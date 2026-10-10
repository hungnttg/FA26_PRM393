//npm i express
//npm i mysql2
//npm i cors
//import thu vien
const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
//tao server
const app = express();
app.use(cors());
//thong tin ket noi csdl
const conn = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"",
    database:"a2"
});
conn.connect(err=>err);//thuc hien ket noi csdl
app.get('/get',(req,res)=>{
    conn.query('select * from photos',(err,results)=>{
        if(err) throw err;
        res.json(results);
    });
});
//lang nghe
app.listen(3015,()=>{
    console.log('server dang lang nghe o cong 3015');
})