const getAll = (con,callback) => {
    con.query('SELECT * from products',callback);
}

const getById = (con,id,callback) => {
    con.query(`SELECT * from products WHERE id = ${id}`,callback);
}

const update = (con,id,quantity,callback) => {
    con.query(`UPDATE products SET quantity = ${quantity} WHERE id = ${id}`,callback);
}

const create = (con,data,callback) => {
    con.query("INSERT INTO products (name,quantity,price,safetyStock,note) VALUES (?,?,?,?,?)",[
        data.name,data.quantity,data.price,data.safetyStock,data.note
    ],callback);
}

const remove = (con,id,callback) => {
    con.query(`DELETE FROM products WHERE id = ${id}`,callback)
}

const allCount = (con,callback) => {
    con.query(`SELECT COUNT(*) FROM products`,callback)
}

const allOutOfStock = (con,callback) => {
    con.query(`SELECT COUNT(*) FROM products WHERE quantity < safetyStock`,callback)
}

module.exports = {getAll,getById,update,create,remove,allCount,allOutOfStock};