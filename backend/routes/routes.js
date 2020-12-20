import express from "express";

import { showUsers, showUserById, createUser, authUser, showEmployees, showAssignedEvents, deleteUser, createEmployee } from "../controllers/account.js";
import { showServices, showServiceById, createService, deleteService, updateService } from "../controllers/service.js"

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

// Get all employees to Manager View
router.get('/manager/employees', showEmployees);

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

//Export default router
export default router;