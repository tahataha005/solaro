const { Router } = require("express");

const router = Router();

const {
    getSolarStats,
    // getAllItems,
    // getItem,
} = require("../controllers/read.controller.js");

router.get("/system/:user_id/:system_id", getSolarStats);
router.get("/:user_id", getUser);

// router.get("/item/:item_id", getItem);
// router.get("/items/:user_id/:system_name", getAllItems);

module.exports = router;
