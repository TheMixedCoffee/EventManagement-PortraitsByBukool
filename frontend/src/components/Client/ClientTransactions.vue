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
        <li>
          <a @click="redirect('ClientEvents')"><span class="fa fa-calendar mr-3"></span> Events</a>
        </li>
        <li class="active">
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
      <div>
        <h1>Transactions</h1>
         <a class="list-group-item list-group-item-action" v-for="event in events" :key="event.id">
            {{event.event_name}} ||  {{event.event_date}}
        </a>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'ClientTransactions',
  data() {
    return {
      eventStatus: "",
      account_id: -1,
      events: [],
      services: [],
    };
  },

  created() {
    this.account_id = this.$route.params.id;
    console.log("The account id is: " + this.account_id);
    this.getEvents();
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
    async getEvents() {
      try {
        const response = await axios.get(`http://localhost:3000/get_completed/${this.account_id}`)
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
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
