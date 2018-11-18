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

 Date: 18/11/2018 17:54:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wk_order_import
-- ----------------------------
DROP TABLE IF EXISTS `wk_order_import`;
CREATE TABLE `wk_order_import`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属订单ID',
  `export_date` datetime(0) NULL DEFAULT NULL COMMENT '出账日期',
  `type` int(2) NULL DEFAULT 0 COMMENT '操作类型-订单类型，1-消费，2-取现刷卡',
  `pos_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'POS名称（保存POS的ID）',
  `mall_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户名称',
  `consume_account_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消费账户',
  `bill` decimal(10, 2) NULL DEFAULT NULL COMMENT '消费金额',
  `consume_type` int(2) NULL DEFAULT NULL COMMENT '消费方式，1-正常刷卡，2-双免闪付',
  `result` int(2) NULL DEFAULT NULL COMMENT '操作结果，1-成功，2-失败',
  `rate` decimal(6, 3) NULL DEFAULT NULL COMMENT '手续费率（成本手续费）',
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
INSERT INTO `wk_order_import` VALUES ('075d3ef7-6422-45f9-a884-4dfc2f192d12', '1', '2018-11-18 00:00:00', 1, '92e4bfed-83f6-44fe-a1e2-19853d7ed967', '来宾市百佳超市', '22b4f34e-827b-4dd0-af0d-15f7151b1dec', 2000.00, 2, 1, 0.380, 7.60, 1992.40, 8000.00, '第一笔消费', 1, '2018-11-18 10:51:23', '2018-11-18 10:51:23', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_import` VALUES ('140861ad-4640-4a28-bc52-6232283d17bd', 'd053d43e-7b28-490c-8ec7-320a2c2a9d14', '2018-11-09 00:00:00', 2, '1', '洪源装璜', '37395154-bfe9-49e3-a774-a38adc3ea16d', 21516.00, 1, 1, 0.600, 135.00, 51.00, 12.00, '测试111', 2, '2018-11-09 07:20:04', '2018-11-09 07:58:08', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_import` VALUES ('15073f2a-f644-4580-bc8a-56866e0af155', '', '2018-11-09 01:06:42', 2, '92e4bfed-83f6-44fe-a1e2-19853d7ed967', '来宾国际大酒店', '37395154-bfe9-49e3-a774-a38adc3ea16d', 2566165.00, NULL, 1, 0.380, 20.00, 40000.00, 500.00, '测试', 2, '2018-11-09 01:07:45', '2018-11-09 01:07:45', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_import` VALUES ('53381747-af81-476e-9355-f08a03caa829', '1', '2018-11-18 15:50:32', 1, '92e4bfed-83f6-44fe-a1e2-19853d7ed967', '来宾国际大酒店', '22b4f34e-827b-4dd0-af0d-15f7151b1dec', 1000.00, 1, 1, 0.600, 6.00, 994.00, 0.00, '最后一笔消费', 1, '2018-11-18 15:51:43', '2018-11-18 15:51:43', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_import` VALUES ('6b35415f-1907-4fda-bf45-84fbbed1c4db', '1', '2018-11-01 00:00:00', 1, '1', '来宾大酒店', '22b4f34e-827b-4dd0-af0d-15f7151b1dec', 1000.00, 2, 1, 0.380, 3.80, 996.20, 2000.00, '第三笔', 1, '2018-11-18 14:54:17', '2018-11-18 14:54:17', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_import` VALUES ('7d6cf1e7-2076-43b4-acd9-184824d23a6f', '1', '2018-11-02 00:00:00', 1, '92e4bfed-83f6-44fe-a1e2-19853d7ed967', '来宾宜家家居', '22b4f34e-827b-4dd0-af0d-15f7151b1dec', 1000.00, 1, 1, 0.600, 6.00, 994.00, 1000.00, '', 1, '2018-11-18 14:59:16', '2018-11-18 14:59:16', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order_import` VALUES ('e045d34e-c399-4a41-b311-1e04b7e4150e', '1', '2018-11-18 00:00:00', 1, '1', '中国石油加油站', '22b4f34e-827b-4dd0-af0d-15f7151b1dec', 5000.00, 1, 1, 0.600, 30.00, 4970.00, 3000.00, '第二笔消费', 1, '2018-11-18 10:53:06', '2018-11-18 10:53:06', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');

SET FOREIGN_KEY_CHECKS = 1;
