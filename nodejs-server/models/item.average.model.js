const mongoose = require("mongoose");

const itemAveragesSchema = mongoose.Schema({
    item_id: {
        type: String,
        required: "item id required",
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
