import { Request, Response } from "express";
import Logger from "../configs/logger";
import { Food, FoodDocument } from "../models/food.model";
import _ from "lodash";

export default class FoodController {
    public static async GetListFood(req: Request, res: Response) {
        try {
            const foods = await Food.find();

            res.status(200).json(foods);
        } catch (error) {
            Logger.error(error);
            res.status(500).json({
                error,
            });
        }
    }

    public static async GetDetailFood(req: Request, res: Response) {
        const {
            params: { food_id },
        } = req;

        try {
            const food = await Food.findById(food_id);

            res.status(200).json(food);
        } catch (error) {
            Logger.error(error);
            res.status(500).json({
                error,
            });
        }
    }

    public static async CreateFood(req: Request, res: Response) {
        const {
            body: { title, description, image, price },
        } = req;

        try {
            const newFood = await Food.create(
                new FoodDocument(title, description, image, price)
            );

            const food = await newFood.save();

            res.status(201).json(food);
        } catch (error) {
            Logger.error(error);
            res.status(500).json({
                error,
            });
        }
    }

    public static async UpdateFood(req: Request, res: Response) {
        const {
            params: { food_id },
            body,
        } = req;

        try {
            const existingFood = await Food.findById(food_id);

            if (!existingFood) {
                return res.status(400).json({
                    message: "Can not find food",
                });
            }

            const newFood = _.extend(existingFood, {
                ...body,
            });

            await Food.findByIdAndUpdate(food_id, newFood);

            res.status(200).json(newFood);
        } catch (error) {
            Logger.error(error);
            res.status(500).json({
                error,
            });
        }
    }

    public static async DeleteFood(req: Request, res: Response) {
        const {
            params: { food_id },
        } = req;

        try {
            await Food.findByIdAndDelete(food_id);

            res.status(200).json({
                message: "Delete Food Successfully",
            });
        } catch (error) {
            Logger.error(error);
            res.status(500).json({
                error,
            });
        }
    }
}
