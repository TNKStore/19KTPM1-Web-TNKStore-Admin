const express = require('express');
const router = express.Router();
const adminController = require('./adminController');
//const Product = require('../../models/productModel');

/* GET home page. */
router.get('/', adminController.list);

//router.post('', productController.list);

router.get('/create', adminController.admin_create_get);
router.post('/create', adminController.admin_create_post);

router.get('/lock', adminController.admin_lock_get);

module.exports = router;
