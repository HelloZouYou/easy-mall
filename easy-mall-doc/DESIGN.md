# easy-mall 设计文稿

本项目 easy-mall 目的是为了 golang 自行学习实践，初期目标实现一个简单的单商户微信小商城，拥有如商品、类目、订单、优惠券、购物车等基本的商城能力。

## 项目结构

- easy-mall-axure 项目原型，使用 Axure 开发实现
- easy-mall-app 微信小程序，使用小程序源码开发
- easy-mall-app-api 小程序后端API项目，golang 框架 [gin](https://github.com/gin-gonic/gin) 实现
- easy-mall-admin 管理后台前端，基于 [vue-element-admin](https://github.com/PanJiaChen/vue-element-admin) 二次开发
- easy-mall-admin-api 管理后台API后端，golang 框架 [gin](https://github.com/gin-gonic/gin) 实现
- easy-mall-doc 项目文档文稿目录
- easy-mall-docker 项目 Docker 环境

## 技术栈

- Golang
- Vue
- element-ui
- 微信小程序
- MySQL
- Redis
- Docker
- Linux

## 功能

### 小程序

小程序功能基本已由原型展示，以下简单陈述：

- 首页
- 商品分类
- 商品列表，商品详情
- 商品热卖推荐、新品推荐
- 浏览足迹，商品收藏
- 购物车
- 个人中心
- 订单列表、详情
- 地址管理
- 意见反馈
- 订单商品评价
- 优惠券

### 管理后台

- 商品管理
- 分类管理
- 订单管理
- 用户管理
- 权限管理
- 图表统计
- 系统配置
