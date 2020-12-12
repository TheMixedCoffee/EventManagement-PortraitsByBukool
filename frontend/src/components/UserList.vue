<template>
  <div class="hello">
    <table>
      <thead>
        <th>UID</th>
        <th>Username</th>
        <th>Email</th>
        <th>User Type</th>
      </thead>
      <tbody>
        <tr v-for="user in users" :key="user.id">
          <td>{{ user.id }}</td>
          <td>{{ user.username }}</td>
          <td>{{ user.email }}</td>
          <td>{{ user.user_type }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'UserList',
  data() {
    return {
      users: [],
    };
  },

  created() {
    this.getUsers();
  },

  methods: {
    async getUsers() {
      try {
        const response = await axios.get("http://localhost:3000/user");
        this.users = response.data;
        console.log(this.users);
      } catch (err) {
        console.log(err);
      }
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
