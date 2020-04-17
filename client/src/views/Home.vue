<template>
  <main>
    <h2>Current Tournament ({{ tour_id }})</h2>
    <div class="outer">
      <h1>{{ tour_name }}</h1>
      <div style="overflow-x:auto">
        <table class="matches">
          <tr>
            <th>Match No.</th>
            <th>Date</th>
            <th>Time</th>
            <th>Team 1</th>
            <th>Team 2</th>
            <th>Field</th>
            <th>Referee</th>
          </tr>

          <tr>
            <td>1</td>
            <td>01-01-2020</td>
            <td>16:30</td>
            <td>Team X</td>
            <td>Team Y</td>
            <td>Field X</td>
            <td>Field X</td>
          </tr>
          
          <tr>
            <td>1</td>
            <td>01-01-2020</td>
            <td>16:30</td>
            <td>Team X</td>
            <td>Team Y</td>
            <td>Field X</td>
            <td>Field X</td>
          </tr>

          <tr>
            <td>1</td>
            <td>01-01-2020</td>
            <td>16:30</td>
            <td>Team X</td>
            <td>Team Y</td>
            <td>Field X</td>
            <td>Field X</td>
          </tr>

        </table>
      </div>
    </div>
  </main>
</template>

<script>
import BaseCard from './../components/BaseCard'

export default {
  name: 'Home',
  components: {
    BaseCard
  },

  data() {
    return {
      tour_id: 1,
      tour_name: 'Test Tournament'
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
    border-radius: 15px;
    /* border-width: 1px; */
    border-color: #1d2935;
  }

  .matches {
    border-collapse: collapse;
    width: 95%;
    margin: auto;
    margin-bottom: 20px;

  }

  .matches td, .matches th {
    padding: 12px;
  }

  .matches tr:nth-child(even) {
    background-color: #2c3e5081;
  }

  .matches tr:hover {
    background-color: #42b983e7;
  }

  .matches th {
    padding-top: 12px;
    padding-bottom: 12px;
    background-color: #2c3e50;
    color: white;
  }
</style>