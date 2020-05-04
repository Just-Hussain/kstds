<template>
  <main>
    <h1>Highlights</h1>
    <div class="outer">
      <h2>Players Who Scored More Than Two Goals</h2>
      <BaseTable style="color:#fff">
        <tr>
          <th>Player</th>
        </tr>

        <tr v-for="player in players" :key="player.id">
          <td>{{player.last_name}}, {{player.first_name}}</td>
        </tr>
      </BaseTable>
    </div>
  </main>
</template>

<script>
import BaseTable from "./../components/BaseTable";
import { Player } from "./../models/Models.js";
import { api } from './../services/Api'

export default {
  name: "Highlight",
  components: {
    BaseTable
  },

  data() {
    return {
      players: []
    };
  },

  created: async function() {
    this.players = (await api.get('/players')).data
  }
};
</script>

<style scoped>
.outer {
  border-style: solid;
  /* border-width: 1px; */
  border-color: #1d2935;
  border-right: none;
  border-left: none;
}
</style>