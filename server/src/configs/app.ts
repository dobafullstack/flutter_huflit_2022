import bodyParser from "body-parser";
import express from "express";
import cookieParser from "cookie-parser";
import router from "../routes/index.routes";

const app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cookieParser());
app.use("/api", router);

export default app;
