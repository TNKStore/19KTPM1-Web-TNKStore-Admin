const accountService = require('./accountService')

exports.info = async (req, res, next) => {
    const user = await accountService.findByEmail(req.user.username);
    res.render('info/account',
            {
                title: 'My Account',
                pageTitle: "Account information",
                user
            })
}

exports.changeAccountDetail = async (req, res, next) => {
    console.log(req.body);
    const {first_name, last_name} = req.body;
    console.log(first_name);
    accountService.updateInfo(req.user.username, first_name, last_name)
        .then(
            _ => res.redirect('/account'),
            _ => next())
};

exports.changePassword = async (req, res, next) => {
    const {password, newPassword} = req.body;
    const user = await accountService.findByEmail(req.user.username);
    const isMatch = await accountService.verifyPassword(password, user);
    console.log(isMatch);

    if (!isMatch) {
        return res.redirected('/account?wrong-password')
    }
    accountService.updatePassword(req.user.username, newPassword)
        .then(
            _ => res.redirect('/account'),
            _ => next())
}

