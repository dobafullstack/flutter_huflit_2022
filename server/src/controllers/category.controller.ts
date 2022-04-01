import { Request, Response } from "express";
import Logger from "../configs/logger";
import { Category, CategoryDocument } from "../models/category.model";
import { Food, FoodDocument } from "../models/food.model";

export default class CategoryController {
    public static async GetListCategory(req: Request, res: Response) {
        try {
            const categories = await Category.find();

            res.status(200).json(categories);
        } catch (error) {
            Logger.error(error);
            res.status(500).json({
                error,
            });
        }
    }

    public static async GetDetailCategory(req: Request, res: Response) {
        const {
            params: { category_id },
        } = req;

        try {
            const category = await Category.findById(category_id);

            res.status(200).json(category);
        } catch (error) {
            Logger.error(error);
            res.status(500).json({
                error,
            });
        }
    }
}
