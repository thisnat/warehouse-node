const express = require("express")
const router = express.Router()
const db = require('../db');
const cart = require('../model/Cart')

router.get("/",(req,res,next) => {
    cart.getAll(db,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

router.get("/:id",(req,res,next) => {
    cart.getById(db,req.params.id,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

router.put("/:id",(req,res,next) => {
    const quantity = req.body.quantity;
    cart.update(db,req.params.id,quantity,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(`${quantity}`);
        }
    });
});

router.delete("/:id",(req,res,next) => {
    cart.remove(db,req.params.id,(err,result) => {
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
    cart.create(db,data,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

module.exports = router;