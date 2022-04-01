"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Order = exports.OrderDocument = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
class OrderDocument {
    constructor(username, address, total, order_details, status, created_at) {
        this.username = username;
        this.address = address;
        this.total = total;
        this.order_details = order_details;
        this.status = status;
        this.created_at = created_at;
    }
}
exports.OrderDocument = OrderDocument;
const schema = new mongoose_1.default.Schema({
    username: {
        type: String,
        required: true,
    },
    address: {
        type: String,
        required: true,
    },
    total: {
        type: Number,
        required: true,
    },
    order_details: {
        type: [String],
        required: true,
    },
    status: {
        type: String,
        required: true,
    },
    created_at: {
        type: Date,
        required: true,
    },
}, {
    collection: "order",
    versionKey: false,
});
exports.Order = mongoose_1.default.model("Order", schema);
