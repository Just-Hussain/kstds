<template>
  <main id="Login">
    <br>
    <img src="./../assets/Logo.png" class="logo" >
  <body>
    <br>
    <img src="./../assets/ID.png" class="loginimg">
    <input v-model="userName" placeholder="enter username" > 
    <br><br>
    <img src="./../assets/Key.png" class="loginimg">
    <input v-model="passWord" placeholder="enter password" type="password"> 
    <br><br>
    <button @click="LogUserIn">
      Login 
    </button>
    <br>
    
    
  </body>
  </main>
</template>

<script>
  import {bus} from './../main'

 // console.log(`g var: ${this.$loggedIn}`)

  firebase.auth()
  .onAuthStateChanged(function(user) {
    if (user) {
      // User is signed in.
      console.log(`user in bruh`)
      
      console.log(user)
      
      

    } else {
      // User is signed out.
      console.log(`user null burh`)
    }
  })


  // TODO: backend stuff

  export default {
    name: 'Login',
    data()
    {
      return {
        userName: '',
        passWord: ''
      }
    },

    methods:
    {
      LogUserIn() 
      {
        bus.$emit('auth', true)
        // firebase.auth()
        // .createUserWithEmailAndPassword(this.userName, this.passWord)
        // .catch(function(err) {
        //   // Handle Errors here.
          
        //   console.log(`err up bruh: ${err}`)        
        // })

        // firebase.auth()
        // .signInWithEmailAndPassword(this.userName, this.passWord)
        // .catch(function(err) {
        //   // Handle Errors here.

        //   console.log(`err in bruh: ${err}`)
        // });
        //here we send the info to the server
        this.userName='',
        this.passWord=''
        //here we would check if true or false\
        //if false borders go red, lets see how it goes
      }

    }
  
  }
</script>

<style scoped>
  h1 {
    color:forestgreen;
  }
  input
  {
    padding: 15px;
    border-radius: 7ch;
    height:3ch;
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
  .logo{
    width: 16ch;
    height: 16ch;
  }
</style>