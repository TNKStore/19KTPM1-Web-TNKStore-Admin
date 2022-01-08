const Product = require('../../models/productModel');
const Bill = require('../../models/billModel');
const Catalog = require('../../models/catalogModel');

exports.listViewWithCatalog = (limit) => Product.findAll({
    where: { hide: 0 },
    limit: limit,
    include: [{
        model: Catalog
    }],
    order: [
        ['amount_view','DESC']
    ]
});

exports.listSoldWithCatalog = (limit) => Product.findAll({
    where: { hide: 0 },
    limit: limit,
    include: [{
        model: Catalog
    }],
    order: [
        ['amount_sold','DESC']
    ]
});