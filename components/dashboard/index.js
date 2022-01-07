const express = require('express');
const router = express.Router();
const dashboardController = require('./dashboardController');


/* GET home page. */
//router.get('/', function (req, res, next) {
    //res.render('index', {title: 'TNKStore'});
//});

router.get('/', dashboardController.chart);

module.exports = router;