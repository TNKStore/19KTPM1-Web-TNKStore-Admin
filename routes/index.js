const express = require('express');
const router = express.Router();


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'TNKStore' });
});

router.get('/index', function (req, res, next) {
  res.redirect('/')
})

//router.get('/items-list', function (req, res, next) {
  //res.render('items/items-list',
//{
          //title: 'TNKStore',
      //});
//});

router.get('/item-editor', function (req, res, next) {
  res.render('items/item-editor',
      {
          title: 'TNKStore',
      });
});

module.exports = router;
