import mongoose from "mongoose";

export class FoodDocument {
    constructor(
        public title: string,
        public description: string,
        public image: string,
        public price: number
    ) {}
}

const schema = new mongoose.Schema<FoodDocument>(
    {
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
    },
    {
        collection: "food",
        versionKey: false,
    }
);

export const Food = mongoose.model<FoodDocument>("Food", schema);
