require('dotenv').config();

const pool = require('../models/db');
const bcrypt = require("bcrypt");
const jwt = require('jsonwebtoken');

const maxAge = 3 * 24 * 60 * 60
const createToken = (id,isAdmin) => {
    // const adminid = { "id": id }
    return jwt.sign(
        {
            id: id,
            isAdmin: isAdmin
        },
        process.env.ACCESS_TOKEN_SECRET, { expiresIn: maxAge });
}

validateUser = (user) =>{
   
    var errors = [];

    if (!user.name || !user.email || !user.password) {
        errors.push({ message: "Please enter all fields" });
    }

    if (user.password.length < 6) {
        errors.push({ message: "Password must be a least 6 characters long" });
      }

    if(errors.length > 0){
        console.log(errors)
        return false;
        
    }else{
        return true;
    }

}

const signup = async (req,res) => {
    try {
        console.log("123")

        console.log(req.body)
        if (validateUser(req.body)) {

            const {name , email , password} = req.body;

            const checkEmail = await pool.query(`SELECT * FROM users WHERE email = $1`,[email])
            console.log(checkEmail.rows);
            if(checkEmail.rows.length == 0){
                hashedPassword = await bcrypt.hash(password,10);
                await pool.query("insert into users (name,email,password) values($1,$2,$3)",[name,email,hashedPassword]);
                res.status(201);
            }else{
                res.json("email already exist")
            }
            
        } else {
            console.log("456")
            res.json(errors);
            errors = []
        }
        
    } catch (err) {
        console.log("456")
        console.log(err.message);
    }
}

const login = async(req,res) => {
    
    try{
        const { email, password } = req.body;
        console.log(req.body);
        const user = await pool.query(`SELECT * FROM users WHERE email = $1`,[email])

        if (user.rows.length > 0) {
            
            console.log("login enter");
            
            try {
                const auth = await bcrypt.compare(password, user.rows[0].password);
                if (auth) {
                    const token = createToken(user.rows[0].id,user.rows[0].isAdmin);
                    // res.cookie('jwt', token, { httpOnly: true, maxAge: maxAge * 1000 });
                    res.cookie('userInfo', token, { maxAge: maxAge * 1000 });
                    // res.json(token);
                    res.send({'userInfo':token})
                    res.status(200);

                    res.status(200).json({ id:user.id,isAdmin:user.isAdmin });
                }
                else {
                    res.status(204);

                }
            }catch(err){
                res.json(err);
            }
        }
        
        res.render('users login');
    }catch(err){
        console.log(err.message);

    }
}

const loginget = async(req,res) =>{
    res.json("fill email and password ")
}

const logout = (req,res) => {
    res.cookie('userInfo',"",{ maxAge: 1 });
    res.redirect('/login');
}

module.exports = {
    signup, login ,logout,loginget
}