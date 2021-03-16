const express = require('express')
const cors = require('cors');
const db = require('./db');

const app = express();
app.use(cors());
app.use(express.urlencoded({ extended: true }))
app.use(express.json());

//i know this api suck but refactor soon kub
app.get('/api', (req, res, next) => {
    res.send("hello!")
});

//super dumb login maybe fix soon lol
app.post('/api/login', (req, res, next) => {
    const username = req.body.username;
    const password = req.body.password;
    db.query("SELECT * from user WHERE username = ? AND password = ?",[username,password],(err,result) => {
        if(err){
            res.send({err : err});
        }
        if(result.length > 0){
            res.send(result);
            console.log(req.hostname + " login!");
        }
        else{
            res.status(401);
            res.send("nope");
            console.log(req.hostname + " login fail");
        }
    })
});

const productRouter = require('./routes/ProductRouter');
const cartRouter = require('./routes/CartRouter');
const historyRouter = require('./routes/HistoryRouter');
app.use('/api/products', productRouter);
app.use('/api/cart', cartRouter);
app.use('/api/history', historyRouter);

process.on('SIGINT', () => {
    process.exit();
});

app.listen(3001, () => console.log("Server is running at port 3001"))
