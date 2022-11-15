const Router = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const { insertData } = require("../controllers/data.controller");

//Creating routes
router.post("/", insertData);

module.exports = router;
