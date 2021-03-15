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

router.get("/count",(req,res,next) => {
    history.allCount(db,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

router.get("/count/import",(req,res,next) => {
    history.allImport(db,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

router.get("/count/export",(req,res,next) => {
    history.allExport(db,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

router.get("/pending",(req,res,next) => {
    history.getAllPending(db,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

router.get("/pending/count",(req,res,next) => {
    history.pendingCount(db,(err,result) => {
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

router.get("/getitem/:id",(req,res,next) => {
    history.getItemById(db,req.params.id,(err,result) => {
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
            res.send(`${result.insertId}`);
        }
    });
});

router.post("/add/item",(req,res,next) => {
    const data = req.body;
    history.createItem(db,data,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

router.put("/update/:id",(req,res,next) => {
    const data = req.body;
    history.update(db,data,req.params.id,(err,result) => {
        if(err){
            throw err;
        }
        else{
            res.send(result);
        }
    });
});

module.exports = router;