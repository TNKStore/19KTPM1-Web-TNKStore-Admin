const dashboardService = require('./dashboardService');
const {body, validationResult} = require('express-validator');
const Product = require('../../models/productModel');
const Catalog = require('../../models/catalogModel');
const Bill = require('../../models/billModel');
const User = require('../../models/userModel');
const {result} = require('lodash');
const createError = require("http-errors");

exports.chart = async function (req, res, next) {
    const limit = 10;

    const total1 = await Product.findAndCountAll();
    productList = total1.rows;
    var total2 = 0;
    for (var i = 0; i< total1.count; i++)
    {
        total2 += productList[i].amount_view;
    }
    const total3 = await Catalog.findAndCountAll();
    const total4 = await Bill.findAndCountAll();
    const total5 = await User.findAndCountAll();

    const topView = await dashboardService.listViewWithCatalog(10);
    const topSold = await dashboardService.listSoldWithCatalog(10);

    res.render('index', {
        title: 'TNKStore',
        total1: total1.count,
        total2: total2,
        total3: total3.count,
        total4: total4.count,
        total5: total5.count,
        topView: topView,
        topSold: topSold
    });
}