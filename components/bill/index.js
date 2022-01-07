const express = require('express');
const router = express.Router();
const billController = require('./billController');
//const Product = require('../../models/productModel');

/* GET home page. */
router.get('/', billController.list);

//router.post('', productController.list);

router.get('/update/:id', billController.bill_update_get);
router.post('/update/:id', billController.bill_update_post);

module.exports = router;