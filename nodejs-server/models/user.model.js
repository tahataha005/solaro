const mongoose = require("mongoose");

//Creating an item schema
const itemSchema = mongoose.Schema({
    name: {
        type: String,
        required: "name is required",
        trim: true,
    },
    status: {
        type: Boolean,
        default: false,
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

//Creating a solar system schema
const solarSystemSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        unique: true,
        trim: 0,
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
    items: [itemSchema],
});

//Creating a user schema
const userSchema = mongoose.Schema({
    email: {
        type: String,
        required: "email is required",
        unique: true,
        trim: true,
    },

    password: {
        type: String,
        required: "password is required",
        trim: true,
    },
    user_type: {
        type: String,
        required: true,
    },
    system: [solarSystemSchema],
});

//Creating a user model using user schema
const User = mongoose.model("User", userSchema);

module.exports = User;