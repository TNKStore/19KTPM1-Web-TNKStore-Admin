const Product = require('../../models/productModel');

exports.list = (page, itemPerPage) => Product.findAndCountAll({offset: ((itemPerPage * page) - itemPerPage), limit: itemPerPage});