DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '帐号昵称',
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱名',
  `phone` char(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话号码',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-正常， 2-停用，3-软删',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像图片',
  `login_at` datetime DEFAULT NULL COMMENT '最近登录时间',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(63) NOT NULL DEFAULT '' COMMENT '微信登录openid',
  `session_key` varchar(100) NOT NULL DEFAULT '' COMMENT '微信登录会话KEY',
  `gender` tinyint(3) NOT NULL DEFAULT '0' COMMENT '性别：0 未知， 1男， 1 女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `nickname` varchar(63) NOT NULL DEFAULT '' COMMENT '用户昵称或网络名称',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像图片',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-正常， 2-停用，3-软删',
  `login_at` datetime DEFAULT NULL COMMENT '最近登录时间',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

DROP TABLE IF EXISTS `log_user`;
CREATE TABLE `log_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `ip` varchar(16) NOT NULL DEFAULT '' COMMENT '操作IP',
  `type` tinyint(2) unsigned DEFAULT '1' COMMENT '类型：1-注册创建，2-信息修改，3-密码修改，4-登录，5-停用，6-启用，7-删除',
  `opt_name` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COMMENT='用户日志表';

DROP TABLE IF EXISTS `log_admin`;
CREATE TABLE `log_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理账号ID',
  `ip` varchar(16) NOT NULL DEFAULT '' COMMENT '操作IP',
  `type` tinyint(2) unsigned DEFAULT '1' COMMENT '类型：1-注册创建，2-信息修改，3-密码修改，4-登录，5-停用，6-启用，7-删除',
  `opt_name` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COMMENT='管理员日志表';

DROP TABLE IF EXISTS `advertisement`;
DROP TABLE IF EXISTS `address`;
DROP TABLE IF EXISTS `cart`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `coupon`;
DROP TABLE IF EXISTS `goods`;
DROP TABLE IF EXISTS `goods_attr`;
DROP TABLE IF EXISTS `goods_collect`;
DROP TABLE IF EXISTS `goods_comment`;
DROP TABLE IF EXISTS `goods_specification`;
DROP TABLE IF EXISTS `goods_stock`;
DROP TABLE IF EXISTS `issue`;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS `order_goods`;
DROP TABLE IF EXISTS `province_city`;
DROP TABLE IF EXISTS `user_coupon`;
DROP TABLE IF EXISTS `user_feedback`;
DROP TABLE IF EXISTS `user_footprint`;
