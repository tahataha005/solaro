const ItemHistory = require("../models/items.history.model.js");
const SolarHistory = require("../models/solar.history.model");
const cron = require("node-cron");

const saveDataScheduller = reading => {
    cron.schedule("0 0 * * * *", () => {});
};

module.exports = { saveDataScheduller };
