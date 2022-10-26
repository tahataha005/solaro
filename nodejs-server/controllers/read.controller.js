const SolarSystem = require("../models/solar.system.model.js");
const Item = require("../models/item.model.js");

//Searching for system by user id
const getSolarStats = async (req, res) => {
    try {
        //Destructuring req data
        const { user_id } = req.params;

        //Geting system belonging to user by his id
        const system = await SolarSystem.findOne({ user: user_id });

        //If not found return not found
        if (!system)
            return res.status(404).json({ message: "Solar System not found" });

        //Returning recieved system
        res.status(200).json(system);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

//Searching for all items belonging to solar system by system id
const getAllItems = async (req, res) => {
    try {
        //Destructuring req data
        const { system_id } = req.params;

        //Geting items belonging to system by its id
        const items = await Item.find({ solar_system: system_id });

        //If not found return not found
        if (!items)
            return res
                .status(404)
                .json({ message: "No items found or system id doesn't exist" });

        //Returning recieved items
        res.status(200).json(items);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

module.exports = { getSolarStats, getAllItems };
