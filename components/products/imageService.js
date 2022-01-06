const Image = require('../../models/image')

exports.getProductImage = id => Image.findOne(
    {
        where: { product_id: id }
    })