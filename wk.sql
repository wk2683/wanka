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

 Date: 04/11/2018 10:31:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wk_account
-- ----------------------------
DROP TABLE IF EXISTS `wk_account`;
CREATE TABLE `wk_account`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资金账户名称',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工ID',
  `bank_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行名称',
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
INSERT INTO `wk_account` VALUES ('1f904b33-5215-4fdd-9e64-cfde3ab61edf', '中行103', '李四', '0b05b5e1-73b1-452f-ab1f-f1e4514d8c29', '中国银行', '1561561515615', NULL, NULL, 2, '远东传动', '2018-11-04 08:33:41', '2018-11-04 08:33:41', NULL);
INSERT INTO `wk_account` VALUES ('6e4b3f3d-ac34-437e-8dca-8e187fe2d5f8', '工行105', '赵志国', 'c32900e7-49d2-47b5-845e-6c620f383cb4', '农业银行', '05616156156', NULL, NULL, 2, ' 地借助', '2018-11-04 08:34:39', '2018-11-04 08:34:39', NULL);
INSERT INTO `wk_account` VALUES ('fjwoafjoweij', 'fiewjf', 'jfwiejf', NULL, 'jioji', 'o', 'ioj', 'oij', 21, 'abc', '2018-11-04 08:02:07', '2018-11-04 08:02:10', 'jio');

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
INSERT INTO `wk_card` VALUES ('55a287e3-2191-45b6-ae84-2584b36def2c', '21b2883c-a8a7-4fd5-a872-93dddf7dd1aa', 1, '招商信用卡', '张无忌', '4515684615', '1325648615', '工商银行', '646166', '123465456', 5, 20, 50000.00, 25000.00, 0.03, 20.00, 0.05, NULL, '博采众家之长', 2, '2018-11-04 06:17:19', '2018-11-04 06:17:19', NULL);
INSERT INTO `wk_card` VALUES ('9d9091c7-58bc-40e4-8b3b-84863d41ef79', '0b05b5e1-73b1-452f-ab1f-f1e4514d8c29', 1, '中行', '张三', '156156', '1561', '农业银行', '651', '516', 156, 165, 15000.00, 5000.00, 0.03, 20.00, 0.06, 1, 'awf \n \ne地\n脸', 2, '2018-11-02 11:21:37', '2018-11-04 06:15:07', NULL);
INSERT INTO `wk_card` VALUES ('abe58281-b616-463e-b820-14db053c7d99', 'c2896645-ab6e-4813-88d6-662968edbe8b', 2, '中行', '张三', '156156', '1561', '中国银行', '651', '516', 156, 165, 15000.00, 5000.00, 0.03, 20.00, 0.06, 1, 'awf \n \ne地\n脸', 2, '2018-11-02 08:43:02', '2018-11-02 08:43:02', NULL);

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
INSERT INTO `wk_customer` VALUES ('0b05b5e1-73b1-452f-ab1f-f1e4514d8c29', '李四', '4549846', '13564875132', '284ea7b8-3699-493a-9520-e6b51e9a81bd', '656c1e0c-b422-428b-a00f-b9f2ae39ddf7/f48b3e7c-b086-49ac-b173-243f313cb71f.jpg', '656c1e0c-b422-428b-a00f-b9f2ae39ddf7/e539de2c-4bf8-4ce4-a167-b00aad9a5181.jpg', '656c1e0c-b422-428b-a00f-b9f2ae39ddf7/5d076639-5da4-4c46-83a9-24d3c6f8345c.jpg', 'fweaefew', 8, '2018-11-04 02:57:07', '2018-11-04 06:08:40', NULL);
INSERT INTO `wk_customer` VALUES ('21b2883c-a8a7-4fd5-a872-93dddf7dd1aa', '李文文', '1566156', '15615315', '3deb04b6-6690-46fe-9f6a-90406055955e', '44fdb80e-8509-4641-aec1-c791b928b49c/c6110735-6570-4a48-a59f-799358e5d8c6.jpg', '44fdb80e-8509-4641-aec1-c791b928b49c/ae40d0a5-a6ce-46de-855d-0274ce03b90f.jpg', '44fdb80e-8509-4641-aec1-c791b928b49c/297b8b12-8bf5-4f31-be2f-8123d9249e51.jpg', '零散款式', 5, '2018-11-04 05:03:04', '2018-11-04 05:03:04', NULL);
INSERT INTO `wk_customer` VALUES ('c2896645-ab6e-4813-88d6-662968edbe8b', 'xxxx', '16165', '131656', '3deb04b6-6690-46fe-9f6a-90406055955e', '05f85c8d-9625-495d-9042-04fd924585d5/77272e6f-abe3-4e90-9b1e-bc699a4702e0.jpg', '05f85c8d-9625-495d-9042-04fd924585d5/dbd10184-8138-41f0-a49c-0f09b7d59f06.jpg', '05f85c8d-9625-495d-9042-04fd924585d5/83e2d06c-be61-4a18-84e7-dcad8f9279d8.jpg', 'ffewefwafew', 2, '2018-11-01 07:17:52', '2018-11-01 07:17:52', NULL);
INSERT INTO `wk_customer` VALUES ('c32900e7-49d2-47b5-845e-6c620f383cb4', '赵志国', '456486561', '5156485156', 'c822257f-f561-4ba9-924b-50bc15156dec', '666cda3b-66f6-4a70-89e6-938e2c8ef0c4/474f02f8-3f62-4c64-af4b-fbff4e0f01ac.jpg', '666cda3b-66f6-4a70-89e6-938e2c8ef0c4/2b254f9f-08bf-4cb3-9589-dc278471de93.jpg', '666cda3b-66f6-4a70-89e6-938e2c8ef0c4/5ea2189e-5dc7-4822-ba42-5f585c6eeed3.jpg', '发我额驸 仍', 5, '2018-11-04 05:07:20', '2018-11-04 05:07:20', NULL);

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
INSERT INTO `wk_model` VALUES ('20454919-0bd3-465a-abde-eab630537f7d', '组织模块', NULL, '组织管理', 1, '2018-10-30 21:09:11', '2018-10-30 21:09:11', NULL);
INSERT INTO `wk_model` VALUES ('8c7b81f5-a5b5-4dc8-bc19-14b382f64205', '员工管理', NULL, '员工管理，可以处理员工的添加，删除，修改，查询等待操作', 100, '2018-11-04 03:40:42', '2018-11-04 03:40:42', NULL);
INSERT INTO `wk_model` VALUES ('c0755d36-1cb6-4b6a-afcf-a7dac5aef4e7', '订单模块', NULL, 'fafew fwef ef we', 1, '2018-10-31 09:05:18', '2018-11-03 22:30:56', NULL);
INSERT INTO `wk_model` VALUES ('fe208d18-fd5a-4315-8ae4-3270d016e0a2', '客户模块', NULL, '客户模块是管理客户的操作', 1, '2018-11-03 21:14:23', '2018-11-04 03:47:12', NULL);

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
INSERT INTO `wk_org` VALUES ('017686f2-f2d5-4a01-9fbb-26226cab6a10', '总公司4', '0', '0', '负责政府部门对接工作', 2, '2018-11-04 04:34:30', '2018-11-04 04:34:58', NULL);
INSERT INTO `wk_org` VALUES ('1', '总公司1', '0', '0', 'jfweoifjewiof', 1, '2018-10-16 23:02:18', '2018-10-16 23:02:18', '8f269ec7-6ad4-48cc-a6d8-42a9d94ccd23');
INSERT INTO `wk_org` VALUES ('2', '一级分公司1', '0,1', '1', '12', 1, '2018-10-23 01:12:03', '2018-10-23 01:12:03', '8f269ec7-6ad4-48cc-a6d8-42a9d94ccd23');
INSERT INTO `wk_org` VALUES ('3', '一级分公司2', '0,1', '1', '12', 1, '2018-10-24 00:38:47', '2018-10-24 00:38:47', '8f269ec7-6ad4-48cc-a6d8-42a9d94ccd23');
INSERT INTO `wk_org` VALUES ('4', '总公司2', '0', '0', '12', 1, '2018-10-23 23:51:26', '2018-10-23 23:51:26', '8f269ec7-6ad4-48cc-a6d8-42a9d94ccd23');
INSERT INTO `wk_org` VALUES ('5', '一级分公司21', '0,4', '4', '12', 1, '2018-10-24 22:24:25', '2018-10-24 22:24:25', '8f269ec7-6ad4-48cc-a6d8-42a9d94ccd23');
INSERT INTO `wk_org` VALUES ('5a23a6d9-6d6b-4a1e-9785-a57677bb44bf', '二级分公司', '0,1,3', '3', '工地', 1, '2018-10-28 20:26:00', '2018-10-28 20:26:00', NULL);
INSERT INTO `wk_org` VALUES ('6', '一级分公司22', '0,4', '4', '12', 1, '2018-10-24 22:29:05', '2018-10-24 22:29:05', '8f269ec7-6ad4-48cc-a6d8-42a9d94ccd23');
INSERT INTO `wk_org` VALUES ('e1632585-a80e-4108-afd5-91b5f47c6c24', '华南分部1', '0,017686f2-f2d5-4a01-9fbb-26226cab6a10', '017686f2-f2d5-4a01-9fbb-26226cab6a10', '华南地区业务处理', 1, '2018-11-04 04:36:03', '2018-11-04 04:36:24', NULL);

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
INSERT INTO `wk_permission` VALUES ('2', '20454919-0bd3-465a-abde-eab630537f7d', 'q', '1', 'page', '1', 1, '2018-10-31 00:11:25', '2018-10-31 00:11:28', '1');
INSERT INTO `wk_permission` VALUES ('3', '20454919-0bd3-465a-abde-eab630537f7d', 'hih', 'hiuhiu', 'click', 'huihu', 2, '2018-10-31 00:11:56', '2018-10-31 00:11:59', '1');
INSERT INTO `wk_permission` VALUES ('839556e3-a6b0-42f4-90a5-0c17b5b5a92f', '8c7b81f5-a5b5-4dc8-bc19-14b382f64205', '新增员工', 'page/worker_add.html', NULL, '添加员工页面及操作', 1, '2018-11-04 03:48:54', '2018-11-04 03:48:54', NULL);
INSERT INTO `wk_permission` VALUES ('9b455f3d-7a6b-480b-bbf0-7bd7037c649d', 'fe208d18-fd5a-4315-8ae4-3270d016e0a2', '客户管理', 'page/customer_manager.html', 'page', '用户列表页面', 1, '2018-11-03 21:15:09', '2018-11-04 04:20:41', NULL);
INSERT INTO `wk_permission` VALUES ('ae0d0095-f1ee-44d4-9f85-371e599e1b76', '8c7b81f5-a5b5-4dc8-bc19-14b382f64205', '员工管理', 'page/worker_manager.html', NULL, '员工的新增、删除、修改、查询等待操作', 1, '2018-11-04 03:52:55', '2018-11-04 03:52:55', NULL);
INSERT INTO `wk_permission` VALUES ('c0a6ec88-9a8b-454d-8ee1-966660487712', 'c0755d36-1cb6-4b6a-afcf-a7dac5aef4e7', '新增', 'page/order_add.html', NULL, '生成订单', 2, '2018-11-03 22:31:53', '2018-11-03 22:31:53', NULL);

-- ----------------------------
-- Table structure for wk_pos
-- ----------------------------
DROP TABLE IF EXISTS `wk_pos`;
CREATE TABLE `wk_pos`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `import_user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `import_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
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
INSERT INTO `wk_pos` VALUES ('570594e8-36d2-4d4f-a05f-a051ea02a4e4', '卡卡宝', '张三', NULL, '中行', '1665165', '0.3', '发我额驸脸', 1, '2018-11-03 23:14:15', '2018-11-03 23:14:15', NULL);
INSERT INTO `wk_pos` VALUES ('b553794a-cf1c-425d-adaa-541417c7bbb1', '中行POS机111', '李四', '0b05b5e1-73b1-452f-ab1f-f1e4514d8c29', '农业银行', '134813464848', '0.02', '发我额驸  仍零用', 2, '2018-11-04 03:04:59', '2018-11-04 03:28:25', NULL);
INSERT INTO `wk_pos` VALUES ('40c49025-1982-41cb-a1df-41eb747962a1', '成卡POS机', '李四', '0b05b5e1-73b1-452f-ab1f-f1e4514d8c29', '工商银行', '165461156156', '0.05', '埒地人夫脍代', 2, '2018-11-04 03:38:31', '2018-11-04 03:38:31', NULL);

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
INSERT INTO `wk_role` VALUES ('238292fe-d2ea-427c-80b1-3962315b9e8e', '财务管理', '财务管理', 1, '2018-11-03 08:55:03', '2018-11-03 08:55:03', NULL);
INSERT INTO `wk_role` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', '系统管理员', 'fawfew fawfe fefa e', 2, '2018-10-28 11:10:08', '2018-11-03 08:55:16', NULL);

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
INSERT INTO `wk_worker` VALUES ('284ea7b8-3699-493a-9520-e6b51e9a81bd', '1', 'b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'weixiaoxiao', '123456', '韦小晓', '4526851315', '13564876215', 'wx1235846', '284ea7b8-3699-493a-9520-e6b51e9a81bd/c11d3a82-80c6-48dd-b05e-08bd87407d9f.jpg', '284ea7b8-3699-493a-9520-e6b51e9a81bd/51921491-8ba4-4726-b18b-efcf59c552ff.jpg', '284ea7b8-3699-493a-9520-e6b51e9a81bd/93aebb90-76c3-4a56-9059-50fba2903b94.jpg', '20181103入职', 8, '2018-11-04 04:52:01', '2018-11-04 04:53:24', NULL);
INSERT INTO `wk_worker` VALUES ('3deb04b6-6690-46fe-9f6a-90406055955e', '1', 'b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'fweaf', '323232132', '马云', 'fweaf', 'fwea', 'fweaf', '3deb04b6-6690-46fe-9f6a-90406055955e/f1cfd82d-48a7-4edc-a0a2-d8404d1ab253.jpg', '3deb04b6-6690-46fe-9f6a-90406055955e/e4e06d85-a07d-4bd0-8530-6092e71adee0.jpg', '3deb04b6-6690-46fe-9f6a-90406055955e/eae0bae8-2366-495a-9010-7e61fc0d1e85.jpg', 'fawewea fawe fwe fewaf awe 222', 2, '2018-10-29 23:09:27', NULL, NULL);
INSERT INTO `wk_worker` VALUES ('c822257f-f561-4ba9-924b-50bc15156dec', '1', 'b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'zhangsanfeng', '123456', '张三丰', '15665561', '13568421568', 'wein1582', 'c822257f-f561-4ba9-924b-50bc15156dec/f805457c-b406-4f20-ac56-f73f641d916f.jpg', 'c822257f-f561-4ba9-924b-50bc15156dec/f2b9cdf4-de08-4024-93c3-5ab8ec2c94ce.jpg', 'c822257f-f561-4ba9-924b-50bc15156dec/2368fce7-b0fe-42c5-854a-7724d58a8897.jpg', '43242r23r323rvr23vr32', 2, '2018-11-03 09:06:04', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
