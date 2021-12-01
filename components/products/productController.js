const productService = require('./productService');

exports.list = async function(req, res) {
    const products = await productService.list();
    res.render('items/items-list', { products });
}