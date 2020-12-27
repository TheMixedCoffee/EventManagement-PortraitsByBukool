<template>
  <div class="wrapper d-flex align-items-stretch">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
  
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../pages/css/style.css">
    <nav id="sidebar" style="background-color: #006666;">
      <div class="p-4">
        <h1><a href="" class="logo"><img src="../../../public/pages/img/sunlogo(original).png" width="100%" alt=""></a></h1>
      <div class="mb-5">
      <ul class="list-unstyled components mb-5">
        <li class="active">
            <a href="/employee/events"><span class="fa fa-calendar mr-3"></span> Events</a>
        </li>
        <li>
          <a href="/employee/inbox"><span class="fa fa-inbox mr-3"></span>  Inbox</a>
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
      <div>
        <h1>Events</h1>
        <br>
        <div class="row">
          <div class="col-sm-3">
            <h3>Event List</h3>
            <div>
              <a class="list-group-item list-group-item-action" v-for="assigned in assignedEvents" :key="assigned.id" @click="showEvent(assigned.id)">
                {{assigned.event_name}}
              </a>
            </div>
          </div>
          <div class="col">
            <h3>Event Details</h3>
            <div>
            Project Status: {{eventStatus}}
            <br>
            Current Task:
            <br>
            Team Manager:
            </div>
          </div>
          <div class="col">
            <v-calendar ref="calendar" is-expanded></v-calendar>
          </div>
        </div>
      </div>
    </div>
    


  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'EmployeeEvents',
 data() {
    return {
      account_id: -1,
      eventId: -1,
      eventName: "",
      eventDetails: "",
      eventStatus: "",
      assignedEvents: [],
      services: [],
    };
  },

  created() {
    this.account_id = this.$route.params.id;
    console.log("The account id is: " + this.account_id);
    this.getAssignedEvents();
    this.getServices();
  },

  methods: {
    async getServices() {
      try {
        const response = await axios.get("http://localhost:3000/services");
        this.services = response.data;
        console.log(this.services);
      } catch (err) {
        console.log(err);
      }
    },
    async getAssignedEvents() {
      try {
        const response = await axios.get(`http://localhost:3000/employee/${this.account_id}`);
        console.log("ONGOING");
        this.assignedEvents = response.data;
        console.log(this.assignedEvents);
      } catch (err) {
        console.log(err);
      }
    },
    async showEvent(id){
      try {
        const response = await axios.get(`http://localhost:3000/event/${id}`)
        console.log(response);
        this.eventId = response.data.id
        this.eventName = response.data.event_name;
        this.eventDetails = response.data.event_details;
        this.eventStatus = response.data.status;
        const calendar = this.$refs.calendar;
        await calendar.move(response.data.event_date);
      } catch (err) {
        console.log(err);
      }
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
