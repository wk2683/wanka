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

 Date: 06/11/2018 07:37:04
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
INSERT INTO `wk_account` VALUES ('fjwoafjoweij', 'fiewjf', 'jfwiejf', 'jioji', 'o', 'ioj', 'oij', 21, NULL, '2018-11-05 14:06:08', '2018-11-05 14:06:05', 'jio');

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
INSERT INTO `wk_pos` VALUES ('1', '1', NULL, '1', '1', '1', '1', '1', 1, '2018-11-01 09:04:58', '2018-11-01 09:05:02', '1');
INSERT INTO `wk_pos` VALUES ('92e4bfed-83f6-44fe-a1e2-19853d7ed967', 'fwafewe', NULL, 'fewaf', 'fewfwea', 'fewaf', '0.3', 'fewafewafewa', 1, '2018-11-01 09:04:18', '2018-11-01 09:04:18', NULL);

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
INSERT INTO `wk_worker` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, '2018-10-28 20:53:33', '2018-10-28 20:53:37', '1');
INSERT INTO `wk_worker` VALUES ('1cc7901a-c73e-4ff4-adec-bfde3659fc65', NULL, NULL, 'uesr_name', '123456', '张三', '4165464165115615', '13564258796', NULL, NULL, NULL, NULL, '20181102', 1, '2018-11-02 08:21:12', '2018-11-02 08:21:12', NULL);
INSERT INTO `wk_worker` VALUES ('3deb04b6-6690-46fe-9f6a-90406055955e', '1', 'f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', 'fweaf', 'fweaf', 'fwea333', 'fweaf', 'fwea', 'fweaf', '3deb04b6-6690-46fe-9f6a-90406055955e/50e2de71-791e-483e-a51f-e4b0a516edeb.jpg', '3deb04b6-6690-46fe-9f6a-90406055955e/fc05159f-731a-493a-ae9a-7c8d2cda8972.jpg', '3deb04b6-6690-46fe-9f6a-90406055955e/469d0cad-1ca1-467d-ad24-cd2f51f91056.jpeg', 'fawewea fawe fwe fewaf awe 222', 2, '2018-10-29 23:09:27', NULL, NULL);
INSERT INTO `wk_worker` VALUES ('b78c71ea-0051-44cc-9bd3-e021b0e1d16d', NULL, NULL, 'uesr_name', '123456', '张三', '168461654612641964', '13165161', NULL, NULL, NULL, NULL, '123165465185 ', 2, '2018-11-02 08:23:28', '2018-11-02 08:23:28', NULL);

SET FOREIGN_KEY_CHECKS = 1;
