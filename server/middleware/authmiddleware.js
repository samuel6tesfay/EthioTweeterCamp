require('dotenv').config()

const jwt = require('jsonwebtoken');

const requireAuth = (req,res,next) => {
    const token = req.cookies.jwt;
    if(token){
        jwt.verify(token,process.env.ACCESS_TOKEN_SECRET,(err,decodedToken) => {
            if(err){
                console.log(err.message);
                res.redirect('/login');

            }else{
                console.log(decodedToken.id);
                req.admin_id = decodedToken;
                next();
            }
        })
    }else{
        res.redirect('/login')
    }
}

module.exports = {requireAuth}