<template>
  <main id="Login">
    <h1>Login Screen</h1>
  <body>
    <br>
    <input v-model="userName" placeholder="enter username" > 
    <br><br>
    <input v-model="passWord" placeholder="enter password"> 
    <br><br>
    <button @click="LogUserIn">
      Login
    </button>
    <br>
    
    
  </body>
  </main>
</template>

<script>
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
    
  }
  button {
    background: #42b983;
    border: none;
    padding: 15px;
    margin: 15px;
    color: #fff;
  }
</style>