var express = require('express')
var app = express()

app.listen(10202);

app.get('/', function (req, res) {
  res.send('dummy service two')
})
