"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Category = exports.CategoryDocument = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
class CategoryDocument {
    constructor(title, image) {
        this.title = title;
        this.image = image;
    }
}
exports.CategoryDocument = CategoryDocument;
const schema = new mongoose_1.default.Schema({
    title: {
        type: String,
        required: true,
    },
    image: {
        type: String,
        required: true,
    },
}, {
    collection: "category",
    versionKey: false,
});
exports.Category = mongoose_1.default.model("Category", schema);
