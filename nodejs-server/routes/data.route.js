const Router = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const {
    getItemData,
    getSystemData,
    getSolarAvg,
    getItemAvg,
    liveSystem,
} = require("../controllers/data.controller");

//Creating routes
router.post("/item/avg", getItemAvg);
router.get("/item/:item_id", getItemData);
router.post("/system/avg", getSolarAvg);
router.get("/system/:system_id", getSystemData);
router.post("/system/live", liveSystem);

module.exports = router;
