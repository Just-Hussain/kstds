import Vue from 'vue'
import App from './App.vue'
import router from './router'

Vue.config.productionTip = false

// An event bus to fire events and move data
// across components rather than between parent-child only
// mainly used to detect login and out
export const bus = new Vue()

new Vue({
  router,
  render: function (h) { return h(App) }
}).$mount('#app')
