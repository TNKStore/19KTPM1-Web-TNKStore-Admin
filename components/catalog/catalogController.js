const catalogService = require('./catalogService');
const {body, validationResult} = require('express-validator');
const Catalog = require('../../models/catalogModel');
const {result} = require('lodash');
const createError = require("http-errors");

exports.list = async function (req, res, next) {
    let page = parseInt(req.query.page) || 1;

    const itemPerPage = 6;
    const catalogList = await catalogService.list(page, itemPerPage);
    const catalog = catalogList.rows;
    const numPages = Math.ceil(catalogList.count / itemPerPage);
    //if (page> numPages) {
    //next(createError(404))
    //}
    let pages = Array(numPages)
        .fill("")
        .map((page, index) => {
            return {
                url: `/catalog-list?page=${index + 1}`,
                page: index + 1,
                //active: false
            }
        })
    res.render('catalog/catalog-list', {
        catalog,
        pages,
        previous: pages[page - 2] || false,
        next: pages[page] || false,
        title: 'TNKStore',
    });
}

exports.catalog_create_get = async function (req, res) {

    res.render('catalog/catalog-editor', {
        pageTitle: 'Create Catalog',
        action: '/catalog-list/create',
        title: 'Create Catalog'
    });
};

exports.catalog_create_post = [
    body('name', 'Name must not be empty.').trim().isLength({min: 1}).escape(),

    (req, res, next) => {

        // Extract the validation errors from a request.
        const errors = validationResult(req);

        // Create a Book object with escaped and trimmed data.
        var catalog = new Catalog({
            name: req.body.name,
        });

        if (!errors.isEmpty()) {
            async.parallel({
            }, function (err, results) {
                if (err) {
                    return next(err);
                }
                res.render('catalog/catalog-editor', {
                    name: results.name,
                    errors: errors.array()
                });
            });
        } else {
            // Data from form is valid. Save book.
            catalog.save()//successful - redirect to new book record.
                .then(_ => res.redirect('/catalog-list'))
                .catch(err => next(err));
        }
    }
];

exports.catalog_update_get = async function (req, res, next) {
    let id = parseInt(req.params.id);

    if (id) {
        const catalog = await catalogService.getCatalogByID(id);
        res.render('catalog/catalog-editor',
            {
                pageTitle: "Update catalog",
                action: '/catalog-list/update/' + id,
                catalog: catalog
            })
    } else {
        next(createError(404))
    }
};

// Handle product update on POST.
exports.catalog_update_post = [
    body('name', 'Name must not be empty.').trim().isLength({min: 1}).escape(),

    async (req, res, next) => {

        // Extract the validation errors from a request.
        const errors = validationResult(req);
        const id = parseInt(req.params.id);
        // Create a Book object with escaped and trimmed data.
        const catalog = await catalogService.getCatalogByID(id);

        catalog.name = req.body.name;

        if (!errors.isEmpty()) {
            async.parallel({}, function (err, results) {
                if (err) {
                    return next(err);
                }
                res.render('catalog/catalog-editor', {
                    name: results.name,
                    errors: errors.array()
                });
            });
        } else {
            catalog.save()
                .then(_ => res.redirect('/catalog-list'))
                .catch(err => next(err));
        }
    }
];