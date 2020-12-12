import express from "express";

import { showUser } from "../controllers/account.js";

//Initialize Router
const router = express.Router();

//Get User
router.get('/user', getUser);

//Export default router
export default router;