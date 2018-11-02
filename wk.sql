/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : wk

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 02/11/2018 11:34:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wk_account
-- ----------------------------
DROP TABLE IF EXISTS `wk_account`;
CREATE TABLE `wk_account`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资金账户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_account
-- ----------------------------
INSERT INTO `wk_account` VALUES ('fjwoafjoweij', 'fiewjf', 'jfwiejf', 'jioji', 'o', 'ioj', 'oij', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'jio');

-- ----------------------------
-- Table structure for wk_bank
-- ----------------------------
DROP TABLE IF EXISTS `wk_bank`;
CREATE TABLE `wk_bank`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行简称',
  `seg` int(10) NULL DEFAULT NULL COMMENT '排序值',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '银行列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_bank
-- ----------------------------
INSERT INTO `wk_bank` VALUES ('aaaa', '农业银行', '农行', 1, NULL);
INSERT INTO `wk_bank` VALUES ('fawffawefaewfewa', '中国银行', '中行', 1, NULL);
INSERT INTO `wk_bank` VALUES ('jfowejfi', '工商银行', '工行', 1, NULL);
INSERT INTO `wk_bank` VALUES ('ofiwaefowofo', '建设银行', '建行', 1, NULL);

-- ----------------------------
-- Table structure for wk_card
-- ----------------------------
DROP TABLE IF EXISTS `wk_card`;
CREATE TABLE `wk_card`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户ID',
  `self` int(1) NULL DEFAULT NULL COMMENT '是否客户自己的卡。1为是，其它为否',
  `card_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_number` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_date` int(11) NULL DEFAULT NULL,
  `replay_date` int(11) NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `bill` decimal(10, 2) NULL DEFAULT NULL,
  `replay_rate` decimal(3, 2) NULL DEFAULT NULL,
  `mini_fee` decimal(10, 2) NULL DEFAULT NULL,
  `cash_rate` decimal(3, 2) NULL DEFAULT NULL,
  `income` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户信用卡信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_card
-- ----------------------------
INSERT INTO `wk_card` VALUES ('22b4f34e-827b-4dd0-af0d-15f7151b1dec', 'c2896645-ab6e-4813-88d6-662968edbe8b', 1, '中行', '张三', '165156', '1651', '中国银行', '515641561', '132', 5, 15, 50000.00, 20000.00, 0.02, 20.00, 0.06, 1, '161 51 51 561 6 ', 2, '2018-11-02 08:41:45', '2018-11-02 08:41:45', NULL);
INSERT INTO `wk_card` VALUES ('9d9091c7-58bc-40e4-8b3b-84863d41ef79', 'c2896645-ab6e-4813-88d6-662968edbe8b', 1, '中行', '张三', '156156', '1561', '农业银行', '651', '516', 156, 165, 15000.00, 5000.00, 0.03, 20.00, 0.06, 1, 'awf \n \ne地\n脸', 2, '2018-11-02 11:21:37', NULL, NULL);
INSERT INTO `wk_card` VALUES ('abe58281-b616-463e-b820-14db053c7d99', 'c2896645-ab6e-4813-88d6-662968edbe8b', 2, '中行', '张三', '156156', '1561', '中国银行', '651', '516', 156, 165, 15000.00, 5000.00, 0.03, 20.00, 0.06, 1, 'awf \n \ne地\n脸', 2, '2018-11-02 08:43:02', '2018-11-02 08:43:02', NULL);
INSERT INTO `wk_card` VALUES ('fde56175-6d9a-4804-9b1e-ce31597809bd', 'c2896645-ab6e-4813-88d6-662968edbe8b', 1, '中行', '张三', '16545615', '165156', '中国银行', '4165515', '15', 15, 15, 51515.00, 1510.00, 0.03, 30.00, 0.60, 1, '216 1256 165 156 ', 1, '2018-11-02 08:38:26', '2018-11-02 08:38:26', NULL);

-- ----------------------------
-- Table structure for wk_customer
-- ----------------------------
DROP TABLE IF EXISTS `wk_customer`;
CREATE TABLE `wk_customer`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_number` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `worker_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `font_img` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `after_img` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `home_img` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_customer
-- ----------------------------
INSERT INTO `wk_customer` VALUES ('', NULL, '1', '1', '1', '11', '1', '1', '1', 1, '2018-11-01 08:45:09', '2018-11-01 08:45:11', NULL);
INSERT INTO `wk_customer` VALUES ('c2896645-ab6e-4813-88d6-662968edbe8b', 'xxxx', '16165', '131656', '3deb04b6-6690-46fe-9f6a-90406055955e', '05f85c8d-9625-495d-9042-04fd924585d5/77272e6f-abe3-4e90-9b1e-bc699a4702e0.jpg', '05f85c8d-9625-495d-9042-04fd924585d5/dbd10184-8138-41f0-a49c-0f09b7d59f06.jpg', '05f85c8d-9625-495d-9042-04fd924585d5/83e2d06c-be61-4a18-84e7-dcad8f9279d8.jpg', 'ffewefwafew', 2, '2018-11-01 07:17:52', '2018-11-01 07:17:52', NULL);

-- ----------------------------
-- Table structure for wk_model
-- ----------------------------
DROP TABLE IF EXISTS `wk_model`;
CREATE TABLE `wk_model`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标类名',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作模块表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_model
-- ----------------------------
INSERT INTO `wk_model` VALUES ('1', '1', NULL, '1', 1, '2018-10-31 00:10:38', '2018-10-31 00:10:42', '1');
INSERT INTO `wk_model` VALUES ('20454919-0bd3-465a-abde-eab630537f7d', '组织模块', NULL, '组织管理', 1, '2018-10-30 21:09:11', '2018-10-30 21:09:11', NULL);
INSERT INTO `wk_model` VALUES ('5b53f687-8c4f-4f9a-b9cd-d7c985658208', '葡萄牙', NULL, '零用地废物', 2, '2018-10-30 08:56:29', '2018-10-30 08:56:29', NULL);
INSERT INTO `wk_model` VALUES ('c0755d36-1cb6-4b6a-afcf-a7dac5aef4e7', '访问列表', NULL, 'fafew fwef ef we', 1, '2018-10-31 09:05:18', '2018-10-31 09:05:18', NULL);

-- ----------------------------
-- Table structure for wk_opt_type
-- ----------------------------
DROP TABLE IF EXISTS `wk_opt_type`;
CREATE TABLE `wk_opt_type`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作类型表,\r\n\r\n还款\r\n消费\r\n取现刷卡\r\n取现转账\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_opt_type
-- ----------------------------
INSERT INTO `wk_opt_type` VALUES ('1', '1', '1', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for wk_order
-- ----------------------------
DROP TABLE IF EXISTS `wk_order`;
CREATE TABLE `wk_order`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `rate` decimal(3, 2) NULL DEFAULT NULL,
  `fee` decimal(10, 2) NULL DEFAULT NULL,
  `discount` decimal(10, 2) NULL DEFAULT NULL,
  `real_fee` decimal(10, 2) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_order
-- ----------------------------
INSERT INTO `wk_order` VALUES ('1', '1', 1, 1.00, 1.00, 1.00, 1.00, 1.00, 1, '1', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for wk_order_export
-- ----------------------------
DROP TABLE IF EXISTS `wk_order_export`;
CREATE TABLE `wk_order_export`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` decimal(3, 2) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `rate` decimal(3, 2) NULL DEFAULT NULL,
  `fee` decimal(10, 2) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单出账表,帮客户还款细节' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wk_order_import
-- ----------------------------
DROP TABLE IF EXISTS `wk_order_import`;
CREATE TABLE `wk_order_import`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` decimal(3, 2) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `rate` decimal(3, 2) NULL DEFAULT NULL,
  `fee` decimal(10, 2) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单入账表,客户归还款细节' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wk_order_type
-- ----------------------------
DROP TABLE IF EXISTS `wk_order_type`;
CREATE TABLE `wk_order_type`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_order_type
-- ----------------------------
INSERT INTO `wk_order_type` VALUES ('1', '1', '1', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for wk_org
-- ----------------------------
DROP TABLE IF EXISTS `wk_org`;
CREATE TABLE `wk_org`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parents` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织结构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_org
-- ----------------------------
INSERT INTO `wk_org` VALUES ('1', '总公司1', '0', '0', 'jfweoifjewiof', 1, '2018-10-16 23:02:18', '2018-10-16 23:02:18', '8f269ec7-6ad4-48cc-a6d8-42a9d94ccd23');
INSERT INTO `wk_org` VALUES ('2', '一级分公司1', '0,1', '1', '12', 1, '2018-10-23 01:12:03', '2018-10-23 01:12:03', '8f269ec7-6ad4-48cc-a6d8-42a9d94ccd23');
INSERT INTO `wk_org` VALUES ('3', '一级分公司2', '0,1', '1', '12', 1, '2018-10-24 00:38:47', '2018-10-24 00:38:47', '8f269ec7-6ad4-48cc-a6d8-42a9d94ccd23');
INSERT INTO `wk_org` VALUES ('4', '总公司2', '0', '0', '12', 1, '2018-10-23 23:51:26', '2018-10-23 23:51:26', '8f269ec7-6ad4-48cc-a6d8-42a9d94ccd23');
INSERT INTO `wk_org` VALUES ('5', '一级分公司21', '0,4', '4', '12', 1, '2018-10-24 22:24:25', '2018-10-24 22:24:25', '8f269ec7-6ad4-48cc-a6d8-42a9d94ccd23');
INSERT INTO `wk_org` VALUES ('5a23a6d9-6d6b-4a1e-9785-a57677bb44bf', '二级分公司', '0,1,3', '3', '工地', 1, '2018-10-28 20:26:00', '2018-10-28 20:26:00', NULL);
INSERT INTO `wk_org` VALUES ('6', '一级分公司22', '0,4', '4', '12', 1, '2018-10-24 22:29:05', '2018-10-24 22:29:05', '8f269ec7-6ad4-48cc-a6d8-42a9d94ccd23');

-- ----------------------------
-- Table structure for wk_permission
-- ----------------------------
DROP TABLE IF EXISTS `wk_permission`;
CREATE TABLE `wk_permission`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `opt_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型：click | view | page',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_permission
-- ----------------------------
INSERT INTO `wk_permission` VALUES ('1', '1', '1', '1', 'page', '1', 1, '2018-10-31 00:11:34', '2018-10-31 00:11:31', '1');
INSERT INTO `wk_permission` VALUES ('2', '20454919-0bd3-465a-abde-eab630537f7d', 'q', '1', 'page', '1', 1, '2018-10-31 00:11:25', '2018-10-31 00:11:28', '1');
INSERT INTO `wk_permission` VALUES ('3', '20454919-0bd3-465a-abde-eab630537f7d', 'hih', 'hiuhiu', 'click', 'huihu', 2, '2018-10-31 00:11:56', '2018-10-31 00:11:59', '1');

-- ----------------------------
-- Table structure for wk_pos
-- ----------------------------
DROP TABLE IF EXISTS `wk_pos`;
CREATE TABLE `wk_pos`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `import_user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'POS机信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_pos
-- ----------------------------
INSERT INTO `wk_pos` VALUES ('1', '1', '1', '1', '1', '1', '1', 1, '2018-11-01 09:04:58', '2018-11-01 09:05:02', '1');
INSERT INTO `wk_pos` VALUES ('92e4bfed-83f6-44fe-a1e2-19853d7ed967', 'fwafewe', 'fewaf', 'fewfwea', 'fewaf', '0.3', 'fewafewafewa', 1, '2018-11-01 09:04:18', '2018-11-01 09:04:18', NULL);

-- ----------------------------
-- Table structure for wk_rate
-- ----------------------------
DROP TABLE IF EXISTS `wk_rate`;
CREATE TABLE `wk_rate`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rate` decimal(3, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '费率表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_rate
-- ----------------------------
INSERT INTO `wk_rate` VALUES ('1', 1.00, '1', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for wk_role
-- ----------------------------
DROP TABLE IF EXISTS `wk_role`;
CREATE TABLE `wk_role`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_role
-- ----------------------------
INSERT INTO `wk_role` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'bnbbb', 'fawfew fawfe fefa e', 2, '2018-10-28 11:10:08', '2018-10-28 11:10:08', NULL);
INSERT INTO `wk_role` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', '老板', '投资人', 1, '2018-10-28 08:16:02', '2018-10-28 08:16:02', NULL);

-- ----------------------------
-- Table structure for wk_role_permision
-- ----------------------------
DROP TABLE IF EXISTS `wk_role_permision`;
CREATE TABLE `wk_role_permision`  (
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permision_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限关联表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wk_worker
-- ----------------------------
DROP TABLE IF EXISTS `wk_worker`;
CREATE TABLE `wk_worker`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `org_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_number` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weixin` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `font_img` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `after_img` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `home_img` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_worker
-- ----------------------------
INSERT INTO `wk_worker` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, '2018-10-28 20:53:33', '2018-10-28 20:53:37', '1');
INSERT INTO `wk_worker` VALUES ('1cc7901a-c73e-4ff4-adec-bfde3659fc65', NULL, NULL, 'uesr_name', '123456', '张三', '4165464165115615', '13564258796', NULL, NULL, NULL, NULL, '20181102', 1, '2018-11-02 08:21:12', '2018-11-02 08:21:12', NULL);
INSERT INTO `wk_worker` VALUES ('3deb04b6-6690-46fe-9f6a-90406055955e', '1', 'f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', 'fweaf', 'fweaf', 'fwea333', 'fweaf', 'fwea', 'fweaf', '3deb04b6-6690-46fe-9f6a-90406055955e/50e2de71-791e-483e-a51f-e4b0a516edeb.jpg', '3deb04b6-6690-46fe-9f6a-90406055955e/fc05159f-731a-493a-ae9a-7c8d2cda8972.jpg', '3deb04b6-6690-46fe-9f6a-90406055955e/469d0cad-1ca1-467d-ad24-cd2f51f91056.jpeg', 'fawewea fawe fwe fewaf awe 222', 2, '2018-10-29 23:09:27', NULL, NULL);
INSERT INTO `wk_worker` VALUES ('b78c71ea-0051-44cc-9bd3-e021b0e1d16d', NULL, NULL, 'uesr_name', '123456', '张三', '168461654612641964', '13165161', NULL, NULL, NULL, NULL, '123165465185 ', 2, '2018-11-02 08:23:28', '2018-11-02 08:23:28', NULL);

SET FOREIGN_KEY_CHECKS = 1;
