const adminModel = require('../../models/adminModel');

exports.findByUsername = (username) => {
    return adminModel.findOne({
        where: {username: username}
    });
}

exports.validPassword = (password, user) => {
    return user.password === password;
}