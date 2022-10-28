const User = require("../models/user.model.js");

//Adding a new solar system
const addSolarSystem = async (req, res) => {
    //Destructuring req data
    const { user_id, connection, system_name } = req.body;

    try {
        //Assigning solar system attributes
        const system = {
            name: system_name,
            connection: connection,
            charging: 0,
            consumption: 0,
        };

        //Getting user to add solar system
        const user = await User.findById(user_id);

        //Pushing new system to array of systems in user
        user.system.push(system);

        //Saving solar system in database
        await user.save();

        //Returning created system
        res.status(200).json({ added: system });
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
        item.status = false;
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

//Deleting solar system by name
const dropSolarSystem = async (req, res) => {
    //Destructuring req data
    const { user_id, system_name } = req.body;

    try {
        //Getting user by id to delete solar system from
        const user = await User.findById(user_id);

        //Filtering array of solar systems
        user.system = user.system.filter(system => {
            return system.name != system_name;
        });

        //Saving changes in user's solar systems
        await user.save();

        //Returning user solar systems
        res.status(200).json(user.system);
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
        res.status(400).json({ message: err.message });
    }
};

const controlItem = async (req, res) => {
    const { item_id, status } = req.body;

    try {
        if (status === "on") {
            const item = await Item.findByIdAndUpdate(item_id, {
                status: true,
            });
            return res.status(200).json({ message: `${item.name} turned on` });
        }
        if (status === "off") {
            const item = await Item.findByIdAndUpdate(item_id, {
                status: false,
            });
            return res.status(200).json({ message: `${item.name} turned off` });
        }
        res.status(400).json({ message: "a problem occured assigning status" });
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

module.exports = {
    addSolarSystem,
    addItem,
    dropSolarSystem,
    dropItem,
    editItem,
    controlItem,
};
