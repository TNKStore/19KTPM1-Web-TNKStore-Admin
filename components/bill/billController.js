const billService = require('./billService');
const statusService = require('./statusService');
const billDetailService = require('./billDetailService');
const { body, validationResult } = require('express-validator');
const Catalog = require('../../models/catalogModel');
const Product = require('../../models/productModel');
const Image = require('../../models/image');
const { result } = require('lodash');
const createError = require("http-errors");
const async = require('async');

exports.list = async function (req, res, next) {
    let page = parseInt(req.query.page) || 1;

    const itemPerPage = 6;
    const billsList = await billService.listWithStatusAndPaymentAndUser(page, itemPerPage);
    const bills = billsList.rows;
    const numPages = Math.ceil(billsList.count / itemPerPage);
    //if (page> numPages) {
    //next(createError(404))
    //}
    let pages = Array(numPages)
        .fill("")
        .map((page, index) => {
            return {
                url: `/bill-list?page=${index + 1}`,
                page: index + 1,
                //active: false
            }
        })
    res.render('bill/bill-list', {
        bills,
        pages,
        previous: pages[page - 2] || false,
        next: pages[page] || false,
        title: 'TNKStore'
    });
}

// Display product update form on GET.
exports.bill_update_get = async function (req, res, next) {
    let id = parseInt(req.params.id);

    if (id) {
        const bill = await billService.getBillByIDWithStatusAndPaymentAndUser(id);
        const detail = await billDetailService.getBillDetail(id);
        const status = await statusService.list();
        res.render('bill/bill-editor',
            {
                pageTitle: "Update the Bill",
                action: '/bill-list/update/' + id,
                bill: bill,
                status: status,
                detail: detail
            })
    } else {
        next(createError(404))
    }
};

// Handle product update on POST.
exports.bill_update_post = [
    body('status.*').escape(),

    async (req, res, next) => {

        // Extract the validation errors from a request.
        const errors = validationResult(req);
        const id = parseInt(req.params.id);
        // Create a Book object with escaped and trimmed data.
        const bill = await billService.getBillByID(id);

        bill.status_id = parseInt(req.body.status);

        if (!errors.isEmpty()) {
            async.parallel({}, function (err, results) {
                if (err) {
                    return next(err);
                }
                res.render('bill/bill-editor', {
                    status_id: results.status_id,
                    errors: errors.array()
                });
            });
        } else {
            bill.save()
                .then(_ => res.redirect('/bill-list'))
                .catch(err => next(err));
        }
    }
];