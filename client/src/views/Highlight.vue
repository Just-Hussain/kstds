<template>
  <main>
    <h1>ur html goes here, inside of main</h1>
    <h2>{{ test }}</h2>
    <h3>{{ test2 }}</h3>
  </main>
</template>

<script>
  import BaseTable from './../components/BaseTable'

  export default {
    name: 'Highlight',
    components: {
      BaseTable
    },

    data() {
      // ur data goes inside the retuned object 
      // comma-serperated
      return {
        test: 'hi',
        test2: 'sub'
      }
    },

    methods: {
      // methods goes here, comma-serperated
    }
  }
</script>

<style scoped>
  /* styling goes here */
  h1 {
    color: blue;
  }
</style>