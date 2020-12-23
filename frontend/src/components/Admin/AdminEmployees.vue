<template>
  <div class="container">
    <h1>Admin Page - Employees</h1>
    <div class="mb-4">
      <a class="btn btn-outline-dark mr-1" href="/admin/services">Services</a>
      <a class="btn btn-outline-dark mr-1" href="/admin/employees">Employees</a>
      <a class="btn btn-outline-dark mr-1" href="/admin/contacts">Contacts</a>
      <a class="btn btn-outline-dark mr-1" href="/admin/inbox">Inbox</a>
    </div>
    <a class="text-success" data-toggle="modal" data-target="#addEmployeeModal" @click="reset()">Add Employee <i class="fas fa-plus-circle fa-lg"></i></a>
    <div class="row row-cols-1 row-cols-md-3 g-4">
      <div v-for="employee in employees" :key="employee.id" class="col mb-4">
        <a data-toggle="modal" data-target="#showEmployeeModal" @click="getAssignedEvents(employee.id)">
          <div class="card" style="max-width: 540px;">
            <div class="row no-gutters">
              <div class="col-md-4">
                <img src="../../../public/pages/img/employee.png" class="card-img" alt="">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title">{{ employee.firstname }} {{ employee.lastname }}</h5>
                  <p class="card-text">{{ employee.employee_type }}</p>
                  <div class="card-text"><small class="text-muted">{{ employee.contact }}</small></div>
                  <span class="card-text"><small class="text-muted">{{ employee.email }}</small></span>
                </div>
              </div>
            </div>
          </div>
        </a>
      </div>
    </div>
    <div class="modal fade" id="showEmployeeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">{{ firstname }} {{ lastname }}</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col col-sm-3">
                <img src="../../../public/pages/img/employee.png" class="card-img" alt="">
              </div>
              <div class="col col-sm-9">
                <p class="card-text">{{ employee_type }}</p>
                <div class="card-text"><small class="text-muted">{{ contact }}</small></div>
                <div class="card-text"><small class="text-muted">{{ email }}</small></div>
              </div>
            </div>
            <p>Currently Assigned Event:</p>
            <ul class="list-group">
              <li v-for="event in employeecard" :key="event.event_id" class="list-group-item">{{ event.event_name }}</li>
            </ul>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" @click="deleteEmployee(id)" data-dismiss="modal">Delete</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Message</button>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="addEmployeeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Add Employee</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-group row">
              <label class="col-sm-4 col-form-label" for="firstname">First Name: </label>
              <div class="col-sm-8">
                <input type="text" class="form-control" id="firstname" v-model="firstname" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-4 col-form-label" for="lastname">Last Name: </label>
              <div class="col-sm-8">
                <input type="text" class="form-control" id="lastname" v-model="lastname" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-4 col-form-label" for="email">Email Address: </label>
              <div class="col-sm-8">
                <input type="text" class="form-control" id="email" v-model="email" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-4 col-form-label" for="contact">Contact Number: </label>
              <div class="col-sm-8">
                <input type="text" class="form-control" id="contact" v-model="contact" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-4 col-form-label" for="position">Position</label>
              <div class="col-sm-8">
                <select class="form-control" id="position" v-model="employee_type" required>
                  <option selected="true" disabled="disabled" >Choose...</option>
                  <option value="Photographer">Photographer</option>
                  <option value="Editor">Editor</option>
                  <option value="Videographer">Videographer</option>
                </select>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" @click="addEmployee" data-dismiss="modal">Add</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'AdminEmployees',
  data() {
    return {
      id: "",
      firstname: "",
      lastname: "",
      employee_type: "",
      contact: "",
      email: "",
      employees: [],
      employeecard: [],
    };
  },

  created() {
    this.getEmployees();
  },

  methods: {
    async getEmployees() {
      try {
        const response = await axios.get("http://localhost:3000/admin/employees");
        this.employees = response.data;
        console.log(this.employees);
      } catch (err) {
        console.log(err);
      }
    },
    async getAssignedEvents(id) {
      try {
        const response = await axios.get(`http://localhost:3000/admin/employees/${id}`);
        this.id = response.data[0].id;
        this.firstname = response.data[0].firstname;
        this.lastname = response.data[0].lastname;
        this.employee_type = response.data[0].employee_type;
        this.contact = response.data[0].contact;
        this.email = response.data[0].email;
        this.employeecard = response.data;
        console.log(this.employeecard)
      } catch (err) {
        console.log(err);
      }
    },
    async deleteEmployee(id) {
      try {
        await axios.delete(`http://localhost:3000/admin/employees/${id}`);
        this.getEmployees();
      } catch (err) {
        console.log(err);
      }
    },
    async addEmployee() {
      try {
        await axios.post("http://localhost:3000/admin/employees", {
          username: "",
          password: "password123",
          firstname: this.firstname,
          lastname: this.lastname,
          email: this.email,
          contact: this.contact,
          employee_type: this.employee_type,
        });
        this.firstname = "";
        this.lastname = "";
        this.email = "";
        this.contact = "";
        this.employee_type = "";
        this.getEmployees();
      } catch (err) {
        console.log(err);
      }
    },
    reset() {
      this.firstname = "";
      this.lastname = "";
      this.email = "";
      this.contact = "";
      this.employee_type = "";
    }
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
