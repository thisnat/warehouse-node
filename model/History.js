const getAll = (con,callback) => {
    con.query('SELECT * from history',callback);
}

const getById = (con,id,callback) => {
    con.query(`SELECT * from history WHERE id = ${id}`,callback);
}

const create = (con,data,callback) => {
    con.query("INSERT INTO history (type,note) VALUES (?,?)",[data.type,data.note],callback);
}

const remove = (con,id,callback) => {
    con.query(`DELETE FROM history WHERE id = ${id}`,callback)
}

const getItemById = (con,id,callback) => {
    con.query(`SELECT * FROM history_item WHERE historyId = ${id}`,callback)
}

const createItem = (con,data,callback) => {
    con.query("INSERT INTO history_item (historyId,productId,name,price,quantity) VALUES (?,?,?,?,?)",
    [data.historyId,data.productId,data.name,data.price,data.quantity],callback);
}

module.exports = {getAll,getById,create,remove,getItemById,createItem};