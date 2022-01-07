const { Sequelize } = require('sequelize');
const sequelize = require('../models');

const Status = sequelize.define('status', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    name: {
        type: Sequelize.STRING
    }
}, {
        tableName: "status",
        timestamps: false
    });

module.exports = Status;