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
const category_model_1 = require("../models/category.model");
class CategoryController {
    static GetListCategory(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const categories = yield category_model_1.Category.find();
                res.status(200).json(categories);
            }
            catch (error) {
                logger_1.default.error(error);
                res.status(500).json({
                    error,
                });
            }
        });
    }
    static GetDetailCategory(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { params: { category_id }, } = req;
            try {
                const category = yield category_model_1.Category.findById(category_id);
                res.status(200).json(category);
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
exports.default = CategoryController;
