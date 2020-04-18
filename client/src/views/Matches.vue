<template>
  <main>
    <h1>Matches</h1>
    <BaseMatch></BaseMatch>
    <BaseMatch></BaseMatch>
    <BaseMatch></BaseMatch>

  </main>
</template>

<script>
  import BaseMatch from './../components/BaseMatch'

  export default {
    name: 'Matches',
    components: {
      BaseMatch
    }
  }
</script>

<style scoped>
  main {
    max-width: 100%;
    margin: auto;
  }
</style>