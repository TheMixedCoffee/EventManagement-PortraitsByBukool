<template>
  <div>
    <div class="field">
      <label class="label">Service/Package Name</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Enter name"
          v-model="name"
        />
      </div>
    </div>
 
    <div class="field">
      <label class="label">Service/Package Desciption</label>
      <div class="control">
        <input
          class="input"
          type="textfield"
          placeholder="Enter description"
          v-model="description"
        />
      </div>
    </div>

    <div class="field">
      <label class="label">Price</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Enter price"
          v-model="price"
        />
      </div>
    </div>
 
    <div class="control">
      <button class="button is-success" @click="saveService">SAVE</button>
    </div>
  </div>
</template>
 
<script>
// import axios
import axios from "axios";
 
export default {
  name: "AddService",
  data() {
    return {
      name: "",
      description: "",
      price: "",
    };
  },
  methods: {
    // Create New Service
    async saveService() {
      try {
        await axios.post("http://localhost:3000/addservice", {
          name: this.name,
          description: this.description,
          price: this.price,
        });
        this.name = "";
        this.description = "";
        this.price = ""
        this.$router.push("/services");
      } catch (err) {
        console.log(err);
      }
    },
  },
};
</script>
 
<style>
</style>