<template>
  <div>
    <div class="field">
      <label class="label">First Name</label>
      <div class="control">
        <input class="input" type="text" placeholder="Enter First Name" v-model="firstname"/>
      </div>
    </div>

    <div class="field">
      <label class="label">Last Name</label>
      <div class="control">
        <input class="input" type="text" placeholder="Enter Last Name" v-model="lastname"/>
      </div>
    </div>

    <div class="field">
      <label class="label">Username</label>
      <div class="control">
        <input class="input" type="text" placeholder="Enter username" v-model="username"/>
      </div>
    </div>
 
    <div class="field">
      <label class="label">Password</label>
      <div class="control">
        <input class="input" type="password" placeholder="Enter password" v-model="password"/>
      </div>
    </div>

    <div class="field">
      <label class="label">Email Address</label>
      <div class="control">
        <input class="input" type="text" placeholder="Enter email address" v-model="email"/>
      </div>
    </div>
 
    <div class="control">
      <button type="submit" class="button is-success" @click="createUser">SIGNUP</button>
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