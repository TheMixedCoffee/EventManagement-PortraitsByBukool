<template>
<div class="wrapper d-flex align-items-stretch">
			<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
			<link rel="stylesheet" href="../../pages/css/style.css">
			<nav id="sidebar">
				<div class="p-4">
					<h1><a href="" class="logo"><img src="../../../public/pages/img/sunlogo(original).png" width="100%" alt=""></a></h1>
        <div class="mb-5">
        <ul class="list-unstyled components mb-5">
          <li>
            <a href="/admin/services"><span class="fas fa-box-open mr-3"></span> Services</a>
          </li>
          <li>
            <a href="/admin/employees"><span class="fa fa-users mr-3"></span> Employees</a>
          </li>
          <li class="active">
            <a href="/admin/contacts"><span class="fas fa-address-book mr-3"></span> Contacts</a>
          </li>
          <li>
            <a href="/admin/inbox"><span class="fa fa-inbox mr-3"></span>  Inbox</a>
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
              <h1>Contacts</h1>
              <a class="text-success" data-toggle="modal" data-target="#addContactModal" @click="reset()">Add Contact <i class="fas fa-plus-circle fa-lg"></i></a>
              <!--LIST OF CONTACTS-->
              <div class="row mb-4">
              <div class="list-group col-sm-3">
                <a class="list-group-item list-group-item-action active text-light">Contact List</a>
                <div v-for="contact in contacts" :key="contact.id">
                  <a class="list-group-item list-group-item-action" v-on:click="showContact(contact.id)"> {{contact.contact_name}} </a>
                </div>
              </div>
              <div class="col-sm-9 border">
              <h3>Contact Details</h3>
              <div>
                <h4>{{ contactName }}</h4>
                <p style="whitespace: pre">{{ contactDescription }}</p>
                <p>{{ contactNum }}</p>
                <button type="button" v-if="clicked == 'clicked'" class="btn btn-danger mr-1 mb-2" data-toggle="modal" data-target="#deleteModal">Delete</button>
                <button type="button" v-if="clicked == 'clicked'" class="btn btn-info mb-2" data-toggle="modal" data-target="#updateContactModal">Update</button>
              </div>
            </div>
              </div>
            <!--END OF LIST OF CONTACTS-->
            <!-- ADD CONTACT MODAL-->
            <div class="modal fade" id="addContactModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                    <label class="col-sm-4 col-form-label" for="contact_name">Contact Name: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" id="contact_name" v-model="contactName" required>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="contact_number">Contact Number: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" id="contact_number" v-model="contactNum" required>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="contact_desc">Contact Description: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" id="contact_desc" v-model="contactDescription" required>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" @click="addContact" data-dismiss="modal">Add</button>
                </div>
              </div>
            </div>
          </div>
          <!--END OF ADD CONTACT MODAL-->
          <!--UPDATE MODAL-->
          <div class="modal fade" id="updateContactModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Update Contact</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="contact_name">Name: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" v-model="contactName" required>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="contact_desc">Description: </label>
                    <div class="col-sm-8">
                      <textarea type="text" class="form-control" rows="4" id="contact_desc" v-model="contactDescription" required></textarea>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="contact_number">Contact Number: </label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" v-model="contactNum" required>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" @click="updateContact(contactId)" data-dismiss="modal">Update</button>
                </div>
              </div>
            </div>
          </div>
          <!--END OF UPDATE MODAL-->
          <!--DELETE MODAL-->
          <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Delete Package</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  You are trying to delete this contact: {{ contactName }}. Do you want to continue?
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                  <button type="button" class="btn btn-danger" @click="deleteContact(contactId)" data-dismiss="modal">Delete</button>
                </div>
              </div>
            </div>
          </div>
          <!--END OF DELETE MODAL-->
      </div>
  </div>
</div>
</template>

<script>
import axios from "axios";

export default {
  name: 'AdminContacts',
  data() {
    return {
      contactId: "",
      contactName: "",
      contactNum: "",
      contactDescription: "",
      clicked: "unclicked",
      contacts: [],
    };
  },

  created(){
    this.getContacts();
  },

  methods:{
    async getContacts(){
      try {
        const response = await axios.get("http://localhost:3000/admin/contact");
        this.contacts = response.data;
        console.log(this.contacts);
      } catch (err) {
        console.log(err);
      }
    },
    async addContact() {
      try {
        await axios.post("http://localhost:3000/admin/contact", {
          contact_name: this.contactName,
          contact_desc: this.contactDescription,
          contact_number: this.contactNum,
        });
        this.contactName = "";
        this.contactDescription = "";
        this.contactNum = "";
        this.getContacts();
      } catch (err) {
        console.log(err);
      }
    },
    async deleteContact(id){
      try{
        await axios.delete(`http://localhost:3000/admin/contact/${id}`);
        this.reset();
        this.getContacts();
      } catch (err) {
        console.log(err);
      }
    },
    async showContact(id){
      try {
        const response = await axios.get(`http://localhost:3000/admin/contact/${id}`);
        console.log(response);
        this.contactId = id;
        this.contactName = response.data.contact_name;
        this.contactDescription = response.data.contact_desc;
        this.contactNum = response.data.contact_number;
        this.clicked = "clicked";
      } catch (err) {
        console.log(err);
      }
    },
    async updateContact(id){
      try {
        await axios.put(`http://localhost:3000/admin/contact/${id}`, {
          contact_name: this.contactName,
          contact_desc: this.contactDescription,
          contact_number: this.contactNum,
        });
        this.getContacts();
      } catch (err){
        console.log(err);
      }
    },
    reset(){
      this.contactName = "";
      this.contactDescription = "";
      this.contactNum = "";
      this.clicked = "unclicked"
    }
  }
  
}
</script>

<style scoped>
</style>