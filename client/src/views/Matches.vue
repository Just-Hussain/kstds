<template>
  <main>
    <h1>Matches</h1>
    
    <button v-if="flag" @click="modal_match = true">Add Match</button>
    <button @click="modal_referee = true">List by Referee</button>

    <BaseModal
      v-if="modal_match"
      action="add-match"
      @close="modal_match = false"
      @add-match="addMatch"
    >
      <h3 slot="header">Add a New Match</h3>
      <div slot="body">
        <!-- input fields for adding new match -->
        <input v-model="new_match.id" type="text" placeholder="id...">
        <input v-model="new_match.date" type="text" placeholder="date...">  
        <input v-model="new_match.time" type="text" placeholder="time...">  
        <input v-model="new_match.team1" type="text" placeholder="team 1...">  
        <input v-model="new_match.team2" type="text" placeholder="team 2...">  
        <input v-model="new_match.field" type="text" placeholder="field...">  
        <input v-model="new_match.referee" type="text" placeholder="referee...">  
      </div>
    </BaseModal>

    <BaseModal
      v-if="modal_referee"
      action="by-referee"
      @close="modal_referee = false"
      @by-referee="listByReferee"
    >
      <h3 slot="header">Matches by Referee</h3>
      <div slot="body">
        <input v-model="ref_name" type="text" placeholder="referee...">        
      </div>
    </BaseModal>


    <BaseMatch
      :match="match"
      :flag="flag"
      v-for="match in matches"
      :key="match.id"
    >
    </BaseMatch>

  </main>
</template>

<script>
  import BaseMatch from './../components/BaseMatch'
  import BaseModal from './../components/BaseModal'
  import {Match} from './../models/Models'
  import {api} from './../services/Api'
  import {bus} from './../main'

  export default {
    name: 'Matches',
    components: {
      BaseMatch,
      BaseModal
    },

    mounted: function() {
      // * using mounted because created does not work well with router
      
      // updaing the flag first here because the flag is reset
      // every time the site navigates to this view i guess
      // so this makes sure what is the current status
      this.flag = firebase.auth().currentUser ? true : false
  
      console.log(`created from match flag: ${this.flag}`)
      
      let self = this; // because the callback changes the scope
      bus.$on("auth", function(ev) {
        self.flag = ev
        console.log(`from auth matches: ${ev}, flag: ${self.flag}`)
      });
    },

    data() {
      return {
        modal_match: false,
        modal_referee: false,
        matches: [],
        ref_name: '',
        new_match: new Match(),
        flag: false
      }
    },

    methods: {
      addMatch() {
        console.log(`from add match`);

        // TODO: this does not reflect on current content
        // only sends data to server so it needs fixing
        // and takes team as name only,
        // and now a match object should have a team object
        // FIX
        
        api.post(`/matches?id=${this.new_match.id}&date=${this.new_match.date}&time=${this.new_match.time}&team1=${this.new_match.team1}&team2=${this.new_match.team2}&field=${this.new_match.field}&referee=${this.new_match.referee}`)

        this.modal_match = false
      },

      listByReferee() {
        
        console.log(`from by referee`)
        
        // it`s bad to alway re-query the db,
        // but i`m waay to lazy to change it
        api.get('/matches')
        .then(res => {
          this.matches = res.data
          
          if (this.ref_name == '') return

          this.matches = this.matches.filter((match) => {
            return match.ref.toLowerCase() == this.ref_name.toLowerCase()
          })
        })

        this.modal_referee = false
      }
    },

    created: async function() {
      this.matches = (await api.get('/matches')).data
      
    }
  }
</script>

<style scoped>
  main {
    max-width: 100%;
    margin: auto;
  }
</style>