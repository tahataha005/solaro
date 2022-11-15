const Router = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const {
    insertItemData,
    insertSystemData,
    getItemData,
    getSystemData,
    itemDailyAvg,
    getItemAvg,
} = require("../controllers/data.controller");

//Creating routes
router.post("/item", insertItemData);
router.post("/item/avg", getItemAvg);
router.get("/item/:item_id", getItemData);
router.get("/item/avg/:item_id", itemDailyAvg);
router.get("/system/:system_id", getSystemData);

module.exports = router;
