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

 Date: 10/11/2018 11:41:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wk_account
-- ----------------------------
DROP TABLE IF EXISTS `wk_account`;
CREATE TABLE `wk_account`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seg` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资金账户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_account
-- ----------------------------
INSERT INTO `wk_account` VALUES ('37395154-bfe9-49e3-a774-a38adc3ea16d', '中行卡', 'administrator', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d', '中国银行', '165415161561', '123456', '123456', 2, '测试', '2018-11-08 08:37:54', '2018-11-08 08:37:54', NULL);
INSERT INTO `wk_account` VALUES ('fjwoafjoweij', 'fiewjf', 'jfwiejf', NULL, 'jioji', 'o', 'ioj', 'oij', 21, NULL, '2018-11-05 14:06:08', '2018-11-05 14:06:05', 'jio');

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
  `valid_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效期',
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
INSERT INTO `wk_card` VALUES ('148c3c93-a731-4cd4-bd3a-de4acae82d1b', 'c2896645-ab6e-4813-88d6-662968edbe8b', 1, '赵鹏运', '共时晃', '165156', '1515615616', '农业银行', '161561', '133123', 2, 20, '2018-11', 50000.00, 4000.00, 0.04, 60.00, 0.06, 2, '肤', 2, '2018-11-07 11:17:39', '2018-11-10 09:55:10', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_card` VALUES ('22b4f34e-827b-4dd0-af0d-15f7151b1dec', 'c2896645-ab6e-4813-88d6-662968edbe8b', 1, '中行', '张三', '165156', '1651', '中国银行', '515641561', '132', 5, 15, '2018-11-07', 50000.00, 20000.00, 0.02, 20.00, 0.06, 1, '161 51 51 561 6 ', 2, '2018-11-02 08:41:45', '2018-11-02 08:41:45', NULL);
INSERT INTO `wk_card` VALUES ('9d9091c7-58bc-40e4-8b3b-84863d41ef79', 'c2896645-ab6e-4813-88d6-662968edbe8b', 1, '中行', '张三', '156156', '1561', '农业银行', '651', '516', 156, 165, '2018-11-14', 15000.00, 5000.00, 0.03, 20.00, 0.06, 1, 'awf \n \ne地\n脸', 2, '2018-11-02 11:21:37', NULL, NULL);
INSERT INTO `wk_card` VALUES ('abe58281-b616-463e-b820-14db053c7d99', 'c2896645-ab6e-4813-88d6-662968edbe8b', 2, '中行', '张三', '156156', '1561', '中国银行', '651', '516', 156, 165, '2018-11', 15000.00, 5000.00, 0.03, 20.00, 0.06, 1, 'awf \n \ne地\n脸', 2, '2018-11-02 08:43:02', '2018-11-07 11:15:00', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_card` VALUES ('fde56175-6d9a-4804-9b1e-ce31597809bd', 'c2896645-ab6e-4813-88d6-662968edbe8b', 1, '中行', '张三', '16545615', '165156', '中国银行', '4165515', '15', 15, 15, '2018-11-29', 51515.00, 1510.00, 0.03, 30.00, 0.60, 1, '216 1256 165 156 ', 1, '2018-11-02 08:38:26', '2018-11-02 08:38:26', NULL);

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
INSERT INTO `wk_customer` VALUES ('', '项羽', '11651651561', '13625865421', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d', '11', '1', '1', '1替 地', 1, '2018-11-01 08:45:09', '2018-11-07 07:54:41', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_customer` VALUES ('c2896645-ab6e-4813-88d6-662968edbe8b', '刘备', '16165', '131656', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d', '05f85c8d-9625-495d-9042-04fd924585d5/77272e6f-abe3-4e90-9b1e-bc699a4702e0.jpg', '05f85c8d-9625-495d-9042-04fd924585d5/dbd10184-8138-41f0-a49c-0f09b7d59f06.jpg', '05f85c8d-9625-495d-9042-04fd924585d5/83e2d06c-be61-4a18-84e7-dcad8f9279d8.jpg', 'ffewefwafew', 2, '2018-11-01 07:17:52', '2018-11-07 07:53:59', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');

-- ----------------------------
-- Table structure for wk_mall
-- ----------------------------
DROP TABLE IF EXISTS `wk_mall`;
CREATE TABLE `wk_mall`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户名称',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户简称',
  `seg` int(10) NULL DEFAULT NULL COMMENT '排序值',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户列表' ROW_FORMAT = Dynamic;

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
INSERT INTO `wk_model` VALUES ('24c2a625-18ab-495c-885b-ae06f539a1e9', '组织管理', NULL, '系统组织树结构', 2, '2018-11-05 21:01:05', '2018-11-05 21:01:05', NULL);
INSERT INTO `wk_model` VALUES ('5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡管理', NULL, '信用卡管理模块', 40, '2018-11-05 21:36:05', '2018-11-05 21:36:05', NULL);
INSERT INTO `wk_model` VALUES ('906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户管理', NULL, '客户管理，增删查改', 10, '2018-11-05 21:24:56', '2018-11-05 21:25:11', NULL);
INSERT INTO `wk_model` VALUES ('9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户管理', NULL, '资金账户管理模块', 50, '2018-11-05 21:41:13', '2018-11-05 21:41:13', NULL);
INSERT INTO `wk_model` VALUES ('b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工管理', NULL, '员工信息列表管理，增删查改', 4, '2018-11-05 21:05:17', '2018-11-05 21:05:17', NULL);
INSERT INTO `wk_model` VALUES ('b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单管理', NULL, '订单管理模块', 60, '2018-11-05 21:48:25', '2018-11-05 21:48:25', NULL);
INSERT INTO `wk_model` VALUES ('d56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色管理', NULL, '角色的增删查改', 3, '2018-11-05 21:03:16', '2018-11-05 21:03:16', NULL);
INSERT INTO `wk_model` VALUES ('e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机管理', NULL, 'POS机管理，增删查改', 20, '2018-11-05 21:31:05', '2018-11-05 21:31:05', NULL);
INSERT INTO `wk_model` VALUES ('f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块管理', NULL, '系统的各个模块定义', 1, '2018-11-05 20:45:11', '2018-11-05 20:45:11', NULL);

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
  `customer_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单人(客户）',
  `type` int(11) NULL DEFAULT NULL COMMENT '订单类型',
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `rate` decimal(3, 3) NULL DEFAULT NULL,
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
INSERT INTO `wk_order` VALUES ('1', 'c2896645-ab6e-4813-88d6-662968edbe8b', 1, 1.00, 0.999, 1.00, 1.00, 1.00, 1, '1', 1, '2018-11-06 22:27:53', '2018-11-07 08:31:12', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order` VALUES ('101ff879-300e-422f-9add-fab003fbafb7', 'c2896645-ab6e-4813-88d6-662968edbe8b', 1, 1561561.00, 0.050, 50.00, 10.00, 40.00, 0, '亲朋', 2, '2018-11-07 00:17:25', '2018-11-09 08:11:35', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order` VALUES ('727bdc76-94ec-4fd2-aca6-a1b424ff1e64', 'c2896645-ab6e-4813-88d6-662968edbe8b', 1, 1651561.00, 0.040, 10.00, 40.00, 30.00, 2, 'new user', 2, '2018-11-07 00:22:23', '2018-11-07 00:22:23', NULL);
INSERT INTO `wk_order` VALUES ('d053d43e-7b28-490c-8ec7-320a2c2a9d14', 'c2896645-ab6e-4813-88d6-662968edbe8b', 2, 4651561.00, 0.040, 50.00, 10.00, 40.00, 3, '2018', 2, '2018-11-07 05:47:09', '2018-11-07 08:03:04', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');

-- ----------------------------
-- Table structure for wk_order_export
-- ----------------------------
DROP TABLE IF EXISTS `wk_order_export`;
CREATE TABLE `wk_order_export`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属订单ID',
  `export_date` datetime(0) NULL DEFAULT NULL COMMENT '出账日期',
  `type` int(2) NULL DEFAULT NULL COMMENT '操作类型-订单类型',
  `export_account_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转出账户',
  `import_account_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转入账户',
  `card_password` varbinary(64) NULL DEFAULT NULL COMMENT '卡密码',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `card_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡号',
  `import_bill` decimal(10, 3) NULL DEFAULT NULL COMMENT '还入金额',
  `rate` decimal(6, 2) NULL DEFAULT NULL COMMENT '手续费率',
  `fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '手续费',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单出账表,帮客户还款细节' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_order_export
-- ----------------------------
INSERT INTO `wk_order_export` VALUES ('4b0a3fe9-e0e3-4396-8f09-7c53427e42d3', 'd053d43e-7b28-490c-8ec7-320a2c2a9d14', '2018-11-09 00:00:00', 1, 'fjwoafjoweij', '37395154-bfe9-49e3-a774-a38adc3ea16d', 0x66776566, '远东回', 'fwafew423423', 15165.000, 0.60, 20.00, '测试', 2, '2018-11-08 21:55:23', '2018-11-08 21:55:23', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_export` VALUES ('8d6556b6-58e1-40f2-9931-d731f254be4a', 'd053d43e-7b28-490c-8ec7-320a2c2a9d14', '2018-11-09 02:03:52', 2, '37395154-bfe9-49e3-a774-a38adc3ea16d', 'fjwoafjoweij', 0x66667765666565, '张飞', 'fewafew', 561.000, 0.38, 6516.00, 'imya ', 2, '2018-11-08 21:49:25', '2018-11-09 00:01:03', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_export` VALUES ('914c7379-67c2-42b6-8c71-587147c6a295', 'd053d43e-7b28-490c-8ec7-320a2c2a9d14', '2018-11-09 00:00:00', 2, '37395154-bfe9-49e3-a774-a38adc3ea16d', 'fjwoafjoweij', 0x666677656166, 'feff', '24234', 324234.000, 0.60, 32432.00, 'fwef f wf f we 33', 3, '2018-11-08 23:40:55', '2018-11-09 00:06:18', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_export` VALUES ('b818cee2-70d3-4cde-808e-7138c722d5d7', 'd053d43e-7b28-490c-8ec7-320a2c2a9d14', '2018-11-08 23:42:00', 1, '37395154-bfe9-49e3-a774-a38adc3ea16d', '37395154-bfe9-49e3-a774-a38adc3ea16d', 0x66657766, '零用', 'fwafewfewf', 432.000, 0.60, 32423.00, 'fef  fwe fw', 2, '2018-11-08 23:42:39', '2018-11-08 23:42:39', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_export` VALUES ('ddaaee89-20c1-4e84-b1ac-76a0c5dee111', 'd053d43e-7b28-490c-8ec7-320a2c2a9d14', '2018-11-09 07:33:43', 1, '37395154-bfe9-49e3-a774-a38adc3ea16d', '37395154-bfe9-49e3-a774-a38adc3ea16d', 0x333433343233, 'efw', '45545453345', 3423432.000, 0.38, 32432.00, 'fwefw', 23, '2018-11-08 23:34:27', '2018-11-08 23:34:27', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');

-- ----------------------------
-- Table structure for wk_order_import
-- ----------------------------
DROP TABLE IF EXISTS `wk_order_import`;
CREATE TABLE `wk_order_import`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属订单ID',
  `export_date` datetime(0) NULL DEFAULT NULL COMMENT '出账日期',
  `type` int(2) NULL DEFAULT NULL COMMENT '操作类型-订单类型',
  `pos_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'POS名称（保存POS的ID）',
  `mall_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户名称',
  `consume_account_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消费账户',
  `bill` decimal(10, 2) NULL DEFAULT NULL COMMENT '消费金额',
  `consume_type` int(2) NULL DEFAULT NULL COMMENT '消费方式，1-正常刷卡，2-双免闪付',
  `result` int(2) NULL DEFAULT NULL COMMENT '操作结果，1-成功，2-失败',
  `rate` decimal(6, 3) NULL DEFAULT NULL COMMENT '手续费率',
  `fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '成本手续费=消费金额*费率',
  `import_bill` decimal(10, 2) NULL DEFAULT NULL COMMENT '到账金额=消费金额-手续费',
  `should_bill` decimal(10, 2) NULL DEFAULT NULL COMMENT '应该刷余额（=还入金额总和-消费金额总和）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `seg` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `opt_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单出账表,帮客户还款细节' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_order_import
-- ----------------------------
INSERT INTO `wk_order_import` VALUES ('140861ad-4640-4a28-bc52-6232283d17bd', 'd053d43e-7b28-490c-8ec7-320a2c2a9d14', '2018-11-09 00:00:00', 2, '1', '洪源装璜', '37395154-bfe9-49e3-a774-a38adc3ea16d', 21516.00, 1, 1, 0.600, 135.00, 51.00, 12.00, '测试111', 2, '2018-11-09 07:20:04', '2018-11-09 07:58:08', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_import` VALUES ('15073f2a-f644-4580-bc8a-56866e0af155', '', '2018-11-09 01:06:42', 2, '92e4bfed-83f6-44fe-a1e2-19853d7ed967', '来宾国际大酒店', '37395154-bfe9-49e3-a774-a38adc3ea16d', 2566165.00, NULL, 1, 0.380, 20.00, 40000.00, 500.00, '测试', 2, '2018-11-09 01:07:45', '2018-11-09 01:07:45', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');

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
INSERT INTO `wk_permission` VALUES ('00406da9-5209-4963-a69b-95e034ec8bcf', 'e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机删除', 'pos/delete', 'click', 'POS机删除 请求', 1, '2018-11-05 21:33:33', '2018-11-05 21:33:33', NULL);
INSERT INTO `wk_permission` VALUES ('0823b3aa-6d77-4369-a5f5-3d816ab03ab1', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户搜索', 'customer/search', 'click', '客户搜索请求', 1, '2018-11-05 22:00:07', '2018-11-05 22:00:07', NULL);
INSERT INTO `wk_permission` VALUES ('0a680f3c-024a-49f2-b69b-63016bca024d', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单管理页面', 'page/order_manager.html', 'page', '订单管理页面', 60, '2018-11-05 21:48:57', '2018-11-05 21:48:57', NULL);
INSERT INTO `wk_permission` VALUES ('0a909fd1-bcc9-4856-9d71-77bafca2d0e7', 'e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机新增', 'pos/add', 'click', 'POS机新增请求', 1, '2018-11-05 21:32:43', '2018-11-05 21:32:43', NULL);
INSERT INTO `wk_permission` VALUES ('0afeffce-4996-489a-bf6d-86a3d4121433', '24c2a625-18ab-495c-885b-ae06f539a1e9', '组织管理页面', 'page/org_manager.html', 'page', '组织树，增删查改', 1, '2018-11-05 21:01:51', '2018-11-05 21:01:51', NULL);
INSERT INTO `wk_permission` VALUES ('0d531637-c37b-4269-b502-a13ef97a5968', '24c2a625-18ab-495c-885b-ae06f539a1e9', '组织修改', 'org/update', 'click', '组织修改请求', 12, '2018-11-05 21:21:11', '2018-11-05 21:21:11', NULL);
INSERT INTO `wk_permission` VALUES ('19a68cf4-4592-4785-a9e5-0b6b359a6a63', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单删除', 'order/delete', 'click', '订单删除请求', 1, '2018-11-05 21:54:35', '2018-11-05 21:54:35', NULL);
INSERT INTO `wk_permission` VALUES ('207b9351-e4f0-40fe-bd3a-1fdc3a3eda45', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工查询', 'worker/get', 'click', '查询一个员工信息', 1, '2018-11-05 21:14:14', '2018-11-05 21:14:14', NULL);
INSERT INTO `wk_permission` VALUES ('27e876d0-0182-4be9-9a3d-0e0ac0306744', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单搜索', 'order/search', 'click', '订单搜索请求', 1, '2018-11-05 21:55:20', '2018-11-05 21:55:20', NULL);
INSERT INTO `wk_permission` VALUES ('2981fe45-a18e-4e07-9e72-3859bfd64b11', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单新增页面', 'page/order_add.html', 'page', '订单新增页面', 50, '2018-11-05 21:52:54', '2018-11-05 21:52:54', NULL);
INSERT INTO `wk_permission` VALUES ('29d3a02d-7bca-4195-a23c-ea8b443ceb75', 'e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机新增页面', 'page/pos_add.html', 'page', 'POS机新增填写页面', 18, '2018-11-05 21:32:16', '2018-11-05 21:33:48', NULL);
INSERT INTO `wk_permission` VALUES ('2db732bd-15f6-403f-bb66-1e97be1d31da', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工删除', 'worker/delete', 'click', '删除请求', 1, '2018-11-05 21:12:41', '2018-11-05 21:12:41', NULL);
INSERT INTO `wk_permission` VALUES ('2faf78a7-fa11-4f3b-9999-5869f14491f6', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块新增', 'model/add', 'click', '新增模块提交数据到后台的请求地址', 30, '2018-11-05 20:49:07', '2018-11-05 20:49:07', NULL);
INSERT INTO `wk_permission` VALUES ('34b41684-73c4-408c-8c30-0273a3268a48', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色查询', 'role/get', 'click', '角色查询请求', 11, '2018-11-05 21:23:07', '2018-11-05 21:23:07', NULL);
INSERT INTO `wk_permission` VALUES ('3528b554-2837-4127-ac39-4c8779c7b0c9', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户新增页面', 'page/customer_add.html', 'page', '客户新增页面', 25, '2018-11-05 21:26:44', '2018-11-05 21:27:11', NULL);
INSERT INTO `wk_permission` VALUES ('370c3f03-845c-4649-9954-3325716a807e', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块新增页面', 'page/model_add.html', 'page', '添加一个新模块页面', 40, '2018-11-05 20:47:18', '2018-11-05 20:47:40', NULL);
INSERT INTO `wk_permission` VALUES ('37a57edd-14c9-4541-88bc-784b06d740b6', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户管理页面', 'page/customer_manager.html', 'page', '客户管理页面,增删查改', 30, '2018-11-05 21:25:54', '2018-11-05 21:25:54', NULL);
INSERT INTO `wk_permission` VALUES ('37f3792e-b042-461f-81dd-bec5beae997f', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工新增页面', 'page/worker_add.html', 'page', '填写新加入员工信息页面', 28, '2018-11-05 21:06:25', '2018-11-05 21:16:31', NULL);
INSERT INTO `wk_permission` VALUES ('42f17cc2-e502-4603-a573-be82d689e760', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡管理页面', 'page/card_manager.html', 'page', '信用卡管理页面', 40, '2018-11-05 21:36:37', '2018-11-05 21:36:37', NULL);
INSERT INTO `wk_permission` VALUES ('4315f908-1041-40e8-87b2-575cef86079e', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工搜索', 'worker/search', 'click', '搜索出列表', 11, '2018-11-05 21:15:08', '2018-11-05 21:15:08', NULL);
INSERT INTO `wk_permission` VALUES ('48ff4405-63e6-44d5-9253-945333459cfa', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡删除', 'card/delete', 'click', '信用卡删除请求', 1, '2018-11-05 21:38:14', '2018-11-05 21:38:14', NULL);
INSERT INTO `wk_permission` VALUES ('495f9c39-cdeb-4a58-81da-c3ae715d8035', 'e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机修改', 'pos/update', 'click', 'POS机修改', 1, '2018-11-05 21:33:08', '2018-11-05 21:33:08', NULL);
INSERT INTO `wk_permission` VALUES ('4a0912b6-6182-4ca0-9fbf-aac7925f622e', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块管理列表', 'page/model_manager.html', 'page', '显示所有的模块及模块对应的权限页面', 50, '2018-11-05 20:46:27', '2018-11-05 20:46:27', NULL);
INSERT INTO `wk_permission` VALUES ('5b9f3ef1-19dc-48d1-9f53-4db964bf4739', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工详情信息', 'page/worker_detail.html', 'click', '详细信息页面，只可查看', 24, '2018-11-05 21:09:15', '2018-11-05 21:16:50', NULL);
INSERT INTO `wk_permission` VALUES ('5d310b96-1c7b-4472-90c6-47ecbcf2eb44', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色管理页面', 'page/role_manager.html', 'page', '角色的增删查改', 1, '2018-11-05 21:03:58', '2018-11-05 21:03:58', NULL);
INSERT INTO `wk_permission` VALUES ('5e72ded9-78b4-42a9-bb67-9e06b80f32ef', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户搜索', 'account/search', 'click', '资金账户信息搜索请求', 1, '2018-11-05 21:46:50', '2018-11-05 21:46:50', NULL);
INSERT INTO `wk_permission` VALUES ('60924bf9-862c-4ae5-9e19-fcaf90864a22', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户新增', 'customer/add', 'click', '客户新增请求', 10, '2018-11-05 21:27:49', '2018-11-05 21:27:49', NULL);
INSERT INTO `wk_permission` VALUES ('60ca75cd-45ec-4e36-b606-5618125f40db', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工修改页面', 'page/worker_update.html', 'page', '填写修改员工信息页面', 26, '2018-11-05 21:10:56', '2018-11-05 21:16:42', NULL);
INSERT INTO `wk_permission` VALUES ('721470d6-8325-47b5-a0e1-e6ada4b0a5c7', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡修改', 'card/update', 'click', '信用卡修改', 1, '2018-11-05 21:38:43', '2018-11-05 21:38:43', NULL);
INSERT INTO `wk_permission` VALUES ('72da503e-9dc2-4f0b-b9d7-01307ef48afe', 'e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机管理页面', 'page/pos_manager.html', 'page', 'POS机管理页面', 20, '2018-11-05 21:31:39', '2018-11-05 21:31:39', NULL);
INSERT INTO `wk_permission` VALUES ('785eaa24-48da-4a5b-97d6-baaebe89c146', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块删除', 'model/delete', 'click', '删除请求后台地址', 33, '2018-11-05 20:56:39', '2018-11-05 20:56:39', NULL);
INSERT INTO `wk_permission` VALUES ('7a5be87d-0203-47de-b3e4-bd81e6c2e963', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户修改', 'account/update', 'click', '资金账户修改', 1, '2018-11-05 21:45:38', '2018-11-05 21:45:38', NULL);
INSERT INTO `wk_permission` VALUES ('8151b8eb-b266-4b3c-a2f4-4f8eb9fd6ffd', '24c2a625-18ab-495c-885b-ae06f539a1e9', '组织删除', 'org/delete', 'click', '组织删除', 13, '2018-11-05 21:21:34', '2018-11-05 21:21:34', NULL);
INSERT INTO `wk_permission` VALUES ('86da73e7-c991-41c2-a2a9-423e5ea582da', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户信息修改', 'customer/update', 'click', '客户信息修改请求', 11, '2018-11-05 21:29:37', '2018-11-05 21:29:37', NULL);
INSERT INTO `wk_permission` VALUES ('89aed3d8-25d5-4d7f-ab40-3ae2287ec91b', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单查询', 'order/get', 'click', '订单查询请求', 1, '2018-11-05 21:54:56', '2018-11-05 21:54:56', NULL);
INSERT INTO `wk_permission` VALUES ('8e0685f7-1619-44cf-8aaf-13322418eb24', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户新增', 'account/add', 'click', '资金账户新增请求', 1, '2018-11-05 21:44:48', '2018-11-05 21:44:48', NULL);
INSERT INTO `wk_permission` VALUES ('8eebc6ca-7a36-4c6e-8eb6-b08bce6283ab', '24c2a625-18ab-495c-885b-ae06f539a1e9', '组织查询', 'org/get', 'click', '组织查询', 14, '2018-11-05 21:22:04', '2018-11-05 21:22:04', NULL);
INSERT INTO `wk_permission` VALUES ('9570f4b8-4320-411a-9017-7b65eab7881d', 'e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机搜索', 'pos/search', 'click', 'POS机搜索', 1, '2018-11-05 21:34:31', '2018-11-05 21:34:31', NULL);
INSERT INTO `wk_permission` VALUES ('990c3ec0-5740-4717-9d8c-03bc80b7bf07', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡搜索', 'card/search', 'click', '信用卡搜索', 1, '2018-11-05 21:40:14', '2018-11-05 21:40:14', NULL);
INSERT INTO `wk_permission` VALUES ('9c37b33b-98cd-4c0d-a88f-49c20e785f3f', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户查询', 'customer/get', 'click', '客户查询请求', 1, '2018-11-05 21:59:42', '2018-11-05 21:59:42', NULL);
INSERT INTO `wk_permission` VALUES ('a0e92d37-dbe6-4d5c-8731-ea234a6bad03', '24c2a625-18ab-495c-885b-ae06f539a1e9', '组织搜索', 'org/search', 'click', '组织搜索', 15, '2018-11-05 21:22:30', '2018-11-05 21:22:30', NULL);
INSERT INTO `wk_permission` VALUES ('a1f4782a-91b6-4a13-9bfb-7bcacb9bb7ed', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户删除', 'customer/delete', 'click', '客户删除请求', 1, '2018-11-05 21:59:17', '2018-11-05 21:59:17', NULL);
INSERT INTO `wk_permission` VALUES ('a22ad731-3aea-471f-9f6f-77c736c569cb', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡新增页面', 'page/card_add.html', 'page', '信用卡管理新增页面', 38, '2018-11-05 21:37:10', '2018-11-05 21:37:10', NULL);
INSERT INTO `wk_permission` VALUES ('a51ccb15-0b06-4e91-b42d-89047e488412', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡新增', 'card/add', 'click', '信用卡管理新增', 1, '2018-11-05 21:37:32', '2018-11-05 21:37:32', NULL);
INSERT INTO `wk_permission` VALUES ('a56c42d9-3fd3-4ed1-85b1-fd5274b74e9e', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡查询', 'card/get', 'click', '信用卡管理查询', 1, '2018-11-05 21:39:54', '2018-11-05 21:39:54', NULL);
INSERT INTO `wk_permission` VALUES ('a5a10ec2-0bdc-4b93-ac2c-fc83babc7353', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户新增页面', 'page/account_add.html', 'page', '资金账户新增页面', 40, '2018-11-05 21:42:51', '2018-11-05 21:42:51', NULL);
INSERT INTO `wk_permission` VALUES ('ab2142fb-a20d-4255-9aa9-0440e23d03e3', '24c2a625-18ab-495c-885b-ae06f539a1e9', '组织新增', 'org/add', 'click', '组织新增请求', 10, '2018-11-05 21:20:45', '2018-11-05 21:20:45', NULL);
INSERT INTO `wk_permission` VALUES ('ae559f35-73a8-44fe-969c-1bfd1a46ad30', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色新增', 'role/add', 'click', '角色新增请求', 10, '2018-11-05 21:18:21', '2018-11-05 21:18:21', NULL);
INSERT INTO `wk_permission` VALUES ('afb19edd-fbdc-4cd2-865f-4a304ba3da33', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单修改', 'order/update', 'click', '订单修改请求', 1, '2018-11-05 21:54:07', '2018-11-05 21:54:07', NULL);
INSERT INTO `wk_permission` VALUES ('b8e4a5cf-2b28-4884-b7af-f14bba82b539', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工修改', 'worker/update', 'click', '修改后台 请求地址', 1, '2018-11-05 21:11:34', '2018-11-05 21:11:34', NULL);
INSERT INTO `wk_permission` VALUES ('bd43a25c-9a2e-46cd-b10d-ed9d18fb355c', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色删除', 'role/delete', 'click', '角色删除请求', 11, '2018-11-05 21:19:20', '2018-11-05 21:19:20', NULL);
INSERT INTO `wk_permission` VALUES ('c2ace550-9ee8-41fe-98cd-b29a6ee4aa9f', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户查询', 'account/get', 'click', '资金账户查询', 1, '2018-11-05 21:46:04', '2018-11-05 21:46:04', NULL);
INSERT INTO `wk_permission` VALUES ('c8cdb2b7-4c95-451a-a91c-5ca55b258cc0', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块修改', 'model/update', 'click', '提交修改数据到后台的请求地址', 31, '2018-11-05 20:55:08', '2018-11-05 20:55:08', NULL);
INSERT INTO `wk_permission` VALUES ('cc09e43b-a2ce-4bc7-9a5e-d336dba260c4', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色搜索', 'role/search', 'click', '角色搜索请求', 12, '2018-11-05 21:23:43', '2018-11-05 21:23:43', NULL);
INSERT INTO `wk_permission` VALUES ('d42892ee-e813-4f8f-bef8-2fe1fccd24b8', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色修改', 'role/update', 'click', '角色修改请求', 12, '2018-11-05 21:19:57', '2018-11-05 21:19:57', NULL);
INSERT INTO `wk_permission` VALUES ('d7febddf-16aa-4259-b102-d12e162387b9', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工管理页面', 'page/worker_manager.html', 'page', '员工管理页面，可增删查改', 30, '2018-11-05 21:07:14', '2018-11-05 21:16:09', NULL);
INSERT INTO `wk_permission` VALUES ('da198f37-7cd5-4ee7-8bec-f7c71a7e4370', 'e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机查询', 'pos/get', 'click', 'POS机查询', 1, '2018-11-05 21:34:11', '2018-11-05 21:34:11', NULL);
INSERT INTO `wk_permission` VALUES ('e1fff5a3-a2d7-4506-8471-82a20c1be973', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户删除', 'account/delete', 'click', '资金账户删除请求', 1, '2018-11-05 21:45:12', '2018-11-05 21:45:12', NULL);
INSERT INTO `wk_permission` VALUES ('ebb9dc27-61df-4a84-b7d9-1951a033c4e5', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单新增', 'order/add', 'click', '订单新增请求', 1, '2018-11-05 21:53:42', '2018-11-05 21:53:42', NULL);
INSERT INTO `wk_permission` VALUES ('f2559fdd-68e4-4894-b0b4-405b014021ec', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块修改页面', 'page/model_update.html', 'click', '填写修改模块信息页面', 39, '2018-11-05 20:50:18', '2018-11-05 20:58:24', NULL);
INSERT INTO `wk_permission` VALUES ('f6d2315e-d2cb-4762-9412-f55563fbd1ef', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户管理页面', 'page/account_manager.html', 'page', '资金账户管理页面', 50, '2018-11-05 21:42:17', '2018-11-05 21:42:17', NULL);
INSERT INTO `wk_permission` VALUES ('fe15c1a7-d2ca-48be-8850-dc6e19fc7ceb', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工新增', 'worker/add', 'click', '新增请求地址', 1, '2018-11-05 21:08:38', '2018-11-05 21:08:38', NULL);

-- ----------------------------
-- Table structure for wk_pos
-- ----------------------------
DROP TABLE IF EXISTS `wk_pos`;
CREATE TABLE `wk_pos`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `import_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入账人ID(员工）',
  `import_user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入账人名（员工）',
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
INSERT INTO `wk_pos` VALUES ('1', '中行POS机', 'c2896645-ab6e-4813-88d6-662968edbe8b', '刘备', '农业银行', '100000000', '0.05', '1', 1, '2018-11-01 09:04:58', '2018-11-09 01:05:41', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_pos` VALUES ('92e4bfed-83f6-44fe-a1e2-19853d7ed967', '工行POS机', NULL, '项羽', '工商银行', '22222222222222222', '0.3', '测试', 1, '2018-11-01 09:04:18', '2018-11-09 01:06:20', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');

-- ----------------------------
-- Table structure for wk_rate
-- ----------------------------
DROP TABLE IF EXISTS `wk_rate`;
CREATE TABLE `wk_rate`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rate` decimal(3, 3) NULL DEFAULT NULL,
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
INSERT INTO `wk_rate` VALUES ('1lkffwefew2fwe684fwe3f15e6f84we6f1', 0.380, '1', 1, '2018-11-07 23:29:51', '2018-11-07 23:30:05', '1');
INSERT INTO `wk_rate` VALUES ('fewf5w48f6ew6f4we6fe8wf46wef5ew6', 0.600, '', NULL, '2018-11-07 23:29:56', '2018-11-07 23:29:59', '1');

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
INSERT INTO `wk_role` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '系统管理员', '所有操作权限', 2, '2018-10-28 11:10:08', '2018-11-06 07:56:27', NULL);
INSERT INTO `wk_role` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', '老板', '投资人', 1, '2018-10-28 08:16:02', '2018-10-28 08:16:02', NULL);

-- ----------------------------
-- Table structure for wk_role_model
-- ----------------------------
DROP TABLE IF EXISTS `wk_role_model`;
CREATE TABLE `wk_role_model`  (
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `model_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块ID',
  PRIMARY KEY (`role_id`, `model_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色-模块权限关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_role_model
-- ----------------------------
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '24c2a625-18ab-495c-885b-ae06f539a1e9');
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7');
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '906b3ac8-b30f-47c8-8454-641bd02d57b8');
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '9ff50792-b092-4f1e-b5b9-9dce75651eff');
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33');
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a');
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051');
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'e689a2b9-62d8-460f-819c-0ac53d041662');
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5');
INSERT INTO `wk_role_model` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', '24c2a625-18ab-495c-885b-ae06f539a1e9');
INSERT INTO `wk_role_model` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', '906b3ac8-b30f-47c8-8454-641bd02d57b8');
INSERT INTO `wk_role_model` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33');
INSERT INTO `wk_role_model` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a');
INSERT INTO `wk_role_model` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051');
INSERT INTO `wk_role_model` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5');

-- ----------------------------
-- Table structure for wk_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `wk_role_permission`;
CREATE TABLE `wk_role_permission`  (
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permission_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限关联表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_role_permission
-- ----------------------------
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '00406da9-5209-4963-a69b-95e034ec8bcf');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '0823b3aa-6d77-4369-a5f5-3d816ab03ab1');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '0a680f3c-024a-49f2-b69b-63016bca024d');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '0a909fd1-bcc9-4856-9d71-77bafca2d0e7');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '0afeffce-4996-489a-bf6d-86a3d4121433');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '0d531637-c37b-4269-b502-a13ef97a5968');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '19a68cf4-4592-4785-a9e5-0b6b359a6a63');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '207b9351-e4f0-40fe-bd3a-1fdc3a3eda45');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '27e876d0-0182-4be9-9a3d-0e0ac0306744');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '2981fe45-a18e-4e07-9e72-3859bfd64b11');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '29d3a02d-7bca-4195-a23c-ea8b443ceb75');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '2db732bd-15f6-403f-bb66-1e97be1d31da');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '2faf78a7-fa11-4f3b-9999-5869f14491f6');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '34b41684-73c4-408c-8c30-0273a3268a48');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '3528b554-2837-4127-ac39-4c8779c7b0c9');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '370c3f03-845c-4649-9954-3325716a807e');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '37a57edd-14c9-4541-88bc-784b06d740b6');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '37f3792e-b042-461f-81dd-bec5beae997f');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '42f17cc2-e502-4603-a573-be82d689e760');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '4315f908-1041-40e8-87b2-575cef86079e');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '48ff4405-63e6-44d5-9253-945333459cfa');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '495f9c39-cdeb-4a58-81da-c3ae715d8035');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '4a0912b6-6182-4ca0-9fbf-aac7925f622e');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '5b9f3ef1-19dc-48d1-9f53-4db964bf4739');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '5d310b96-1c7b-4472-90c6-47ecbcf2eb44');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '5e72ded9-78b4-42a9-bb67-9e06b80f32ef');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '60924bf9-862c-4ae5-9e19-fcaf90864a22');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '60ca75cd-45ec-4e36-b606-5618125f40db');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '721470d6-8325-47b5-a0e1-e6ada4b0a5c7');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '72da503e-9dc2-4f0b-b9d7-01307ef48afe');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '785eaa24-48da-4a5b-97d6-baaebe89c146');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '7a5be87d-0203-47de-b3e4-bd81e6c2e963');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '8151b8eb-b266-4b3c-a2f4-4f8eb9fd6ffd');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '86da73e7-c991-41c2-a2a9-423e5ea582da');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '89aed3d8-25d5-4d7f-ab40-3ae2287ec91b');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '8e0685f7-1619-44cf-8aaf-13322418eb24');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '8eebc6ca-7a36-4c6e-8eb6-b08bce6283ab');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '9570f4b8-4320-411a-9017-7b65eab7881d');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '990c3ec0-5740-4717-9d8c-03bc80b7bf07');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '9c37b33b-98cd-4c0d-a88f-49c20e785f3f');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'a0e92d37-dbe6-4d5c-8731-ea234a6bad03');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'a1f4782a-91b6-4a13-9bfb-7bcacb9bb7ed');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'a22ad731-3aea-471f-9f6f-77c736c569cb');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'a51ccb15-0b06-4e91-b42d-89047e488412');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'a56c42d9-3fd3-4ed1-85b1-fd5274b74e9e');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'a5a10ec2-0bdc-4b93-ac2c-fc83babc7353');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'ab2142fb-a20d-4255-9aa9-0440e23d03e3');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'ae559f35-73a8-44fe-969c-1bfd1a46ad30');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'afb19edd-fbdc-4cd2-865f-4a304ba3da33');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'b8e4a5cf-2b28-4884-b7af-f14bba82b539');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'bd43a25c-9a2e-46cd-b10d-ed9d18fb355c');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'c2ace550-9ee8-41fe-98cd-b29a6ee4aa9f');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'c8cdb2b7-4c95-451a-a91c-5ca55b258cc0');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'cc09e43b-a2ce-4bc7-9a5e-d336dba260c4');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'd42892ee-e813-4f8f-bef8-2fe1fccd24b8');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'd7febddf-16aa-4259-b102-d12e162387b9');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'da198f37-7cd5-4ee7-8bec-f7c71a7e4370');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'e1fff5a3-a2d7-4506-8471-82a20c1be973');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'ebb9dc27-61df-4a84-b7d9-1951a033c4e5');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'f2559fdd-68e4-4894-b0b4-405b014021ec');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'f6d2315e-d2cb-4762-9412-f55563fbd1ef');
INSERT INTO `wk_role_permission` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'fe15c1a7-d2ca-48be-8850-dc6e19fc7ceb');
INSERT INTO `wk_role_permission` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', '0a680f3c-024a-49f2-b69b-63016bca024d');
INSERT INTO `wk_role_permission` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', '37a57edd-14c9-4541-88bc-784b06d740b6');
INSERT INTO `wk_role_permission` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', '42f17cc2-e502-4603-a573-be82d689e760');

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
INSERT INTO `wk_worker` VALUES ('b78c71ea-0051-44cc-9bd3-e021b0e1d16d', '1', 'b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'administrator', '111111111111111111', '1399999999', 'weixin1998', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d/50f393ec-e00a-49bc-8933-07628c68593c.jpg', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d/71b82a10-97e7-453e-9852-1106133d0c0e.jpg', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d/8ff51956-fcdc-4d0d-8e9d-a9d6c1d1ae0e.jpg', '123165465185 ', 1000, '2018-11-02 08:23:28', '2018-11-06 20:32:29', NULL);

SET FOREIGN_KEY_CHECKS = 1;
