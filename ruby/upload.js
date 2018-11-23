var http = require('http');
var fs = require('fs');

var mainString = fs.readFileSync('main.js', 'utf8');
var compiledString = fs.readFileSync('compiled.js', 'utf8');

var username = 'KeithHanson',
    password = process.env.SCREEPS_PASSWORD,
    data = {
        branch: 'default',         
        modules: {
            compiled: compiledString,
            main: mainString 
        }
    };

var req = http.request({
    hostname: 'screeps.keithhanson.io',
    port: 21025,
    path: '/api/user/code',
    method: 'POST',
    auth: username + ':' + password,
    headers: {
        'Content-Type': 'application/json; charset=utf-8'
    }
});

req.write(JSON.stringify(data));
req.end();
console.log("Uploaded.")
