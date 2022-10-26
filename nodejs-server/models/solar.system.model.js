const mongoose = require("mongoose");

//Creating a solar system schema
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

//Creating a solar system model
const SolarSystem = mongoose.model("SolarSystem", solarSystemSchema);

module.exports = SolarSystem;
