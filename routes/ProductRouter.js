const express = require("express")
const router = express.Router()
const db = require('../db');
const product = require('../model/Product')

router.get("/",(req,res,next) => {
    product.getAll(db,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

router.get("/:id",(req,res,next) => {
    product.getById(db,req.params.id,(err,result) => {
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
    product.update(db,req.params.id,quantity,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

router.post("/import",(req,res,next) => {
    const data = req.body;
    product.create(db,data,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
            console.log(`${data.name} create!`);
        }
    });
});

module.exports = router;