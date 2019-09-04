DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT '登录账号',
  `email` varchar(63) NOT NULL DEFAULT '' COMMENT '邮箱名',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `nickname` varchar(63) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像图片',
  `login_at` datetime DEFAULT NULL COMMENT '最近登录时间',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1-正常， 2-停用，3-软删',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique_name_admin` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `openid` varchar(63) NOT NULL DEFAULT '' COMMENT '微信登录openid',
  `session_key` varchar(255) NOT NULL DEFAULT '' COMMENT '微信登录会话KEY',
  `gender` tinyint(2) NOT NULL DEFAULT 0 COMMENT '性别：0 未知， 1男， 1 女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `nickname` varchar(63) NOT NULL DEFAULT '' COMMENT '用户昵称或网络名称',
  `phone` char(11) NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像图片',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1-正常， 2-停用，3-软删',
  `login_at` datetime DEFAULT NULL COMMENT '最近登录时间',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

DROP TABLE IF EXISTS `log_user`;
CREATE TABLE `log_user` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '操作IP',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型：1-注册创建，2-信息修改，3-密码修改，4-登录，5-停用，6-启用，7-删除',
  `opt_name` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id_log_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户日志表';

DROP TABLE IF EXISTS `log_admin`;
CREATE TABLE `log_admin` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理账号ID',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '操作IP',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型：1-注册创建，2-信息修改，3-密码修改，4-登录，5-停用，6-启用，7-软删',
  `opt_name` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_admin_id_log_admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员日志表';

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT '名称标题',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `img_url` varchar(255) NOT NULL COMMENT '图片地址',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容描述',
  `sort` int(10) NOT NULL DEFAULT 100 COMMENT '排序值',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1-正常， 2-停用',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COMMENT='首页 banner 表';

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单ID',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `goods_stock_id` int(10) NOT NULL DEFAULT 0 COMMENT '商品货品表的货品ID',
  `goods_sn` varchar(63) NOT NULL DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(127) NOT NULL DEFAULT '' COMMENT '商品名称',
  `number` int(10) NOT NULL DEFAULT 0 COMMENT '购买数量',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商品货品的售价',
  `specifications` varchar(1023) NOT NULL COMMENT '商品规格value列表，采用JSON数组格式',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片，具体库存图片',
  `is_checked` tinyint(2) DEFAULT 1 COMMENT '购物车中商品是否选择状态：1-是，2-否',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COMMENT='购物车商品表';

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT '名称',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '类目简述',
  `icon_url` varchar(255) NOT NULL DEFAULT '' COMMENT '类目图标',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '类目图片',
  `sort` int(10) NOT NULL DEFAULT 100 COMMENT '排序值',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1-正常， 2-停用',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COMMENT='类目表';

DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_admin_id_collect` (`user_id`, `goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品收藏表';

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `order_goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单商品ID',
  `content` varchar(1023) NOT NULL DEFAULT '' COMMENT '评论文字内容',
  `pic_urls` varchar(1023) NOT NULL DEFAULT '' COMMENT '图片地址列表，JSON数组',
  `star` tinyint(3) NOT NULL DEFAULT 5 COMMENT '星星评分，1-5',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_admin_id_collect` (`user_id`, `goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论表';

DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL COMMENT '优惠券名称，如限时满减券',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠券介绍，通常是显示优惠券使用限制文字',
  `total` int(10) NOT NULL DEFAULT -1 COMMENT '优惠券数量：-1-无限量',
  `user_limit` int(10) NOT NULL DEFAULT 1 COMMENT '用户领券限制数量：-1-无限制，其他代表具体数量',
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
  `consum_min` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '最低消费金额',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '优惠券类型：1-通用券，用户领取；2-注册赠券；3-优惠券码兑换',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '优惠券状态：1-正常， 2-停用下架，3-过期失效',
  `goods_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '商品限制类型，0-全场通用，1-类目限制，2-商品限制',
  `goods_value` varchar(1023) NOT NULL DEFAULT '' COMMENT '商品限制值，goods_type 所对应的ID限制，逗号分隔或json数组',
  `time_type` smallint(6) DEFAULT 0 COMMENT '时间限制类型，0-基于领取时间的有效天数days；1-start_date和end_date是优惠券有效期；',
  `days` smallint(6) DEFAULT 0 COMMENT '基于领取时间的有效天数',
  `start_date` date DEFAULT NULL COMMENT '使用券开始时间',
  `end_date` date DEFAULT NULL COMMENT '使用券截至时间',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券信息及规则表';

DROP TABLE IF EXISTS `coupon_code`;
CREATE TABLE `coupon_code` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `coupon_id` int(10) UNSIGNED NOT NULL COMMENT '兑换码优惠券ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID，兑换后绑定到用户ID',
  `code` varchar(63) NOT NULL COMMENT '优惠券兑换码',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '优惠券状态：1-正常，2-停用，3-已兑换',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_coupon_id_coupon_code` (`coupon_id`),
  UNIQUE KEY `unique_code_coupon_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='优惠券的兑换码表';

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `username` varchar(63) NOT NULL DEFAULT '' COMMENT '用户名称',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号，可以固话',
  `content` varchar(1023) NOT NULL COMMENT '具体内容',
  `pic_urls` varchar(1023) NOT NULL DEFAULT '' COMMENT '图片地址列表，JSON数组',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_feedback` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='意见反馈表';

DROP TABLE IF EXISTS `footprint`;
CREATE TABLE `footprint` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户浏览足迹表';

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_sn` varchar(63) NOT NULL DEFAULT '' COMMENT '商品编号',
  `category_id` int(10) NOT NULL DEFAULT 0 COMMENT '类目ID',
  `gallery` varchar(1023) NOT NULL DEFAULT '' COMMENT '商品宣传图片列表，采用JSON数组格式',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品搜索关键字，逗号分隔',
  `unit` varchar(15) DEFAULT '件' COMMENT '商品单位，例如件、盒',
  `brief` varchar(255) DEFAULT '' COMMENT '商品简介',
  `detail` text COMMENT '商品详细介绍，是富文本格式',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '商品页面商品图片',
  `share_url` varchar(255) DEFAULT NULL COMMENT '商品分享朋友圈图片',
  `is_on_sale` tinyint(1) DEFAULT 2 COMMENT '是否上架：1-是，2-否',
  `is_new` tinyint(1) DEFAULT 2 COMMENT '是否新品：1-是，2-否',
  `is_hot` tinyint(1) DEFAULT 2 COMMENT '是否热卖：1-是，2-否',
  `sort` int(10) NOT NULL DEFAULT 100 COMMENT '排序值',
  `marked_price` decimal(10,2) DEFAULT 0.00 COMMENT '划线价',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_goods_sn_goods` (`goods_sn`),
  KEY `idx_category_id_goods` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

DROP TABLE IF EXISTS `goods_attr`;
CREATE TABLE `goods_attr` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `attr` varchar(255) NOT NULL COMMENT '商品参数名称',
  `value` varchar(255) NOT NULL COMMENT '商品参数值',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_goods_id_goods_attr` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品参数表';

DROP TABLE IF EXISTS `goods_specification`;
CREATE TABLE `goods_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品规格名称',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT '商品规格值',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_goods_id_goods_attr` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品规格表';

DROP TABLE IF EXISTS `goods_stock`;
CREATE TABLE `goods_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `specifications` varchar(1023) NOT NULL COMMENT '商品规格value列表，采用JSON数组格式',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `stock_num` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `pic_url` varchar(125) NOT NULL DEFAULT '' COMMENT '商品货品图片',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品货品表';

DROP TABLE IF EXISTS `issue`;
CREATE TABLE `issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL COMMENT '问题标题',
  `answer` varchar(255) DEFAULT NULL COMMENT '问题答案',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='常见问题表';

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `order_sn` varchar(63) NOT NULL COMMENT '订单编号',
  `consignee` varchar(63) NOT NULL COMMENT '收货人名称',
  `mobile` varchar(63) NOT NULL COMMENT '收货人手机号',
  `address` varchar(127) NOT NULL COMMENT '收货具体地址',
  `message` varchar(512) NOT NULL DEFAULT '' COMMENT '用户订单留言',
  `goods_money` decimal(10,2) NOT NULL COMMENT '商品总费用',
  `freight_money` decimal(10,2) NOT NULL COMMENT '配送费用',
  `coupon_money` decimal(10,2) NOT NULL COMMENT '优惠券减免',
  `order_money` decimal(10,2) NOT NULL COMMENT '订单费用， goods_money + freight_money - coupon_money',
  `pay_id` varchar(63) DEFAULT NULL COMMENT '微信付款编号',
  `pay_at` datetime DEFAULT NULL COMMENT '微信付款时间',
  `confirm_at` datetime DEFAULT NULL COMMENT '用户确认收货时间',
  `end_at` datetime DEFAULT NULL COMMENT '订单关闭时间',
  `ship_at` datetime DEFAULT NULL COMMENT '发货开始时间',
  `ship_sn` varchar(63) DEFAULT NULL COMMENT '发货编号',
  `ship_channel` varchar(63) DEFAULT NULL COMMENT '发货快递公司',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 101 COMMENT '状态：101-未付款；102-未付款，自行取消；103-未付款，系统取消；201-已支付，待发货；202-已支付，取消订单，申请退款；203-已支付，退款完成；301-已发货，运输中；401-已收货，用户自行确认，402-已收货，系统超时自动确认',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单ID',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `goods_stock_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品库存ID',
  `goods_sn` varchar(63) NOT NULL DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(127) NOT NULL DEFAULT '' COMMENT '商品名称',
  `number` int(10) NOT NULL DEFAULT 0 COMMENT '购买数量',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商品货品的售价',
  `specifications` varchar(1023) NOT NULL COMMENT '商品规格value列表，采用JSON数组格式',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片，具体库存图片',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1-待评价，2-已评价',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id_order_goods` (`order_id`),
  KEY `idx_goods_id_order_goods` (`goods_id`),
  KEY `idx_goods_stock_id_order_goods` (`goods_stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单商品表';

DROP TABLE IF EXISTS `province_city`;
CREATE TABLE `province_city` (
  `id` int(10) DEFAULT NULL,
  `name` varchar(16) DEFAULT '' COMMENT '省/市名称',
  `parent_id` varchar(8) DEFAULT NULL COMMENT '父级ID',
  `simple_name` varchar(8) DEFAULT NULL COMMENT '简称',
  `op_type` tinyint(2) DEFAULT NULL COMMENT '类型：1-省，2-市',
  `area_code` int(10) DEFAULT NULL COMMENT '地区代号',
  `post_code` char(10) DEFAULT NULL COMMENT '邮编',
  `pinyin` char(30) DEFAULT NULL COMMENT '拼音'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='省市表';

DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT '收货人',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话号码，可以固话',
  `province` varchar(63) NOT NULL COMMENT '行政区域表的省ID',
  `city` varchar(63) NOT NULL COMMENT '行政区域表的市ID',
  `county` varchar(63) NOT NULL COMMENT '行政区域表的区县ID',
  `detail` varchar(127) NOT NULL DEFAULT '' COMMENT '详细收货地址',
  `area_code` char(6) DEFAULT NULL COMMENT '地区编码，冗余县级',
  `postal_code` char(6) DEFAULT NULL COMMENT '邮政编码，冗余县级',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1-非默认， 2-默认，3-软删',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_user_address` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收货地址';

DROP TABLE IF EXISTS `user_coupon`;
CREATE TABLE `user_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `coupon_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券ID',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单ID，使用后绑定订单',
  `used_at` datetime DEFAULT NULL COMMENT '使用时间',
  `start_at` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `end_at` datetime DEFAULT NULL COMMENT '有效期截至时间',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1-未使用， 2-已使用，3-过期失效',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_coupon_id_user_coupon` (`user_id`, `coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='优惠券用户使用表';

DROP TABLE IF EXISTS `routes`;
CREATE TABLE `routes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL COMMENT '当前路由的path，只是这一级的',
  `component` varchar(255) DEFAULT NULL COMMENT '当前路由所依赖的组件',
  `hidden` tinyint(2) UNSIGNED DEFAULT NULL COMMENT '该路由是否在侧边栏隐藏：1-是，2-否',
  `alwaysShow` tinyint(2) UNSIGNED DEFAULT NULL COMMENT '是否总是显示根路由：1-是，2-否',
  `redirect` varchar(255) DEFAULT NULL COMMENT '在面包屑中点击会重定向去的地址',
  `name` varchar(255) DEFAULT NULL COMMENT '路由名称，必须添加',
  `type` tinyint(2) UNSIGNED DEFAULT NULL COMMENT '分类，用于多套导航菜单：1-管理平台，2-财务账单，3-短信业务',
  `meta_title` varchar(255) DEFAULT NULL COMMENT '该路由在侧边栏和面包屑中展示的名称',
  `meta_icon` varchar(255) DEFAULT NULL COMMENT '该路由的图标',
  `meta_noCache` tinyint(2) UNSIGNED DEFAULT NULL COMMENT '该页面是否不使用<keep-alive> 缓存：1-是，2-否',
  `meta_breadcrumb` tinyint(2) UNSIGNED DEFAULT NULL COMMENT '该页面是否在面包屑中展示：1-是，2-否',
  `meta_affix` tinyint(2) UNSIGNED DEFAULT NULL COMMENT '该路由是否固定到标签导航上：1-是，2-否',
  `meta_roles` varchar(255) DEFAULT NULL COMMENT '该路由允许查看的角色，优先于permission的判断，逗号分隔',
  `meta_activeMenu` varchar(255) DEFAULT NULL COMMENT '该路由在侧边栏active的实际菜单项',
  `parent_id` int(10) UNSIGNED DEFAULT 0 COMMENT '上级路由的ID',
  `sort` int(10) UNSIGNED DEFAULT 0 COMMENT '同级路由的排序值',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='前端路由表';

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cn_name` varchar(255) NOT NULL DEFAULT '' COMMENT '角色中文简称',
  `name` varchar(255) NOT NULL COMMENT '角色名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '角色备注',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色表';

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cn_name` varchar(255) NOT NULL DEFAULT '' COMMENT '权限的中文简称',
  `name` varchar(255) NOT NULL COMMENT '权限资源名称，如 order',
  `action` varchar(255) NOT NULL COMMENT '权限操作名称，如 read',
  `route_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '权限归属的路由ID',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限表';
