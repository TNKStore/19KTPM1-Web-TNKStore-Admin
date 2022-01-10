const { Sequelize } = require('sequelize');
const sequelize = require('../models');
const Status = require('./statusModel');
const Payment = require('./paymentModel');
const User = require('./userModel');

const Bill = sequelize.define('bill', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    user_id: {
        type: Sequelize.INTEGER,
    },
    address: {
        type: Sequelize.STRING,
    },
    payment_id: {
        type: Sequelize.INTEGER
    },
    total: {
        type: Sequelize.INTEGER
    },
    status_id: {
        type: Sequelize.INTEGER
    },
    phone: {
        type: Sequelize.STRING,
    },
    created_at: {
        type: Sequelize.DATE,
        field: `created_at`,
        get() {
            return {
                date: moment(this.getDataValue('createdAt')).format('DD/MM/YYYY'),
                datetime: moment(this.getDataValue('createdAt')).format('DD/MM/YYYY hh:mm:ss')
            };
        }
    }
}, {
        tableName: "bill",
        timestamps: false
    });
Bill.belongsTo(Status, {foreignKey: `status_id`, targetKey: `id`})
Bill.belongsTo(Payment, {foreignKey: `payment_id`, targetKey: `id`})
Bill.belongsTo(User, {foreignKey: `user_id`, targetKey: `id`})
module.exports = Bill;