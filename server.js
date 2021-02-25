const express = require('express')
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.urlencoded({ extended: true }))
app.use(express.json());

//i know this api suck but refactor soon kub

app.get('/api', (req, res, next) => {
    res.send("hello!")
});

app.post('/api', (req, res, next) => {
    const name = req.body.name;
    res.send(`hello ${name}`)
});

const productRouter = require('./routes/ProductRouter');
const cartRouter = require('./routes/CartRouter');
const historyRouter = require('./routes/HistoryRouter');
app.use('/api/products', productRouter);
app.use('/api/cart', cartRouter);
app.use('/api/history', historyRouter);

app.listen(3001, () => console.log("Server is running at port 3001"))
