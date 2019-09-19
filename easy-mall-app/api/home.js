import request from '../utils/request.js'

module.exports = {
  // 请求 banner 数据
  getBannerData: (params) => {
    return request({
      url: '/home/banner',
      method: 'GET',
      data: params
    })
  },
  getCategoryData: (params) => {
    return request({
      url: '/home/category',
      method: 'GET',
      data: params
    })
  }
}
