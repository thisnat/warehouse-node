const express = require('express')
const cors = require('cors')

const app = express();
app.use(cors());
app.use(express.urlencoded({extended: true}))
app.use(express.json());

app.get('/api',(req,res,next) => {
    res.send("hello!")
});

app.post('/api',(req,res,next) => {
    const name = req.body.name;
    res.send("hello "+name)
});

app.listen(3001, () => console.log("Server is running at port 3001"))
