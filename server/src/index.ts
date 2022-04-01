require("dotenv").config();
import app from "./configs/app";
import Logger from "./configs/logger";
import connectMongo from "./configs/mongodb";

const { PORT } = process.env;

async function main() {
  await connectMongo();

  app.listen(PORT, () => Logger.success(`Server is running on http://localhost:${PORT}`));
}

main().catch((err) => Logger.error(err));
