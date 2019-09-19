const Mock = require('mockjs');

let res_data = {
    code: 200,
    msg: 'success',
    data: []
}
// 获取 banner 数据
exports.getBannerData = (req, res) => {
    res_data.data = Mock.mock([
        'https://github.com/HelloZouYou/easy-mall/blob/master/easy-mall-app/mock/data/banner/1.png?w=450&h=300',
        'https://github.com/HelloZouYou/easy-mall/blob/master/easy-mall-app/mock/data/banner/2.png?w=450&h=300',
        'https://github.com/HelloZouYou/easy-mall/blob/master/easy-mall-app/mock/data/banner/3.png?w=450&h=300'
    ])
    res.status(200).json(res_data)
};

// 获取 类目 数据
exports.getCategoryData = (req, res) => {
    res_data.data = Mock.mock([
        {
            icon: 'https://github.com/HelloZouYou/easy-mall/blob/master/easy-mall-app/mock/data/icon/category-1.png',
            name: '分类一'
        },
        {
            icon: 'https://github.com/HelloZouYou/easy-mall/blob/master/easy-mall-app/mock/data/icon/category-2.png',
            name: '分类二'
        },
        {
            icon: 'https://github.com/HelloZouYou/easy-mall/blob/master/easy-mall-app/mock/data/icon/category-3.png',
            name: '分类三'
        },
        {
            icon: 'https://github.com/HelloZouYou/easy-mall/blob/master/easy-mall-app/mock/data/icon/category-4.png',
            name: '分类四'
        },
    ])
    res.status(200).json(res_data)
};
