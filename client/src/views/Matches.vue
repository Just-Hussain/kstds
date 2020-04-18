<template>
  <main>
    <h1>Matches</h1>
    
    <button @click="modal_match = true">Add Match</button>

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
        matches: [
          {
            id: 0,
            date: '01-01-2020',
            time: '18:30',
            team1: 'Team 1',
            team2: 'Team 2',
            field: 'Field XYZ',
            score1: 0,
            score2: 1

          },
          {
            id: 1,
            date: '01-05-2020',
            time: '19:30',
            team1: 'Team 1',
            team2: 'Team 2',
            field: 'Field XVYZ',
            score1: 0,
            score2: 1
          },
          {
            id: 2,
            date: '01-08-2020',
            time: '18:00',
            team1: 'Team 1',
            team2: 'Team 2',
            field: 'Field XYZQ',
            score1: 0,
            score2: 1
          }
        ]
      }
    },

    methods: {
      addMatch() {
        console.log(`from add match`);
        this.modal_match = false
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