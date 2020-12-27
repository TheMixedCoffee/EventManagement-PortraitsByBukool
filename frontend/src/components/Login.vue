<template>
  <div class="bg">
    <div class="container">
      <link rel="stylesheet" href="../pages/css/about.css">
      <div class="row mt-5">
        <div class="col-sm-5 bg-dark border py-5 text-center">
          <img src="../../public/pages/img/sunlogo(gray).png" alt="" class="w-50">
          <h3 class="text-light poiret">Portraits by Bukool</h3>
          <br>
          <br>
          <h1 class="ramaraja" style="color: #A8A8A8;">Welcome Back</h1>
          <p style="color: #A8A8A8;">To help connected with us please login <br> with your personal info</p>
        </div>
        <div class="col-sm-7 p-5 align-self-center">
          <h1 class="ramaraja text-dark text-center">Login to your Account</h1>
          <div class="form-group">
            <label class="label">Username</label>
            <div class="control">
              <input class="form-control" type="text" placeholder="Enter your username" v-model="username"/>
            </div>
          </div>

          <div class="form-group">
            <label class="label">Password</label>
            <div class="control">
              <input class="form-control" type="password" placeholder="Enter your password" v-model="password"/>
            </div>
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary" @click="loginUser">LOGIN</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
 
<script>
// import axios
import axios from "axios";

export default {
  name: "Login",
  data() {
    return {
      user: [],
      username: "",
      password: "",
      account_id: "",
    };
  },
  methods: {
    // Create New product
    async loginUser() {
      try {
        const response = await axios.post("http://localhost:3000/login", {
          username: this.username,
          password: this.password,
          account_id: this.id,
        });
        this.user = response.data;
        this.account_id = this.user.id;
        this.username = "";
        this.password = "";
        if (this.user.user_type == 'admin') {
            this.$router.push("/admin/services");
        } else if (this.user.user_type == "manager") {
            this.$router.push("/manager/events");
        } else if (this.user.user_type == 'employee') {
            this.$router.push("/employee/events");
        } else if (this.user.user_type == 'client') {
            this.$router.push({name: "ClientEvents", params: {id: this.account_id}});
        }
      } catch (err) {
        console.log(err);
      }
    },
  },
};
</script>
 
<style>
</style>