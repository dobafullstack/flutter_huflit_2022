import { Router } from "express";
import CategoryController from "../controllers/category.controller";

const router = Router();

router.get("/", CategoryController.GetListCategory);
router.get("/:category_id", CategoryController.GetDetailCategory);

export default router;
