import express from "express";
import cors from "cors";
import bcrypt from "bcrypt";
import session from "express-session";
import Router from "./routes/routes.js";

export const saltRounds = 10;

const app = express();

app.use(express.json());

app.use(cors());

app.use(session({
    secret: "BaPerQuiQui",
    saveUninitialized: true,
    resave: true
}));

app.use(Router);

app.listen(3000, () => console.log('Server running at http://localhost:3000'));