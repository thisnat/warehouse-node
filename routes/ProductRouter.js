const express = require("express")
const router = express.Router()
const db = require('../db');
const product = require('../model/Product')
const history = require('../model/History')
const cart = require('../model/Cart')

router.get("/", (req, res, next) => {
    product.getAll(db, (err, result) => {
        if (err) {
            throw err;
        }
        else {
            res.send(result);
        }
    });
});

router.get("/count", (req, res, next) => {
    product.allCount(db, (err, result) => {
        if (err) {
            throw err;
        }
        else {
            res.send(result);
        }
    });
});

router.get("/count/ofs", (req, res, next) => {
    product.allOutOfStock(db, (err, result) => {
        if (err) {
            throw err;
        }
        else {
            res.send(result);
        }
    });
});

router.get("/:id", (req, res, next) => {
    product.getById(db, req.params.id, (err, result) => {
        if (err) {
            throw err;
        }
        else {
            res.send(result);
        }
    });
});

router.put("/:id", (req, res, next) => {
    const quantity = req.body.quantity;
    product.update(db, req.params.id, quantity, (err, result) => {
        if (err) {
            throw err;
        }
        else {
            res.send(`${quantity}`);
        }
    });
});

router.delete("/:id", (req, res, next) => {
    product.remove(db, req.params.id, (err, result) => {
        if (err) {
            throw err;
        }
        else {
            res.send(result);
        }
    });
});

router.post("/add", (req, res, next) => {
    const data = req.body;
    product.create(db, data, (err, result) => {
        if (err) {
            throw err;
        }
        else {
            res.send(`${result.insertId}`);
            console.log(`${data.name} create!`);
        }
    });
});

router.post("/exportall", (req, res, next) => {
    const data = req.body;
    let historyid;

    history.create(db, data, (err, result) => {
        if (err) {
            throw err;
        }
        else {
            historyid = result.insertId;
            cart.getAll(db, (err, result) => {
                if (err) {
                    throw err;
                } else {
                    const createItem = result.map((item) => {
                        let hItem = {
                            "historyId": historyid, "quantity": item.quantity, "productId": item.productId,
                            "name": item.name, "price": item.price, "safetyStock": item.safetyStock, "note": item.note, "createDate": item.createDate
                        }
                        history.createItem(db, hItem, () => { })
                    })
                    history.removeAll(db, () => { console.log("remove all cart item"); })
                    res.send(`${historyid}`)
                }
            })
        }
    })
});

router.post("/import", (req, res, next) => {
    const data = req.body;
    let historyid;

    history.create(db, data, (err, result) => {
        if (err) {
            throw err;
        }
        else {
            historyid = result.insertId;
            let hItem = {
                "historyId": historyid, "quantity": data.quantity, "productId": data.productId,
                "name": data.name, "price": data.price, "safetyStock": data.safetyStock, "note": data.note, "createDate": data.createDate
            }
            history.createItem(db, hItem, (err, result) => {
                if (err) {
                    throw err;
                }
                else {
                    res.send(result);
                }
            })
        }
    })
});

router.post("/export/reject/:id", (req, res, next) => {
    history.getItemById(db, req.params.id, (err, result) => {
        if (err) {
            throw err;
        }
        else {
            const itemReturn = result.map((item) => {
                product.getById(db, item.productId, (err, result) => {
                    if (result.length === 0) {
                        let data = {
                            "name": item.name, "quantity": item.quantity,
                            "price": item.price, "safetyStock": item.safetyStock, "note": item.note
                        }
                        product.create(db, data, () => { })
                    }
                    else {
                        product.update(db, item.productId, result[0].quantity + item.quantity, () => { })
                    }

                    let status = { "status": "REJECT" }
                    history.update(db, status, req.params.id, () => { })
                })
            })
            res.send(result);
        }
    })
});

router.post("/import/accept/:id", (req, res, next) => {
    history.getItemById(db, req.params.id, (err, result) => {
        if (err) {
            throw err;
        }
        else {
            if (result[0].productId == null) {
                let data = {
                    "name": result[0].name, "quantity": result[0].quantity,
                    "price": result[0].price, "safetyStock": result[0].safetyStock, "note": result[0].note
                }
                product.create(db, data, () => { })
            } else {
                product.getById(db, result[0].productId, (err, rProduct) => {
                    if (rProduct[0] != null) {
                        product.update(db, result[0].productId, rProduct[0].quantity + result[0].quantity, () => { })
                    } else {
                        let data = {
                            "name": result[0].name, "quantity": result[0].quantity,
                            "price": result[0].price, "safetyStock": result[0].safetyStock, "note": result[0].note
                        }
                        product.create(db, data, () => { })
                    }
                })
            }
            let status = { "status": "ACCEPT" }
            history.update(db, status, req.params.id, () => { })
            res.send(result);
        }
    })
});

module.exports = router;