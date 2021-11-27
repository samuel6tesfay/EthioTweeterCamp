const pool = require('../models/db')
const path = require('path')

//create a thread
const createthread = async (req,res) =>{
    try {
        
        //  console.log(req.file)
        const { username, body, link } = req.body;
        // console.log(req.body);
        const { filename, mimetype, size } = req.file;
        const filepath = req.file.path;
        console.log(filepath);
        console.log(req.body.username);
        
        // console.log(filepath,filename,mimetype,size);

        const user_id = req.user.id;
        const newTread = await pool.query(
            "insert into threads (username,body,link,filename,filepath,user_id) values($1,$2,$3,$4,$5,$6)",[username,body,link,filename,filepath,user_id]
        );  

        res.json(newTread[0])
        
    }catch(err){
        console.log(err.message);
    }
}





// get all todo
const threads = async (req,res) =>{
    try{
        
        // const user_id = req.user.id;
        // const allThreads = await pool.query("select * from threads where user_id = $1", [user_id]);
        const allThreads = await pool.query("select * from threads");

        res.json(allThreads.rows);
       
    }catch(err){
        console.log(err.message);
    }
}

// read thread image file
const readImage = async (req,res) =>{
    try {

        console.log("readImage");
        
        const { filename } = req.params;
        // console.log(filename);

        const thread = await pool.query("select * from threads where filename = $1", [ filename ]);
        
        // console.log(thread);
        if (thread.rows[0].user_id == 1) {
             const dirname = path.resolve();
             const fullfilepath = path.join(dirname, thread.rows[0].filepath);
             res.sendFile(fullfilepath)

        } else {
            res.json("")
        }

       
       
    }catch(err){
        console.log(err.message);
    }
}


// get a todo
const thread = async (req,res) =>{
    try{
        const { id } = req.params;
        const user_id = req.user.id;

        const thread = await pool.query("select * from threads where id = $1", [id]);
        if (thread.rows[0].user_id == user_id) {
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
        const { username,body,link} = req.body;
        const user_id = req.user.id;

        const thread = await pool.query("select * from threads where id = $1", [id]);
        console.log(thread);
        if (thread.rows[0].user_id == user_id) {
            const updateThread = await pool.query(
        "update threads set   username = $1 , body = $2 , link = $3 where id = $4",[username,body,link,id]);
        res.json("thread is successfully updated"); 
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
        const user_id = req.user.id;
        console.log(user_id);
        const thread = await pool.query("select * from threads where id = $1", [id]);
        if (thread.rows[0].user_id == user_id) {
            await pool.query("delete from threads where id=$1",[id]);
            res.json("thread is successfully deleted");
        }else {
            res.json("fail to delete")
        }
    }catch(err){
        console.log(err.message);
    }
}

module.exports = {
    createthread,threads , readImage, thread , updatethread , deletethread
}