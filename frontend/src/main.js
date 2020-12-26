import Vue from 'vue'
import VueRouter from 'vue-router'
import 'bootstrap'
import 'popper.js'
import 'jquery'

import App from './App.vue'
// Main components
import User from './components/UserList.vue'
import CreateUser from './components/CreateUser.vue'
import Login from './components/Login.vue'
import Landing from './components/Landing.vue'
import Packages from './components/Packages.vue'
import About from './components/About.vue'
// Client components
import ClientEvents from './components/Client/ClientEvents.vue'
import ClientTransactions from './components/Client/ClientTransactions.vue'
import ClientReservation from './components/Client/ClientReservation.vue'
// Admin components
import AdminServices from './components/Admin/AdminServices.vue'
import AdminContacts from './components/Admin/AdminContacts.vue'
import AdminEmployees from './components/Admin/AdminEmployees.vue'
// Manager components
import ManagerEvents from './components/Manager/ManagerEvents.vue'
import ManagerEmployees from './components/Manager/ManagerEmployees.vue'
import ManagerSuppliers from './components/Manager/ManagerSuppliers.vue'
import ManagerDeliveries from './components/Manager/ManagerDeliveries.vue'
// Employee components
import EmployeeEvents from './components/Employee/EmployeeEvents.vue'


Vue.use(VueRouter)

Vue.config.productionTip = false

const routes = [
  // main routes
  {
    name: 'Landing',
    path: '/',
    component: Landing
  },
  {
    name: 'Packages',
    path: '/packages',
    component: Packages
  },
  {
    name: 'About',
    path: '/about',
    component: About
  },
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
  // client routes
  {
    name: 'ClientEvents',
    path: '/client/events',
    component: ClientEvents
  },
  {
    name: 'ClientTransactions',
    path: '/client/transactions',
    component: ClientTransactions
  },
  {
    name: 'ClientReservation',
    path: '/client/reservation',
    component: ClientReservation
  },
  // admin routes
  {
    name: 'AdminServices',
    path: '/admin/services',
    component: AdminServices
  },
  {
    name: 'AdminContacts',
    path: '/admin/contacts',
    component: AdminContacts
  },
  {
    name: 'AdminEmployees',
    path: '/admin/employees',
    component: AdminEmployees
  },
  // manager routes
  {
    name: 'ManagerEmployees',
    path: '/manager/employees',
    component: ManagerEmployees
  },
  {
    name: 'ManagerSuppliers',
    path: '/manager/suppliers',
    component: ManagerSuppliers
  },
  {
    name: 'ManagerEvents',
    path: '/manager/events',
    component: ManagerEvents
  },
  {
    name: 'ManagerDeliveries',
    path: '/manager/deliveries',
    component: ManagerDeliveries
  },
  // employee routes
  {
    name: 'EmployeeEvents',
    path: '/employee/events',
    component: EmployeeEvents
  },
]

const router = new VueRouter({ mode: 'history', routes: routes })

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
