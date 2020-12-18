import Vue from 'vue'
import VueRouter from 'vue-router'

import App from './App.vue'
import User from './components/UserList.vue'
import CreateUser from './components/CreateUser.vue'
import Services from './components/Services.vue'
import AddService from './components/AddService.vue'
import Login from './components/Login.vue'
import ClientEvents from './components/Client/ClientEvents.vue'
import EmployeeEvents from './components/Employee/EmployeeEvents.vue'
import ManagerEvents from './components/Manager/ManagerEvents.vue'
import AdminServices from './components/Admin/AdminServices.vue'

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
    name: 'Login',
    path: '/login',
    component: Login
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
  {
    name: 'ClientEvents',
    path: '/client/events',
    component: ClientEvents
  },
  {
    name: 'EmployeeEvents',
    path: '/employee/events',
    component: EmployeeEvents
  },
  {
    name: 'ManagerEvents',
    path: '/manager/events',
    component: ManagerEvents
  },
  {
    name: 'AdminServices',
    path: '/admin/services',
    component: AdminServices
  },
]

const router = new VueRouter({ mode: 'history', routes: routes })

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
