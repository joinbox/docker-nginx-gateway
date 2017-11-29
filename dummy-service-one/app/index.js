var express = require('express')
var app = express()

app.listen(10201);

app.get('/', function (req, res) {
  res.send('dummy service one')
})
