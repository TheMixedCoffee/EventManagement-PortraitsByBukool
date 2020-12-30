<template>
  <div class="container col-sm-5 border mt-4 p-5">
    <div class="text-center">
      <img src="../../public/pages/img/sunlogo(original).png" alt="" class="w-25">
    </div>
    <h1 class="ramaraja text-dark text-center">Create an Account</h1>
    <br>
    <div class="form-group row">
      <label class="col-form-label col-sm-4">First Name</label>
      <div class="col-sm-8">
        <input class="form-control" type="text" placeholder="Enter First Name" v-model="firstname"/>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-form-label col-sm-4">Last Name</label>
      <div class="col-sm-8">
        <input class="form-control" type="text" placeholder="Enter Last Name" v-model="lastname"/>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-form-label col-sm-4">Username</label>
      <div class="col-sm-8">
        <input class="form-control" type="text" placeholder="Enter username" v-model="username"/>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-form-label col-sm-4">Password</label>
      <div class="col-sm-8">
        <input class="form-control" type="password" placeholder="Enter password" v-model="password"/>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-form-label col-sm-4">Email Address</label>
      <div class="col-sm-8">
        <input class="form-control" type="text" placeholder="Enter email address" v-model="email"/>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-form-label col-sm-4">Contact Number</label>
      <div class="col-sm-8">
        <input class="form-control" type="text" placeholder="Enter contact number" v-model="contact"/>
      </div>
    </div>
    <div class="form-group">
      <button type="submit" class="btn btn-primary" @click="createUser">SIGNUP</button>
    </div>
    <div>
      Already have an account? <a href="/login">Login here</a>
    </div>
  </div>
</template>
 
<script>
// import axios
import axios from "axios";
 
export default {
  name: "CreateUser",
  data() {
    return {
      firstname: "",
      lastname: "",
      username: "",
      password: "",
      email: "",
      contact: "",
    };
  },
  methods: {
    // Create New product
    async createUser() {
      try {
        await axios.post("http://localhost:3000/register", {
          username: this.username,
          password: this.password,
          firstname: this.firstname,
          lastname: this.lastname,
          email: this.email,
          contact: this.contact,
        });
        this.username = "";
        this.password = "";
        this.firstname = "";
        this.lastname = "";
        this.email = "";
        this.$router.push("/login");
      } catch (err) {
        console.log(err);
      }
    },
  },
};
</script>
 
<style>
</style>