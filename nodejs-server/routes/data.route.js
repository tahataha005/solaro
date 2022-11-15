const Router = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const {
    insertItemData,
    getItemData,
} = require("../controllers/data.controller");

//Creating routes
router.post("/", insertItemData);
router.get("/:item_id", getItemData);

module.exports = router;
