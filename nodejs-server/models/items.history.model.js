const mongoose = require("mongoose");

const itemsHistorySchema = mongoose.Schema({
    item_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Item",
    },
    consumption: {
        type: Number,
        required: "peak is required",
    },
    timestamp: {
        type: Date,
        required: "date is required",
        default: Date.now,
    },
});

const ItemHistory = mongoose.model("ItemHistory", itemsHistorySchema);

module.exports = ItemHistory;
