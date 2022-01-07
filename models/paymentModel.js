const { Sequelize } = require('sequelize');
const sequelize = require('../models');

const Payment = sequelize.define('payment', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    name: {
        type: Sequelize.STRING
    }
}, {
        tableName: "payment",
        timestamps: false
    });

module.exports = Payment;