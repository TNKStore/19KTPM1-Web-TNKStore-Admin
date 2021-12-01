const Product = require('../../models/productModel');

exports.list = () => Product.findAll({limit: 6});