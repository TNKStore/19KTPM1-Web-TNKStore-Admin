const User = require('../../models/userModel');

exports.list = (page, itemPerPage) => User.findAndCountAll({
    offset: ((itemPerPage * page) - itemPerPage),
    limit: itemPerPage
});

exports.getUserByID = id => User.findOne({where: {id: id}});

exports.lockByID = async (id) => {
    const user = await this.getUserByID(id);
    if (user.locked == 0) {
        user.locked = 1;
    }
    else {
        user.locked = 0;
    }
        
    return user.save();
}