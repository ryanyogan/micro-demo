var barrister = require('barrister');
var express   = require('express');
var bodyParser = require('body-parser');
var fs        = require('fs');

function Calculator() {}
Calculator.prototype.add = function(a, b, callback) {
  callback(null, a + b);
};

Calculator.prototype.subtract = function(a, b, callback) {
  callback(null, a - b);
};

var idl = JSON.parse(fs.readFileSync("./calc.json").toString());
var server = new barrister.Server(idl);
server.addHandler("Calculator", new Calculator());

var app = express();
app.use(bodyParser.json())
app.post('/calc', function(req, res) {
  server.handle({}, req.body, function(respJson) {
    res.contentType('application/json');
    res.send(respJson);
  });
});
app.listen(7667);
