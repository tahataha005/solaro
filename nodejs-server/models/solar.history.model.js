const mongoose = require("mongoose");

//Creating a schema for solar history collection
const solarHistorySchema = mongoose.Schema({
    system_id: {
        type: String,
        required: "system_id is required",
    },
    charging: {
        type: Number,
        required: "charging is required",
    },
    consumption: {
        type: Number,
        required: "consumption is required",
    },
    timestamp: {
        type: Date,
        required: "time is required",
        default: Date.now,
    },
});

//Creating solar history model using schema
const SolarHistory = mongoose.model("solarHistory", solarHistorySchema);

module.exports = SolarHistory;
