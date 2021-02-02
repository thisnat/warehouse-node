const express = require('express')
const cors = require('cors');
const dbConnection = require('./db');

const app = express();
app.use(cors());
app.use(express.urlencoded({extended: true}))
app.use(express.json());

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

app.listen(3001, () => console.log("Server is running at port 3001"))
