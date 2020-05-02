<template>
  <div class="header">
    <router-link to="/">KSTDS</router-link>
    <div class="header-right">
      <router-link to="/">Tournaments</router-link>
      <router-link to="/highlight">Highlights</router-link>
      <router-link to="/teams">Teams</router-link>
      <button v-if="flag" @click="logout">Logout</button>
      <router-link v-else to="/login">Login</router-link>
    </div>
  </div>
</template>

<script>
  import { bus } from "./../main";

  export default {
    name: "AppHeader",

    // this is to decide wether to show
    // the log in or log out button.
    // it is achived by listening to an event
    // fired by the login view, or the logout button
    created: function() {
      let self = this; // because the callback changes the scope
      bus.$on("auth", function(ev) {
        console.log(`from auth header: ${ev}`);
        self.flag = ev;
      });
    },

    data() {
      return {
        // taked if user logged in or out from the <auth> listener
        flag: false
      };
    },

    methods: {
      logout() {
        // notify other compnents that the user has logged out
        bus.$emit("auth", false);

        firebase.auth()
        .signOut()
        .then(function() {
          // Sign-out successful.
          console.log('signed out')

        })
        .catch(function(err) {
          console.log(`err out ${err}`)
        })
      }
    }
  };
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
    color: #fff;
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
    transition: all 0.2s ease-in-out;
    transform: scale(1.05);
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
  @media screen and (max-width: 600px) {
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