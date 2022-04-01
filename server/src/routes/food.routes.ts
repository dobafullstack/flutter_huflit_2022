import { Router } from "express";
import FoodController from "../controllers/food.controller";

const router = Router();

router
    .route("/")
    .get(FoodController.GetListFood)
    .post(FoodController.CreateFood);

router
    .route("/:food_id")
    .get(FoodController.GetDetailFood)
    .put(FoodController.UpdateFood)
    .delete(FoodController.DeleteFood);

export default router;
