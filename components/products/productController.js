const productService = require('./productService');

exports.list = async function(req, res, next) {
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
        previous: pages[page-2] || false,
        next: pages[page] || false
     });
}