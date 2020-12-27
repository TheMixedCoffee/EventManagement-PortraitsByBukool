<template>
  <div class="wrapper d-flex align-items-stretch">
			<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
			<link rel="stylesheet" href="../../pages/css/style.css">
			<nav id="sidebar" style="background-color: #001a33;">
				<div class="p-4">
					<h1><a href="" class="logo"><img src="../../../public/pages/img/sunlogo(original).png" width="100%" alt=""></a></h1>
        <div class="mb-5">
        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a href="/manager/events"><span class="fa fa-calendar mr-3"></span> Events</a>
          </li>
          <li>
            <a href="/manager/suppliers"><span class="fa fa-handshake-o mr-3"></span>Suppliers</a>
          </li>
          <li>
            <a href="/manager/deliveries"><span class="fa fa-truck mr-3"></span> Deliveries</a>
          </li>
          <li>
            <a href="/manager/employees"><span class="fa fa-users mr-3"></span> Employees</a>
          </li>
          <li>
            <a href="/manager/inbox"><span class="fa fa-inbox mr-3"></span>  Inbox</a>
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
              <a class="list-group-item list-group-item-action" v-for="ongoing in ongoingEvents" :key="ongoing.id" @click="showEvent(ongoing.id)">
                {{ongoing.event_name}}
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
            <div v-if="eventStatus == 'pending'">
              <a class="text-success" @click="acceptEvent(eventId)">Reserve Event<i class="fas fa-plus-circle fa-lg"></i></a>
            </div> 
            <div v-else-if="eventStatus == 'ongoing'">
              <a class="text-success" @click="doneEvent(eventId)">Mark as Completed<i class="fas fa-plus-circle fa-lg"></i></a>
            </div> 
          </div>
          <div class="col">
            <v-calendar ref="calendar" is-expanded></v-calendar>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-5">
            <h3>Pending List</h3>
            <div>
              <a class="list-group-item list-group-item-action"  v-for="pending in pendingEvents" :key="pending.id" @click="showEvent(pending.id)">
                {{pending.event_name}}
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>


  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'ManagerEvents',
  data() {
    return {
      eventId: -1,
      eventName: "",
      eventDetails: "",
      eventStatus: "",
      ongoingEvents: [],
      pendingEvents: [],
      services: [],
    };
  },

  created() {
    this.getOngoingEvents();
    this.getServices();
    this.getPendingEvents();
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
    async getOngoingEvents() {
      try {
        const response = await axios.get("http://localhost:3000/event_ongoing");
        console.log("ONGOING");
        this.ongoingEvents = response.data;
        console.log(this.ongoingEvents);
      } catch (err) {
        console.log(err);
      }
    },
    async getPendingEvents(){
      try{
        const response = await axios.get("http://localhost:3000/event_pending");
        console.log("PENDING");
        this.pendingEvents = response.data;
        console.log(this.pendingEvents);
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
    async acceptEvent(id){
      try{
        await axios.put(`http://localhost:3000/event_update/${id}`, {
          event_name: this.eventName,
          event_details: this.eventDetails,
          status: "ongoing",
        });
        this.getOngoingEvents();
        this.getPendingEvents();
      }catch (err){
        console.log(err);
      }
    },
    async doneEvent(id){
      try{
        await axios.put(`http://localhost:3000/event_update/${id}`, {
          event_name: this.eventName,
          event_details: this.eventDetails,
          status: "completed",
        });
        this.getOngoingEvents();
        this.getPendingEvents();
      }catch (err){
        console.log(err);
      }
    }
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
