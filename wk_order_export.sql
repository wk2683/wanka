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

 Date: 18/11/2018 17:54:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wk_order_export
-- ----------------------------
DROP TABLE IF EXISTS `wk_order_export`;
CREATE TABLE `wk_order_export`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属订单ID',
  `export_date` datetime(0) NULL DEFAULT NULL COMMENT '出账日期',
  `type` int(2) NULL DEFAULT 0 COMMENT '操作类型-订单类型，1-还款，2-取现转账',
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
INSERT INTO `wk_order_export` VALUES ('08a33b0d-d5ff-4f70-b305-7468dd7106ff', '1', '2018-11-18 15:31:01', 1, '37395154-bfe9-49e3-a774-a38adc3ea16d', '22b4f34e-827b-4dd0-af0d-15f7151b1dec', NULL, '张三', '515641561', 1000.000, NULL, 20.00, '第二笔还款', 1, '2018-11-18 15:32:36', '2018-11-18 15:32:36', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_export` VALUES ('4b0a3fe9-e0e3-4396-8f09-7c53427e42d3', 'd053d43e-7b28-490c-8ec7-320a2c2a9d14', '2018-11-09 00:00:00', 1, 'fjwoafjoweij', '37395154-bfe9-49e3-a774-a38adc3ea16d', 0x66776566, '远东回', 'fwafew423423', 15165.000, 0.60, 20.00, '测试', 2, '2018-11-08 21:55:23', '2018-11-08 21:55:23', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_export` VALUES ('4becd6e3-d21c-4c15-a239-3ca690b693a6', '1', '2018-11-18 15:49:33', 1, '37395154-bfe9-49e3-a774-a38adc3ea16d', '22b4f34e-827b-4dd0-af0d-15f7151b1dec', NULL, '张三', '515641561', 1000.000, NULL, 0.00, '第三笔还款', 1, '2018-11-18 15:50:20', '2018-11-18 15:50:20', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_export` VALUES ('8d6556b6-58e1-40f2-9931-d731f254be4a', 'd053d43e-7b28-490c-8ec7-320a2c2a9d14', '2018-11-09 02:03:52', 2, '37395154-bfe9-49e3-a774-a38adc3ea16d', 'fjwoafjoweij', 0x66667765666565, '张飞', 'fewafew', 561.000, 0.38, 6516.00, 'imya ', 2, '2018-11-08 21:49:25', '2018-11-09 00:01:03', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_export` VALUES ('914c7379-67c2-42b6-8c71-587147c6a295', 'd053d43e-7b28-490c-8ec7-320a2c2a9d14', '2018-11-09 00:00:00', 2, '37395154-bfe9-49e3-a774-a38adc3ea16d', 'fjwoafjoweij', 0x666677656166, 'feff', '24234', 324234.000, 0.60, 32432.00, 'fwef f wf f we 33', 3, '2018-11-08 23:40:55', '2018-11-09 00:06:18', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_export` VALUES ('ac5050a4-5d15-4f6a-b08b-a2ecf666693b', '1', '2018-11-18 15:25:14', 1, '37395154-bfe9-49e3-a774-a38adc3ea16d', '22b4f34e-827b-4dd0-af0d-15f7151b1dec', NULL, '张三', '515641561', 5000.000, NULL, 10.00, '第一笔还款', 1, '2018-11-18 15:26:18', '2018-11-18 15:26:18', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_export` VALUES ('b818cee2-70d3-4cde-808e-7138c722d5d7', 'd053d43e-7b28-490c-8ec7-320a2c2a9d14', '2018-11-08 23:42:00', 1, '37395154-bfe9-49e3-a774-a38adc3ea16d', '37395154-bfe9-49e3-a774-a38adc3ea16d', 0x66657766, '零用', 'fwafewfewf', 432.000, 0.60, 32423.00, 'fef  fwe fw', 2, '2018-11-08 23:42:39', '2018-11-08 23:42:39', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_export` VALUES ('ddaaee89-20c1-4e84-b1ac-76a0c5dee111', 'd053d43e-7b28-490c-8ec7-320a2c2a9d14', '2018-11-09 07:33:43', 1, '37395154-bfe9-49e3-a774-a38adc3ea16d', '37395154-bfe9-49e3-a774-a38adc3ea16d', 0x333433343233, 'efw', '45545453345', 3423432.000, 0.38, 32432.00, 'fwefw', 23, '2018-11-08 23:34:27', '2018-11-08 23:34:27', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');

SET FOREIGN_KEY_CHECKS = 1;
