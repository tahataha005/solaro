const ItemHistory = require("../models/items.history.model.js");
const SolarHistory = require("../models/solar.history.model.js");

//Insert data
const insertItemData = async (req, res) => {
    try {
        //Destructuring req data
        const { item_id, consumption, time } = req.body;

        //Creating a new document
        const record = new ItemHistory();

        //Assigning document data
        record.item_id = item_id;
        record.consumption = consumption;
        record.timestamp = time;

        //Saving new document
        record.save();

        //Returning saved record
        res.status(200).json(record);
    } catch (error) {
        res.status(400).json(error.message);
    }
};

//Get history according to data
const getItemData = async (req, res) => {
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

module.exports = { insertItemData, getItemData };
