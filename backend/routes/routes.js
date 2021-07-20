import express from "express";

import { showUsers, showUserById, createUser, authUser, showUserByName, showEmployees, showAssignedEvents, deleteUser, createEmployee, showUserByEmail, resetPassword } from "../controllers/account.js";
import { showServices, showServiceById, createService, deleteService, updateService } from "../controllers/service.js"
import { createSupplier, showSupplierById, showSuppliers, showSupplierContacts, createSupplierContact } from "../controllers/supplier.js"
import { showContacts, showContactNumbers, showContactById, createContact, updateContact, deleteContact} from "../controllers/contact.js"
import { showAllEventTypes, showEventTypeById } from "../controllers/event_type.js"
import { showAllEvents, showEventByAccount, showEventByEmployee, showEventById, createEvent, showAllOngoingEvents, updateEvent, showAllCompletedEvents, showAllPendingEvents, showCompletedEventsByAccount,} from "../controllers/event.js"
import { showServiceByEventId, linkEventService } from "../controllers/event_service.js"
import { showTasksByEventId, createTask, showTaskByEmployee, showTaskById, setTaskComplete } from "../controllers/task.js";

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
// Reset Password
router.post('/resetpassword', resetPassword)
// Get all services
router.get('/services', showServices);
// Get all event types
router.get('/event_types', showAllEventTypes);
// Create an event
router.post('/create_event/', createEvent);
// Get user by email
router.get('/user_email', showUserByEmail);
// Get all events
router.get('/event', showAllEvents);
//Get all ongoing events
router.get('/event_ongoing', showAllOngoingEvents);
//Get all pending events
router.get('/event_pending', showAllPendingEvents);
//Get events by id
router.get('/event/:id', showEventById);
//Get events by user id
router.get('/event_user/:id', showEventByAccount);
//Get user by name
router.get('/get_account_id/:username', showUserByName);
//Get completed Events
router.get('/get_completed', showAllCompletedEvents);
//Get completed Events by Account
router.get('/get_completed/:id', showCompletedEventsByAccount);
//Insert event service
router.post('/link_event', linkEventService);

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
// Get all contact numbers
router.get('/admin/contactnumber/:id', showContactNumbers);
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
// Get all Contact Numbers
router.get('/manager/contacts', showSupplierContacts);
// Get Single Supplier
router.get('/manager/suppliers/:id', showSupplierById);
// Create New Supplier
router.post('/manager/suppliers', createSupplier);
// Create New Contact
router.post('/manager/contacts', createSupplierContact);
//Update an Event
router.put('/event_update/:id', updateEvent);
//Get task by Event Id
router.get('/get_tasks/:id', showTasksByEventId)
//Create new task
router.post('/create_task', createTask);

//Employee routes
//Get event based on employee id
router.get('/employee/events/:id', showEventByEmployee);
//Get tasks based on employee id
router.get('/employee/tasks/:id', showTaskByEmployee);
//Get task by Task Id
router.get('/employee/get_task/:id', showTaskById);
//Update task into complete
router.put('/employee/tasks/:id', setTaskComplete);

//Export default router
export default router;