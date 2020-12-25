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
          <li>
            <a href="/manager/events"><span class="fa fa-calendar mr-3"></span> Events</a>
          </li>
          <li class="active">
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
        <div class="container">
          <h1>Suppliers</h1>
          <a class="text-success" data-toggle="modal" data-target="#addSupplierModal" @click="reset()">Add Contact <i class="fas fa-plus-circle fa-lg"></i></a>
          <div class="row row-cols-1 row-cols-md-3 g-4">
              <div v-for="supplier in suppliers" :key="supplier.id" class="col mb-3">
                <div class="card h-100">
                      <h5 class="card-header">{{ supplier.company_name }}</h5>
                      <div class="card-body">
                          <p class="card-text">Contact no: {{ supplier.contact_number }}</p>
                      </div>
                      <div class="card-footer">
                          <a data-toggle="modal" data-target="#showSupplierModal" class="btn btn-primary text-white btn-sm" @click="getSupplierById(supplier.id)">Details</a>
                          <a class="btn btn-primary btn-sm ml-1 text-white">History</a>
                      </div>
                  </div>
              </div>
          </div>
          <div class="modal fade" id="showSupplierModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">{{ company_name }}</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <p class="card-text">{{ description }}</p>
                  <div class="card-text"><small class="text-muted">Contact Person: {{ contact_person }}</small></div>
                  <div class="card-text"><small class="text-muted">Contact number: {{ contact_number }}</small></div>
                  <div class="card-text"><small class="text-muted">Email Address: {{ email }}</small></div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="addSupplierModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Add Contact</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="company_name">Company Name: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" id="company_name" v-model="company_name" required>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="description">Description: </label>
                    <div class="col-sm-8">
                      <textarea type="text" class="form-control" rows="4" id="description" v-model="description" required></textarea>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="contact_person">Contact Person: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" id="contact_person" v-model="contact_person" required>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="contact_number">Contact Number: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" id="contact_number" v-model="contact_number" required>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="email">Email Address: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" id="email" v-model="email" required>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" @click="addSupplier" data-dismiss="modal">Add</button>
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
  name: 'ManagerEmployees',
  data() {
    return {
      company_name: "",
      contact_person: "",
      description: "",
      contact_number: "",
      email: "",
      suppliers: [],
    };
  },

  created() {
    this.getSuppliers();
  },

  methods: {
    async getSuppliers() {
      try {
        const response = await axios.get("http://localhost:3000/manager/suppliers");
        this.suppliers = response.data;
        console.log(this.suppliers);
      } catch (err) {
        console.log(err);
      }
    },
    async getSupplierById(id) {
      try {
        const response = await axios.get(`http://localhost:3000/manager/suppliers/${id}`)
        this.company_name = response.data.company_name;
        this.contact_person = response.data.contact_person;
        this.description = response.data.description;
        this.contact_number = response.data.contact_number;
        this.email = response.data.email;
        console.log(response.data);
      } catch (err) {
        console.log(err)
      }
    },
    async addSupplier() {
      try {
        await axios.post("http://localhost:3000/manager/suppliers", {
          company_name: this.company_name,
          contact_person: this.contact_person,
          description: this.description,
          contact_number: this.contact_number,
          email: this.email,
        });
        this.company_name = "";
        this.contact_person = "";
        this.description = "";
        this.contact_number = "";
        this.email = "";
        this.getSuppliers();
      } catch (err) {
        console.log(err);
      }
    },
    reset() {
      this.company_name = "";
      this.contact_person = "";
      this.description = "";
      this.contact_number = "";
      this.email = "";
    }
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
