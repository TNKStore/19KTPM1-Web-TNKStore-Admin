const productService = require('./productService');
const {body, validationResult} = require('express-validator');
const Catalog = require('../../models/catalogModel');
const Product = require('../../models/productModel');
const {result} = require('lodash');

exports.list = async function (req, res, next) {
    let page = parseInt(req.query.page) || 1;

    const itemPerPage = 6;
    const productsList = await productService.list(page, itemPerPage);
    const products = productsList.rows;
    console.log(products);
    const numPages = Math.ceil(productsList.count / itemPerPage);
    console.log(numPages);
    //if (page> numPages) {
    //next(createError(404))
    //}
    let pages = Array(numPages)
        .fill("")
        .map((page, index) => {
            return {
                url: `/items-list?page=${index + 1}`,
                page: index + 1,
                //active: false
            }
        })
    res.render('items/items-list', {
        products,
        pages,
        previous: pages[page - 2] || false,
        next: pages[page] || false
    });
}

// Display product create form on GET.
exports.product_create_get = function (req, res) {
    async.parallel({
        Product: function (callback) {
            Catalog_id.find(callback);
        },
    }, function (err, results) {
        if (err) {
            return next(err);
        }
        res.render('items/item-editor', {
            title: 'Create Product',
            catalog_id: results.catalog_id
        });
    });
};

exports.product_create_post = [
    /*console.log(req.body);
    res.send('NOT IMPLEMENTED: product delete POST');*/
    body('name', 'Title must not be empty.').trim().isLength({min: 1}).escape(),
    body('amount', 'Author must not be empty.').trim().isLength({min: 1}).escape(),
    body('price', 'Summary must not be empty.').trim().isLength({min: 1}).escape(),
    body('category.*').escape(),

    (req, res, next) => {

        // Extract the validation errors from a request.
        const errors = validationResult(req);

        // Create a Book object with escaped and trimmed data.
        var product = new Product({
            name: req.body.name,
            amount: parseInt(req.body.amount),
            price: parseInt(req.body.price),
            catalog_id: parseInt(req.body.category)
        });

        if (!errors.isEmpty()) {
            // There are errors. Render form again with sanitized values/error messages.

            // Get all authors and genres for form.
            async.parallel({
                /*authors: function(callback) {
                    Author.find(callback);
                },*/
            }, function (err, results) {
                if (err) {
                    return next(err);
                }
                res.render('items/item-editor', {
                    name: results.name,
                    amount: results.amount,
                    price: results.price,
                    catalog_id: results.catalog_id,
                    errors: errors.array()
                });
            });
        } else {
            // Data from form is valid. Save book.
            product.save()//successful - redirect to new book record.
                .then(_ => res.redirect('/items-list'))
                .catch(err => next(err));
        }
    }
];

// Display product delete form on GET.
exports.product_delete_get = function (req, res, next) {

    async.parallel({
        products: function (callback) {
            Product.findById(req.params.id).exec(callback)
        },
        authors_products: function (callback) {
            product.find({'author': req.params.id}).exec(callback)
        },
    }, function (err, results) {
        if (err) {
            return next(err);
        }
        if (results.author == null) { // No results.
            res.redirect('/catalog/authors');
        }
        // Successful, so render.
        res.render('author_delete', {
            title: 'Delete Author',
            author: results.author,
            author_products: results.authors_products
        });
    });

};

// Handle product delete on POST.
exports.product_delete_post = function (req, res) {
    res.send('NOT IMPLEMENTED: product delete POST');
};

// Display product update form on GET.
exports.product_update_get = function (req, res) {
    res.send('NOT IMPLEMENTED: product update GET');
};

// Handle product update on POST.
exports.product_update_post = function (req, res) {
    res.send('NOT IMPLEMENTED: product update POST');
};