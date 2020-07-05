const express = require("express");

module.exports = function(db) {
    const router = express.Router();
    const backgroundController = require("../controllers/background-controller")(db);

    router.get("/", backgroundController.getAllBackgrounds);

    return router;
}