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
          <div v-if="eventId != -1" class="col">
            <h3>{{eventName}} Details</h3>
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
              <a class="text-success" @click="doneEvent(eventId)">Mark as Completed   <i class="fas fa-plus-circle fa-lg"></i></a>
            </div> 
          </div>
          <div class="col">
            <v-calendar ref="calendar" :attributes='attributes' is-expanded>
            </v-calendar>
          </div>
        </div>
        <br>
        <br>
        <div class="row mt-3">
          <div class="col-sm-3">
            <h3>Pending List</h3>
            <div>
              <a class="list-group-item list-group-item-action"  v-for="pending in pendingEvents" :key="pending.id" @click="showEvent(pending.id)">
                {{pending.event_name}}
              </a>
              <span v-if="pendingEvents.length == 0">None</span>
            </div>
          </div>
           <div v-if="eventId != -1 && eventStatus != 'pending'" class="col-sm-4">
            <h3>Task List</h3>
            <a class="text-success" data-toggle="modal" data-target="#addTaskModal">Add Task <i class="fas fa-plus-circle fa-lg"></i></a>
            <div>
              <a class="list-group-item list-group-item-action" v-for="task in tasks" :key="task.id">
                {{task.name}}
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>


    <!--ADD TASK MODAL-->
    <div class="modal fade" id="addTaskModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Add Task</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label" for="task_name">Task Name: </label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" id="task_name" v-model="task_name" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label" for="start_date">Start Date: </label>
                        <div class="col-sm-8">
                          <input type="date" class="form-control" id="start_date" v-model="start_date" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label" for="end_date">End Date: </label>
                        <div class="col-sm-8">
                          <input type="date" class="form-control" id="end_date" v-model="end_date" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="col-sm-4 col-form-label">Select Employee: </label>
                        <div class="col-sm-8">
                          <select name="employee_id" id="" v-model="employee_id" class="form-control">
                            <option selected="true" disabled="disabled">Choose...</option>
                            <option v-for="employee in employees" :key="employee.id" :value='employee.id' >{{ employee.firstname }} {{ employee.lastname }}</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary" @click="addTask" data-dismiss="modal">Add</button>
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
    const todos = [
      {
        description: 'Photoshoot at event location',
        isComplete: false,
        dates: {weekdays: 6},
        color: 'blue',
      },
      {
        description: 'Photo Editing',
        isComplete: false,
        dates: {start: new Date(2021, 0, 1), end: new Date(2021, 0, 3)},
        color: 'red',
      },
    ]
    return {
      eventId: -1,
      eventName: "",
      eventDetails: "",
      eventStatus: "",
      task_name: "",
      start_date: "",
      end_date: "",
      employee_id: "",
      ongoingEvents: [],
      pendingEvents: [],
      tasks: [],
      services: [],
      incId: todos.length,
      todos,
      employees: [],
    };
  },

  created() {
    this.getOngoingEvents();
    this.getServices();
    this.getPendingEvents();
    this.getTasks();
    this.getEmployees();
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
    async getTasks(id){
      try{
        const response = await axios.get(`http://localhost:3000/get_tasks/${id}`);
        console.log(response);
        this.tasks = response.data;
      }catch (err){
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
      this.getTasks(id);
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
    },
    async addTask(){
      try{
        await axios.post("http://localhost:3000/create_task", {
          name: this.task_name,
          start_date: this.start_date,
          end_date: this.end_date,
          employee_id: this.employee_id, //PLACE HOLDER
          event_id: this.eventId,
          status: "ongoing",
        })
        this.task_name =  "";
        this.start_date = "";
        this.end_date = "";
        this.getTasks(this.eventId);
      } catch (err) {
        console.log(err);
      }
    },
    async getEmployees() {
      try {
        const response = await axios.get("http://localhost:3000/manager/employees");
        this.employees = response.data;
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
