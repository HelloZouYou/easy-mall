const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());
app.use(cors());

require('./router')(app)

//  指定端口
const PORT = 8080;

// 获取本机的局域网IP
var os = require('os'),
    iptable = {},
    ifaces = os.networkInterfaces();
for (var dev in ifaces) {
    ifaces[dev].forEach(function (details, alias) {
        if (details.family == 'IPv4') {
            iptable[dev + (alias ? ':' + alias : '')] = details.address;
        }
    });
}

app.listen(PORT, () => {
    console.log(`服务器启动，运行为http://${iptable["WLAN:1"]}:${PORT}`);
});
