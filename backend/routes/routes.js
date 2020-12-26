import express from "express";

import { showUsers, showUserById, createUser, authUser, showEmployees, showAssignedEvents, deleteUser, createEmployee, showUserByEmail } from "../controllers/account.js";
import { showServices, showServiceById, createService, deleteService, updateService } from "../controllers/service.js"
import { createSupplier, showSupplierById, showSuppliers } from "../controllers/supplier.js"
import { showContacts, showContactById, createContact, updateContact, deleteContact} from "../controllers/contact.js"
import { showAllEventTypes, showEventTypeById } from "../controllers/event_type.js"
import { showAllEvents, showEventByAccount, showEventByEmployee, showEventById, createEvent} from "../controllers/event.js"

// Initialize Router
const router = express.Router();

// Get User
router.get('/users', showUsers);
// Get Single User
router.get('/user/:id', showUserById);
// Create User
router.post('/register', createUser);
// Login User
router.post('/login', authUser);
// Get all services
router.get('/services', showServices);
// Get all event types
router.get('/event_types', showAllEventTypes);
// Create an event
router.post('/create_event/', createEvent);
// Get user by email
router.get('/user_email', showUserByEmail);

// Admin routes
// Get all employees to Admin View
router.get('/admin/employees', showEmployees);
// Get assigned events of an employee
router.get('/admin/employees/:id', showAssignedEvents);
// Delete Employee
router.delete('/admin/employees/:id', deleteUser);
// Create New Employee
router.post('/admin/employees', createEmployee);
// Get all services
router.get('/admin/services/:id', showServiceById);
// Create New Service
router.post('/admin/services', createService);
// Update a Service
router.put('/admin/services/:id', updateService);
// Delete a Service
router.delete('/admin/services/:id', deleteService);
//Get all contacts
router.get('/admin/contact', showContacts);
//Search for a specific contact
router.get('/admin/contact/:id', showContactById);
//Create contact
router.post('/admin/contact', createContact);
//Update a contact
router.put('/admin/contact/:id', updateContact);
//Delete Contact
router.delete('/admin/contact/:id', deleteContact);

// Manager routes
// Get all employees to Manager View
router.get('/manager/employees', showEmployees);
// Create New Employee
router.post('/manager/employees', createEmployee);
// Get assigned events of an employee
router.get('/manager/employees/:id', showAssignedEvents);
// Get all Supplier
router.get('/manager/suppliers', showSuppliers);
// Get Single Supplier
router.get('/manager/suppliers/:id', showSupplierById);
// Create New Supplier
router.post('/manager/suppliers', createSupplier);

//Export default router
export default router;