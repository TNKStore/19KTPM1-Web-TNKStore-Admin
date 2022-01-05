const express = require('express');
const router = express.Router();
const accountController = require('./accountController');
//const Product = require('../../models/productModel');

/* GET home page. */
router.get('/', accountController.info);

//router.post('', productController.list);

router.post('/update', accountController.changeAccountDetail);
router.post('/change-password', accountController.changePassword);

module.exports = router;
