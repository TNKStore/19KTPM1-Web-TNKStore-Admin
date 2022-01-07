const Product = require('../../models/productModel');
const BillDetail = require('../../models/billDetailModel');

exports.getBillDetail = id => BillDetail.findAll(
    {
        where: { bill_id: id },
        include: [{
            model: Product    
        }]
    })