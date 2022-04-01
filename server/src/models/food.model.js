"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Food = exports.FoodDocument = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
class FoodDocument {
    constructor(title, description, image, price) {
        this.title = title;
        this.description = description;
        this.image = image;
        this.price = price;
    }
}
exports.FoodDocument = FoodDocument;
const schema = new mongoose_1.default.Schema({
    title: {
        type: String,
        required: true,
    },
    image: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    price: {
        type: Number,
        required: true,
    },
}, {
    collection: "food",
    versionKey: false,
});
exports.Food = mongoose_1.default.model("Food", schema);
