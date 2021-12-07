const express = require('express');
const router = express.Router();


/* GET home page. */
router.get('/', function (req, res, next) {
    res.render('index', {title: 'TNKStore'});
});

router.get('/index', function (req, res, next) {
    res.redirect('/');
})

module.exports = router;
