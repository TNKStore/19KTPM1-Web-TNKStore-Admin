const Product = require('../../models/productModel');
const Payment = require('../../models/paymentModel');
const Status = require('../../models/statusModel');
const User = require('../../models/userModel');
const Bill = require('../../models/billModel');

exports.list = (page, itemPerPage) => Bill.findAndCountAll({
    offset: ((itemPerPage * page) - itemPerPage),
    limit: itemPerPage
});

exports.listWithStatusAndPaymentAndUser = (page, itemPerPage) => Bill.findAndCountAll(
    {
        offset: ((itemPerPage * page) - itemPerPage),
        limit: itemPerPage,
        include: [{
            model: Status    
        },
        {
            model: Payment
        },
        {
            model: User
        }]
    });

exports.getBillByID = id => Bill.findOne({ where: { id: id } })

exports.getBillByIDWithStatusAndPaymentAndUser = id => Bill.findOne(
    {
        where: { id: id },
        include: [{
            model: Status    
        },
        {
            model: Payment
        },
        {
            model: User
        }]
    })