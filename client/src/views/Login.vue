<template>
<main id="Login">
  <br />
  <img src="./../assets/Logo.png" class="logo" />
  <body>
    <br />
    <img src="./../assets/ID.png" class="loginimg" />
    <input :class="{err}" v-model="userName" placeholder="enter username" />
    <br />
    <br />
    <img src="./../assets/Key.png" class="loginimg" />
    <input :class="{err}" v-model="passWord" placeholder="enter password" type="password" />
    <br />
    <br />
    <button @click="LogUserIn">Login</button>
    <br />
  </body>
</main>
</template>

<script>
  import { bus } from "./../main";

  firebase.auth()
  .onAuthStateChanged(function(user) {
    if (user) {
      // User is signed in.
      console.log(`user in bruh`);

      console.log(user);
    } else {
      // User is signed out.
      console.log(`user null burh`);
    }
  });

  export default {
    name: "Login",

    data() {
      return {
        userName: "",
        passWord: "",
        err: false
      };
    },

    methods: {
      LogUserIn() {
        // TODO: wrong password check
        // currently, it notifies other components that
        // a user has logged in even if the password was wrong
        if (this.userName.toLowerCase() == 'admin@kstds.com') {
          // notify other components that a user has logged in
          bus.$emit("auth", true);
          this.err = false // clear any prev errs
          // nav to home upon signing in
          this.$router.push('/')

          // login using firebase
          firebase.auth()
          .signInWithEmailAndPassword(this.userName, this.passWord)
          .then(function() {
            console.log('logging in worked aight')
            
          })
          .catch(function(err) {
            console.log(`err in bruh: ${err}`)
          })
        }
        else {
          this.err = true
        }
        
        this.userName = ""
        this.passWord = ""
      }
    }
  };
</script>

<style scoped>
  .err {
    border: red solid 5px;  
  }

  h1 {
    color: forestgreen;
  }
  input {
    padding: 15px;
    border-radius: 7ch;
    height: 3ch;
    width: 40ch;
  }
  button {
    background: #42b983;
    border: none;
    padding: 15px;
    margin: 15px;
    color: #fff;
  }
  .loginimg {
    border: none;
    width: 6ch;
    height: 6ch;
    margin-right: 4px;
    vertical-align: middle;
  }
  .logo {
    width: 16ch;
    height: 16ch;
  }
</style>