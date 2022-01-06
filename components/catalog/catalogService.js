const Catalog = require('../../models/catalogModel');

exports.list = (page, itemPerPage) => Catalog.findAndCountAll({
    offset: ((itemPerPage * page) - itemPerPage),
    limit: itemPerPage
});

exports.getCatalogByID = id => Catalog.findOne({where: {id: id}});