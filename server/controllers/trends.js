const pool = require('../models/db')

//create a trend
const createtrend = async (req, res) => {
    console.log("create trend")
    try{
        const { body , link } = req.body;
        const user_id = req.user.id;
        const trend = await pool.query(
            "insert into trends (body,link,user_id) values($1,$2,$3)",[body,link,user_id]
        );
        res.json(trend[0])
        
    }catch(err){
        console.log(err.message);
    }
}
// get all todo
const trends = async (req,res) =>{
    try{
        
        // const user_id = req.user.id;
        // const us_id = 1;
        // const alltrends = await pool.query("select * from trends where user_id = $1", [user_id]);
        const alltrends = await pool.query("select * from trends");

        res.json(alltrends.rows);
    }catch(err){
        console.log(err.message);
    }
}

// get a todo
const trend= async (req,res) =>{
    try{
        const { id } = req.params;
        const user_id = req.user.id;

        const trend = await pool.query("select * from trends where id = $1", [id]);
        if (trend.rows[0].user_id == user_id) {
            res.json(trend.rows[0]);

        } else {
            res.json("")
        }
    }catch(err){
        console.log(err.message);
    }
}

// update todo
const updatetrend = async (req,res) =>{
    try{
        const { id } = req.params;
        const { body } = req.body;
        const user_id = req.user.id;

        const trend = await pool.query("select * from trends where id = $1", [id]);
        if (trend.rows[0].user_id == user_id) {
            const updatetrend = await pool.query(
        "update trends set body = $1 where id = $2",[body,id]);
        res.json("trend was updated"); 
        }else {
            res.json("fail to update")
        }

        
    }catch(err){
        console.log(err.message);
    }
}

// delete todo
const deletetrend = async (req,res) =>{
    try{
        const { id } = req.params;

        const user_id = req.user.id;

        const trend = await pool.query("select * from trends where id = $1", [id]);
        if (trend.rows[0].user_id == user_id) {
            const deleletrend = await pool.query("delete from trends where id=$1",[id]);
            res.json("trend was deleted!"); 
        }else {
            res.json("fail to delete")
        }
    }catch(err){
        console.log(err.message);
    }
}

module.exports = {
    createtrend,trends,trend,updatetrend,deletetrend
}