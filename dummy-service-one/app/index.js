var express = require('express')
var app = express()

app.set('etag', false);
app.listen(10201);

app.get('/', function (req, res) {
  res.setHeader("Vary", "User-Agent");
  res.setHeader('Last-Modified', (new Date(2018,0,1)).toUTCString());
  // 86400 = 1d
  res.setHeader("Cache-Control", "public, max-age=86400");

  res.send(`Created at ${new Date(Date.now()).toUTCString()}`)
})
