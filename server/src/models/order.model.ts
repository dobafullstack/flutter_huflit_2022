import mongoose from "mongoose";

export class OrderDocument {
    constructor(
        public username: string,
        public address: string,
        public total: number,
        public order_details: mongoose.Types.Array<string>,
        public status: string,
        public created_at: Date
    ) {}
}

const schema = new mongoose.Schema<OrderDocument>(
    {
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
    },
    {
        collection: "order",
        versionKey: false,
    }
);

export const Order = mongoose.model<OrderDocument>("Order", schema);
