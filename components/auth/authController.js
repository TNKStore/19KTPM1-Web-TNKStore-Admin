exports.login = (req, res, next) => {
    const wrongPassword = req.query['wrong-password'] !== undefined;
    res.render('auth/login', {
        title: 'Sign in',
        wrongPassword
    });
}

exports.logout = (req, res) => {
    req.logout;
    res.redirect('/admin/login');
}
