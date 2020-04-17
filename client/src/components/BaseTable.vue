<template>
  <div style="overflow-x:auto">
    <table>
      <slot></slot>
    </table>
  </div>
</template>

<script>
export default {
  name: 'BaseTable'
}
</script>

<style scoped>
  table {
    border-collapse: collapse;
    width: 95%;
    margin: auto;
    margin-bottom: 20px;

  }

  table td, table th {
    padding: 12px;
  }

  table tr:nth-child(even) {
    background-color: #2c3e5081;
  }

  table tr:hover {
    background-color: #42b983e7;
  }

  table th {
    padding-top: 12px;
    padding-bottom: 12px;
    background-color: #2c3e50;
  }
</style>