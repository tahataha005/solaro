const Router = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const { insertData, getData } = require("../controllers/data.controller");

//Creating routes
router.post("/", insertData);
router.get("/:item_id", getData);

module.exports = router;
