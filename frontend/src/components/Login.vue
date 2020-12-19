<template>
  <div class="container">
    <i class="far fa-calendar-alt"></i>
    <div class="form-group">
      <label class="label">Username</label>
      <div class="control">
        <input class="form-control" type="text" placeholder="Enter username" v-model="username"/>
      </div>
    </div>

    <div class="form-group">
      <label class="label">Password</label>
      <div class="control">
        <input class="form-control" type="password" placeholder="Enter password" v-model="password"/>
      </div>
    </div>
    <div class="form-group">
      <button type="submit" class="btn btn-primary" @click="loginUser">LOGIN</button>
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
    };
  },
  methods: {
    // Create New product
    async loginUser() {
      try {
        const response = await axios.post("http://localhost:3000/login", {
          username: this.username,
          password: this.password,
        });
        this.user = response.data;
        this.username = "";
        this.password = "";
        if (this.user.user_type == 'admin') {
            this.$router.push("/admin/services");
        } else if (this.user.user_type == "manager") {
            this.$router.push("/manager/events");
        } else if (this.user.user_type == 'employee') {
            this.$router.push("/employee/events");
        } else if (this.user.user_type == 'client') {
            this.$router.push("/client/events");
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