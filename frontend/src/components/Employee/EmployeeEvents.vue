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
            <a @click="redirect('EmployeeEvents')"><span class="fa fa-calendar mr-3"></span> Events</a>
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
      <div style="float: right;">
        <span>{{account.firstname}} {{account.lastname}} </span><i class="fas fa-user-circle fa-lg"></i>
      </div>
      <div class="mt-3">
        <h1>Events</h1>
        <br>
        <div class="row">
          <div class="col-sm-3">
            <h3>Task List</h3>
            <div>
              <a class="list-group-item list-group-item-action" v-for="task in tasks" :key="task.id" @click="showEvent(task.event_id, task.start_date, task.end_date, task.name, task.id)">
                {{task.name}}
              </a>
            </div>
          </div>
          <div v-if="eventId != -1" class="col">
            <h3>Event Details</h3>
            <div>
            Project Name: {{eventName}}
            <br>
            Project Status: {{eventStatus}}
            <br>
            Team Manager: {{managerName}}
            <br>
            <div v-if="clicked == 'clicked'">
              <a class="text-success" @click="doneTask(taskId)">Mark as Done <i class="fas fa-plus-circle fa-lg"></i></a>
            </div>
            </div>
          </div>
          <div class="col">
            <v-calendar ref="calendar" :attributes='attributes' is-expanded></v-calendar>
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
      managerName: "",
      account_id: -1,
      eventId: -1,
      eventName: "",
      eventDetails: "",
      eventStatus: "",
      startDate: "101010",
      endDate: "101010",
      taskName: "",
      taskId: "",
      clicked: "not",
      assignedEvents: [],
      services: [],
      tasks: [],
      account: [],
    };
  },

  created() {
    this.account_id = this.$route.params.id;
    console.log("The account id is: " + this.account_id);
    this.getAssignedEvents();
    this.getServices();
    this.getAssignedTasks();
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
    async getAssignedTasks() {
      try {
        const response = await axios.get(`http://localhost:3000/employee/tasks/${this.account_id}`);
        this.tasks = response.data;
      } catch (err) {
        console.log(err);
      }
    },
    async getAssignedEvents() {
      try {
        const response = await axios.get(`http://localhost:3000/employee/events/${this.account_id}`);
        console.log("ONGOING");
        this.assignedEvents = response.data;
        console.log(this.assignedEvents);
      } catch (err) {
        console.log(err);
      }
    },
    async showEvent(id, start_date, end_date, task_name, task_id){
      try {
        const response = await axios.get(`http://localhost:3000/event/${id}`)
        console.log(response);
        this.clicked = "clicked";
        this.startDate = start_date;
        this.endDate = end_date;
        this.taskName = task_name;
        this.taskId = task_id;
        console.log(start_date, end_date, task_id, task_name);
        this.eventId = response.data.id
        this.eventName = response.data.event_name;
        this.eventDetails = response.data.event_details;
        this.eventStatus = response.data.status;
        this.managerName = "Isaiah Quinicot"
        const calendar = this.$refs.calendar;
        await calendar.move(response.data.event_date);
      } catch (err) {
        console.log(err);
      }
    },
    async doneTask(id) {
      try {
        await axios.put(`http://localhost:3000/employee/tasks/${id}`);
        this.eventId = "";
        this.eventName = "";
        this.eventDetails = "";
        this.eventStatus = "";
        this.managerName = "";
        this.clicked = "not";
        this.startDate = "101010",
        this.endDate = "101010",
        this.getAssignedEvents();
        this.getServices();
        this.getAssignedTasks();
      } catch (err) {
        console.log(err);
      }
    }
  },
  computed:{
    attributes(){
      return[
        {
          highlight: {
            start: {fillMode: 'outline', color: 'red'},
            base: {fillMode: 'light', color: 'red'},
            end: {fillMode: 'outline', color: 'red'},
          },
          dates: {start: this.startDate, end: this.endDate},
          popover: {
            label: this.taskName+"-"+this.eventName,
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
