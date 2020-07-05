module.exports = function(db) {
    let dbBackground = {}

    dbBackground.getAllBackgrounds = (cb) => {
        let query = "SELECT * FROM backgrounds";
        db.query(query, (err, result) => {
            if (err) return cb(err);
            return cb(null, result);
        })
    }



    return dbBackground;
}