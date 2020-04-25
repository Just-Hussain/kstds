<template>
  <main>
    <h1>Matches</h1>
    
    <button @click="modal_match = true">Add Match</button>
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

  export default {
    name: 'Matches',
    components: {
      BaseMatch,
      BaseModal
    },

    data() {
      // matches should be refactored to an abstract class
      // it still does not handle players and thiers goals
      // later on, populating the array should be on mounted
      // and from the database using a match service or such
      return {
        modal_match: false,
        modal_referee: false,
        matches: [],
        ref_name: '',
        new_match: new Match()
      }
    },

    methods: {
      addMatch() {
        console.log(`from add match`);

        api.post(`/matches?id=${this.new_match.id}&date=${this.new_match.date}&time=${this.new_match.time}&team1=${this.new_match.team1}&team2=${this.new_match.team2}&field=${this.new_match.field}&referee=${this.new_match.referee}`)

        this.modal_match = false
      },

      listByReferee() {
        // filter the matches array
        // based on the given referee.
        // insted of using matches array
        // in the Base Match v-for
        // a computed array can be used
        
        console.log(`from by referee`);

        this.matches = this.matches.filter((match) => {
          return match.referee.toLowerCase() == this.ref_name.toLowerCase()
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