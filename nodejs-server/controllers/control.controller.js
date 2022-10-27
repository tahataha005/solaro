const User = require("../models/user.model.js");
const SolarSystem = require("../models/solar.system.model.js");
const Item = require("../models/item.model.js");

//Adding a new solar system
const addSolarSystem = async (req, res) => {
    //Destructuring req data
    const { user, connection } = req.body;
    try {
        //Cerating a new instance of SolarSystem model
        const system = new SolarSystem();

        //Assigning solar system attributes
        system.user = user;
        system.connection = connection;
        system.charging = 0;
        system.consumption = 0;

        //Saving solar system in database
        await system.save();

        //Returning created system id
        res.status(200).json({ system_id: system._id });
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

module.exports = { addSolarSystem };
