const Mock = require('mockjs');

let res_data = {
    code: 200,
    msg: 'success',
    data: []
}

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

// 获取 banner 数据
exports.getGoodsData = (req, res) => {
    let tmp = Object.assign({}, res_data)
    tmp.data = Mock.mock([
        {
            id: 1,
            is_checked: true,
            pic_url: 'http://' + iptable["WLAN:1"] + ':8080/image/goods/1?w=80&h=80',
            goods_name: '123123123123123123',
            goods_stock: '已选择的规格描述',
            number: 2,
            price: 99.9
        },
        {
            id: 2,
            is_checked: false,
            pic_url: 'http://' + iptable["WLAN:1"] + ':8080/image/goods/1?w=80&h=80',
            goods_name: '456',
            goods_stock: '已选择的规格描述',
            number: 1,
            price: 99.9
        }
    ])
    res.status(200).json(tmp)
};