const ItemHistory = require("../models/items.history.model.js");
const SolarHistory = require("../models/solar.history.model");
const cron = require("node-cron");

const saveDataScheduller = reading => {
    const saveData = async reading => {
        try {
        } catch (err) {
            console.log(err);
        }
    };

    cron.schedule("0 0 * * * *", () => {});
};

module.exports = { saveDataScheduller };
