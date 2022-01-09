const express = require('express');
const router = express.Router();
const userController = require('./userController');
//const Product = require('../../models/productModel');

/* GET home page. */
router.get('/', userController.list);

router.get('/detail/:id', userController.user_detail_get);

router.get('/lock', userController.user_lock_get);

module.exports = router;
