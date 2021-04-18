const express = require("express")
const router = express.Router()
const db = require('../db');
const cart = require('../model/Cart')
const product = require('../model/Product')

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

router.post("/remove/:id",(req,res,next) => {
    cart.getById(db,req.params.id,(err,result) => {
        if(err){
            throw err;
        }
        else{
            product.getById(db,result[0].productId,(err,result2) => {
                if (result2.length === 0){
                    // do add product
                    let data = {
                        "name": result[0].name, "quantity": result[0].quantity,
                        "price": result[0].price, "safetyStock": result[0].safetyStock, "note": result[0].note
                    }
                    product.create(db,data,(err,result3) => {
                        if (err){
                            throw err;
                        }
                    })
                }
                else{
                    // do update product
                    product.update(db, result[0].productId, result[0].quantity + result2[0].quantity, (err, result4) => {
                        if (err) {
                            throw err;
                        }
                    });
                }
                cart.remove(db,req.params.id,(err,result5) => {
                    if(err){
                        throw err;
                    }
                    else{
                        res.send(result5);
                    }
                });
            })
        }
    });
})

module.exports = router;