const http = require('http');
const app = require('./src/app.js');
const { getTableInventario } = require('./src/controllers/product.controller.js');
const axios = require('axios');

require('dotenv').config();

const port = process.env.PORT || 4000;
const host = process.env.HOST;

const httpServer = http.createServer(app);

function fetchDataPeriodically() {
  getTableInventario()
    .then(data => {
      console.log('Data:', data);

      try {
        axios.post(`${host}/inventario/products`, data)
          .then(response => {
            console.log('Response:', response.data);
          })
          .catch(error => {
            console.error('Error en la solicitud HTTP:', error);
          });
      } catch (error) {
        console.error('Error en la solicitud Axios:', error);
      }
    })
    .catch(error => {
      console.error('Error fetching data:', error);
    });
}

const interval = 60000; 
setInterval(fetchDataPeriodically, interval);

httpServer.listen(port, () => {
  console.log(`Server listening at ${port}`);
});