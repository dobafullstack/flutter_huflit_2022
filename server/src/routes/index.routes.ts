import { Router } from "express";
import FoodRoute from "./food.routes";
import CategoryRoute from "./category.routes";

const router = Router();

router.use("/food", FoodRoute);
router.use("/category", CategoryRoute);

export default router;
