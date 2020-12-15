import Vue from 'vue'
import VueRouter from 'vue-router'

import App from './App.vue'
import User from './components/UserList.vue'
import CreateUser from './components/CreateUser.vue'
import Services from './components/Services.vue'
import AddService from './components/AddService.vue'

Vue.use(VueRouter)

Vue.config.productionTip = false

const routes = [
  {
    name: 'User',
    path: '/users',
    component: User
  },
  {
    name: 'CreateUser',
    path: '/register',
    component: CreateUser
  },
  {
    name: 'Service',
    path: '/services',
    component: Services
  },
  {
    name: 'AddService',
    path: '/addservice',
    component: AddService
  },
]

const router = new VueRouter({ mode: 'history', routes: routes })

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
