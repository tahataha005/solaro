const mongoose = require("mongoose");

//Creating history schema
const historySchema = mongoose.Schema({
    item: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Item",
    },
    start: {
        type: date,
        required: "start date is required",
    },
    end: {
        type: date,
        required: "end date is required",
    },
    average_consumtion: {
        type: Number,
        required: "average consumption is required",
    },
});
