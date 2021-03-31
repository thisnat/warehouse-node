# warehouse-node
backend of [warehouse project](https://github.com/thisnat/warehouse-spring)
## requirement
- Node.js
- MySQL
- Docker (optional)
## setup
#### manual
- setup your database environment in `db.js` first
- use `warehouse.sql` to create database tables
```bash
npm i
npm start
```
#### docker
```bash
docker-compose up -d
```
## database environment
- `db.js`  use your database environment (user,password)
- `warehouse.sql`  warehouse project's database tables and records
