import mongoose from "mongoose";

export class CategoryDocument {
    constructor(public title: string, public image: string) {}
}

const schema = new mongoose.Schema<CategoryDocument>(
    {
        title: {
            type: String,
            required: true,
        },
        image: {
            type: String,
            required: true,
        },
    },
    {
        collection: "category",
        versionKey: false,
    }
);

export const Category = mongoose.model<CategoryDocument>("Category", schema);
