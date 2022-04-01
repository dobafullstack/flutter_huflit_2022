import mongoose from "mongoose";
import Logger from "./logger";

export default async function connectMongo() {
  const url = process.env.MONGO_DB_URL as string;

  try {
    await mongoose.connect(url);

    Logger.success("MongoDB connected");
  } catch (error) {
    Logger.error(error);
  }
}
