const {Sequelize} = require('sequelize');
const sequelize = require('../models');
const Catalog = require('./catalogModel');

const Product = sequelize.define('product', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: Sequelize.STRING
    },
    catalog_id: {
        type: Sequelize.INTEGER
    },
    description: {
        type: Sequelize.STRING
    },
    amount: {
        type: Sequelize.INTEGER
    },
    price: {
        type: Sequelize.INTEGER
    },
    amount_view: {
        type: Sequelize.INTEGER
    },
    amount_sold: {
        type: Sequelize.INTEGER
    },
    created_at: {
        type: Sequelize.DATE
    },
    update_at: {
        type: Sequelize.DATE
    },
    hide: {
        type: Sequelize.INTEGER
    }
}, {
    tableName: "product",
    timestamps: false
});

Product.belongsTo(Catalog, {foreignKey: `catalog_id`, targetKey: `id`})

module.exports = Product;