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
require("dotenv").config();
const app_1 = __importDefault(require("./configs/app"));
const logger_1 = __importDefault(require("./configs/logger"));
const mongodb_1 = __importDefault(require("./configs/mongodb"));
const { PORT } = process.env;
function main() {
    return __awaiter(this, void 0, void 0, function* () {
        yield (0, mongodb_1.default)();
        app_1.default.listen(PORT, () => logger_1.default.success(`Server is running on http://localhost:${PORT}`));
    });
}
main().catch((err) => logger_1.default.error(err));
