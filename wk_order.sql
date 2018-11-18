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

 Date: 18/11/2018 17:55:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wk_order
-- ----------------------------
DROP TABLE IF EXISTS `wk_order`;
CREATE TABLE `wk_order`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单人(客户）',
  `card_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单的信用卡ID',
  `type` int(11) NULL DEFAULT 0 COMMENT '订单类型，1-YK 养卡，2-TX套现，3-YK+TX 养卡套现',
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `rate` decimal(3, 3) NULL DEFAULT NULL,
  `fee` decimal(10, 2) NULL DEFAULT NULL,
  `discount` decimal(10, 2) NULL DEFAULT NULL,
  `real_fee` decimal(10, 2) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL COMMENT '0-4对应：\'已关闭\',\'新增\',\'完成\',\'业务中\',\'操作完成\'',
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
INSERT INTO `wk_order` VALUES ('1', 'c2896645-ab6e-4813-88d6-662968edbe8b', '22b4f34e-827b-4dd0-af0d-15f7151b1dec', 1, 10000.00, 0.999, 1.00, 1.00, 1.00, 1, '1', 1, '2018-11-06 22:27:53', '2018-11-07 08:31:12', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order` VALUES ('101ff879-300e-422f-9add-fab003fbafb7', 'c2896645-ab6e-4813-88d6-662968edbe8b', '148c3c93-a731-4cd4-bd3a-de4acae82d1b', 1, 1561561.00, 0.050, 50.00, 10.00, 40.00, 0, '亲朋', 2, '2018-11-07 00:17:25', '2018-11-09 08:11:35', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_order` VALUES ('727bdc76-94ec-4fd2-aca6-a1b424ff1e64', 'c2896645-ab6e-4813-88d6-662968edbe8b', '148c3c93-a731-4cd4-bd3a-de4acae82d1b', 1, 1651561.00, 0.040, 10.00, 40.00, 30.00, 2, 'new user', 2, '2018-11-07 00:22:23', '2018-11-07 00:22:23', NULL);
INSERT INTO `wk_order` VALUES ('d053d43e-7b28-490c-8ec7-320a2c2a9d14', 'c2896645-ab6e-4813-88d6-662968edbe8b', '22b4f34e-827b-4dd0-af0d-15f7151b1dec', 2, 4651561.00, 0.040, 50.00, 10.00, 40.00, 3, '2018', 2, '2018-11-07 05:47:09', '2018-11-07 08:03:04', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');

SET FOREIGN_KEY_CHECKS = 1;
