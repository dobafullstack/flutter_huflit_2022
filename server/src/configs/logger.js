"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const chalk_1 = __importDefault(require("chalk"));
class Logger {
    static success(msg) {
        console.log(chalk_1.default.bgGreen.black(msg));
    }
    static error(err) {
        if (err.message) {
            console.log(chalk_1.default.bgRed.black(err.message));
        }
        else {
            console.log(chalk_1.default.bgRed.black(err));
        }
    }
}
exports.default = Logger;
