const express = require("express")
const router = express.Router()
const db = require('../db');
const product = require('../model/Product')
const history = require('../model/History')
const cart = require('../model/Cart')

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
            res.send(`${quantity}`);
        }
    });
});

router.delete("/:id",(req,res,next) => {
    product.remove(db,req.params.id,(err,result) => {
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
    product.create(db,data,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(`${result.insertId}`);
            console.log(`${data.name} create!`);
        }
    });
});

router.post("/exportall",(req,res,next) => {
    const data = req.body;
    let historyid;

    history.create(db,data,(err,result) => {
        if(err){
            throw err;
        }
        else{
            historyid = result.insertId;
            cart.getAll(db,(err,result) =>{
                if(err){
                    throw err;
                }else{
                    const createItem = result.map((item) =>{
                        let hItem = {"historyId":historyid,"quantity":item.quantity,"productId":item.productId,"name":item.name,"price":item.price}
                        history.createItem(db,hItem,()=>{})
                    })
                    history.removeAll(db,()=>{console.log("remove all cart item");})
                    res.send(`${historyid}`)
                }
            })
        }
    })
});

module.exports = router;