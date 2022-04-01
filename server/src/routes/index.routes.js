"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const food_routes_1 = __importDefault(require("./food.routes"));
const category_routes_1 = __importDefault(require("./category.routes"));
const router = (0, express_1.Router)();
router.use("/food", food_routes_1.default);
router.use("/category", category_routes_1.default);
exports.default = router;
