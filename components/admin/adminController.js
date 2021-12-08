const adminService = require('./adminService');
const {body, validationResult} = require('express-validator');
const Admin = require('../../models/adminModel');
const {result} = require('lodash');
const createError = require("http-errors");

exports.list = async function (req, res, next) {
    let page = parseInt(req.query.page) || 1;

    const itemPerPage = 6;
    const adminList = await adminService.list(page, itemPerPage);
    const admin = adminList.rows;
    const numPages = Math.ceil(adminList.count / itemPerPage);
    //if (page> numPages) {
    //next(createError(404))
    //}
    let pages = Array(numPages)
        .fill("")
        .map((page, index) => {
            return {
                url: `/admin-list?page=${index + 1}`,
                page: index + 1,
                //active: false
            }
        })
    res.render('admin/admin-list', {
        admin,
        pages,
        previous: pages[page - 2] || false,
        next: pages[page] || false,
        title: 'TNKStore'
    });
}