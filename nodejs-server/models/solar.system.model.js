const mongoose = require("mongoose");

const solarSystemSchema = mongoose.Schema({
    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
    },
    connection: {
        type: String,
        required: "connection is required",
    },
    charging: {
        type: Number,
        default: 0,
    },
    consumption: {
        type: Number,
        default: 0,
    },
});
