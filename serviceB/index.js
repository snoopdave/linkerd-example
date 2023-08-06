const express = require('express');
const axios = require('axios');
const app = express();
app.get('/hello/:name', async (req, res) => {
    const name = req.params.name;
    const { data } = await axios.get('http://service-a/random');
    res.send(`Hello ${name}, here's your random number ${data}`);
});
app.listen(8080);
