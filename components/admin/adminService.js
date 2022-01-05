const Admin = require('../../models/adminModel');

exports.list = (page, itemPerPage) => Admin.findAndCountAll({
    offset: ((itemPerPage * page) - itemPerPage),
    limit: itemPerPage
});

exports.getAdminByUsername = username => Admin.findOne({where: {username: username}});

exports.lockByUsername = async (username) => {
    const admin = await this.getAdminByUsername(username);
    if (admin.locked == 0) {
        admin.locked = 1;
    }
    else {
        admin.locked = 0;
    }
        
    return admin.save();
}