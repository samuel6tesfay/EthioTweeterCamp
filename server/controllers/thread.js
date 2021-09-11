const pool = require('../models/db')

//create a todo
const createthread = async (req,res) =>{
    try{
        const {name ,username, body} = req.body;
        const admin_id = 1;
        const newTread = await pool.query(

            "insert into thread (name,username,body,admin_id) values($1,$2,$3,$4)",[name,username,body,admin_id]
        );
        res.json(newTread[0])
        
    }catch(err){
        console.log(err.message);
    }
}
// get all todo
const threads = async (req,res) =>{
    try{
        
        // const admin_id = req.admin_id.id;
        // const allThreads = await pool.query("select * from thread where admin_id = $1", [admin_id]);

        const allThreads = await pool.query("select * from thread");
    

        res.json(allThreads.rows);
    }catch(err){
        console.log(err.message);
    }
}

// get a todo
const thread = async (req,res) =>{
    try{
        const { id } = req.params;
        const admin_id = req.admin_id.id;

        const thread = await pool.query("select * from thread where id = $1", [id]);
        if (thread.rows[0].admin_id == admin_id) {
            res.json(thread.rows[0]);

        } else {
            res.json("")
        }
    }catch(err){
        console.log(err.message);
    }
}

// update todo
const updatethread = async (req,res) =>{
    try{
        const { id } = req.params;
        const { name,username,body} = req.body;
        // const admin_id = req.admin_id.id;
        const admin_id = 1;

        const thread = await pool.query("select * from thread where id = $1", [id]);
        console.log(thread);
        if (thread.rows[0].admin_id == admin_id) {
            const updateThread = await pool.query(
        "update thread set name = $1 ,  username = $2 , body = $3 where id = $4",[name,username,body,id]);
        res.json("thread was updated"); 
        }else {
            res.json("fail to update")
        }

        
    }catch(err){
        console.log(err.message);
    }
}

// delete todo
const deletethread = async (req,res) =>{
    try{
        const { id } = req.params;
        const deleteThread = await pool.query("delete from thread where id=$1",[id]);


        // const admin_id = req.admin_id.id;
        // const thread = await pool.query("select * from thread where id = $1", [id]);
        // if (thread.rows[0].admin_id == admin_id) {
        //     // const deleletThread = await pool.query("delete from thread where admin_id=$1",[id]);

        //     res.json("Thread was deleted!");
        // }else {
        //     res.json("fail to delete")
        // }
    }catch(err){
        console.log(err.message);
    }
}

module.exports = {
    createthread,threads , thread , updatethread , deletethread
}