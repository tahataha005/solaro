const User = require("../models/user.model.js");

//Adding a new solar system
const addSolarSystem = async (req, res) => {
    //Destructuring req data
    const { user_id, connection, system_name } = req.body;

    try {
        //Assigning solar system attributes
        const newSystem = {
            name: system_name,
            connection: connection,
            charging: 0,
            consumption: 0,
        };

        //Getting user to add solar system
        const user = await User.findById(user_id);

        //Pushing new system to array of systems in user
        user.system.push(newSystem);

        //Saving solar system in database
        await user.save();

        //Returning created system
        res.status(200).json({ added: user.system[user.system.length - 1] });
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

//Adding w new item to solar system
const addItem = async (req, res) => {
    //Destructuring req data
    const { user_id, system_id, name, ideal_consumption } = req.body;

    try {
        //Getting user by id
        const user = await User.findById(user_id);

        //Searching for solar system to add item to
        const system = user.system.filter(system => {
            return system.id == system_id;
        })[0];

        //Creating and new item object
        const item = {
            name: name,
            ideal_consumption: ideal_consumption,
            status: false,
            live_consumption: 0,
            timestamp: null,
        };

        //Adding item to solar system
        system.items.push(item);

        //Saving user
        await user.save();

        //Returning created item
        res.status(200).json(system.items[system.items.length - 1]);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

//Deleting solar system by name
const dropSolarSystem = async (req, res) => {
    //Destructuring req data
    const { user_id, system_id } = req.body;

    try {
        //Getting user by id to delete solar system from
        const user = await User.findById(user_id);

        //Filtering array of solar systems
        user.system = user.system.filter(system => {
            system.id.toString() != system_id;
        });

        //Saving changes in user's solar systems
        await user.save();

        //Returning user solar systems
        res.status(200).json(user.system);
    } catch (err) {
        res.status(200).json({ message: err.message });
    }
};

//Deleting item by name
const dropItem = async (req, res) => {
    const { user_id, system_id, item_id } = req.body;

    try {
        //Getting user by id to delete solar system from
        const user = await User.findById(user_id);

        //Filtering array of solar systems
        const system = user.system.filter(system => {
            return system.id == system_id;
        })[0];

        //Filtering items to remove desired item
        system.items = system.items.filter(item => {
            return item.id != item_id;
        });

        //Saving changes in user
        await user.save();

        console.log(system.items);
        //Returning deleted item
        res.status(200).json(system.items);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

//Editing item by name
const editItem = async (req, res) => {
    //Destructuring req data
    const { user_id, system_id, item_id, name, ideal_consumption } = req.body;

    try {
        //Getting user by id
        const user = await User.findById(user_id);

        //Filtering array of solar systems
        const system = user.system.filter(system => {
            return system.id == system_id;
        })[0];

        //Filtering items to get desired item
        const item = system.items.filter(item => {
            return item.id == item_id;
        })[0];

        //Updating item according to obtained attributes
        name ? (item.name = name) : (item.name = item.name);
        ideal_consumption
            ? (item.ideal_consumption = ideal_consumption)
            : (item.ideal_consumption = item.ideal_consumption);

        //Saving changes in user
        await user.save();

        //Returning updated item
        res.status(200).json(item);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

const controlItem = async (req, res) => {
    //Destructuring req data
    const { user_id, system_id, item_id } = req.body;

    //Assigning status according to request

    try {
        //Getting user by id
        const user = await User.findById(user_id);

        //Filtering array of solar systems
        const system = user.system.filter(system => {
            return system.id == system_id;
        })[0];

        //Filtering items to get desired item
        const item = system.items.filter(item => {
            return item.id == item_id;
        })[0];

        //if item not found return not found
        if (!item) return res.status(404).json({ message: "Item not found" });

        //Updating item according to obtained attributes
        item.status = !item.status;

        //Saving changes in user
        await user.save();

        //Returning updated item
        res.status(200).json(item);
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
