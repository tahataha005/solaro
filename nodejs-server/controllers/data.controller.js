const ItemHistory = require("../models/items.history.model.js");
const SolarHistory = require("../models/solar.history.model.js");

//Insert item history data
const insertItemData = async (req, res) => {
    try {
        //Destructuring req data
        const { item_id, consumption, time } = req.body;

        //Creating a new document
        const record = new ItemHistory();

        //Assigning document data
        record.item_id = item_id;
        record.consumption = consumption;

        //Saving new document
        record.save();

        //Returning saved record
        res.status(200).json(record);
    } catch (error) {
        res.status(400).json(error.message);
    }
};

//Get item history according to id
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

//Insert system history data
const insertSystemData = async (req, res) => {
    //Destructuring req data
    const { system_id, charging, consumption, time } = req.body;

    try {
        //Creating a new document
        const record = new SolarHistory();

        //Assigning document data
        record.system_id = system_id;
        record.charging = charging;
        record.consumption = consumption;

        //Saving new document
        record.save();

        //Returning saved record
        res.status(200).json(record);
    } catch (error) {
        res.status(400).json(error.message);
    }
};

//Get system history according to id
const getSystemData = async (req, res) => {
    try {
        //Destructuring req data
        const { system_id } = req.params;

        //Getting documents accoring to item id
        const retrieved = await SolarHistory.find({ system_id });

        //Returning retrieved data
        res.status(200).json(retrieved);
    } catch (error) {
        res.status(400).json(error.message);
    }
};

module.exports = {
    insertItemData,
    getItemData,
    insertSystemData,
    getSystemData,
};
