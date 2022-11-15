const ItemHistory = require("../models/items.history.model");

const insertData = async (req, res) => {
    try {
        //Destructuring req data
        const { item_id } = req.body;

        //Creating a new document
        const record = new ItemHistory();

        //Assigning document data
        record.item_id = item_id;
        record.consumption = 5;
        record.timestamp = "12-8-2022";

        //Saving new document
        record.save();

        //Returning saved record
        res.status(200).json(record);
    } catch (error) {
        res.status(400).json(error.message);
    }
};

module.exports = { insertData };
