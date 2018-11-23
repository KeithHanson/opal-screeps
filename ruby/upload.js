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

function getDateTime() {

    var date = new Date();

    var hour = date.getHours();
    hour = (hour < 10 ? "0" : "") + hour;

    var min  = date.getMinutes();
    min = (min < 10 ? "0" : "") + min;

    var sec  = date.getSeconds();
    sec = (sec < 10 ? "0" : "") + sec;

    var year = date.getFullYear();

    var month = date.getMonth() + 1;
    month = (month < 10 ? "0" : "") + month;

    var day  = date.getDate();
    day = (day < 10 ? "0" : "") + day;

    return hour + ":" + min + ":" + sec;

}

req.write(JSON.stringify(data));
req.end();
console.log("Uploaded. " + getDateTime())
