import express from "express";

import { showUsers, showUserById, createUser, authUser } from "../controllers/account.js";
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

//Export default router
export default router;