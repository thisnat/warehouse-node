const express = require("express")
const router = express.Router()
const db = require('../db');
const history = require('../model/History')

router.get("/",(req,res,next) => {
    history.getAll(db,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

router.get("/:id",(req,res,next) => {
    history.getById(db,req.params.id,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

router.delete("/:id",(req,res,next) => {
    history.remove(db,req.params.id,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

router.post("/add",(req,res,next) => {
    const data = req.body;
    history.create(db,data,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
            console.log(`${data.id} create!`);
        }
    });
});

module.exports = router;