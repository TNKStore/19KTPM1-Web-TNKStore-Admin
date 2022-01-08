const Status = require('../../models/statusModel')

exports.list = () => Status.findAll()