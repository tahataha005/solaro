const mongoose = require("mongoose");

const systemAveragesSchema = mongoose.Schema({
    system_id: {
        type: String,
        required: "system id required",
    },
    day: {
        type: Object,
        required: "date required",
    },
    avg_consumption: {
        type: Number,
        required: "average consumption required",
    },
});

const SystemAverage = mongoose.model("SystemAverage", systemAveragesSchema);

module.exports = SystemAverage;
