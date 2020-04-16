<template>
  <div class="card">
    <div class="card-inner">
      <slot>Test</slot>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'BaseCard'
  }
</script>

<style scoped>
  * {
    box-sizing: border-box;
  }
  
  .card {
    margin: 15px;
    width: fit-content;
    transition: all 0.2s ease-in-out;
  }

  .card:hover {
    transform: scale(1.05);
  }

  .card-inner {
    width: 100%;
    padding: 40px;
    position: relative;
    cursor: pointer;

    background-color: #2c3e50;
    color: #fff;
    font-size: 1.5em;
    text-align: center;
  }

  .card-inner:hover {
    background-color: #42b983;
    transition: all 0.2s ease-in-out;
  }
</style>