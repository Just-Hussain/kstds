import Vue from 'vue'
import VueRouter from 'vue-router'

import Home from './../views/Home.vue'
import Login from './../views/Login.vue'


Vue.use(VueRouter)

// here goes all the routes the page uses
// each route is as such:
/*{
    path: '/path',
    name: 'name',
    component: <imported component>
  }
*/
export default new VueRouter({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    }
  ]
})
