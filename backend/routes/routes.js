import express from "express";

import { showUsers, showUserById, createUser, authUser, showEmployees, showAssignedEvents, deleteUser, createEmployee } from "../controllers/account.js";
import { showServices, showServiceById, createService } from "../controllers/service.js"

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

// Create New Service
router.post('/addservice', createService);

// Get all employees to Manager View
router.get('/manager/employees', showEmployees);

// Get all employees to Admin View
router.get('/admin/employees', showEmployees);

// Get assigned events of an employee
router.get('/admin/employees/:id', showAssignedEvents);

// Delete Employee
router.delete('/admin/employees/:id', deleteUser);

router.post('/admin/employees', createEmployee);

//Export default router
export default router;