import Vue from 'vue'
import VueRouter from 'vue-router'

import App from './App.vue'
import User from './components/UserList.vue'

Vue.use(VueRouter)

Vue.config.productionTip = false

const routes = [
  {
    name: 'User',
    path: '/user',
    component: User
  },
]

const router = new VueRouter({ mode: 'history', routes: routes })

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
