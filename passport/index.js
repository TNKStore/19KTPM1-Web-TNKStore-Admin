const passport = require('passport')
  , LocalStrategy = require('passport-local').Strategy;

const authService = require('../components/auth/authService');

passport.use(new LocalStrategy(
  async function(username, password, done) {
    console.log('passport-local');
    const user = await authService.findByUsername(username);
    if (!user)
        return done(null, false, { message: 'Incorrect username.'});

    const isUnlock = authService.checkLock(user);
    if (!isUnlock) {
      return done(null, false, { message: 'Account locked.' });
    } 
    const isValid = await authService.validPassword(password, user);
    //if (!adminService.validPassword(password, user)) {  // use this for initial admin
    if (!isValid) {
        return done(null, false, { message: 'Incorrect password.' });
    }
    return done(null, user);
  },
));

passport.serializeUser(function(user, done) {
    done(null, {username: user.username, first_name: user.first_name, last_name: user.last_name});
  });
  
passport.deserializeUser(async function(user, done) {
    done(null, user);
  });

module.exports = passport;