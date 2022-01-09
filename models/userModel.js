const { Sequelize } = require('sequelize');
const sequelize = require('../models');

const User = sequelize.define('user', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
    },
    first_name: {
        type: Sequelize.STRING
    },
    last_name: {
        type: Sequelize.STRING
    },
    email: {
        type: Sequelize.STRING,
        unique: true
    },
    pwd: {
        type: Sequelize.STRING,
    },
    phone: {
        type: Sequelize.STRING,
    },
    address: {
        type: Sequelize.STRING,
    },
    locked: {
        type: Sequelize.INTEGER
    },
    activated: {
        type: Sequelize.INTEGER,
    },
    activationString: {
        type: Sequelize.STRING,
    }
}, {
    tableName: "user",
    timestamps: false
});

module.exports = User
