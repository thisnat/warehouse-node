const express = require('express')
const cors = require('cors');
const dbConnection = require('./db');

const app = express();
app.use(cors());
app.use(express.urlencoded({extended: true}))
app.use(express.json());

//i know this api suck but refactor soon kub

app.get('/api',(req,res,next) => {
    res.send("hello!")
});

app.post('/api',(req,res,next) => {
    const name = req.body.name;
    res.send(`hello ${name}`)
});

app.get('/api/products',(req,res,next) => {
    dbConnection.query('SELECT * from products',(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

app.get('/api/products/:id',(req,res,next) => {
    const { params } = req;
    dbConnection.query('SELECT * from products WHERE id = ?',[params.id],(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

app.post('/api/import',(req,res,next) => {
    const name = req.body.name;
    const quantity = req.body.quantity;
    const price = req.body.price;
    const safetyStock = req.body.safetyStock;
    const note = req.body.note;

    dbConnection.query('INSERT INTO products (name,quantity,price,safetyStock,note) VALUES(?,?,?,?,?)',[name,quantity,price,safetyStock,note],(err,result) =>{
        if(err){
            throw err;
        }
        else{
            res.send(result);
            console.log(name + " created!");
        }
    });
});

app.listen(3001, () => console.log("Server is running at port 3001"))
