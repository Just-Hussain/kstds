<template>
  <main>
    <h2>Current Tournament ({{ tour_id }})</h2>
    <div class="outer">
      <h1>{{ tour_name }}</h1>
      
      <BaseTable>
        <tr>
          <th>Match No.</th>
          <th>Date</th>
          <th>Time</th>
          <th>Team 1</th>
          <th>Team 2</th>
          <th>Field</th>
          <th>Referee</th>
        </tr>

        <tr 
          v-for="match in tour.matches"
          :key="match.id"
        >
          <td>{{match.id}}</td>
          <td>{{match.date}}</td>
          <td>{{match.time}}</td>
          <td>{{match.team1}}</td>
          <td>{{match.team2}}</td>
          <td>{{match.field}}</td>
          <td>{{match.referee}}</td>
        </tr>
        

      </BaseTable>

      <div class="btn">
        <router-link to="/matches">
          Show Detailed
        </router-link>
      </div>
    </div>
  </main>
</template>

<script>
  import BaseCard from './../components/BaseCard'
  import BaseTable from './../components/BaseTable'
  import {Tournament, Match} from './../models/Models'


  export default {
    name: 'Home',
    components: {
      BaseCard,
      BaseTable
    },

    data() {
      return {
        tour_id: 1,
        tour_name: 'Test Tournament',
        tour: new Tournament(
          0, 'THE tournament', '', '', [
            new Match(
              0, '01-01-2020', '16:30',
              'Team X', 'Team Y', 'Field X', 'Referee X'
            ),
            new Match(
              1, '01-01-2020', '16:30',
              'Team X', 'Team Y', 'Field X', 'Referee X'
            ),
            new Match(
              2, '01-01-2020', '16:30',
              'Team X', 'Team Y', 'Field X', 'Referee X'
            )
          ]
        )
      }
    }
  }
</script>

<style scoped>
  
  main {
    max-width: 860px;
    margin: auto;
  }
  
  .outer {
    border-style: solid;
    /* border-width: 1px; */
    border-color: #1d2935;
    border-right: none;
    border-left: none;
  }
  
  a {
    color: #fff;
    text-align: center;
    text-decoration: none;
    font-size: 18px;
    line-height: 25px;
  }

  .btn {
    width: 200px;
    margin: auto;
    margin-bottom: 20px;
    margin-top: 10px;
    border: 1px solid #42b983;
    background: #42b983;
    border-radius: 20px;
  }

  .btn:hover {
    transform: scale(1.08);
    transition: all 0.2s ease-in-out;
  }
</style>