const Product = require('../../models/productModel');
const Bill = require('../../models/billModel');

exports.list = (limit) => Product.findAll({
    limit: limit,
    order: [
        ['amount_view','DESC']
    ]
});