const mongoose = require("mongoose");

//Creating an item schema
const itemSchema = mongoose.Schema({
    solar_system: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "SolarSystem",
    },
    name: {
        type: String,
        required: "name is required",
        trim: true,
    },
    ideal_consumption: {
        type: Number,
        required: "ideal consumption is required",
    },
    live_consumption: {
        type: Number,
        default: 0,
    },
    timestamp: {
        type: Date,
        default: Date.now,
    },
});

//Creating an item model
const Item = mongoose.model("Item", itemSchema);

module.exports = Item;
