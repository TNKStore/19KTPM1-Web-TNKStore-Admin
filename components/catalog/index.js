const express = require('express');
const router = express.Router();
const catalogController = require('./catalogController');
//const Product = require('../../models/productModel');

/* GET home page. */
router.get('/', catalogController.list);

router.get('/create', catalogController.catalog_create_get);
router.post('/create', catalogController.catalog_create_post);

//router.get('/lock', adminController.admin_lock_get);
router.get('/update/:id', catalogController.catalog_update_get);
router.post('/update/:id', catalogController.catalog_update_post);

module.exports = router;