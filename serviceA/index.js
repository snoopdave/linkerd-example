const express = require('express');
const app = express();
app.get('/random', (req, res) => {
    res.send(Math.random().toString());
});
app.listen(8080);
