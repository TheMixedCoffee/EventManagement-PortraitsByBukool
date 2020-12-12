import express from "express";

import { showUsers, showUserById } from "../controllers/account.js";

//Initialize Router
const router = express.Router();

//Get User
router.get('/user', showUsers);

//Get Single User
router.get('/user/:id', showUserById);

//Export default router
export default router;