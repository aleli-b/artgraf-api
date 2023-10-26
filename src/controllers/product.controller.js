const sql = require('mssql');
require('dotenv').config();
const fs = require('fs');
const path = require('path');

const {
  DBEXT_USER, DBEXT_PASSWORD, DBEXT_HOST, DBEXT_NAME, DBEXT_PORT
} = process.env;

const config = {
  user: DBEXT_USER,
  password: DBEXT_PASSWORD,
  server: DBEXT_HOST,
  database: DBEXT_NAME,
  port: Number(DBEXT_PORT),
  options: {
    encrypt: false
  }
};

const getPeriodo = () => {
  const fechaActual = new Date();
  const year = fechaActual.getFullYear();
  const month = String(fechaActual.getMonth() + 1).padStart(2, '0');
  const valorFechaPeriodo = `${year}${month}`;
  return valorFechaPeriodo
}

function getTableInventario() {
  const sqlQuery = fs.readFileSync(path.join(__dirname, '../../src/utils/dbquerys.sql'), 'utf8');

  const sqlQueryActual = sqlQuery.replace('valorFechaPeriodo', getPeriodo());
  return sql.connect(config)
    .then(pool => {
      return pool.request().query(sqlQueryActual);
    })
    .then(result => {
      sql.close();
      return result.recordset;
    })
    .catch(err => {
      sql.close();
      throw err;
    });
}

module.exports = {
  getTableInventario
};