// pages/cart/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    is_edit: false,
    total_fee: 0,
    cart_goods_arr: [
      {
        id: 1,
        is_checked: true,
        pic_url: 'http://localhost:8080/image/goods/1?w=80&h=80',
        goods_name: '123123123123123123',
        goods_stock: '已选择的规格描述',
        number: 2,
        price: 99
      },
      {
        id: 2,
        is_checked: false,
        pic_url: 'http://localhost:8080/image/goods/1?w=80&h=80',
        goods_name: '456',
        goods_stock: '已选择的规格描述',
        number: 1,
        price: 99
      }
    ]
  },
  goodsNumChange: function (e) {
    console.log(e.detail)
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})