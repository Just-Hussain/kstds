<template>
  <div class="header">
    <router-link to="/">KSTDS</router-link>
    <div class="header-right">
      <router-link to="/">Home</router-link>
      <router-link to="/">About</router-link>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'AppHeader'
  }
</script>

<style scoped>
  /* styling from w3schools */
  /* Style the header with a grey background and some padding */
  .header {
    overflow: hidden;
    background-color: #1d2935;
    padding: 20px 10px;
  }

  /* Style the header links */
  .header a {
    float: left;
    color: #b4c7d0;
    text-align: center;
    padding: 12px;
    text-decoration: none;
    font-size: 18px;
    line-height: 25px;
    border-radius: 4px;
  }

  /* Style the logo link (notice that we set the same value of line-height and font-size to prevent the header to increase when the font gets bigger */
  .header a.logo {
    font-size: 25px;
    font-weight: bold;
  }

  /* Change the background color on mouse-over */
  .header a:hover {
    background-color: #b4c7d0;
    color: black;
  }

  /* Style the active/current link*/
  .header a.active {
    background-color: dodgerblue;
    color: white;
  }

  /* Float the link section to the right */
  .header-right {
    float: right;
  }

  /* Add media queries for responsiveness - when the screen is 500px wide or less, stack the links on top of each other */
  @media screen and (max-width: 500px) {
    .header a {
      float: none;
      display: block;
      text-align: left;
    }
    .header-right {
      float: none;
    }
  }
</style>