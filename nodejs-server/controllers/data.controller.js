const ItemHistory = require("../models/items.history.model.js");
const SolarHistory = require("../models/solar.history.model.js");
const SolarAverage = require("../models/system.average.model.js");

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

//Get solar average last week
const getSolarAvg = async (req, res) => {
    // const end = new Date();
    // const start = new Date(end.getTime());
    // start.setDate(end.getDate() - 7);

    //Destructuring req body
    const { system_id } = req.body;
    try {
        //Getting data by system id and date
        const data = await SolarAverage.find({
            // day: { day: "wed" },
            system_id: system_id,
        });

        //Returning data
        res.status(200).json(data);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

//Calculating system average consumption of past day
const solarDailyAvg = async (req, res) => {
    //Array of week days to assign later
    const weekday = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

    //Setting range to calculate average on
    const currentDate = new Date();
    const previousDate = new Date(currentDate.getTime());
    previousDate.setDate(currentDate.getDate() - 1);

    //Destructuring req parameters
    const { system_id } = req.params;

    try {
        //Getting data and calculating average automatically
        const data = await SolarHistory.aggregate([
            {
                //Conditions
                $match: {
                    timestamp: { $gte: previousDate, $lte: currentDate },
                },
            },
            {
                //Calculating average consumption
                $group: {
                    _id: {
                        system_id: system_id,
                    },
                    avg: { $avg: "$consumption" },
                },
            },
        ]).exec();

        //Assigning week day
        const day = weekday[currentDate.getDay()];

        //Creating a new record
        const record = new SolarAverage();

        //Assigning record values
        record.system_id = system_id;
        record.day = { day, date: currentDate };
        record.avg_consumption = data[0].avg;

        //Saving new record
        record.save();

        //Returning created record
        res.status(200).json(record);
    } catch (error) {
        res.status(400).json(error);
    }
};

//Get item average last week
const getItemAvg = async (req, res) => {
    // const end = new Date();
    // const start = new Date(end.getTime());
    // start.setDate(end.getDate() - 7);

    //Destructuring req body
    const { item_id } = req.body;

    try {
        //Getting data by item id and date
        const data = await ItemAverage.find({
            // day: { day: "wed" },
            item_id: item_id,
        });

        //Returning data
        res.status(200).json(data);
    } catch (error) {
        res.status(400).json({ message: err.message });
    }
};

//Calculating item average consumption of past day
const itemDailyAvg = async (req, res) => {
    //Setting range to calculate average on
    const currentDate = new Date();
    const previousDate = new Date(currentDate.getTime());
    previousDate.setDate(currentDate.getDate() - 1);

    //Destructuring req parameters
    const { item_id } = req.params;

    try {
        //Getting data and calculating average automatically
        const data = await ItemHistory.aggregate([
            {
                //Conditions
                $match: {
                    timestamp: { $gte: previousDate, $lte: currentDate },
                },
            },
            {
                //Calculating average consumption automatically
                $group: {
                    _id: {
                        item_id: item_id,
                    },
                    avg: { $avg: "$consumption" },
                },
            },
        ]).exec();

        //Assigning week day
        const day = weekday[currentDate.getDay()];
    } catch (error) {
        res.status(400).json(error);
    }
};

module.exports = {
    insertItemData,
    getItemData,
    insertSystemData,
    getSystemData,
    getSolarAvg,
    solarDailyAvg,
    getItemAvg,
    itemDailyAvg,
};
