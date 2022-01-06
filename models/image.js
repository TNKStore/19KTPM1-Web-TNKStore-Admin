const { Sequelize } = require('sequelize');
const sequelize = require('../models');
const Product = require('./productModel');

const Image = sequelize.define('image', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    product_id: {
        type: Sequelize.INTEGER
    },
    url: {
        type: Sequelize.STRING
    }
}, {
        tableName: "image",
        timestamps: false
    });

Image.belongsTo(Product, {foreignKey: `product_id`, targetKey: `id`})

module.exports = Image;