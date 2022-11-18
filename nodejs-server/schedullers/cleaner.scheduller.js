const ItemHistory = require("../models/items.history.model.js");
const SolarHistory = require("../models/solar.history.model");
const cron = require("node-cron");

const start = new Date(new Date().getTime());
start.setDate(start.getDate() - 7);

const cleanSolarData = async () => {
    try {
        //Getting data before one week
        const data = await SolarHistory.aggregate([
            {
                //Conditions
                $match: {
                    timestamp: { $lt: start },
                },
            },
        ]).exec();

        //Deleting retriveed records
        data.forEach(async record => {
            await SolarHistory.findByIdAndDelete(record._id);
        });
    } catch (error) {
        console.log(error);
    }
};

const cleanItemData = async () => {
    try {
        //Getting data and calculating average automatically
        const data = await ItemHistory.aggregate([
            {
                //Conditions
                $match: {
                    timestamp: { $lt: start },
                },
            },
        ]).exec();

        //Deleting retriveed records
        data.forEach(async record => {
            await ItemHistory.findByIdAndDelete(record._id);
        });
    } catch (error) {
        console.log(error);
    }
};

cron.schedule("0 0 0 * * *", () => {});
