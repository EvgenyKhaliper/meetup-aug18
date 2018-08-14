#!/bin/bash

curl -sL https://deb.nodesource.com/setup_6.x | /bin/bash -E;
sudo apt-get update && sudo apt-get install --no-install-recommends --no-install-suggests -y nodejs;

# kill -9 $(ps aux | grep 'nodejs app.js' | awk '{print $2}')

cat > app.js <<ENDOFCONTENT
var http = require('http');
http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});

    res.write('<!DOCTYPE html>');
    res.write('<html>');
    res.write('<head>');
    res.write('<title>Demo $VERSION</title>');
    res.write('</head>');
    res.write('<body style="background-color: #$COLOR">');


    res.write('<h1 style="color: White; font-size: 72px; text-align: center">Demo $VERSION<</h1>');

    res.write('</body>');
    res.write('</html>');

    res.end(); 
}).listen(80);
ENDOFCONTENT