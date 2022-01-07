const { Sequelize } = require('sequelize');
const sequelize = require('../models');
const Product = require('./productModel');

const BillDetail = sequelize.define('billdetail', {
    bill_id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    product_id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    amount: {
        type: Sequelize.INTEGER
    },
}, {
        tableName: "billdetail",
        timestamps: false
    });
BillDetail.belongsTo(Product, {foreignKey: `product_id`, targetKey: `id`})
module.exports = BillDetail;