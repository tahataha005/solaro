const mongoose = require("mongoose");

//Creating user type schema
const userTypeSchema = mongoose.Schema({
    user_type: {
        type: String,
        requried: true,
        unique: true,
        trim: true,
    },
});

//Creating user type schema
const UserType = mongoose.model("UserType", userTypeSchema);

module.exports = UserType;
