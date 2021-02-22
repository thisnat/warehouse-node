const getAll = (con,callback) => {
    con.query('SELECT * from cart',callback);
}

const getById = (con,id,callback) => {
    con.query(`SELECT * from cart WHERE id = ${id}`,callback);
}

const update = (con,id,quantity,callback) => {
    con.query(`UPDATE cart SET quantity = ${quantity} WHERE id = ${id}`,callback);
}

const create = (con,data,callback) => {
    con.query("INSERT INTO cart (name,quantity,price,safetyStock,note,productId) VALUES (?,?,?,?,?,?)",[
        data.name,data.quantity,data.price,data.safetyStock,data.note,data.productId
    ],callback);
}

const remove = (con,id,callback) => {
    con.query(`DELETE FROM cart WHERE id = ${id}`,callback)
}

module.exports = {getAll,getById,update,create,remove};