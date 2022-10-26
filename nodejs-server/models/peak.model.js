const mongoose = require("mongoose");

//Creating peak schema
const peakSchema = mongoose.Schema({
    item: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Item",
    },
    peak: {
        type: Number,
        required: "peak is required",
    },
    timestamp: {
        type: date,
        required: "date is required",
    },
});
