const mongoose = require("mongoose");

//Creating peak schema
const peakSchema = mongoose.Schema({
    item: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
    },
    peak: {
        type: Number,
        required: "peak is required",
    },
    timestamp: {
        type: Date,
        required: "date is required",
    },
});

//Creating a peak model
const Peak = mongoose.model("Peak", peakSchema);

module.exports = Peak;
