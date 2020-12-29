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
          <a href="/client/events"><span class="fa fa-calendar mr-3"></span> Events</a>
        </li>
        <li>
          <a href="/client/transactions"><span class="fas fa-file-invoice mr-3"></span> Transactions</a>
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
        <h1>Event Reservation</h1>
        <br>
      </div>
      <div class="row">
            <div class="col">
                <div class="form-group row">
                <label class="col-sm-4 col-form-label" for="event_name">Event Name: </label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control border border-info" id="event_name" v-model="eventName"  required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="event_desc">Event Description: </label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control border border-info" id="event_desc" v-model="eventDesc" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="email">Email: </label>
                    <div class="col-sm-8">
                        <input type="email" class="form-control border border-info" id="email" v-model="email"  required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="contact_number">Contact Number: </label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control border border-info" id="contact_number" v-model="contactNum"  required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="event_type">Event Type: </label>
                    <div class="col-sm-8">
                        <select class="custom-select" v-model="eventType">
                            <option v-for="type in event_types" :key="type.id" v-bind:value="type.id">{{ type.name }}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="event_date">Event Date: </label>
                    <div class="col-sm-8">
                        <input type="date" class="form-control border border-info" id="event_date" v-model="eventDate"  required>
                    </div>
                </div>
                <div class="row">
                    <h3>Services Needed:</h3>
                </div>
                <div v-for="service in services"  :key="service.id" class="row checkbox">
                    <b><label><input type="radio" name="service" v-bind:value="service.id" v-model="serviceName"> {{service.name}} (PHP{{service.price}})</label></b>
                    <p>{{service.description}}</p>
                </div>
                <div class="row checkbox">
                    <label>Need something else? Type it here: <input type="text" value=""></label>
                </div>
                <div class="row">
                    <button type="button" class="btn btn-success mr-5" @click="reserve()">Reserve Event</button>
                    <a href="/client/events">
                        <button type="button" class="btn btn-secondary">Go Back</button>
                    </a>
                </div>
            </div>
      </div>

        
    </div>


  </div> <!--WRAPPER ENDING DIV-->
</template>

<script>
import axios from "axios";

export default {
  name: 'ClientReservation',
  data() {
    return {
      accountID: "",
      eventName: "",
      eventDesc: "",
      email: "",
      contactNum: "",
      eventType: "",
      eventDate: "",
      serviceName: "",  
      services: [],
      event_types: [],
    };
  },

  created() {
    this.getEventTypes();
    this.getServices();
  },

  methods: {
    async getEventTypes() {
      try {
        const response = await axios.get("http://localhost:3000/event_types");
        this.event_types = response.data;
        console.log(this.services);
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
    async addEvent() {
        try {
            await axios.post("http://localhost:3000/create_event", {
                account_id: 10, //MANUALLY ADDED VALUE FOR TESTING PURPOSES
                event_name: this.eventName,
                event_details: this.eventDesc,
                contact_number: this.contactNum,
                event_type_id: this.eventType,
                employee_id: -1,
                event_date: this.eventDate,
                status: "pending",
            });
            // await axios.post("http://localhost:3000/link_event", {
            //   event_id: 
            // })
            this.eventName = "";
            this.eventDesc = "";
            this.contactNum = "";
            this.eventType = "";
            this.eventDate = "";
            this.getServices();
            this.getEventTypes();
            console.log("account_id is " + this.accountID);
        } catch (err) {
            console.log(err);
        }
    },
    async getUserId(){
      try {
          const response = await axios.get(`http://localhost:3000/user_email`);
          this.accountID = response.data.id;
          console.log("account id is " + this.accountID);
      } catch (err) {
          console.log(err);
      }
    },
    async reserve(){
      try{
          //this.getUserId();
          this.addEvent();
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
