const ItemHistory = require("../models/items.history.model.js");
const SolarHistory = require("../models/solar.history.model");
const cron = require("node-cron");

const start = new Date(new Date().getTime());
start.setDate(start.getDate() - 7);

cron.schedule("0 0 0 * * *", () => {});
