const Router = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const {
    insertItemData,
    insertSystemData,
    getItemData,
    getSystemData,
} = require("../controllers/data.controller");

//Creating routes
router.post("/item", insertItemData);
router.post("/system", insertSystemData);
router.get("/item/:item_id", getItemData);
router.get("/system/:system_id", getSystemData);

module.exports = router;
