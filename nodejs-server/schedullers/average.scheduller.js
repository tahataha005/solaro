const ItemHistory = require("../models/items.history.model.js");
const SolarAverage = require("../models/system.average.model");
const ItemAverage = require("../models/item.average.model");
const cron = require("node-cron");
const SolarHistory = require("../models/solar.history.model");

const weekday = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

const solarAvg = async () => {
    const ids = await SolarHistory.find().distinct("system_id");

    const currentDate = new Date();
    const previousDate = new Date(currentDate.getTime());
    previousDate.setDate(currentDate.getDate() - 1);

    ids.forEach(async id => {
        //Assigning system_id
        const system_id = id;

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

            console.log(record);
        } catch (error) {
            console.log(error);
        }
    });
};

const itemAvg = async () => {
    const ids = await ItemHistory.find().distinct("item_id");
    console.log(ids[0]);

    const currentDate = new Date();
    const previousDate = new Date(currentDate.getTime());
    previousDate.setDate(currentDate.getDate() - 1);
};

cron.schedule("0 0 0 * * *", () => {
    solarAvg();
});
