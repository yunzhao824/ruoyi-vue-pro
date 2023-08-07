/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1 MySQL
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : ruoyi-vue-pro

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 24/07/2023 12:53:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member_address
-- ----------------------------
DROP TABLE IF EXISTS `member_address`;
CREATE TABLE `member_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '收件地址编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件人名称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '手机号',
  `area_id` bigint NOT NULL COMMENT '地区编码',
  `detail_address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件详细地址',
  `default_status` bit(1) NOT NULL COMMENT '是否默认',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户收件地址';

-- ----------------------------
-- Records of member_address
-- ----------------------------
BEGIN;
INSERT INTO `member_address` (`id`, `user_id`, `name`, `mobile`, `area_id`, `detail_address`, `default_status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (21, 247, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', b'1', '1', '2022-08-01 22:46:35', '247', '2023-06-26 19:47:46', b'0', 1), (22, 247, '芋头', '15601691300', 610632, '12332131', b'0', '1', '2022-08-01 22:46:35', '247', '2023-06-25 14:09:06', b'1', 1), (23, 247, '测试', '15601691300', 120103, '13232312', b'0', '247', '2023-06-26 19:47:40', '247', '2023-06-26 19:47:46', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for member_point_config
-- ----------------------------
DROP TABLE IF EXISTS `member_point_config`;
CREATE TABLE `member_point_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `trade_deduct_enable` bit(1) NOT NULL COMMENT '是否开启积分抵扣',
  `trade_deduct_unit_price` int NOT NULL COMMENT '积分抵扣(单位：分)',
  `trade_deduct_max_price` int NULL DEFAULT NULL COMMENT '积分抵扣最大值',
  `trade_give_point` bigint NULL DEFAULT NULL COMMENT '1 元赠送多少分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员积分配置表';

-- ----------------------------
-- Records of member_point_config
-- ----------------------------
BEGIN;
INSERT INTO `member_point_config` (`id`, `trade_deduct_enable`, `trade_deduct_unit_price`, `trade_deduct_max_price`, `trade_give_point`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, b'1', 0, 10000, 1, '', '2023-07-02 14:49:31', '', '2023-07-02 14:49:31', b'0', 0), (2, b'1', 32, 10003, 1212, '', '2023-07-02 14:49:31', '', '2023-07-02 14:49:31', b'0', 0), (3, b'1', 12, 12, 12, '', '2023-07-02 14:49:31', '', '2023-07-02 14:49:31', b'0', 0);
COMMIT;

-- ----------------------------
-- Table structure for member_point_record
-- ----------------------------
DROP TABLE IF EXISTS `member_point_record`;
CREATE TABLE `member_point_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `biz_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务编码',
  `biz_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务类型',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1增加 0扣减',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '积分标题',
  `description` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '积分描述',
  `point` int NOT NULL COMMENT '积分',
  `total_point` int NOT NULL COMMENT '变动后的积分',
  `status` int NOT NULL COMMENT '状态：1-订单创建，2-冻结期，3-完成，4-失效（订单退款）\n',
  `user_id` int NOT NULL COMMENT '用户id',
  `freezing_time` datetime NULL DEFAULT NULL COMMENT '冻结时间',
  `thawing_time` datetime NULL DEFAULT NULL COMMENT '解冻时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_userId`(`user_id` ASC) USING BTREE,
  INDEX `index_title`(`title` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户积分记录';

-- ----------------------------
-- Records of member_point_record
-- ----------------------------
BEGIN;
INSERT INTO `member_point_record` (`id`, `biz_id`, `biz_type`, `type`, `title`, `description`, `point`, `total_point`, `status`, `user_id`, `freezing_time`, `thawing_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '1', '1', '1', '12', NULL, 212, 12, 1, 12, '2023-06-13 00:00:00', '2023-06-20 00:00:00', '', '2023-07-02 14:50:23', '', '2023-07-02 14:50:23', b'0', 0), (2, '12', '1', '0', '123', NULL, 1212, 12, 2, 12, '2023-06-28 00:00:00', NULL, '', '2023-07-02 14:50:23', '', '2023-07-02 15:00:06', b'0', 0), (3, '12', '1', '1', '12', NULL, 12, 12, 1, 12, '2023-06-27 00:00:00', '2023-06-23 00:00:00', '', '2023-07-02 14:50:23', '', '2023-07-02 14:50:23', b'0', 0);
COMMIT;

-- ----------------------------
-- Table structure for member_sign_in_config
-- ----------------------------
DROP TABLE IF EXISTS `member_sign_in_config`;
CREATE TABLE `member_sign_in_config`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '规则自增主键',
  `day` int NULL DEFAULT NULL COMMENT '签到第x天',
  `point` int NULL DEFAULT NULL COMMENT '签到天数对应分数',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '变更时间',
  `tenant_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '变更人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '积分签到规则';

-- ----------------------------
-- Records of member_sign_in_config
-- ----------------------------
BEGIN;
INSERT INTO `member_sign_in_config` (`id`, `day`, `point`, `create_time`, `update_time`, `tenant_id`, `deleted`, `creator`, `updater`) VALUES (1, 1, 10, '2023-06-10 11:34:43', '2023-06-10 11:34:43', '1', 0, '1', '1'), (2, 2, 20, '2023-06-10 11:34:59', '2023-06-10 03:55:35', '1', 1, '1', '1'), (3, 7, 1001, '2023-06-10 17:47:45', '2023-06-10 19:54:37', '1', 0, '1', '1'), (4, 6, 12121, '2023-06-10 17:47:55', '2023-06-10 19:48:37', '1', 0, '1', '1'), (5, 2, 12, '2023-06-10 19:54:52', '2023-06-10 19:54:52', '1', 0, '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for member_sign_in_record
-- ----------------------------
DROP TABLE IF EXISTS `member_sign_in_record`;
CREATE TABLE `member_sign_in_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '签到自增id',
  `user_id` int NULL DEFAULT NULL COMMENT '签到用户',
  `day` int NULL DEFAULT NULL COMMENT '第几天签到',
  `point` int NULL DEFAULT NULL COMMENT '签到的分数',
  `create_time` datetime NULL DEFAULT NULL COMMENT '签到时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '变更时间',
  `tenant_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户签到积分';

-- ----------------------------
-- Records of member_sign_in_record
-- ----------------------------
BEGIN;
INSERT INTO `member_sign_in_record` (`id`, `user_id`, `day`, `point`, `create_time`, `update_time`, `tenant_id`, `deleted`, `creator`, `updater`) VALUES (1, 121, 1, 123, '2023-06-10 12:58:18', '2023-06-10 04:59:00', '1', 1, '1', '1'), (2, 12, 12, 12, '2023-06-10 19:56:39', '2023-06-10 11:56:45', '1', 1, '1', '1'), (3, 12, 12, 1212, '2023-06-10 20:01:17', '2023-06-10 12:01:23', '1', 1, '1', '1'), (4, 12, 12, 1212, '2023-06-10 20:01:27', '2023-06-10 20:01:27', '1', 0, '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for member_user
-- ----------------------------
DROP TABLE IF EXISTS `member_user`;
CREATE TABLE `member_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `status` tinyint NOT NULL COMMENT '状态',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `register_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '注册 IP',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_mobile`(`mobile` ASC) USING BTREE COMMENT '手机号'
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户';

-- ----------------------------
-- Records of member_user
-- ----------------------------
BEGIN;
INSERT INTO `member_user` (`id`, `nickname`, `avatar`, `status`, `mobile`, `password`, `register_ip`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (247, '', '', 0, '15601691399', '$2a$10$qgYm87VnfOLIC6jgNPlQ/ujIs8lLqsNT064I.D/IxHrua0BYaq3Y6', '127.0.0.1', '127.0.0.1', '2022-07-15 00:59:32', NULL, '2022-05-29 11:23:08', NULL, '2022-07-15 00:59:32', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for product_brand
-- ----------------------------
DROP TABLE IF EXISTS `product_brand`;
CREATE TABLE `product_brand`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '品牌编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品牌名称',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品牌图片',
  `sort` int NULL DEFAULT 0 COMMENT '品牌排序',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品牌描述',
  `status` tinyint NOT NULL COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品品牌';

-- ----------------------------
-- Records of product_brand
-- ----------------------------
BEGIN;
INSERT INTO `product_brand` (`id`, `name`, `pic_url`, `sort`, `description`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '苹果', 'http://test.yudao.iocoder.cn/e3726713fa56db5717c78c011762fcc7a251db12735c3581470638b8e1fa17e2.jpeg', 0, '是上市', 0, '1', '2022-07-30 22:12:18', '1', '2022-07-30 22:13:55', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `parent_id` bigint NOT NULL COMMENT '父分类编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '移动端分类图',
  `big_pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'PC 端分类图',
  `sort` int NULL DEFAULT 0 COMMENT '分类排序',
  `status` tinyint NOT NULL COMMENT '开启状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类';

-- ----------------------------
-- Records of product_category
-- ----------------------------
BEGIN;
INSERT INTO `product_category` (`id`, `parent_id`, `name`, `pic_url`, `big_pic_url`, `sort`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (15, 0, '服装鞋包', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/a23f732db55e6adbc608f4b6cf2b0ab50db6d9147af0ee267a315805a596e175.jpg', '', 100, 0, '1', '2023-04-25 16:57:05', '1', '2023-04-25 17:08:26', b'0', 1), (16, 15, '时尚女装', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/aa8d5c44ac0390ab398bae0dc8883575e3cb57594f9ed00248febe8e3d7484d1.png', '', 200, 0, '1', '2023-04-25 17:09:00', '1', '2023-04-25 17:09:00', b'0', 1), (17, 15, '精品男装', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/b0c166c0846fa2280b4a02431e2ac2e2363f2d2a6b608598f34b067a5ccf1245.png', '', 100, 0, '1', '2023-04-25 17:09:33', '1', '2023-04-25 17:09:33', b'0', 1), (18, 15, '箱包', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/8682928caa2a5a49b380ac93059adc435099873cdf646084f31cea79d5c27f40.png', '', 80, 0, '1', '2023-04-25 17:09:51', '1', '2023-04-25 17:09:51', b'0', 1), (19, 15, '西服', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/c202fa79f2fbe188cfdf40b107c7eca89c548a5c4b0047e26b7a6445c470615a.jpg', '', 0, 0, '1', '2023-04-25 17:10:15', '1', '2023-04-25 17:10:15', b'0', 1), (20, 15, '配饰', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/51bf43fcad0b947f5fa377356fb7034b47223fdbcec241d50e6e60a9be498730.jpg', '', 0, 0, '1', '2023-04-25 17:10:56', '1', '2023-04-25 17:10:56', b'0', 1), (21, 15, '美妆工具', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/c3cd6735cf157c218bc32ece312fd90cb2130c437dc9ec61d4030681d6ba4efb.png', '', 0, 0, '1', '2023-04-25 17:11:15', '1', '2023-04-25 17:11:24', b'0', 1), (22, 0, '网络盒子', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/74656bb8bc988c0419e0dbc613eda24a03956b950452b3565527301a5782db3a.png', '', 50, 0, '1', '2023-04-25 17:12:13', '1', '2023-04-25 17:12:13', b'0', 1), (23, 22, '尿裤湿巾', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/20162f22d8f6b427f0d6f1678c9fbb7bf0c1b70768bdc86101bee8b5e13bec5a.jpeg', '', 0, 0, '1', '2023-04-25 17:12:42', '1', '2023-04-25 17:12:42', b'0', 1), (24, 15, '宠物主粮', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/383729ba05711c400f9e44db11a63603af0fdbc99e58cd7b40e9296ca4e0510e.jpg', '', 0, 0, '1', '2023-04-25 17:13:09', '1', '2023-04-25 17:13:09', b'0', 1), (25, 0, '家电电器', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/c8a34dc2688fd4d2c95b5f49888865db1c88fd3bde153e3f7f0bcd4ff9971c96.png', '', 50, 0, '1', '2023-04-25 17:13:43', '1', '2023-04-25 17:13:43', b'0', 1), (26, 25, '封口/封杯机', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/1c0c208cfcf871c146006d97f95ae4fcd14d8a2deb3eabe3696367af61cb5e69.png', '', 60, 0, '1', '2023-04-25 17:14:39', '1', '2023-04-25 17:14:39', b'0', 1), (27, 25, '空调', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/d578e1e60b2dc3efe70643d25a8b2150dabfecd658fdb2fafcdb786d525f66d1.png', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/34ed55f822ad25ab445e6b396dcd61a7d119882ef19f85f0e24742911d896959.jpeg', 60, 0, '1', '2023-04-25 17:15:12', '1', '2023-04-25 17:17:04', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for product_comment
-- ----------------------------
DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE `product_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论编号，主键自增',
  `user_id` bigint NULL DEFAULT NULL COMMENT '评价人的用户编号，关联 MemberUserDO 的 id 编号',
  `user_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价人名称',
  `user_avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价人头像',
  `anonymous` bit(1) NULL DEFAULT NULL COMMENT '是否匿名',
  `order_id` bigint NULL DEFAULT NULL COMMENT '交易订单编号，关联 TradeOrderDO 的 id 编号',
  `order_item_id` bigint NULL DEFAULT NULL COMMENT '交易订单项编号，关联 TradeOrderItemDO 的 id 编号',
  `spu_id` bigint NULL DEFAULT NULL COMMENT '商品 SPU 编号，关联 ProductSpuDO 的 id',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品 SPU 名称',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '商品 SKU 编号，关联 ProductSkuDO 的 id 编号',
  `visible` bit(1) NULL DEFAULT NULL COMMENT '是否可见，true:显示false:隐藏',
  `scores` tinyint NULL DEFAULT NULL COMMENT '评分星级1-5分',
  `description_scores` tinyint NULL DEFAULT NULL COMMENT '描述星级 1-5 星',
  `benefit_scores` tinyint NULL DEFAULT NULL COMMENT '服务星级 1-5 星',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `pic_urls` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论图片地址数组',
  `reply_status` bit(1) NULL DEFAULT NULL COMMENT '商家是否回复',
  `reply_user_id` bigint NULL DEFAULT NULL COMMENT '回复管理员编号，关联 AdminUserDO 的 id 编号',
  `reply_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家回复内容',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '商家回复时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品评论';

-- ----------------------------
-- Records of product_comment
-- ----------------------------
BEGIN;
INSERT INTO `product_comment` (`id`, `user_id`, `user_nickname`, `user_avatar`, `anonymous`, `order_id`, `order_item_id`, `spu_id`, `spu_name`, `sku_id`, `visible`, `scores`, `description_scores`, `benefit_scores`, `content`, `pic_urls`, `reply_status`, `reply_user_id`, `reply_content`, `reply_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, 633, NULL, NULL, b'1', 4, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '', '2023-06-27 15:57:00', '', '2023-06-27 15:59:26', b'0', 1), (2, NULL, NULL, NULL, NULL, NULL, NULL, 633, NULL, NULL, b'1', 1, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '', '2023-06-27 15:57:00', '', '2023-06-27 15:59:26', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for product_favorite
-- ----------------------------
DROP TABLE IF EXISTS `product_favorite`;
CREATE TABLE `product_favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `spu_id` bigint NOT NULL COMMENT '商品 SPU 编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '商品收藏表';

-- ----------------------------
-- Records of product_favorite
-- ----------------------------
BEGIN;
INSERT INTO `product_favorite` (`id`, `user_id`, `spu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (21, 247, 610632, '1', '2022-08-01 22:46:35', '1', '2023-06-25 04:26:02', b'1', 1), (22, 247, 633, '247', '2023-06-09 20:01:11', '247', '2023-06-09 12:01:17', b'1', 1), (23, 247, 633, '247', '2023-06-11 22:20:27', '247', '2023-06-11 14:20:28', b'1', 1), (24, 247, 633, '247', '2023-06-11 22:20:46', '247', '2023-06-15 11:37:12', b'1', 1), (25, 247, 633, '247', '2023-06-15 19:37:13', '247', '2023-06-25 04:25:40', b'1', 1);
COMMIT;

-- ----------------------------
-- Table structure for product_property
-- ----------------------------
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`(32) ASC) USING BTREE COMMENT '规格名称索引'
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性项';

-- ----------------------------
-- Records of product_property
-- ----------------------------
BEGIN;
INSERT INTO `product_property` (`id`, `name`, `status`, `remark`, `create_time`, `update_time`, `creator`, `updater`, `tenant_id`, `deleted`) VALUES (1, '颜色', 0, '嘿嘿嘿', '2022-09-20 10:25:53', '2022-12-12 23:21:21', '1', '1', 1, b'0'), (2, '尺寸', 0, '123', '2022-09-20 15:11:04', '2022-12-12 23:19:48', '1', '1', 1, b'0'), (3, '版本', 0, NULL, '2023-04-26 12:31:30', '2023-04-26 12:31:39', '1', '1', 1, b'0'), (4, '123', NULL, '', '2023-05-06 22:32:54', '2023-05-06 22:32:54', '1', '1', 1, b'0'), (5, '哈哈', NULL, '', '2023-05-24 09:19:30', '2023-05-24 09:19:30', '1', '1', 1, b'0'), (6, '土豆', NULL, '', '2023-05-24 19:58:33', '2023-05-24 19:58:33', '1', '1', 1, b'0'), (7, 'hhh', NULL, '', '2023-05-24 20:13:09', '2023-05-24 20:13:09', '1', '1', 1, b'0'), (8, '呵呵', NULL, '2', '2023-05-24 20:14:44', '2023-06-03 20:01:37', '1', '1', 1, b'0');
COMMIT;

-- ----------------------------
-- Table structure for product_property_value
-- ----------------------------
DROP TABLE IF EXISTS `product_property_value`;
CREATE TABLE `product_property_value`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `property_id` bigint NULL DEFAULT NULL COMMENT '属性项的编号',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性值';

-- ----------------------------
-- Records of product_property_value
-- ----------------------------
BEGIN;
INSERT INTO `product_property_value` (`id`, `property_id`, `name`, `status`, `remark`, `create_time`, `update_time`, `creator`, `updater`, `tenant_id`, `deleted`) VALUES (1, 1, '红色', 0, '啊啊啊', '2022-09-20 10:26:10', '2022-09-20 10:26:10', '1', '1', 1, b'0'), (2, 1, '绿色', 0, NULL, '2022-09-20 15:10:52', '2022-09-20 15:10:52', '1', '1', 1, b'0'), (3, 2, '12*12', 0, NULL, '2022-09-20 15:11:23', '2022-09-20 15:11:23', '1', '1', 1, b'0'), (4, 2, '13*13', 0, 'xx', '2022-09-20 15:11:30', '2022-12-12 23:39:40', '1', '1', 1, b'0'), (5, 1, '黑色', 0, NULL, '2023-04-26 12:32:01', '2023-04-26 12:32:06', NULL, NULL, 1, b'0'), (6, 1, '蓝色', 0, NULL, '2023-04-26 12:32:20', '2023-04-26 12:32:20', NULL, NULL, 1, b'0'), (7, 1, '白色', 0, NULL, '2023-04-26 12:32:33', '2023-04-26 12:32:35', NULL, NULL, 1, b'0'), (8, 3, 'CH510', 0, NULL, '2023-04-26 12:32:52', '2023-04-27 16:04:38', NULL, NULL, 1, b'0'), (9, 5, '颜色', NULL, NULL, '2023-05-24 09:19:39', '2023-05-24 09:19:39', '1', '1', 1, b'0'), (10, 5, '绿色', NULL, NULL, '2023-05-24 09:19:43', '2023-05-24 09:19:43', '1', '1', 1, b'0'), (11, 6, '蔬菜', NULL, NULL, '2023-05-24 19:58:43', '2023-05-24 19:58:43', '1', '1', 1, b'0'), (12, 6, '绿豆', NULL, NULL, '2023-05-24 19:58:45', '2023-05-24 19:58:45', '1', '1', 1, b'0'), (13, 6, '111', NULL, NULL, '2023-05-24 20:00:06', '2023-05-24 20:00:06', '1', '1', 1, b'0'), (14, 7, '呵呵呵', NULL, NULL, '2023-05-24 20:13:13', '2023-05-24 20:13:13', '1', '1', 1, b'0'), (15, 7, '嘿嘿', NULL, NULL, '2023-05-24 20:13:16', '2023-05-24 20:13:16', '1', '1', 1, b'0'), (16, 8, '哈哈', NULL, NULL, '2023-05-24 20:14:48', '2023-05-24 20:14:48', '1', '1', 1, b'0'), (17, 8, '呵呵', NULL, NULL, '2023-05-24 20:14:50', '2023-05-24 20:14:50', '1', '1', 1, b'0');
COMMIT;

-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `spu_id` bigint NOT NULL COMMENT 'spu编号',
  `properties` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '属性数组，JSON 格式 [{propertId: , valueId: }, {propertId: , valueId: }]',
  `price` int NOT NULL DEFAULT -1 COMMENT '商品价格，单位：分',
  `market_price` int NULL DEFAULT NULL COMMENT '市场价，单位：分',
  `cost_price` int NOT NULL DEFAULT -1 COMMENT '成本价，单位： 分',
  `bar_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'SKU 的条形码',
  `pic_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片地址',
  `stock` int NULL DEFAULT NULL COMMENT '库存',
  `weight` double NULL DEFAULT NULL COMMENT '商品重量，单位：kg 千克',
  `volume` double NULL DEFAULT NULL COMMENT '商品体积，单位：m^3 平米',
  `sub_commission_first_price` int NULL DEFAULT NULL COMMENT '一级分销的佣金，单位：分',
  `sub_commission_second_price` int NULL DEFAULT NULL COMMENT '二级分销的佣金，单位：分',
  `sales_count` int NULL DEFAULT NULL COMMENT '商品销量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` double(64, 0) NULL DEFAULT NULL COMMENT '更新人',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品sku';

-- ----------------------------
-- Records of product_sku
-- ----------------------------
BEGIN;
INSERT INTO `product_sku` (`id`, `spu_id`, `properties`, `price`, `market_price`, `cost_price`, `bar_code`, `pic_url`, `stock`, `weight`, `volume`, `sub_commission_first_price`, `sub_commission_second_price`, `sales_count`, `create_time`, `update_time`, `creator`, `updater`, `deleted`, `tenant_id`) VALUES (1, 633, '[{\"propertyId\": 1, \"propertyName\": \"颜色\", \"valueId\": 5, \"valueName\": \"黑色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', 6, 34900, -1, NULL, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 43, NULL, NULL, NULL, NULL, 17, '2023-04-26 12:37:28', '2023-07-08 04:32:07', NULL, NULL, b'0', 1), (2, 633, '[{\"propertyId\": 1, \"propertyName\": \"颜色\", \"valueId\": 6, \"valueName\": \"蓝色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', 5, 34900, -1, NULL, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 94, NULL, NULL, NULL, NULL, 5, '2023-04-26 12:37:28', '2023-07-06 04:45:10', NULL, NULL, b'0', 1), (3, 633, '[{\"propertyId\": 1, \"propertyName\": \"颜色\", \"valueId\": 7, \"valueName\": \"白色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', 4, 34900, -1, NULL, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 203, NULL, NULL, NULL, NULL, 100, '2023-04-26 12:37:28', '2023-07-06 06:58:17', NULL, NULL, b'0', 1), (10, 101, '[{\"propertyId\": 1, \"proertyName\": \"颜色\", \"valueId\": 5, \"valueName\": \"黑色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', 3, 34900, -1, NULL, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 10, NULL, NULL, NULL, NULL, 17, '2023-04-26 12:37:28', '2023-07-06 04:45:08', NULL, NULL, b'0', 1), (11, 101, '[{\"propertyId\": 1, \"proertyName\": \"颜色\", \"valueId\": 6, \"valueName\": \"蓝色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', 2, 34900, -1, NULL, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 94, NULL, NULL, NULL, NULL, 5, '2023-04-26 12:37:28', '2023-07-06 04:45:06', NULL, NULL, b'0', 1), (12, 101, '[{\"propertyId\": 1, \"proertyName\": \"颜色\", \"valueId\": 7, \"valueName\": \"白色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', 1, 34900, -1, NULL, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 200, NULL, NULL, NULL, NULL, 100, '2023-04-26 12:37:28', '2023-07-06 04:45:05', NULL, NULL, b'0', 1), (13, 109, '[{\"propertyId\": 0, \"propertyName\": \"默认\", \"valueId\": 0, \"valueName\": \"默认\"}]', 100, 200, 300, 'aoteman', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/4a6abcedf41e718bfed8bab975fdc0b7f23bff4c21b7993f008e52e81d4869a5.png', 0, 0, 0, 0, 0, NULL, '2023-06-05 23:30:18', '2023-06-06 14:55:41', '1', 1, b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for product_spu
-- ----------------------------
DROP TABLE IF EXISTS `product_spu`;
CREATE TABLE `product_spu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品 SPU 编号，自增',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `keyword` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关键字',
  `introduction` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品简介',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '商品详情',
  `bar_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '条形码',
  `category_id` bigint NOT NULL COMMENT '商品分类编号',
  `brand_id` int NULL DEFAULT NULL COMMENT '商品品牌编号',
  `pic_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品封面图',
  `slider_pic_urls` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '商品轮播图地址\n 数组，以逗号分隔\n 最多上传15张',
  `video_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品视频',
  `unit` tinyint NOT NULL COMMENT '单位',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序字段',
  `status` tinyint NOT NULL COMMENT '商品状态: 0 上架（开启） 1 下架（禁用）-1 回收',
  `spec_type` bit(1) NULL DEFAULT NULL COMMENT '规格类型：0 单规格 1 多规格',
  `price` int NOT NULL DEFAULT -1 COMMENT '商品价格，单位使用：分',
  `market_price` int NULL DEFAULT NULL COMMENT '市场价，单位使用：分',
  `cost_price` int NOT NULL DEFAULT -1 COMMENT '成本价，单位： 分',
  `stock` int NOT NULL DEFAULT 0 COMMENT '库存',
  `delivery_template_id` bigint NOT NULL COMMENT '物流配置模板编号',
  `recommend_hot` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否热卖推荐: 0 默认 1 热卖',
  `recommend_benefit` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否优惠推荐: 0 默认 1 优选',
  `recommend_best` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否精品推荐: 0 默认 1 精品',
  `recommend_new` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否新品推荐: 0 默认 1 新品',
  `recommend_good` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否优品推荐',
  `give_integral` int NOT NULL DEFAULT 0 COMMENT '赠送积分',
  `give_coupon_template_ids` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '赠送的优惠劵编号的数组',
  `sub_commission_type` bit(1) NULL DEFAULT NULL COMMENT '分销类型',
  `activity_orders` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动显示排序0=默认, 1=秒杀，2=砍价，3=拼团',
  `sales_count` int NULL DEFAULT 0 COMMENT '商品销量',
  `virtual_sales_count` int NULL DEFAULT 0 COMMENT '虚拟销量',
  `browse_count` int NULL DEFAULT 0 COMMENT '商品点击量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 634 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品spu';

-- ----------------------------
-- Records of product_spu
-- ----------------------------
BEGIN;
INSERT INTO `product_spu` (`id`, `name`, `keyword`, `introduction`, `description`, `bar_code`, `category_id`, `brand_id`, `pic_url`, `slider_pic_urls`, `video_url`, `unit`, `sort`, `status`, `spec_type`, `price`, `market_price`, `cost_price`, `stock`, `delivery_template_id`, `recommend_hot`, `recommend_benefit`, `recommend_best`, `recommend_new`, `recommend_good`, `give_integral`, `give_coupon_template_ids`, `sub_commission_type`, `activity_orders`, `sales_count`, `virtual_sales_count`, `browse_count`, `create_time`, `update_time`, `creator`, `updater`, `deleted`, `tenant_id`) VALUES (1, '【潮】Nike Air Jordan aj1 low GS耐克板鞋女子秋季低帮休闲防滑运动耐磨篮球鞋 DC0774-105', NULL, NULL, NULL, NULL, 20, NULL, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/mid_1ee126538975da13beb3496d90eaad90.jpg', '', NULL, 1, 0, 0, NULL, 100, NULL, -1, 10, 0, b'0', b'0', b'0', b'0', b'0', 0, '', NULL, '', 10, 20, 0, '2023-04-26 07:01:29', '2023-05-01 07:56:56', NULL, NULL, b'0', 1), (2, '诺米家居 矿石博览馆系列藤条香氛无火香薰精油卧室助眠除臭', NULL, NULL, NULL, NULL, 19, NULL, 'https://demo26.crmeb.net/uploads/attach/2021/11/20211113/big_3bb9729b7b748b2f297df7bacac2f236.png', '', NULL, 1, 0, 1, NULL, 4500, NULL, -1, 20, 0, b'1', b'0', b'0', b'0', b'0', 0, '', NULL, '[3, 1, 2]', 10, 20, 0, '2023-04-26 07:01:29', '2023-06-22 17:18:01', NULL, NULL, b'0', 1), (101, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', '耳机', '我是快乐的简介', '<p><img style=\"max-width:100%;height:auto;float:left;display:block\" src=\"https://demo26.crmeb.net/uploads/attach/2021/12/20211210/099f261f18576902c4a18209d062a3fd.jpg\"><img style=\"max-width:100%;height:auto;float:left;display:block\" src=\"https://demo26.crmeb.net/uploads/attach/2021/12/20211210/debdb191a4d1bc1bda8a989dbd7afd23.jpg\"><img style=\"max-width:100%;height:auto;float:left;display:block\" src=\"https://demo26.crmeb.net/uploads/attach/2021/12/20211210/ee1618b3334641c707cadbb9e14a5bae.jpg\"><img style=\"max-width:100%;height:auto;float:left;display:block\" src=\"https://demo26.crmeb.net/uploads/attach/2021/12/20211210/1251259c8968cdce993e47dd121b50a7.jpg\"></p>', NULL, 19, NULL, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', '[\n\"https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg\",\n\"https://demo26.crmeb.net/uploads/attach/2021/11/15/7f46e98ece1920e1a4082dfc72bcd72a.jpg\",\n\"https://demo26.crmeb.net/uploads/attach/2021/11/15/bfb275263d02ab081b8670a752f2823f.jpg\",\n\"https://demo26.crmeb.net/uploads/attach/2021/11/15/e499a4dc489cda7b8d472cb3a3b348b7.jpg\",\n\"https://demo26.crmeb.net/uploads/attach/2021/11/15/06fa150a47163e973bb4806a380afaab.jpg\"\n]', NULL, 1, 0, 1, b'1', 29900, 34900, -1, 273, 0, b'0', b'0', b'0', b'0', b'1', 0, '', NULL, '[3, 1, 2]', 30, 40, 0, '2023-04-26 12:29:19', '2023-06-10 07:51:04', NULL, NULL, b'0', 1), (109, '单个 sku 商品', '哈哈哈哈', '111', '<p>123321</p>', 'aoteman', 27, 1, 'http://127.0.0.1:48080/admin-api/infra/file/4/get/93332ead43f162c65f909214971afaa11f44d1739877bceb5102688ac8ad933e.jpg', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/93332ead43f162c65f909214971afaa11f44d1739877bceb5102688ac8ad933e.jpg\",\"http://127.0.0.1:48080/admin-api/infra/file/4/get/a9f677c21d96b364f52aa85017aff793ab056ba973eb9e356b27b676ded4c621.jpg\"]', NULL, 1, 0, 1, b'0', 100, 200, 300, 10, 1, b'0', b'0', b'0', b'0', b'1', 0, '', b'0', '[3, 1, 2]', 0, 0, 0, '2023-06-05 23:30:18', '2023-06-10 07:32:30', '1', '1', b'0', 1), (633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', '耳机', '我是快乐的简介', '<p><img style=\"max-width:100%;height:auto;float:left;display:block\" src=\"https://demo26.crmeb.net/uploads/attach/2021/12/20211210/099f261f18576902c4a18209d062a3fd.jpg\"><img style=\"max-width:100%;height:auto;float:left;display:block\" src=\"https://demo26.crmeb.net/uploads/attach/2021/12/20211210/debdb191a4d1bc1bda8a989dbd7afd23.jpg\"><img style=\"max-width:100%;height:auto;float:left;display:block\" src=\"https://demo26.crmeb.net/uploads/attach/2021/12/20211210/ee1618b3334641c707cadbb9e14a5bae.jpg\"><img style=\"max-width:100%;height:auto;float:left;display:block\" src=\"https://demo26.crmeb.net/uploads/attach/2021/12/20211210/1251259c8968cdce993e47dd121b50a7.jpg\"></p>', NULL, 19, NULL, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', '[\n\"https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg\",\n\"https://demo26.crmeb.net/uploads/attach/2021/11/15/7f46e98ece1920e1a4082dfc72bcd72a.jpg\",\n\"https://demo26.crmeb.net/uploads/attach/2021/11/15/bfb275263d02ab081b8670a752f2823f.jpg\",\n\"https://demo26.crmeb.net/uploads/attach/2021/11/15/e499a4dc489cda7b8d472cb3a3b348b7.jpg\",\n\"https://demo26.crmeb.net/uploads/attach/2021/11/15/06fa150a47163e973bb4806a380afaab.jpg\"\n]', NULL, 1, 0, 1, b'1', 29900, 34900, -1, 309, 0, b'0', b'0', b'0', b'0', b'0', 0, '', NULL, '[2, 1, 3]', 30, 40, 0, '2023-04-26 12:29:19', '2023-07-08 04:32:07', NULL, NULL, b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_coupon
-- ----------------------------
DROP TABLE IF EXISTS `promotion_coupon`;
CREATE TABLE `promotion_coupon`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '优惠劵编号',
  `template_id` bigint NOT NULL COMMENT '优惠劵模板编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '优惠劵名',
  `status` tinyint NOT NULL COMMENT '优惠码状态\n     *\n     * 1-未使用\n     * 2-已使用\n     * 3-已失效',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `take_type` tinyint NOT NULL COMMENT '领取类型\n     *\n     * 1 - 用户主动领取\n     * 2 - 后台自动发放',
  `use_price` int NOT NULL COMMENT '是否设置满多少金额可用，单位：分',
  `valid_start_time` datetime NOT NULL COMMENT '生效开始时间',
  `valid_end_time` datetime NOT NULL COMMENT '生效结束时间',
  `product_scope` tinyint NOT NULL COMMENT '商品范围',
  `product_spu_ids` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品 SPU 编号的数组',
  `discount_type` tinyint NOT NULL COMMENT '折扣类型',
  `discount_percent` tinyint NULL DEFAULT NULL COMMENT '折扣百分比',
  `discount_price` int NULL DEFAULT NULL COMMENT '优惠金额，单位：分',
  `discount_limit_price` int NULL DEFAULT NULL COMMENT '折扣上限',
  `use_order_id` bigint NULL DEFAULT NULL COMMENT '使用订单号',
  `use_time` datetime NULL DEFAULT NULL COMMENT '使用时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠劵';

-- ----------------------------
-- Records of promotion_coupon
-- ----------------------------
BEGIN;
INSERT INTO `promotion_coupon` (`id`, `template_id`, `name`, `status`, `user_id`, `take_type`, `use_price`, `valid_start_time`, `valid_end_time`, `product_scope`, `product_spu_ids`, `discount_type`, `discount_percent`, `discount_price`, `discount_limit_price`, `use_order_id`, `use_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 1, '优惠劵A', 1, 247, 1, 10000, '2019-04-08 00:00:00', '2019-04-10 00:00:00', 0, NULL, 1, NULL, 1000, NULL, 0, '2019-05-17 17:46:30', '', '2022-11-03 00:09:56', '', '2023-06-02 15:47:54', b'0', 1), (2, 1, '优惠劵B', 2, 247, 1, 2, '2019-04-08 00:00:00', '2019-04-10 00:00:00', 0, NULL, 2, 49, 1000, NULL, 0, '2019-05-17 14:21:17', '', '2022-11-03 00:09:56', '', '2022-11-04 18:58:09', b'0', 1), (3, 1, '优惠劵C', 3, 247, 1, 10, '2019-04-08 00:00:00', '2019-04-10 00:00:00', 0, NULL, 1, NULL, 9, NULL, 0, '2019-05-17 17:58:50', '', '2022-11-03 00:09:56', '', '2022-11-04 18:58:12', b'0', 1), (4, 1, '优惠劵A', 1, 247, 1, 1000, '2020-08-20 11:00:00', '2020-08-22 11:00:00', 0, NULL, 1, NULL, 1000, NULL, 0, NULL, '', '2022-11-03 00:09:56', '1', '2022-11-04 21:05:02', b'1', 1), (5, 1, '优惠劵AAA', 1, 247, 1, 1000, '2020-08-22 11:00:00', '2020-08-24 11:00:00', 0, NULL, 1, NULL, 1000, NULL, 0, NULL, '', '2022-11-03 00:09:56', '1', '2022-11-04 20:58:58', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_coupon_template
-- ----------------------------
DROP TABLE IF EXISTS `promotion_coupon_template`;
CREATE TABLE `promotion_coupon_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '模板编号，自增唯一。',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '优惠劵名',
  `status` tinyint NOT NULL COMMENT '状态',
  `total_count` int NOT NULL COMMENT '发放数量, -1 - 则表示不限制',
  `take_limit_count` tinyint NOT NULL COMMENT '每人限领个数, -1 - 则表示不限制',
  `take_type` tinyint NOT NULL COMMENT '领取方式',
  `use_price` int NOT NULL COMMENT '是否设置满多少金额可用，单位：分',
  `product_scope` tinyint NOT NULL COMMENT '商品范围',
  `product_spu_ids` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品 SPU 编号的数组',
  `validity_type` tinyint NOT NULL COMMENT '生效日期类型',
  `valid_start_time` datetime NULL DEFAULT NULL COMMENT '固定日期-生效开始时间',
  `valid_end_time` datetime NULL DEFAULT NULL COMMENT '固定日期-生效结束时间',
  `fixed_start_term` int NULL DEFAULT NULL COMMENT '领取日期-开始天数',
  `fixed_end_term` int NULL DEFAULT NULL COMMENT '领取日期-结束天数',
  `discount_type` int NOT NULL COMMENT '优惠类型\n     *\n     * 1-代金卷\n     * 2-折扣卷',
  `discount_percent` tinyint NULL DEFAULT NULL COMMENT '折扣百分比',
  `discount_price` int NULL DEFAULT NULL COMMENT '优惠金额，单位：分',
  `discount_limit_price` int NULL DEFAULT NULL COMMENT '折扣上限，仅在 {@link #preferentialType} 等于 2 时生效。\n     *\n     * 例如，折扣上限为 20 元，当使用 8 折优惠券，订单金额为 1000 元时，最高只可折扣 20 元，而非 80  元。',
  `take_count` int NOT NULL DEFAULT 0 COMMENT '领取优惠券的数量',
  `use_count` int NOT NULL DEFAULT 0 COMMENT '使用优惠券的次数',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠劵模板';

-- ----------------------------
-- Records of promotion_coupon_template
-- ----------------------------
BEGIN;
INSERT INTO `promotion_coupon_template` (`id`, `name`, `status`, `total_count`, `take_limit_count`, `take_type`, `use_price`, `product_scope`, `product_spu_ids`, `validity_type`, `valid_start_time`, `valid_end_time`, `fixed_start_term`, `fixed_end_term`, `discount_type`, `discount_percent`, `discount_price`, `discount_limit_price`, `take_count`, `use_count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '优惠劵AAA', 0, 100, 10, 2, 1000, 2, '5,2,7,6', 2, NULL, NULL, 1, 2, 2, 90, 1000, 10, 1, 0, '', '2022-10-31 21:12:15', '1', '2022-11-04 21:12:01', b'0', 1), (2, '优惠劵B', 1, 10, 2, 1, 1000, 2, '10', 2, NULL, NULL, 3, 5, 1, NULL, 10000, 10, 0, 0, '', '2022-10-31 21:12:15', '1', '2022-11-02 22:44:18', b'0', 1), (14, '测试一下', 0, 2, 3, 1, 100, 1, '', 1, '2022-11-24 00:00:00', '2022-12-19 23:59:59', NULL, NULL, 1, NULL, 100, NULL, 0, 0, '1', '2022-11-02 22:05:56', '1', '2022-11-02 22:44:12', b'0', 1), (15, '测试下', 0, 1, 2, 1, 300, 1, '', 2, '2022-11-14 00:00:00', '2022-12-22 23:59:59', 1, 3, 2, 10, 400, 0, 0, 0, '1', '2022-11-02 22:12:19', '1', '2022-11-02 22:17:43', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_discount_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_discount_activity`;
CREATE TABLE `promotion_discount_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动标题',
  `status` tinyint NOT NULL DEFAULT -1 COMMENT '活动状态',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '限时折扣活动';

-- ----------------------------
-- Records of promotion_discount_activity
-- ----------------------------
BEGIN;
INSERT INTO `promotion_discount_activity` (`id`, `name`, `status`, `start_time`, `end_time`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (4, '测试活动', 40, '2022-11-25 00:00:00', '2022-12-23 23:59:59', '12345', '1', '2022-11-05 00:54:34', '1', '2022-11-06 12:32:49', b'1', 1), (5, '111', 40, '2022-11-02 00:00:00', '2022-12-13 23:59:59', '', '1', '2022-11-06 00:35:51', '1', '2022-11-06 12:32:45', b'1', 1), (6, '测11', 10, '2022-11-15 00:00:00', '2022-12-29 23:59:59', '测试一下', '1', '2022-11-06 00:41:55', '1', '2022-11-06 00:41:55', b'0', 1), (7, '123', 40, '2022-11-01 00:00:00', '2022-12-20 23:59:59', '', '1', '2022-11-06 00:42:12', '1', '2022-11-06 12:32:36', b'1', 1), (8, '12', 10, '2022-11-09 00:00:00', '2022-12-21 23:59:59', '', '1', '2022-11-06 01:08:07', '1', '2022-11-06 12:36:35', b'0', 1), (9, '测试活动', 20, '2022-11-01 00:00:00', '2022-12-05 23:59:59', '', '1', '2022-11-06 11:48:40', '1', '2022-11-12 17:42:36', b'0', 1), (10, '满减一个商品', 10, '2022-11-08 00:00:00', '2022-11-09 23:59:59', '', '1', '2022-11-06 11:50:58', '1', '2022-11-07 20:24:31', b'0', 1), (11, '323', 10, '2022-12-08 00:00:00', '2023-01-20 23:59:59', '232', '1', '2022-12-04 15:18:05', '1', '2022-12-04 15:18:05', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_discount_product
-- ----------------------------
DROP TABLE IF EXISTS `promotion_discount_product`;
CREATE TABLE `promotion_discount_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，主键自增',
  `activity_id` bigint NOT NULL COMMENT '活动编号',
  `spu_id` bigint NOT NULL DEFAULT -1 COMMENT '商品 SPU 编号',
  `sku_id` bigint NOT NULL COMMENT '商品 SKU 编号',
  `discount_type` int NOT NULL COMMENT '优惠类型\n     *\n     * 1-代金卷\n     * 2-折扣卷',
  `discount_percent` tinyint NULL DEFAULT NULL COMMENT '折扣百分比',
  `discount_price` int NULL DEFAULT NULL COMMENT '优惠金额，单位：分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '限时折扣商品\n';

-- ----------------------------
-- Records of promotion_discount_product
-- ----------------------------
BEGIN;
INSERT INTO `promotion_discount_product` (`id`, `activity_id`, `spu_id`, `sku_id`, `discount_type`, `discount_percent`, `discount_price`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5, 6, 2, 2, 1, NULL, 1322, '1', '2022-11-06 00:41:55', '1', '2022-11-06 00:41:55', b'0', 1), (6, 8, 1, 1, 1, NULL, 0, '1', '2022-11-06 01:08:07', '1', '2022-11-06 01:08:07', b'0', 1), (7, 9, 1, 1, 1, NULL, 0, '1', '2022-11-06 11:48:40', '1', '2022-11-12 17:37:18', b'1', 1), (8, 9, 2, 2, 2, 1, 0, '1', '2022-11-06 11:48:40', '1', '2022-11-12 17:37:18', b'1', 1), (9, 10, 4, 25, 1, NULL, 0, '1', '2022-11-06 11:50:58', '1', '2022-11-06 11:53:40', b'1', 1), (10, 10, 4, 25, 1, 0, 2, '1', '2022-11-06 11:58:49', '1', '2022-11-06 11:59:34', b'1', 1), (11, 10, 4, 25, 1, 0, 100, '1', '2022-11-06 12:04:43', '1', '2022-11-06 11:59:41', b'1', 1), (12, 10, 4, 25, 1, 0, 200, '1', '2022-11-06 12:04:49', '1', '2022-11-06 12:04:49', b'0', 1), (13, 10, 3, 6, 2, 30, NULL, '1', '2022-11-06 12:05:17', '1', '2022-11-06 12:01:15', b'1', 1), (14, 10, 3, 6, 2, 30, 0, '1', '2022-11-06 12:19:56', '1', '2022-11-06 12:19:56', b'0', 1), (15, 10, 2, 4, 1, NULL, 200, '1', '2022-11-06 12:19:56', '1', '2022-11-06 12:14:53', b'1', 1), (16, 10, 2, 4, 1, 0, 299, '1', '2022-11-06 12:20:02', '1', '2022-11-06 12:14:59', b'1', 1), (17, 10, 2, 4, 2, 20, 299, '1', '2022-11-06 12:20:08', '1', '2022-11-06 12:15:24', b'1', 1), (18, 9, 1, 1, 1, 0, 150, '1', '2022-11-12 17:42:36', '1', '2022-11-12 17:42:36', b'0', 1), (19, 9, 2, 2, 2, 15, 0, '1', '2022-11-12 17:42:36', '1', '2022-11-12 17:42:36', b'0', 1), (20, 11, 3, 6, 2, 10, 100, '1', '2022-12-04 15:18:05', '1', '2022-12-04 15:18:05', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_reward_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_reward_activity`;
CREATE TABLE `promotion_reward_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动标题',
  `status` tinyint NOT NULL DEFAULT -1 COMMENT '活动状态',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `condition_type` tinyint NOT NULL DEFAULT -1 COMMENT '条件类型',
  `product_scope` tinyint NOT NULL COMMENT '商品范围',
  `product_spu_ids` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品 SPU 编号的数组',
  `rules` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠规则的数组',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '满减送活动';

-- ----------------------------
-- Records of promotion_reward_activity
-- ----------------------------
BEGIN;
INSERT INTO `promotion_reward_activity` (`id`, `name`, `status`, `start_time`, `end_time`, `remark`, `condition_type`, `product_scope`, `product_spu_ids`, `rules`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (4, '测试活动', 40, '2022-11-25 00:00:00', '2022-12-23 23:59:59', '1234', 10, 2, '1,2', '[{\"limit\":1,\"discountPrice\":10,\"freeDelivery\":true,\"point\":10,\"couponIds\":[10,20],\"couponCounts\":[1,2]},{\"limit\":2,\"discountPrice\":20,\"freeDelivery\":false,\"point\":20,\"couponIds\":[30,40],\"couponCounts\":[3,4]}]', '1', '2022-11-05 00:54:34', '1', '2022-11-05 10:45:40', b'1', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_seckill_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_seckill_activity`;
CREATE TABLE `promotion_seckill_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '秒杀活动编号',
  `spu_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '秒杀活动商品',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '秒杀活动名称',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '活动状态，开启：0 禁用：1',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动开始时间',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动结束时间',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `config_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '秒杀时段 id',
  `order_count` int NOT NULL DEFAULT 0 COMMENT '新增订单数',
  `user_count` int NOT NULL DEFAULT 0 COMMENT '付款人数',
  `total_price` int NOT NULL DEFAULT 0 COMMENT '订单实付金额，单位：分',
  `total_limit_count` int NULL DEFAULT 0 COMMENT '总限购数量',
  `single_limit_count` int NULL DEFAULT 0 COMMENT '单次限够数量',
  `stock` int NULL DEFAULT 0 COMMENT '秒杀库存',
  `total_stock` int NULL DEFAULT 0 COMMENT '秒杀总库存',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀活动';

-- ----------------------------
-- Records of promotion_seckill_activity
-- ----------------------------
BEGIN;
INSERT INTO `promotion_seckill_activity` (`id`, `spu_ids`, `name`, `status`, `remark`, `start_time`, `end_time`, `sort`, `config_ids`, `order_count`, `user_count`, `total_price`, `total_limit_count`, `single_limit_count`, `stock`, `total_stock`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (35, '1,2', '测试秒杀活动1', 0, 'test1', '2022-11-04 00:00:00', '2022-12-08 00:00:00', 1, '26,27,28,29', 0, 0, 0, 0, 0, 0, 0, '1', '2022-12-03 15:26:58', '1', '2022-12-03 15:26:58', b'0', 1), (36, '1,2', '测试秒杀活动2', 10, 'test2', '2022-12-04 00:00:00', '2022-12-09 00:00:00', 2, '27,28', 0, 0, 0, 0, 0, 0, 0, '1', '2022-12-03 15:27:31', '1', '2022-12-03 16:43:26', b'0', 1), (37, '1,2', '测试秒杀活动3', 20, 'test', '2022-12-02 00:00:00', '2022-12-17 00:00:00', 3, '28,29', 0, 0, 0, 0, 0, 0, 0, '1', '2022-12-03 16:44:30', '1', '2022-12-03 16:44:30', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_seckill_config
-- ----------------------------
DROP TABLE IF EXISTS `promotion_seckill_config`;
CREATE TABLE `promotion_seckill_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '秒杀时段名称',
  `start_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开始时间点',
  `end_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '结束时间点',
  `pic_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '秒杀主图',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态，开启：0 禁用：1',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀时段';

-- ----------------------------
-- Records of promotion_seckill_config
-- ----------------------------
BEGIN;
INSERT INTO `promotion_seckill_config` (`id`, `name`, `start_time`, `end_time`, `pic_url`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (26, '上午场', '09:00:00', '11:50:00', 'http://test.yudao.iocoder.cn/e1fdd7271685ec143a0900681606406621717a666ad0b2798b096df41422b32f.png', 0, '1', '2022-11-19 15:36:11', '1', '2022-12-03 16:37:36', b'0', 1), (27, '中午场', '12:00:00', '13:30:00', 'http://test.yudao.iocoder.cn/e1fdd7271685ec143a0900681606406621717a666ad0b2798b096df41422b32f.png', 0, '1', '2022-11-19 15:36:36', '1', '2022-12-03 15:21:41', b'0', 1), (28, '下午场', '17:30:00', '19:00:00', 'http://test.yudao.iocoder.cn/e1fdd7271685ec143a0900681606406621717a666ad0b2798b096df41422b32f.png', 0, '1', '2022-11-19 15:37:23', '1', '2022-12-03 16:38:40', b'0', 1), (29, '晚间场', '21:00:00', '23:00:00', 'http://test.yudao.iocoder.cn/e1fdd7271685ec143a0900681606406621717a666ad0b2798b096df41422b32f.png', 0, '1', '2022-11-19 15:37:53', '1', '2022-12-03 16:38:40', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_seckill_product
-- ----------------------------
DROP TABLE IF EXISTS `promotion_seckill_product`;
CREATE TABLE `promotion_seckill_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '秒杀参与商品编号',
  `activity_id` bigint NOT NULL DEFAULT 0 COMMENT '秒杀活动id',
  `config_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '秒杀时段id',
  `spu_id` bigint NOT NULL DEFAULT 0 COMMENT '商品spu_id',
  `sku_id` bigint NOT NULL DEFAULT 0 COMMENT '商品sku_id',
  `seckill_price` int NOT NULL DEFAULT 0 COMMENT '秒杀金额，单位：分',
  `stock` int NOT NULL DEFAULT 0 COMMENT '秒杀库存',
  `activity_status` tinyint NOT NULL DEFAULT 0 COMMENT '秒杀商品状态',
  `activity_start_time` datetime NOT NULL COMMENT '活动开始时间点',
  `activity_end_time` datetime NOT NULL COMMENT '活动结束时间点',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀参与商品';

-- ----------------------------
-- Records of promotion_seckill_product
-- ----------------------------
BEGIN;
INSERT INTO `promotion_seckill_product` (`id`, `activity_id`, `config_ids`, `spu_id`, `sku_id`, `seckill_price`, `stock`, `activity_status`, `activity_start_time`, `activity_end_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (60, 35, '26,27,28,29', 1, 1, 20000, 5, 0, '2023-06-15 15:26:58', '2023-06-25 15:26:58', '1', '2022-12-03 15:26:58', '1', '2022-12-03 15:26:58', b'0', 1), (61, 35, '26,27,28,29', 2, 2, 30000, 5, 0, '2023-06-15 15:26:58', '2023-06-25 15:26:58', '1', '2022-12-03 15:26:58', '1', '2022-12-03 15:26:58', b'0', 1), (62, 35, '26,27,28,29', 2, 3, 30000, 5, 0, '2023-06-15 15:26:58', '2023-06-25 15:26:58', '1', '2022-12-03 15:26:58', '1', '2022-12-03 15:26:58', b'0', 1), (63, 35, '26,27,28,29', 2, 4, 30000, 5, 0, '2023-06-15 15:26:58', '2023-06-25 15:26:58', '1', '2022-12-03 15:26:58', '1', '2022-12-03 15:26:58', b'0', 1), (64, 1, '27,28,26', 2, 5, 30000, 5, 0, '2023-06-15 15:26:58', '2023-06-25 15:26:58', '1', '2022-12-03 15:27:31', '1', '2022-12-03 16:37:31', b'1', 1), (65, 1, '27,28', 3, 6, 20000, 5, 0, '2023-06-15 15:26:58', '2023-06-25 15:26:58', '1', '2022-12-03 15:27:31', '1', '2022-12-03 16:37:36', b'0', 1), (66, 1, '27,28', 5, 23, 20000, 5, 0, '2023-06-15 15:26:58', '2023-06-25 15:26:58', '1', '2022-12-03 15:27:31', '1', '2022-12-03 16:37:36', b'0', 1), (67, 36, '27,28,26', 6, 24, 40000, 5, 0, '2023-06-15 15:26:58', '2023-06-25 15:26:58', '1', '2022-12-03 15:27:31', '1', '2022-12-03 16:37:31', b'1', 1), (68, 37, '28,29', 4, 25, 30000, 5, 0, '2023-06-15 15:26:58', '2023-06-25 15:26:58', '1', '2022-12-03 16:44:30', '1', '2022-12-03 16:44:30', b'0', 1), (69, 37, '28,29', 8, 28, 10000, 5, 0, '2023-06-15 15:26:58', '2023-06-25 15:26:58', '1', '2022-12-03 16:44:30', '1', '2022-12-03 16:44:30', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_seckill_time
-- ----------------------------
DROP TABLE IF EXISTS `promotion_seckill_time`;
CREATE TABLE `promotion_seckill_time`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '秒杀时段名称',
  `start_time` time NOT NULL COMMENT '开始时间点',
  `end_time` time NOT NULL COMMENT '结束时间点',
  `seckill_activity_count` int NOT NULL DEFAULT 0 COMMENT '秒杀活动数量',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '秒杀时段';

-- ----------------------------
-- Records of promotion_seckill_time
-- ----------------------------
BEGIN;
INSERT INTO `promotion_seckill_time` (`id`, `name`, `start_time`, `end_time`, `seckill_activity_count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (26, '上午场', '09:00:00', '11:50:00', 1, '1', '2022-11-19 15:36:11', '1', '2022-12-03 16:37:36', b'0', 1), (27, '中午场', '12:00:00', '13:30:00', 2, '1', '2022-11-19 15:36:36', '1', '2022-12-03 15:21:41', b'0', 1), (28, '下午场', '17:30:00', '19:00:00', 3, '1', '2022-11-19 15:37:23', '1', '2022-12-03 16:38:40', b'0', 1), (29, '晚间场', '21:00:00', '23:00:00', 2, '1', '2022-11-19 15:37:53', '1', '2022-12-03 16:38:40', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_after_sale
-- ----------------------------
DROP TABLE IF EXISTS `trade_after_sale`;
CREATE TABLE `trade_after_sale`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '售后编号',
  `no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '售后流水号',
  `status` int NOT NULL DEFAULT 0 COMMENT '售后状态',
  `way` tinyint NOT NULL COMMENT '售后方式',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户编号',
  `apply_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '申请原因',
  `apply_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '补充描述',
  `apply_pic_urls` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '补充凭证图片',
  `order_id` bigint UNSIGNED NOT NULL COMMENT '订单编号',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '订单流水号',
  `order_item_Id` bigint UNSIGNED NOT NULL COMMENT '订单项编号',
  `spu_id` bigint UNSIGNED NOT NULL COMMENT '商品 SPU 编号',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '商品 SPU 名称',
  `sku_id` bigint UNSIGNED NOT NULL COMMENT '商品 SKU 编号',
  `properties` json NULL COMMENT '商品属性数组，JSON 格式',
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品图片',
  `count` int NOT NULL COMMENT '购买数量',
  `audit_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审批时间',
  `audit_user_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '审批人',
  `audit_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '审批备注',
  `refund_price` int NOT NULL DEFAULT 0 COMMENT '退款金额，单位：分',
  `pay_refund_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '支付退款编号',
  `refund_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '退款时间',
  `logistics_id` bigint NULL DEFAULT NULL COMMENT '退货物流公司编号',
  `logistics_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '退货物流单号',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '退货时间',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `receive_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '收货备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `type` tinyint NULL DEFAULT NULL COMMENT '售后类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '交易订单明细表';

-- ----------------------------
-- Records of trade_after_sale
-- ----------------------------
BEGIN;
INSERT INTO `trade_after_sale` (`id`, `no`, `status`, `way`, `user_id`, `apply_reason`, `apply_description`, `apply_pic_urls`, `order_id`, `order_no`, `order_item_Id`, `spu_id`, `spu_name`, `sku_id`, `properties`, `pic_url`, `count`, `audit_time`, `audit_user_id`, `audit_reason`, `refund_price`, `pay_refund_id`, `refund_time`, `logistics_id`, `logistics_no`, `delivery_time`, `receive_time`, `receive_reason`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`, `type`) VALUES (1, '20221122', 10, 10, 247, 'biu', 'hhaha', NULL, 12, '2023', 24, 4, 'iphone14 pro\n', 12, '[{\"valueId\": 4, \"propertyId\": 2}]', 'http://test.yudao.iocoder.cn/e1fdd7271685ec143a0900681606406621717a666ad0b2798b096df41422b32f.png', 1, '2022-11-19 20:41:14', NULL, NULL, 20, NULL, '2022-11-19 20:41:14', NULL, NULL, NULL, NULL, NULL, '', '2022-11-19 20:41:14', '', '2022-12-09 00:13:39', b'0', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for trade_after_sale_log
-- ----------------------------
DROP TABLE IF EXISTS `trade_after_sale_log`;
CREATE TABLE `trade_after_sale_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `after_sale_id` bigint NOT NULL COMMENT '售后编号',
  `order_id` bigint UNSIGNED NOT NULL COMMENT '订单编号',
  `order_item_Id` bigint UNSIGNED NOT NULL COMMENT '订单项编号',
  `before_status` tinyint NULL DEFAULT NULL COMMENT '售后状态（之前）',
  `after_status` tinyint NOT NULL COMMENT '售后状态（之后）',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '操作明细',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '交易售后日志';

-- ----------------------------
-- Records of trade_after_sale_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for trade_cart
-- ----------------------------
DROP TABLE IF EXISTS `trade_cart`;
CREATE TABLE `trade_cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，唯一自增。',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `add_status` bit(1) NOT NULL COMMENT '是否添加到购物车',
  `order_status` bit(1) NOT NULL COMMENT '是否提交订单',
  `spu_id` bigint NOT NULL COMMENT '商品 SPU 编号',
  `sku_id` bigint NOT NULL COMMENT '商品 SKU 编号',
  `count` int NOT NULL COMMENT '商品购买数量',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车的商品信息';

-- ----------------------------
-- Records of trade_cart
-- ----------------------------
BEGIN;
INSERT INTO `trade_cart` (`id`, `user_id`, `add_status`, `order_status`, `spu_id`, `sku_id`, `count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (49, 247, b'1', b'0', 102, 1, 7, '247', '2023-05-07 22:14:30', '247', '2023-07-06 16:32:26', b'0', 1), (50, 247, b'1', b'0', 102, 2, 11, '247', '2023-05-10 20:02:21', '247', '2023-06-07 17:34:17', b'0', 1), (51, 247, b'0', b'0', 102, 1, 1, '247', '2023-05-20 14:56:29', '247', '2023-06-07 17:17:03', b'0', 1), (52, 247, b'0', b'0', 102, 3, 1, '247', '2023-06-07 17:24:59', '247', '2023-06-07 17:24:59', b'0', 1), (53, 247, b'0', b'0', 102, 2, 1, '247', '2023-06-07 17:25:37', '247', '2023-06-07 17:25:37', b'0', 1), (54, 247, b'1', b'0', 102, 3, 3, '247', '2023-06-07 17:28:12', '247', '2023-06-07 17:29:43', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_delivery_express
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_express`;
CREATE TABLE `trade_delivery_express`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '快递公司编码',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '快递公司名称',
  `logo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '快递公司 logo',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '快递公司';

-- ----------------------------
-- Records of trade_delivery_express
-- ----------------------------
BEGIN;
INSERT INTO `trade_delivery_express` (`id`, `code`, `name`, `logo`, `sort`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 'STO', '申通快递', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/a9c49e4805e215ef4a1c924136b273f9d44ebf1acf7068b33a00da070f760ce9.png', 1, 0, '1', '2023-05-24 23:30:13', '1', '2023-05-24 23:30:13', b'0', 1), (2, 'SF', '顺丰速运', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/4a6abcedf41e718bfed8bab975fdc0b7f23bff4c21b7993f008e52e81d4869a5.png', 2, 0, '1', '2023-05-24 23:31:54', '1', '2023-05-24 23:31:54', b'0', 1), (3, 'ZTO', '中通快递', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/d99ce879d75ff60a149e50eec85b9f1c745950abbe04e9a074108084f2f613ed.jpg', 3, 0, '1', '2023-05-24 23:32:51', '1', '2023-05-24 23:32:51', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_delivery_express_template
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_express_template`;
CREATE TABLE `trade_delivery_express_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `charge_mode` tinyint NOT NULL COMMENT '配送计费方式',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '快递运费模板';

-- ----------------------------
-- Records of trade_delivery_express_template
-- ----------------------------
BEGIN;
INSERT INTO `trade_delivery_express_template` (`id`, `name`, `charge_mode`, `sort`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '111', 3, 0, '1', '2023-05-24 23:59:25', '1', '2023-05-24 23:59:25', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_delivery_express_template_charge
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_express_template_charge`;
CREATE TABLE `trade_delivery_express_template_charge`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，自增',
  `template_id` bigint NOT NULL COMMENT '快递运费模板编号',
  `area_id` int NOT NULL COMMENT '配送区域 id',
  `charge_mode` tinyint NOT NULL COMMENT '配送计费方式',
  `start_count` double NOT NULL COMMENT '首件数量',
  `start_price` int NOT NULL COMMENT '起步价，单位：分',
  `extra_count` double NOT NULL COMMENT '续件数量',
  `extra_price` int NOT NULL COMMENT '额外价，单位：分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '快递运费模板计费配置';

-- ----------------------------
-- Records of trade_delivery_express_template_charge
-- ----------------------------
BEGIN;
INSERT INTO `trade_delivery_express_template_charge` (`id`, `template_id`, `area_id`, `charge_mode`, `start_count`, `start_price`, `extra_count`, `extra_price`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 1, 120102, 3, 1, 100, 1, 100, '1', '2023-05-24 23:59:25', '1', '2023-05-24 23:59:25', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_delivery_express_template_free
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_express_template_free`;
CREATE TABLE `trade_delivery_express_template_free`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `template_id` bigint NOT NULL COMMENT '快递运费模板编号',
  `area_id` int NOT NULL COMMENT '包邮区域 id',
  `free_price` int NOT NULL COMMENT '包邮金额，单位：分',
  `free_count` int NOT NULL DEFAULT 0 COMMENT '包邮件数,',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '快递运费模板包邮配置';

-- ----------------------------
-- Records of trade_delivery_express_template_free
-- ----------------------------
BEGIN;
INSERT INTO `trade_delivery_express_template_free` (`id`, `template_id`, `area_id`, `free_price`, `free_count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 1, 110101, 100, 1, '1', '2023-05-24 23:59:25', '1', '2023-05-24 23:59:25', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_delivery_pick_up_store
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_pick_up_store`;
CREATE TABLE `trade_delivery_pick_up_store`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店名称',
  `introduction` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '门店简介',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店手机',
  `area_id` int NOT NULL COMMENT '区域编号',
  `detail_address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店详细地址',
  `logo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店 logo',
  `opening_time` time NOT NULL COMMENT '营业开始时间',
  `closing_time` time NOT NULL COMMENT '营业结束时间',
  `latitude` double NOT NULL COMMENT '纬度',
  `longitude` double NOT NULL COMMENT '经度',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '门店状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自提门店';

-- ----------------------------
-- Records of trade_delivery_pick_up_store
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for trade_order
-- ----------------------------
DROP TABLE IF EXISTS `trade_order`;
CREATE TABLE `trade_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '订单流水号',
  `type` int NOT NULL DEFAULT 0 COMMENT '订单类型',
  `terminal` int NOT NULL COMMENT '订单来源终端',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户编号',
  `user_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户 IP',
  `user_remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户备注',
  `status` int NOT NULL DEFAULT 0 COMMENT '订单状态',
  `product_count` int NOT NULL COMMENT '购买的商品数量',
  `cancel_type` int NULL DEFAULT NULL COMMENT '取消类型',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商家备注',
  `comment_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否评价',
  `pay_order_id` bigint NULL DEFAULT NULL COMMENT '支付订单编号',
  `pay_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已支付：[0:未支付 1:已经支付过]',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '订单支付时间',
  `pay_channel_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '支付成功的支付渠道',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '订单完成时间',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '订单取消时间',
  `total_price` int NOT NULL DEFAULT 0 COMMENT '商品原价（总），单位：分',
  `discount_price` int NOT NULL DEFAULT 0 COMMENT '订单优惠（总），单位：分',
  `delivery_price` int NOT NULL DEFAULT 0 COMMENT '运费金额，单位：分',
  `adjust_price` int NOT NULL DEFAULT 0 COMMENT '订单调价（总），单位：分',
  `pay_price` int NOT NULL DEFAULT 0 COMMENT '应付金额（总），单位：分',
  `delivery_type` tinyint NOT NULL COMMENT '配送类型',
  `logistics_id` bigint NULL DEFAULT NULL COMMENT '发货物流公司编号',
  `logistics_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '物流公司单号',
  `delivery_status` tinyint NOT NULL DEFAULT 0 COMMENT '发货状态',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `receiver_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件人名称',
  `receiver_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件人手机',
  `receiver_area_id` int NOT NULL COMMENT '收件人地区编号',
  `receiver_detail_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件人详细地址',
  `pick_up_store_id` tinyint NULL DEFAULT NULL COMMENT '自提门店编号',
  `refund_status` tinyint NOT NULL DEFAULT 0 COMMENT '售后状态',
  `refund_price` int NOT NULL DEFAULT 0 COMMENT '退款金额，单位：分',
  `coupon_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '优惠劵编号',
  `coupon_price` int NOT NULL DEFAULT 0 COMMENT '优惠劵减免金额，单位：分',
  `point_price` int NOT NULL DEFAULT 0 COMMENT '积分抵扣的金额',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '交易订单表';

-- ----------------------------
-- Records of trade_order
-- ----------------------------
BEGIN;
INSERT INTO `trade_order` (`id`, `no`, `type`, `terminal`, `user_id`, `user_ip`, `user_remark`, `status`, `product_count`, `cancel_type`, `remark`, `comment_status`, `pay_order_id`, `pay_status`, `pay_time`, `pay_channel_code`, `finish_time`, `cancel_time`, `total_price`, `discount_price`, `delivery_price`, `adjust_price`, `pay_price`, `delivery_type`, `logistics_id`, `logistics_no`, `delivery_status`, `delivery_time`, `receive_time`, `receiver_name`, `receiver_mobile`, `receiver_area_id`, `receiver_detail_address`, `pick_up_store_id`, `refund_status`, `refund_price`, `coupon_id`, `coupon_price`, `point_price`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (21, '1595061082189692928', 1, 10, 247, '127.0.0.1', '我是备注', 30, 1, NULL, NULL, b'1', NULL, b'1', NULL, 'wx_pub', NULL, NULL, 200, 0, 0, 0, 200, 0, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 610632, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2022-11-22 22:26:11', '247', '2023-05-20 03:24:05', b'0', 1), (23, '1595067235174912000', 2, 11, 247, '127.0.0.1', '我是备注', 0, 1, NULL, NULL, b'0', 125, b'1', NULL, NULL, NULL, NULL, 200, 0, 0, 0, 200, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 610632, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2022-11-22 22:50:38', '247', '2023-05-21 04:10:26', b'0', 1), (24, '1595061082189692928', 3, 10, 248, '127.0.0.1', '我是备注', 30, 1, NULL, NULL, b'0', NULL, b'0', NULL, 'wx_pub', NULL, NULL, 200, 0, 0, 0, 200, 0, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 610632, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '248', '2022-12-13 22:26:11', '248', '2023-05-20 03:04:59', b'0', 1), (25, '1595067235174912000', 4, 11, 248, '127.0.0.1', '我是备注', 30, 1, NULL, NULL, b'0', 125, b'0', NULL, NULL, NULL, NULL, 200, 0, 0, 0, 200, 0, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 610632, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '248', '2022-12-13 22:50:38', '248', '2023-05-20 03:05:00', b'0', 1), (29, '1664802570730221568', 0, 20, 247, '127.0.0.1', '我是备注', 0, 2, NULL, NULL, b'0', 172, b'0', NULL, NULL, NULL, NULL, 59800, 0, 0, 0, 59800, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 610632, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-06-03 09:13:58', '247', '2023-06-03 09:13:58', b'0', 1), (30, '1674807288407797760', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 173, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-06-30 23:49:09', '247', '2023-06-30 23:49:09', b'0', 1), (31, '1674814720739651584', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 174, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 2, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', 1, 0, 0, NULL, 0, 0, '247', '2023-07-01 00:18:41', '247', '2023-07-01 16:49:00', b'0', 1), (32, '1676241314821955584', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 175, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-04 22:47:27', '247', '2023-07-04 22:47:27', b'0', 1), (33, '1676248641276993536', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 176, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-04 23:16:34', '247', '2023-07-04 23:16:34', b'0', 1), (34, '1676248922656071680', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 177, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-04 23:17:41', '247', '2023-07-04 23:17:41', b'0', 1), (35, '1676254908489916416', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 178, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-04 23:41:28', '247', '2023-07-04 23:41:28', b'0', 1), (36, '1676610322305904640', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 179, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-05 23:13:45', '247', '2023-07-05 23:13:46', b'0', 1), (37, '1676790423029760000', 0, 20, 247, '39.144.104.107', NULL, 0, 1, NULL, NULL, b'0', 180, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 11:09:25', '247', '2023-07-06 11:09:25', b'0', 1), (38, '1676796859214413824', 0, 20, 247, '39.144.104.107', NULL, 0, 1, NULL, NULL, b'0', 181, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 11:34:59', '247', '2023-07-06 11:34:59', b'0', 1), (39, '1676813795272900608', 0, 20, 247, '39.144.105.28', NULL, 0, 1, NULL, NULL, b'0', 182, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 12:42:17', '247', '2023-07-06 12:42:17', b'0', 1), (40, '1676814319435071488', 0, 20, 247, '39.144.105.28', NULL, 0, 1, NULL, NULL, b'0', 183, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 12:44:22', '247', '2023-07-06 12:44:22', b'0', 1), (41, '1676814748415901696', 0, 20, 247, '39.144.105.28', NULL, 0, 1, NULL, NULL, b'0', 184, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 12:46:04', '247', '2023-07-06 12:46:04', b'0', 1), (42, '1676842791880556544', 0, 20, 247, '39.144.105.120', NULL, 0, 1, NULL, NULL, b'0', 185, b'0', NULL, NULL, NULL, NULL, 4, 0, 0, 0, 4, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 14:37:30', '247', '2023-07-06 14:37:31', b'0', 1), (43, '1676843246601830400', 0, 20, 247, '39.144.105.120', NULL, 0, 1, NULL, NULL, b'0', 186, b'0', NULL, NULL, NULL, NULL, 4, 0, 0, 0, 4, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 14:39:19', '247', '2023-07-06 14:39:19', b'0', 1), (44, '1676848021946957824', 0, 20, 247, '39.144.105.120', NULL, 0, 1, NULL, NULL, b'0', 187, b'0', NULL, NULL, NULL, NULL, 4, 0, 0, 0, 4, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 14:58:17', '247', '2023-07-06 14:58:18', b'0', 1), (45, '1676871394747936768', 0, 20, 247, '39.144.105.120', NULL, 0, 1, NULL, NULL, b'0', 188, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 16:31:10', '247', '2023-07-06 16:31:10', b'0', 1), (46, '1676871891588411392', 0, 20, 247, '39.144.105.120', NULL, 0, 1, NULL, NULL, b'0', 189, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 16:33:08', '247', '2023-07-06 16:33:08', b'0', 1), (47, '1676878232700792832', 0, 20, 247, '39.144.104.41', NULL, 0, 1, NULL, NULL, b'0', 190, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 16:58:20', '247', '2023-07-06 16:58:20', b'0', 1), (48, '1676880606890766336', 0, 20, 247, '39.144.104.41', NULL, 0, 1, NULL, NULL, b'0', 191, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 17:07:46', '247', '2023-07-06 17:07:46', b'0', 1), (49, '1676883084608745472', 0, 20, 247, '39.144.104.41', NULL, 0, 1, NULL, NULL, b'0', 192, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 17:17:37', '247', '2023-07-06 17:17:37', b'0', 1), (50, '1676919023997497344', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 193, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 19:40:26', '247', '2023-07-06 19:40:26', b'0', 1), (51, '1676919030054072320', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 194, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 19:40:27', '247', '2023-07-06 19:40:27', b'0', 1), (52, '1676922590019923968', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 195, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 19:54:36', '247', '2023-07-06 19:54:36', b'0', 1), (53, '1676925756664918016', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 196, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 20:07:11', '247', '2023-07-06 20:07:11', b'0', 1), (54, '1676926752342355968', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 197, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 20:11:08', '247', '2023-07-06 20:11:08', b'0', 1), (55, '1676928765545361408', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 198, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 20:19:08', '247', '2023-07-06 20:19:08', b'0', 1), (56, '1676933108956868608', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 199, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 20:36:24', '247', '2023-07-06 20:36:24', b'0', 1), (57, '1676937622568992768', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 200, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 20:54:20', '247', '2023-07-06 20:54:20', b'0', 1), (58, '1676974528767057920', 0, 20, 247, '114.86.74.143', NULL, 0, 1, NULL, NULL, b'0', 201, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 23:20:59', '247', '2023-07-06 23:20:59', b'0', 1), (59, '1676974985623232512', 0, 20, 247, '114.86.74.143', NULL, 0, 1, NULL, NULL, b'0', 202, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 23:22:48', '247', '2023-07-06 23:22:48', b'0', 1), (60, '1677531936589414400', 0, 20, 247, '114.86.74.143', NULL, 0, 1, NULL, NULL, b'0', 203, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-08 12:15:55', '247', '2023-07-08 12:15:56', b'0', 1), (61, '1677534566103449600', 0, 20, 247, '114.86.74.143', NULL, 0, 1, NULL, NULL, b'0', 204, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-08 12:26:22', '247', '2023-07-08 12:26:22', b'0', 1), (62, '1677535579870920704', 0, 20, 247, '114.86.74.143', NULL, 0, 1, NULL, NULL, b'0', 205, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-08 12:30:24', '247', '2023-07-08 12:30:24', b'0', 1), (63, '1677536015713632256', 0, 20, 247, '114.86.74.143', NULL, 0, 1, NULL, NULL, b'0', 206, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-08 12:32:08', '247', '2023-07-08 12:32:08', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_order_item
-- ----------------------------
DROP TABLE IF EXISTS `trade_order_item`;
CREATE TABLE `trade_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单项编号',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户编号',
  `order_id` bigint UNSIGNED NOT NULL COMMENT '订单编号',
  `cart_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '购物车项编号',
  `spu_id` bigint UNSIGNED NOT NULL COMMENT '商品 SPU 编号',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '商品 SPU 名称',
  `sku_id` bigint UNSIGNED NOT NULL COMMENT '商品 SKU 编号',
  `properties` json NULL COMMENT '商品属性数组，JSON 格式',
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品图片',
  `count` int NOT NULL COMMENT '购买数量',
  `comment_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否评价',
  `price` int NOT NULL DEFAULT 0 COMMENT '商品原价（单），单位：分',
  `discount_price` int NOT NULL DEFAULT 0 COMMENT '商品级优惠（总），单位：分',
  `delivery_price` int NOT NULL DEFAULT 0 COMMENT '运费金额，单位：分',
  `adjust_price` int NOT NULL DEFAULT 0 COMMENT '订单调价（总），单位：分',
  `pay_price` int NOT NULL DEFAULT 0 COMMENT '子订单实付金额（总），不算主订单分摊金额，单位：分',
  `coupon_price` int NOT NULL DEFAULT 0 COMMENT '优惠劵减免金额，单位：分',
  `point_price` int NOT NULL DEFAULT 0 COMMENT '积分抵扣的金额',
  `after_sale_status` int NOT NULL DEFAULT 0 COMMENT '售后状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '交易订单明细表';

-- ----------------------------
-- Records of trade_order_item
-- ----------------------------
BEGIN;
INSERT INTO `trade_order_item` (`id`, `user_id`, `order_id`, `cart_id`, `spu_id`, `spu_name`, `sku_id`, `properties`, `pic_url`, `count`, `comment_status`, `price`, `discount_price`, `delivery_price`, `adjust_price`, `pay_price`, `coupon_price`, `point_price`, `after_sale_status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 247, 21, 0, 10, '好利来', 29, '[{\"valueId\": 3, \"propertyId\": 2}]', 'https://cdn.pixabay.com/photo/2022/11/18/14/00/christmas-tree-7600201_640.jpg', 1, b'1', 200, 0, 0, 0, 200, 0, 0, 0, '247', '2022-11-22 22:26:15', '247', '2023-05-19 11:41:34', b'0', 1), (2, 247, 21, 0, 10, '好利来（测试）', 29, '[{\"valueId\": 3, \"propertyId\": 2}]', 'https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830_1280.jpg', 1, b'0', 200, 0, 0, 0, 200, 0, 0, 0, '247', '2022-11-22 22:26:15', '247', '2022-12-10 11:16:44', b'0', 1), (3, 247, 23, 0, 10, '好利来', 29, '[{\"valueId\": 4, \"propertyId\": 2}]', 'https://cdn.pixabay.com/photo/2022/12/06/06/21/lavender-7638368_1280.jpg', 1, b'0', 200, 0, 0, 0, 200, 0, 0, 0, '247', '2022-11-22 22:50:39', '247', '2023-05-21 04:18:11', b'0', 1), (4, 248, 24, 0, 10, '好利来', 29, '[{\"valueId\": 3, \"propertyId\": 2}]', 'https://cdn.pixabay.com/photo/2022/11/18/14/00/christmas-tree-7600201_640.jpg', 1, b'0', 200, 0, 0, 0, 200, 0, 0, 0, '248', '2022-11-22 22:26:15', '248', '2022-12-13 17:50:27', b'0', 1), (5, 248, 24, 0, 10, '好利来（测试）', 29, '[{\"valueId\": 3, \"propertyId\": 2}]', 'https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830_1280.jpg', 1, b'0', 200, 0, 0, 0, 200, 0, 0, 0, '248', '2022-11-22 22:26:15', '248', '2022-12-13 17:50:31', b'0', 1), (6, 248, 25, 0, 10, '好利来', 29, '[{\"valueId\": 4, \"propertyId\": 2}]', 'https://cdn.pixabay.com/photo/2022/12/06/06/21/lavender-7638368_1280.jpg', 1, b'0', 200, 0, 0, 0, 200, 0, 0, 0, '248', '2022-11-22 22:50:39', '248', '2022-12-13 17:50:34', b'0', 1), (9, 247, 29, NULL, 102, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": null}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 2, b'0', 29900, 0, 0, 0, 59800, 0, 0, 0, '247', '2023-06-03 09:13:58', '247', '2023-06-03 09:13:58', b'0', 1), (10, 247, 30, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, 0, '247', '2023-06-30 23:49:09', '247', '2023-06-30 23:49:09', b'0', 1), (11, 247, 31, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, 0, '247', '2023-07-01 00:18:41', '247', '2023-07-01 00:18:41', b'0', 1), (12, 247, 32, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, 0, '247', '2023-07-04 22:47:27', '247', '2023-07-04 22:47:27', b'0', 1), (13, 247, 33, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, 0, '247', '2023-07-04 23:16:34', '247', '2023-07-04 23:16:34', b'0', 1), (14, 247, 34, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, 0, '247', '2023-07-04 23:17:41', '247', '2023-07-04 23:17:41', b'0', 1), (15, 247, 35, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, 0, '247', '2023-07-04 23:41:28', '247', '2023-07-04 23:41:28', b'0', 1), (16, 247, 36, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, 0, '247', '2023-07-05 23:13:45', '247', '2023-07-05 23:13:45', b'0', 1), (17, 247, 37, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, 0, '247', '2023-07-06 11:09:25', '247', '2023-07-06 11:09:25', b'0', 1), (18, 247, 38, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, 0, '247', '2023-07-06 11:34:59', '247', '2023-07-06 11:34:59', b'0', 1), (19, 247, 39, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, 0, '247', '2023-07-06 12:42:17', '247', '2023-07-06 12:42:17', b'0', 1), (20, 247, 40, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, 0, '247', '2023-07-06 12:44:22', '247', '2023-07-06 12:44:22', b'0', 1), (21, 247, 41, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 12:46:04', '247', '2023-07-06 12:46:04', b'0', 1), (22, 247, 42, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 3, '[{\"valueId\": 7, \"valueName\": \"白色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 4, 0, 0, 0, 4, 0, 0, 0, '247', '2023-07-06 14:37:31', '247', '2023-07-06 14:37:31', b'0', 1), (23, 247, 43, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 3, '[{\"valueId\": 7, \"valueName\": \"白色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 4, 0, 0, 0, 4, 0, 0, 0, '247', '2023-07-06 14:39:19', '247', '2023-07-06 14:39:19', b'0', 1), (24, 247, 44, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 3, '[{\"valueId\": 7, \"valueName\": \"白色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 4, 0, 0, 0, 4, 0, 0, 0, '247', '2023-07-06 14:58:17', '247', '2023-07-06 14:58:17', b'0', 1), (25, 247, 45, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 16:31:10', '247', '2023-07-06 16:31:10', b'0', 1), (26, 247, 46, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 16:33:08', '247', '2023-07-06 16:33:08', b'0', 1), (27, 247, 47, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 16:58:20', '247', '2023-07-06 16:58:20', b'0', 1), (28, 247, 48, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 17:07:46', '247', '2023-07-06 17:07:46', b'0', 1), (29, 247, 49, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 17:17:37', '247', '2023-07-06 17:17:37', b'0', 1), (30, 247, 50, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 19:40:26', '247', '2023-07-06 19:40:26', b'0', 1), (31, 247, 51, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 19:40:27', '247', '2023-07-06 19:40:27', b'0', 1), (32, 247, 52, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 19:54:36', '247', '2023-07-06 19:54:36', b'0', 1), (33, 247, 53, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 20:07:11', '247', '2023-07-06 20:07:11', b'0', 1), (34, 247, 54, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 20:11:08', '247', '2023-07-06 20:11:08', b'0', 1), (35, 247, 55, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 20:19:08', '247', '2023-07-06 20:19:08', b'0', 1), (36, 247, 56, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 20:36:24', '247', '2023-07-06 20:36:24', b'0', 1), (37, 247, 57, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 20:54:20', '247', '2023-07-06 20:54:20', b'0', 1), (38, 247, 58, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 23:20:59', '247', '2023-07-06 23:20:59', b'0', 1), (39, 247, 59, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-06 23:22:48', '247', '2023-07-06 23:22:48', b'0', 1), (40, 247, 60, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-08 12:15:55', '247', '2023-07-08 12:15:55', b'0', 1), (41, 247, 61, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-08 12:26:22', '247', '2023-07-08 12:26:22', b'0', 1), (42, 247, 62, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-08 12:30:24', '247', '2023-07-08 12:30:24', b'0', 1), (43, 247, 63, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 0, '247', '2023-07-08 12:32:08', '247', '2023-07-08 12:32:08', b'0', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
