const mongoose = require("mongoose");

//Creating a user schema
const userSchema = mongoose.Schema({
    user_type: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "UserType",
    },
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

//Creating a user model using user schema
const User = mongoose.model("User", userSchema);

module.exports = User;
