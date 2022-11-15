const ItemHistory = require("../models/items.history.model");

//Insert data
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

//Get history according to data
const getData = async (req, res) => {
    try {
        //Destructuring req data
        const { item_id } = req.params;

        //Getting documents accoring to item id
        const retrieved = await ItemHistory.find({ item_id });

        //Returning retrieved data
        res.status(200).json(retrieved);
    } catch (error) {
        res.status(400).json(error.message);
    }
};

module.exports = { insertData, getData };
