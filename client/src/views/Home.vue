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

      </BaseTable>
    </div>
  </main>
</template>

<script>
  import BaseCard from './../components/BaseCard'
  import BaseTable from './../components/BaseTable'
  
  export default {
    name: 'Home',
    components: {
      BaseCard,
      BaseTable
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
    /* border-width: 1px; */
    border-color: #1d2935;
    border-right: none;
    border-left: none;
  }

</style>