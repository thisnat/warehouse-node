const getAll = (con, callback) => {
    con.query('SELECT * from history', callback);
}

const getById = (con, id, callback) => {
    con.query(`SELECT * from history WHERE id = ${id}`, callback);
}

const create = (con, data, callback) => {
    con.query("INSERT INTO history (type,status) VALUES (?,?)", [data.type, data.status], callback);
}

const remove = (con, id, callback) => {
    con.query(`DELETE FROM history WHERE id = ${id}`, callback)
}

const getItemById = (con, id, callback) => {
    con.query(`SELECT * FROM history_item WHERE historyId = ${id}`, callback)
}

const createItem = (con, data, callback) => {
    con.query("INSERT INTO history_item (historyId,productId,name,price,quantity,safetyStock,note,createDate) VALUES (?,?,?,?,?,?,?,?)",
        [data.historyId, data.productId, data.name, data.price, data.quantity, data.safetyStock, data.note, data.createDate], callback);
}

const getAllPending = (con, callback) => {
    con.query(`SELECT * from history WHERE status = "PENDING"`, callback)
}

const removeAll = (con, callback) => {
    con.query(`DELETE FROM cart`, callback)
}

const pendingCount = (con, callback) => {
    con.query(`SELECT COUNT(*) FROM history WHERE status = "PENDING"`, callback)
}

const allCount = (con, callback) => {
    con.query(`SELECT COUNT(*) FROM history`, callback)
}

const allImport = (con, callback) => {
    con.query(`SELECT COUNT(*) FROM history WHERE type = "IMPORT"`, callback)
}

const allExport = (con, callback) => {
    con.query(`SELECT COUNT(*) FROM history WHERE type = "EXPORT"`, callback)
}

const update = (con, data, id, callback) => {
    con.query(`UPDATE history SET status = "${data.status}" WHERE id = ${id}`, callback)
}

module.exports = {
    getAll, getById, create, remove,
    getItemById, createItem, removeAll, getAllPending, pendingCount, update, allCount,
    allImport, allExport
};