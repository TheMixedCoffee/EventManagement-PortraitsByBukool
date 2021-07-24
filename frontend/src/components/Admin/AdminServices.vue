<template>
  <div class="wrapper d-flex align-items-stretch">
			<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
			<link rel="stylesheet" href="../../pages/css/style.css">
			<nav id="sidebar">
				<div class="p-4">
					<h1><a href="" class="logo"><img src="../../../public/pages/img/sunlogo(original).png" width="100%" alt=""></a></h1>
        <div class="mb-5">
        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a href="/admin/services"><span class="fas fa-box-open mr-3"></span> Services</a>
          </li>
          <li>
            <a href="/admin/employees"><span class="fa fa-users mr-3"></span> Employees</a>
          </li>
          <li>
            <a href="/admin/contacts"><span class="fas fa-address-book mr-3"></span> Contacts</a>
          </li>
          <li>
            <a href="/admin/inbox"><span class="fa fa-inbox mr-3"></span>  Inbox</a>
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
				<div class="container">
          <h1>Services</h1>
          <a class="text-success" data-toggle="modal" data-target="#addServiceModal" @click="reset()">Add Package  <i class="fas fa-plus-circle fa-lg"></i></a>
          <br>
          <a class="text-success" data-toggle="modal" data-target="#createServiceModal" @click="reset()">Create Package Type  <i class="fas fa-plus-circle fa-lg"></i></a>
          <br>
          <div class="row mt-2 mb-4">
            <div class="list-group col-sm-3">
              <a class="list-group-item list-group-item-action active text-light">Package List</a>
              <a class="list-group-item list-group-item-primary list-group-item-action" @click="showWedding(), reset()">Wedding
                <i v-if="weddingList == 'unshow'" class="fas fa-caret-down"></i>
                <i v-else class="fas fa-caret-up"></i>
              </a>
              <div v-if="weddingList == 'show'">
                <div v-for="service in services" :key="service.id">
                  <a v-if="service.event_type_id == 1" class="list-group-item list-group-item-action" v-on:click="showEvent(service.id)">{{ service.name }}</a>
                </div>
              </div>
              <a class="list-group-item list-group-item-success list-group-item-action" @click="showDebut(), reset()">Debut
                <i v-if="debutList == 'unshow'" class="fas fa-caret-down"></i>
                <i v-else class="fas fa-caret-up"></i>
              </a>
              <div v-if="debutList == 'show'">
                <div v-for="service in services" :key="service.id">
                  <a v-if="service.event_type_id == 2" class="list-group-item list-group-item-action" v-on:click="showEvent(service.id)">{{ service.name }}</a>
                </div>
              </div>
              <a class="list-group-item list-group-item-info list-group-item-action" @click="showEventList(), reset()">Corporate Events
                <i v-if="eventList == 'unshow'" class="fas fa-caret-down"></i>
                <i v-else class="fas fa-caret-up"></i>
              </a>
              <div v-if="eventList == 'show'">
                <div v-for="service in services" :key="service.id">
                  <a v-if="service.event_type_id == 3" class="list-group-item list-group-item-action" v-on:click="showEvent(service.id)">{{ service.name }}</a>
                </div>
              </div>
              <a class="list-group-item list-group-item-warning list-group-item-action" @click="showPortfolio(), reset()">Personal Portfolio
                <i v-if="portfolioList == 'unshow'" class="fas fa-caret-down"></i>
                <i v-else class="fas fa-caret-up"></i>
              </a>
              <div v-if="portfolioList == 'show'">
                <div v-for="service in services" :key="service.id">
                  <a v-if="service.event_type_id == 4" class="list-group-item list-group-item-action" @click="showEvent(service.id)">{{ service.name }}</a>
                </div>
              </div>
            </div>
            <div class="col-sm-9 border">
              <h3>Package Details</h3>
              <div>
                <h4>{{ packageName }}</h4>
                <p style="whitespace: pre">{{ packageDescription }}</p>
                <p>{{ packagePrice }}</p>
                <button type="button" v-if="clicked == 'clicked'" class="btn btn-danger mr-1" data-toggle="modal" data-target="#deleteModal">Delete</button>
                <button type="button" v-if="clicked == 'clicked'" class="btn btn-info" data-toggle="modal" data-target="#updateServiceModal">Update</button>
              </div>
            </div>
          </div>
          <div class="modal fade" id="addServiceModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Add New Package</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="name">Name: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" id="name" v-model="packageName" required>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="description">Details/Description: </label>
                    <div class="col-sm-8">
                      <textarea type="text" class="form-control" rows="4" id="description" v-model="packageDescription" required></textarea>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="price">Price: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" id="price" v-model="packagePrice" required>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="event_type">Event Type</label>
                    <div class="col-sm-8">
                      <select class="form-control" id="event_type" v-model="packageType" required>
                        <option v-for="event in eventTypes"  v-bind:key="event.id" v-bind:value="event.id">{{event.name}}</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" @click="addService" data-dismiss="modal">Add</button>
                </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="updateServiceModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Update Package</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="name">Name: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" v-model="packageName" required>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="description">Details/Description: </label>
                    <div class="col-sm-8">
                      <textarea type="text" class="form-control" rows="4" id="description" v-model="packageDescription" required></textarea>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="price">Price: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" v-model="packagePrice" required>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="event_type">Event Type</label>
                    <div class="col-sm-8">
                      <select class="form-control" id="event_type" v-model="packageType" required>
                          <option v-for="event in eventTypes"  v-bind:key="event.id" v-bind:value="event.id">{{event.name}}</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" @click="updateService(packageId)" data-dismiss="modal">Add</button>
                </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Delete Package</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  You are trying to delete this package: {{ packageName }}. Do you want to continue?
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                  <button type="button" class="btn btn-danger" @click="deleteService(packageId)" data-dismiss="modal">Delete</button>
                </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="createServiceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Create Package Type</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                 <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="name">Name: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" v-model="newPackageType" required>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                  <button type="button" class="btn btn-primary" @click="addEventType()" data-dismiss="modal">Add</button>
                </div>
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
  name: 'AdminServices',
  data() {
    return {
      packageId: "",
      packageName: "",
      packageDescription: "",
      packagePrice: "",
      packageType: "",
      newPackageType: "",
      weddingList: "unshow",
      debutList: "unshow",
      eventList: "unshow",
      portfolioList: "unshow",
      clicked: "unclicked",
      services: [],
      eventTypes: [],
    };
  },

  created() {
    this.getServices();
    this.getEventTypes();
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
    async getEventTypes(){
      try{
        const response = await axios.get("http://localhost:3000/admin/get_eventTypes");
        this.eventTypes = response.data;
        console.log(this.eventTypes);
      } catch (err){
        console.log(err);
      }
    },
    async addService() {
      try {
        await axios.post("http://localhost:3000/admin/services", {
          name: this.packageName,
          description: this.packageDescription,
          price: this.packagePrice,
          event_type_id: this.packageType,
        });
        this.packageName = "";
        this.packageDescription = "";
        this.packagePrice = "";
        this.packageType = "";
        this.getServices();
      } catch (err) {
        console.log(err);
      }
    },
    async addEventType(){
      try{
        await axios.post("http://localhost:3000/admin/create_eventType", {
          name: this.newPackageType
        });
        this.newPackageType = "";
        this.getEventTypes();
      } catch (err) {
        console.log(err);
      }
    },
    async deleteService(id) {
      try {
        await axios.delete(`http://localhost:3000/admin/services/${id}`);
        this.reset();
        this.getServices();
      } catch (err) {
        console.log(err);
      }
    },
    async showEvent(id) {
      try {
        const response = await axios.get(`http://localhost:3000/admin/services/${id}`);
        console.log(response);
        this.packageId = id;
        this.packageName = response.data.name;
        this.packageDescription = response.data.description;
        this.packagePrice = response.data.price;
        this.packageType = response.data.event_type_id;
        this.clicked = "clicked";
      } catch (err) {
        console.log(err);
      }
    },
    async updateService(id) {
      try {
        await axios.put(`http://localhost:3000/admin/services/${id}`, {
          name: this.packageName,
          description: this.packageDescription,
          price: this.packagePrice,
          event_type_id: this.packageType,
        });
        this.getServices();
      } catch (err) {
        console.log(err)
      }
    },
    reset() {
      this.packageName = "";
      this.packageDescription = "";
      this.packagePrice = "";
      this.clicked = "unclicked"
    },
    showWedding() {
      if(this.weddingList == "show") {
        this.weddingList = "unshow";
      } else {
        this.weddingList = "show";
      }
    },
    showDebut() {
      if(this.debutList == "show") {
        this.debutList = "unshow";
      } else {
        this.debutList = "show";
      }
    },
    showEventList() {
      if(this.eventList == "show") {
        this.eventList = "unshow";
      } else {
        this.eventList = "show";
      }
    },
    showPortfolio() {
      if(this.portfolioList == "show") {
        this.portfolioList = "unshow";
      } else {
        this.portfolioList = "show";
      }
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
