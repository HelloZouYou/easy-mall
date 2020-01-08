// pages/cart/index.js
import {
  getCartGoods
} from '../../api/cart.js'

Page({

  /**
   * 页面的初始数据
   */
  data: {
    is_edit: false,
    total_fee: 0,
    cart_goods_arr: []
  },
  goodsNumChange: function (e) {
    console.log(e.detail)
  },
  // 获取页面数据
  fetchData() {
    this.fetchCartData()
  },
  // 获取购物车数据
  fetchCartData: function() {
    getCartGoods().then(res => {
      this.setData({
        cart_goods_arr: res.data.data
      })
      this.sumTotalFee()
    }).catch(errors => {
      console.log(errors)
    })
  },

  sumTotalFee: function() {
    let temp_fee = 0
    this.data.cart_goods_arr.forEach(function (item) {
      temp_fee += item.number*item.price
    })
    this.setData({
      total_fee: temp_fee
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.fetchData()
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