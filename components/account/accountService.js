const Admin = require("../../models/adminModel");
const bcrypt = require("bcrypt");

function hashPassword(password) {
    const salt = bcrypt.genSaltSync(10);
    return bcrypt.hashSync(password, salt);
}
exports.findByEmail = (username) => Admin.findOne({where: {username: username}});
exports.updateInfo = (username, first_name, last_name) => Admin.update({
    first_name: first_name,
    last_name: last_name
}, {
    where: {
        username: username
    }
});
exports.verifyPassword = (password, user) => bcrypt.compare(password, user.password);
exports.updatePassword = (username, password) => Admin.update({
    password: hashPassword(password)
}, {
    where: {
        username: username
    }
});