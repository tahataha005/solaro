const User = require("../models/user.model.js");

//Getting user by id
const getUser = async (req, res) => {
    //Destructuring req data
    const { user_id } = req.params;

    try {
        //Geting user by id
        const user = await User.findById(user_id);

        //Return not found if user wasn't found
        if (!user) return res.status(404).json({ message: "User Not Found" });

        //Returning recieved user
        return res.status(200).json(user);
    } catch (error) {
        res.status(400).json({ message: err.message });
    }
};

//Searching for system by user id
const getSolarStats = async (req, res) => {
    //Destructuring req data
    const { user_id, system_id } = req.params;

    try {
        //Geting user by id
        const user = await User.findById(user_id);

        //Searching for the desired solar system
        const system = user.system.filter(system => {
            return system.id == system_id;
        })[0];

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
    //Destructuring req data
    const { user_id, system_name } = req.params;

    try {
        //Geting items belonging to system by its id
        const user = await User.findById(user_id);

        //Searching for the desired solar system
        const system = user.system.filter(system => {
            return system.name == system_name;
        })[0];

        const items = system.items;

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

const readItem = async (req, res) => {
    //Destructuring req data
    const { user_id, system_id, item_id } = req.body;

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

        //Returning updated item
        res.status(200).json(item);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

module.exports = { getSolarStats, getAllItems, getUser, readItem };
