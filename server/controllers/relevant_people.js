const pool = require('../models/db')

//create a todo
const createrelevant_people = async (req,res) =>{
    try{
        const { name,image } = req.body;
        const admin_id = req.admin_id.id;
        const newrelevant_people = await pool.query(

            "insert into relevant_people (name,image,admin_id) values($1,$2,$3)",[name,image,admin_id]
        );
        res.json(newrelevant_people[0])
        
    }catch(err){
        console.log(err.message);
    }
}
// get all todo
const relevant_peoples = async (req,res) =>{
    try{
        
        const admin_id = req.admin_id.id;
        const allrelevant_peoples = await pool.query("select * from relevant_people where admin_id = $1", [admin_id]);
    
        res.json(allrelevant_peoples.rows);
    }catch(err){
        console.log(err.message);
    }
}

// get a todo
const relevant_people = async (req,res) =>{
    try{
        const { id } = req.params;
        const admin_id = req.admin_id.id;

        const relevant_people = await pool.query("select * from relevant_people where id = $1", [id]);
        if (relevant_people.rows[0].admin_id == admin_id) {
            res.json(relevant_people.rows[0]);

        } else {
            res.json("")
        }
    }catch(err){
        console.log(err.message);
    }
}

// update todo
const updaterelevant_people = async (req,res) =>{
    try{
        const { id } = req.params;
        const { name,image } = req.body;
        const admin_id = req.admin_id.id;
        const relevant_people = await pool.query("select * from relevant_people where id = $1", [id]);
        if (relevant_people.rows[0].admin_id == admin_id) {
            const updaterelevant_people = await pool.query(
        "update relevant_people set name = $1 , image = $2 where id = $3",[name,image,id]);
        res.json("relevant_people was updated"); 
        }else {
            res.json("fail to update")
        }

        
    }catch(err){
        console.log(err.message);
    }
}

// delete todo
const deleterelevant_people = async (req,res) =>{
    try{
        const { id } = req.params;

        const admin_id = req.admin_id.id;
        const relevant_people = await pool.query("select * from relevant_people where id = $1", [id]);
        if (relevant_people.rows[0].admin_id == admin_id) {
            const deleletrelevant_people = await pool.query("delete from relevant_people where id=$1",[id]);
            res.json("relevant_people was deleted!"); 
        }else {
            res.json("fail to delete")
        }
    }catch(err){
        console.log(err.message);
    }
}

module.exports = {
    createrelevant_people,relevant_peoples , relevant_people , updaterelevant_people , deleterelevant_people
}