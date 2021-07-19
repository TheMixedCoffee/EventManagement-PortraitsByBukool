<template>
  <div class="container col-sm-5 border mt-4 p-5">
    <h1 class="ramaraja text-dark text-center">Reset Password</h1>
    <br>
    <div class="form-group row">
      <label class="col-form-label col-sm-4">Username</label>
      <div class="col-sm-8">
        <input class="form-control" type="text" placeholder="Enter username" v-model="username"/>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-form-label col-sm-4">New Password</label>
      <div class="col-sm-8">
        <input class="form-control" type="password" placeholder="Enter password" v-model="password"/>
      </div>
    </div>
    <div class="form-group">
      <button type="submit" class="btn btn-primary" @click="resetPassword">Reset Password</button>
    </div>
  </div>
</template>
 
<script>
// import axios
import axios from "axios";
 
export default {
  name: "ForgetPassword",
  data() {
    return {
      username: "",
      password: "",
    };
  },
  methods: {
    // Create New product
    async resetPassword() {
      try {
        await axios.post("http://localhost:3000/resetpassword", {
          username: this.username,
          password: this.password,
        });
        this.username = "";
        this.password = "";
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