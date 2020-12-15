<template>
  <div>
    <div class="field">
      <label class="label">Username</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Enter username"
          v-model="username"
        />
      </div>
    </div>
 
    <div class="field">
      <label class="label">Password</label>
      <div class="control">
        <input
          class="input"
          type="password"
          placeholder="Enter password"
          v-model="password"
        />
      </div>
    </div>

    <div class="field">
      <label class="label">Email Address</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Enter email address"
          v-model="email"
        />
      </div>
    </div>
 
    <div class="control">
      <button class="button is-success" @click="saveProduct">SAVE</button>
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
      username: "",
      password: "",
      email: "",
    };
  },
  methods: {
    // Create New product
    async saveProduct() {
      try {
        await axios.post("http://localhost:3000/register", {
          username: this.username,
          password: this.password,
          email: this.email,
        });
        this.username = "";
        this.password = "";
        this.email = ""
        this.$router.push("/user");
      } catch (err) {
        console.log(err);
      }
    },
  },
};
</script>
 
<style>
</style>