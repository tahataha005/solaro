const mongoose = require("mongoose");

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
});
