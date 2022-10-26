const { Router } = require("express");

const router = Router();

const {
    getSolarStats,
    getAllItems,
} = require("../controllers/read.controller.js");

router.get("/system/:user_id", getSolarStats);
router.get("/item/:system_id", getAllItems);

module.exports = router;
