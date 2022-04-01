"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const food_controller_1 = __importDefault(require("../controllers/food.controller"));
const router = (0, express_1.Router)();
router
    .route("/")
    .get(food_controller_1.default.GetListFood)
    .post(food_controller_1.default.CreateFood);
router
    .route("/:food_id")
    .get(food_controller_1.default.GetDetailFood)
    .put(food_controller_1.default.UpdateFood)
    .delete(food_controller_1.default.DeleteFood);
exports.default = router;
