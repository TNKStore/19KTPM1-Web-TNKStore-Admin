exports.login = (req, res, next) => {
    res.render('auth/login', {
        title: 'Sign in'
    })
}
