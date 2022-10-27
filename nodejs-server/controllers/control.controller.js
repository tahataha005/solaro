const User = require("../models/user.model.js");
const SolarSystem = require("../models/solar.system.model.js");
const Item = require("../models/item.model.js");

//Adding a new solar system
const addSolarSystem = async (req, res) => {
    //Destructuring req data
    const { user, connection } = req.body;
    try {
        //Creating a new instance of SolarSystem model
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

const addItem = async (req, res) => {
    //Destructuring req data
    const { solar_system, name, ideal_consumption } = req.body;

    try {
        //Creating a new instance of Item model
        const item = new Item();

        //Assigning item attributes
        item.solar_system = solar_system;
        item.name = name;
        item.ideal_consumption = ideal_consumption;
        item.live_consumption = 0;
        item.timestamp = null;

        //Saving item in database
        await item.save();

        //Returning created item id
        res.status(200).json({ item_id: item._id });
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

//Deleting solar system by id
const dropSolarSystem = async (req, res) => {
    //Destructuring req data
    const { system_id } = req.body;

    try {
        //Searching for system by id and deleting it
        const system = await SolarSystem.findByIdAndDelete(system_id);

        //Returning deleted system
        res.status(200).json({ deleted: system });
    } catch (err) {
        res.status(200).json({ message: err.message });
    }
};

//Deleting item by id
const dropItem = async (req, res) => {
    //Destructuring req data
    const { item_id } = req.body;

    try {
        //Searching for item by id and deleting it
        const item = await Item.findByIdAndDelete(item_id);

        //Returning deleted item
        res.status(200).json({ deleted: item });
    } catch (err) {
        res.status(200).json({ message: err.message });
    }
};

//Editing item by its id
const editItem = async (req, res) => {
    //Destructuring req data
    const { item_id, name, ideal_consumption } = req.body;

    try {
        //Updating item by it
        const item = await Item.findByIdAndUpdate(item_id, {
            name: name,
            ideal_consumption: ideal_consumption,
        });

        //Returning updated item
        res.status(200).json({ updated: item });
    } catch (err) {
        res.status(200).json({ message: err.message });
    }
};

module.exports = {
    addSolarSystem,
    addItem,
    dropSolarSystem,
    dropItem,
    editItem,
};
