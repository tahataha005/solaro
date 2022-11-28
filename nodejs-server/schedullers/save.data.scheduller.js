const ItemHistory = require("../models/items.history.model.js");
const cron = require("node-cron");

const saveDataScheduller = () => {
    const saveData = async reading => {
        try {
            //Creating new item history record
            const record = new ItemHistory();

            //Assigning properties of new record
            const date = new Date();
            record.item_id = reading.item_id;
            record.consumption = reading.consumption;
            record.timestamp = date;

            //Saving record
            await record.save();
        } catch (err) {
            console.log(err);
        }
    };

    cron.schedule("0 0 * * * *", () => {
        saveData();
    });
};

module.exports = { saveDataScheduller };
