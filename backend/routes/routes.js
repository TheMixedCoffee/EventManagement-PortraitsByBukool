import express from "express";

import { showUsers, showUserById, createUser } from "../controllers/account.js";
import { showSerVices, showServiceById, createService } from "../controllers/service.js"

//Initialize Router
const router = express.Router();

//Get User
router.get('/users', showUsers);

//Get Single User
router.get('/user/:id', showUserById);

//Create User
router.post('/register', createUser);

// Get all services
router.get('/services', showSerVices);

// Create New Service
router.post('/addservice', createService);

//Export default router
export default router;