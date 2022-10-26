const { Router } = require("express");

const router = Router();

const {
    getSolarStats,
    getAllItems,
    getItem,
} = require("../controllers/read.controller.js");

router.get("/system/:user_id", getSolarStats);
router.get("/item/:item_id", getItem);
router.get("/items/:system_id", getAllItems);

module.exports = router;
