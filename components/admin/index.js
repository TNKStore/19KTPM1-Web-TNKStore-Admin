const express = require('express');
const router = express.Router();
const adminController = require('./adminController');
//const Product = require('../../models/productModel');

/* GET home page. */
router.get('/', adminController.list);

//router.post('', productController.list);

//router.get('/create', productController.product_create_get);
//router.post('/create', productController.product_create_post);

module.exports = router;
