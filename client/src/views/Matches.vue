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
        <input type="text" placeholder="referee...">        
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
  import Home from './Home.vue'

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
        matches: Home.data().tour.matches
      }
    },

    methods: {
      addMatch() {
        console.log(`from add match`);
        this.modal_match = false
      },

      listByReferee() {
        // filter the matches array
        // based on the given referee.
        // insted of using matches array
        // in the Base Match v-for
        // a computed array can be used
        
        console.log(`from by referee`);
        this.modal_referee = false
      }
    }
  }
</script>

<style scoped>
  main {
    max-width: 100%;
    margin: auto;
  }
</style>