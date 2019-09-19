const Mock = require('mockjs');

let res_data = {
    code: 200,
    msg: 'success',
    data: []
}
// 获取 banner 数据
exports.getBannerData = (req, res) => {
    res_data.data = Mock.mock([
        'http://localhost:8080/image/banner/1?w=450&h=300',
        'http://localhost:8080/image/banner/2?w=450&h=300',
        'http://localhost:8080/image/banner/3?w=450&h=300',
    ])
    res.status(200).json(res_data)
};

// 获取 类目 数据
exports.getCategoryData = (req, res) => {
    res_data.data = Mock.mock([
        {
            icon: 'http://localhost:8080/image/category/1',
            name: '分类一'
        },
        {
            icon: 'http://localhost:8080/image/category/2',
            name: '分类二'
        },
        {
            icon: 'http://localhost:8080/image/category/3',
            name: '分类三'
        },
        {
            icon: 'http://localhost:8080/image/category/4',
            name: '分类四'
        },
        {
            icon: 'http://localhost:8080/image/category/4',
            name: '分类四'
        },
    ])
    res.status(200).json(res_data)
};
