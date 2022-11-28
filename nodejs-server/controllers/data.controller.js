const User = require("../models/user.model.js");
const ItemHistory = require("../models/items.history.model.js");
const SolarHistory = require("../models/solar.history.model.js");
const SolarAverage = require("../models/system.average.model.js");
const Peak = require("../models/peak.model.js");
const { sendNotification } = require("./notifications.controller");
const { socketIO } = require("../config/socket.config")();

//Insert item history data
const insertItemData = async (req, res) => {
    try {
        //Destructuring req data
        const { user_id, system_id, item_id, consumption, peak } = req.body;
        const registrationToken = req.headers.registrationtoken;

        //Creating a new document
        const record = new ItemHistory();

        //Assigning document data
        record.item_id = item_id;
        record.consumption = consumption;

        //Saving new document
        record.save();

        if (peak) {
            //Getting user by id
            const user = await User.findById(user_id);

            //Filtering array of solar systems
            const system = user.system.filter(system => {
                return system.id == system_id;
            })[0];

            //Filtering items to get desired item
            const item = system.items.filter(item => {
                return item.id == item_id;
            })[0];

            sendNotification({
                systemName: system.name,
                itemName: item.name,
                consumption,
                registrationToken,
            });

            //if item not found return not found
            if (!item)
                return res.status(404).json({ message: "Item not found" });

            const peakRecord = new Peak();
            peakRecord.item = item_id;
            peakRecord.peak = consumption;
            peakRecord.timestamp = record.timestamp;
            peakRecord.save();

            user.notifications.push({
                title: `${system.name}: Peak detected`,
                body: `Detected a peak of ${consumption}A in ${item.name}`,
                time: `${record.timestamp.getHours()}:${record.timestamp.getMinutes()}`,
            });

            user.save();
        }

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

//Get item average last week
const getItemAvg = async (req, res) => {
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

//Emitting live item data to frontend
const liveItem = async (req, res) => {
    const record = req.body;
    try {
        //send socket
        socketIO.emit(`live ${record.id}`, record);
    } catch (error) {
        res.status(400).json(error.message);
    }
};

//Emitting live system data to frontend
const liveSystem = async (req, res) => {
    const record = req.body;
    try {
        //send socket
        socketIO.emit(`live ${record.id}`, record);
        res.status(200).json(record);
    } catch (error) {
        res.status(400).json(error.message);
    }
};

module.exports = {
    insertItemData,
    getItemData,
    insertSystemData,
    getSystemData,
    getSolarAvg,
    getItemAvg,
    liveItem,
    liveSystem,
};
