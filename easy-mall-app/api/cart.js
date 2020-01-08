import request from '../utils/request.js'

module.exports = {
  // 请求购物车数据
  getCartGoods: (params) => {
    return request({
      url: '/cart/goods',
      method: 'GET',
      data: params
    })
  }
}
