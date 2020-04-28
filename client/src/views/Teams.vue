<template>
  <main>
    
    <button @click="modal_get = true">
      Get Players by Team and Match
    </button>

    <BaseModal
      class="filter-modal"
      v-if="modal_get"
      action="players-by"
      @close="modal_get = false"
      @players-by="getPlayers"
    >
    <h3 slot="header">
      Get Players by Team and Match
    </h3>

    <div slot="body">
      <input 
        v-model="query_team" 
        type="text" 
        placeholder="Enter Team..."
      >
      <input 
        v-model="query_match"
        type="text" 
        placeholder="Enter Match..."
      >

      <BaseTable style="color:#fff">
        <tr>
          <th>Players</th>
        </tr>

        <tr
        v-for="player in players"
        :key="player"
        >
          <td>{{player}}</td>
        </tr>
      </BaseTable>
    </div>
    </BaseModal>


    <div class="cards">
      <BaseCard
        v-for="team in teams"
        :key="team.id"
      >
        <h1>{{ team.name }}</h1>
        <BaseTable>
          <tr>
            <th>Scored</th>
            <th>Recieved</th>
            <th>Points</th>
            <th>Rank</th>
          </tr>

          <tr>
            <td>{{ team.scored }}</td>
            <td>{{ team.recieved }}</td>
            <td>{{ team.points }}</td>
            <td>{{ team.rank }}</td>
          </tr>
        </BaseTable>
      </BaseCard>
    </div>
  </main>
</template>

<script>
  import BaseCard from './../components/BaseCard'
  import BaseTable from './../components/BaseTable'
  import BaseModal from './../components/BaseModal'
  import {Team} from './../models/Models'
  import {api} from './../services/Api'

  export default {
    name: 'Teams',
    components: {
      BaseCard,
      BaseTable,
      BaseModal
    },

    data() {
      return {
        modal_get: false,
        teams: [
          // new Team(0, 'Team XXX', [], 0, 0, 0, 0),
          // new Team(1, 'Team YYY', [], 0, 0, 0, 0),
          // new Team(2, 'Team ZZZ', [], 0, 0, 0, 0)
        ],
        query_team: '',
        query_match: '',
        players: []
      }
    },

    methods: {
      async getPlayers() {
        console.log('from get players')

        this.players = (await api.get(`/player?team=${this.query_team}&match=${this.query_match}`)).data
        

      }
    },

    created: async function() {
      // GETs data from server
      this.teams = (await api.get('/teams')).data
    }
  }
</script>

<style>
  .cards {
    max-width: fit-content;
    margin: auto;
  }

  button {
    font-size: 1.4em;
    background: #42b983;
    border: none;
    border-radius: 5px;
    padding: 10px;
    margin: 15px;
    color: #fff;
  }

  button:hover {
    transition: all 0.2s ease-in-out;
    transform: scale(1.05);
  }

  input {
    margin: 10px;
    margin-bottom: 25px;
  }

  .filter-modal table tr:nth-child(even) {
    background-color: #2c3e5081;
  }
  .filter-modal table tr:nth-child(odd) {
    background-color: #14202c81;
  }
  .filter-modal table tr:hover {
    background-color: #42b983e7;
  }
  .filter-modal table {
    display: block;
    width: max-content;
    max-height: 470px;
    overflow-y: scroll;
  }
  
</style>