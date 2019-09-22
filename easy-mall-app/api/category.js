import request from '../utils/request.js'

module.exports = {
  // 请求推荐类目
  getCategoryData: (params) => {
    return request({
      url: '/category/index',
      method: 'GET',
      data: params
    })
  },
  // 请求推荐类目
  getGoodsData: (params) => {
    return request({
      url: '/category/goods',
      method: 'GET',
      data: params
    })
  },

}
