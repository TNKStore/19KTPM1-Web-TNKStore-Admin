const userService = require('./userService');
const {result} = require('lodash');
const createError = require("http-errors");

const bcrypt = require('bcrypt');
const saltRounds = 10

exports.list = async function (req, res, next) {
    let page = parseInt(req.query.page) || 1;

    const itemPerPage = 6;
    const usersList = await userService.list(page, itemPerPage);
    const users = usersList.rows;
    const numPages = Math.ceil(usersList.count / itemPerPage);
    //if (page> numPages) {
    //next(createError(404))
    //}
    let pages = Array(numPages)
        .fill("")
        .map((page, index) => {
            return {
                url: `/user-list?page=${index + 1}`,
                page: index + 1,
                //active: false
            }
        })
    res.render('user/user-list', {
        users,
        pages,
        previous: pages[page - 2] || false,
        next: pages[page] || false,
        title: 'TNKStore',
    });
}

exports.user_detail_get = async function (req, res, next) {
    let id = parseInt(req.params.id);

    if (id) {
        const user = await userService.getUserByID(id);
        res.render('user/user-detail',
            {
                pageTitle: "User detail",
                eachUser: user,
            })
    } else {
        next(createError(404))
    }
};

exports.user_lock_get = async function (req, res, next) {
    const id = parseInt(req.query.id)
    if (id) {
        userService.lockByID(id)
            .then(_ => res.redirect('/user-list'))
            .catch(err => next(err))
    }
};