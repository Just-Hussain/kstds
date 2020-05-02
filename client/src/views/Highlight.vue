<template>
  <main>
    <h1>Highlights</h1>
    <h2>Players Who Scored More Than Two Goals</h2>
    <BaseTable style="color:#fff">
      <tr>
        <th>ID</th>
        <th>Player</th>
        <th># Goals</th>
      </tr>

      <tr v-for="player in players" :key="player.id">
        <td>{{player.id}}</td>
        <td>{{player.last_name}}, {{player.first_name}}</td>
        <td>{{player.goals}}</td>
      </tr>
    </BaseTable>
  </main>
</template>

<script>
import BaseTable from "./../components/BaseTable";
import { Player } from "./../models/Models.js";

// TODO: this whole view

export default {
  name: "Highlight",
  components: {
    BaseTable
  },

  data() {
    // ur data goes inside the retuned object
    // comma-serperated
    return {
      players: [
        new Player(1, "Ahmad", "Al-Khaledi", "XXX", 4, "none"),
        new Player(2, "Salman", "Al-Ghamdi", "YYY", 3, "none")
      ]
    };
  },

  methods: {
    // methods goes here, comma-serperated
  }
};
</script>

<style scoped>
/* styling goes here */
h1 {
  color: white;
}

h2 {
  font-style: italic;
}
</style>