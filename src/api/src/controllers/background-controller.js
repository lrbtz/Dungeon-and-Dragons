module.exports = function(db) {
    const dbBackground = require('../utils/background-db')(db);
    let backgroundController = {};

    backgroundController.getAllBackgrounds = (req, res, next) => {
        dbBackground.getAllBackgrounds((err, result) => {
            if (err) return next(err);

            return res.status(200).send(result);
        })
    }

    return backgroundController;
}