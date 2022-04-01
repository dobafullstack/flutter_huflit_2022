"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const logger_1 = __importDefault(require("../configs/logger"));
const food_model_1 = require("../models/food.model");
const lodash_1 = __importDefault(require("lodash"));
class FoodController {
    static GetListFood(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const foods = yield food_model_1.Food.find();
                res.status(200).json(foods);
            }
            catch (error) {
                logger_1.default.error(error);
                res.status(500).json({
                    error,
                });
            }
        });
    }
    static GetDetailFood(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { params: { food_id }, } = req;
            try {
                const food = yield food_model_1.Food.findById(food_id);
                res.status(200).json(food);
            }
            catch (error) {
                logger_1.default.error(error);
                res.status(500).json({
                    error,
                });
            }
        });
    }
    static CreateFood(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { body: { title, description, image, price }, } = req;
            try {
                const newFood = yield food_model_1.Food.create(new food_model_1.FoodDocument(title, description, image, price));
                const food = yield newFood.save();
                res.status(201).json(food);
            }
            catch (error) {
                logger_1.default.error(error);
                res.status(500).json({
                    error,
                });
            }
        });
    }
    static UpdateFood(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { params: { food_id }, body, } = req;
            try {
                const existingFood = yield food_model_1.Food.findById(food_id);
                if (!existingFood) {
                    return res.status(400).json({
                        message: "Can not find food",
                    });
                }
                const newFood = lodash_1.default.extend(existingFood, Object.assign({}, body));
                yield food_model_1.Food.findByIdAndUpdate(food_id, newFood);
                res.status(200).json(newFood);
            }
            catch (error) {
                logger_1.default.error(error);
                res.status(500).json({
                    error,
                });
            }
        });
    }
    static DeleteFood(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { params: { food_id }, } = req;
            try {
                yield food_model_1.Food.findByIdAndDelete(food_id);
                res.status(200).json({
                    message: "Delete Food Successfully",
                });
            }
            catch (error) {
                logger_1.default.error(error);
                res.status(500).json({
                    error,
                });
            }
        });
    }
}
exports.default = FoodController;
