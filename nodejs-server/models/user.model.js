const mongoose = require("mongoose");

//Creating a solar system schema
const solarSystemSchema = mongoose.Schema({
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
