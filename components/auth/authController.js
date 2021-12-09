exports.login = (req, res, next) => {
    if (req.user) {
        return res.redirect('/')
    }
    const wrongPassword = req.query['wrong-password'] !== undefined;
    res.render('auth/login', {
        title: 'Sign in',
        wrongPassword,
        layout: false
    });
}

exports.logout = (req, res) => {
    req.logout();
    res.redirect('/admin/login');
}
