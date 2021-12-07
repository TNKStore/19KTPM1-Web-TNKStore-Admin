const passport = require('passport')
  , LocalStrategy = require('passport-local').Strategy;

const adminService = require('../components/auth/adminService');

passport.use(new LocalStrategy(
  async function(username, password, done) {
    console.log('passport-local');
    const user = await adminService.findByUsername(username);
    if (!user)
        return done(null, false, { message: 'Incorrect username.'});
    if (!adminService.validPassword(password, user)) {
        return done(null, false, { message: 'Incorrect password.' });
    }
    return done(null, user);
  },
));

passport.serializeUser(function(user, done) {
    done(null, user.username);
  });
  
passport.deserializeUser(function(username, done) {
    adminService.findByUsername(username, function(err, user) {
      done(err, user);
    });
  });

module.exports = passport;