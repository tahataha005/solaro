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
};

cron.schedule("0 0 0 * * *", () => {
    itemAvg();
});
