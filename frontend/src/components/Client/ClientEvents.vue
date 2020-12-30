<template>
  <div class="wrapper d-flex align-items-stretch">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
  
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../pages/css/style.css">
    <nav id="sidebar" style="background-color: #002233;">
      <div class="p-4">
        <h1><a href="" class="logo"><img src="../../../public/pages/img/sunlogo(original).png" width="100%" alt=""></a></h1>
      <div class="mb-5">
      <ul class="list-unstyled components mb-5">
        <li class="active">
          <a @click="redirect('ClientEvents')"><span class="fa fa-calendar mr-3"></span> Events</a>
        </li>
        <li>
          <a @click="redirect('ClientTransactions')"><span class="fas fa-file-invoice mr-3"></span> Transactions</a>
        </li>
      </ul>
      </div>
        <div class="footer">
          <ul class="list-unstyled components mb-5">
            <li>
              <a href="/"><span class="fa fa-sign-out mr-3"></span> Logout</a>
            </li>
          </ul>
        </div>

      </div>
    </nav>

      <!-- Page Content  -->
    <div id="content" class="p-4 p-md-5 pt-5">
      <div style="float: right;">
        <span>{{account.firstname}} {{account.lastname}} </span><i class="fas fa-user-circle fa-lg"></i>
      </div>
      <div>
        <h1>Events</h1>
        <br>
        <div class="row">
          <div class="col-sm-3">
            <h3>Your Events</h3>
            <div>
              <a class="list-group-item list-group-item-action" v-for="event in events" :key="event.id" @click="showEvent(event.id)">
                {{event.event_name}}
              </a>
            </div>
            <div class="mt-5 mx-auto">
              <a href="/client/reservation">
                <button class="btn btn-success">Reserve an Event</button>
              </a>
            </div> 
          </div>
          <div class="col">
            <h3>Event Details</h3>
            <div>
            Project Status: {{eventStatus}}
            <br>
            Current Task: {{currentTask}}
            <br>
            Team Manager: {{managerName}}
            </div> 
          </div>
          <div class="col">
            <v-calendar ref="calendar" :attributes="attributes" is-expanded></v-calendar>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'ClientEvents',
  data() {
    return {
      currentTask: "",
      eventStatus: "",
      managerName: "",
      account_id: -1,
      events: [],
      services: [],
      account: [],
    };
  },

  created() {
    this.account_id = this.$route.params.id;
    console.log("The account id is: " + this.account_id);
    this.getEvents();
    this.getServices();
    this.getAccount();
  },

  methods: {
    async getAccount() {
      try {
        const response = await axios.get(`http://localhost:3000/user/${this.account_id}`)
        this.account = response.data;
      } catch (err) {
        console.log(err);
      }
    },
    async getServices() {
      try {
        const response = await axios.get("http://localhost:3000/services");
        this.services = response.data;
        console.log(this.services);
      } catch (err) {
        console.log(err);
      }
    },
    async getEvents() {
      try {
        const response = await axios.get(`http://localhost:3000/event_user/${this.account_id}`)
        this.events = response.data;
        console.log("TEST");
        console.log(this.events);
      } catch (err) {
        console.log(err);
      }
    },
    async showEvent(id){
      try {
        const response = await axios.get(`http://localhost:3000/event/${id}`)
        console.log(response);
        this.eventName = response.data.event_name;
        this.eventStatus = response.data.status;
        const calendar = this.$refs.calendar;
        await calendar.move(response.data.event_date);
        this.currentTask = "Editing Photo";
        this.managerName = "Isaiah Quinicot";
      } catch (err) {
        console.log(err);
      }
    },
    async redirect(path){
      try{
        this.$router.push({name: path, params: {id: this.account_id}});
      }catch (err){
        console.log(err);
      }
    }
  },
    computed:{
    attributes(){
      return[
        {
          highlight: {
            color: 'blue',
            start: {fillMode: 'outline'},
            base: {fillMode: 'light'},
            end: {fillMode: 'outline'},
          },
          dates: {start: new Date(2020, 11, 29), end: new Date(2020, 11, 31)},
          popover: {
            label: "Photoshoot at event location",
            visibility: 'click'
          }
        },
        {
          highlight: {
            start: {fillMode: 'outline', color: 'red'},
            base: {fillMode: 'light', color: 'red'},
            end: {fillMode: 'outline', color: 'red'},
          },
          dates: {start: new Date(2021, 0, 1), end: new Date(2021, 0, 3)},
          popover: {
            label: "Photo editing",
            visibility: 'click'
          }
        },
        {
          highlight: {
            start: {fillMode: 'outline', color: 'green'},
            base: {fillMode: 'light', color: 'green'},
            end: {fillMode: 'outline', color: 'green'},
          },
          dates: {start: new Date(2021, 0, 4), end: new Date(2021, 0, 6)},
          popover: {
            label: "Creation of physical album",
            visibility: 'click'
          }
        },
                {
          highlight: {
            start: {fillMode: 'outline', color: 'purple'},
            base: {fillMode: 'light', color: 'purple'},
            end: {fillMode: 'outline', color: 'purple'},
          },
          dates: {start: new Date(2021, 0, 7), end: new Date(2021, 0, 8)},
          popover: {
            label: "Delivery to client",
            visibility: 'click'
          }
        },
      ]
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
