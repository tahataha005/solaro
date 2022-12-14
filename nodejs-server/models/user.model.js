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
    consumptionPin: {
        type: String,
        required: "consumptionPin is required",
    },
    controlPin: {
        type: String,
        required: "controlPin is required",
    },
    ideal_consumption: {
        type: Number,
        required: "ideal consumption is required",
    },
});

//Creating a solar system schema
const solarSystemSchema = mongoose.Schema({
    _id: {
        type: mongoose.Schema.Types.ObjectId,
        unique: true,
        index: true,
        auto: true,
    },
    name: {
        type: String,
        required: true,
        trim: 0,
    },
    chargingPin: {
        type: String,
        required: "charingPin is required",
    },
    consumptionPin: {
        type: String,
        required: "consumptionPin is required",
    },
    capacity: {
        type: Number,
        required: "capacity is required",
    },
    items: [itemSchema],
});

//Creating a notification schema
const notificationSchema = mongoose.Schema({
    _id: {
        type: mongoose.Schema.Types.ObjectId,
        unique: true,
        index: true,
        auto: true,
    },
    title: {
        type: String,
        required: true,
        trim: true,
    },
    body: {
        type: String,
        required: true,
        trim: true,
    },
    time: {
        type: String,
        required: true,
        trim: true,
    },
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
        select: false,
    },
    user_type: {
        type: String,
        required: true,
    },
    notifications: [notificationSchema],
    system: [solarSystemSchema],
});

//Creating a user model using user schema
const User = mongoose.model("User", userSchema);

module.exports = User;
