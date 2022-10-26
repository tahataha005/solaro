const SolarSystem = require("../models/solar.system.model.js");
const Item = require("../models/item.model.js");

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

module.exports = { getSolarStats };
