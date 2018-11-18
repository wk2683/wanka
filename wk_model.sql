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

 Date: 18/11/2018 17:53:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
INSERT INTO `wk_model` VALUES ('24c2a625-18ab-495c-885b-ae06f539a1e9', '组织管理', NULL, '系统组织树结构', 80, '2018-11-05 21:01:05', '2018-11-05 21:01:05', NULL);
INSERT INTO `wk_model` VALUES ('5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡管理', NULL, '信用卡管理模块', 50, '2018-11-05 21:36:05', '2018-11-05 21:36:05', NULL);
INSERT INTO `wk_model` VALUES ('906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户管理', NULL, '客户管理，增删查改', 60, '2018-11-05 21:24:56', '2018-11-05 21:25:11', NULL);
INSERT INTO `wk_model` VALUES ('9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户管理', NULL, '资金账户管理模块', 69, '2018-11-05 21:41:13', '2018-11-05 21:41:13', NULL);
INSERT INTO `wk_model` VALUES ('b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工管理', NULL, '员工信息列表管理，增删查改', 70, '2018-11-05 21:05:17', '2018-11-05 21:05:17', NULL);
INSERT INTO `wk_model` VALUES ('b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单管理', NULL, '订单管理模块', 40, '2018-11-05 21:48:25', '2018-11-05 21:48:25', NULL);
INSERT INTO `wk_model` VALUES ('d56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色管理', NULL, '角色的增删查改', 100, '2018-11-05 21:03:16', '2018-11-05 21:03:16', NULL);
INSERT INTO `wk_model` VALUES ('df53b52b-676c-4b1b-b8ef-b5714a786bfe', '权限管理', NULL, '权限管理', 88, '2018-11-17 10:03:09', '2018-11-17 10:03:09', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_model` VALUES ('e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机管理', NULL, 'POS机管理，增删查改', 68, '2018-11-05 21:31:05', '2018-11-05 21:31:05', NULL);
INSERT INTO `wk_model` VALUES ('e6b68fac-8813-4f94-a214-bac807082585', '商户信息', NULL, '商户信息的管理', 1, '2018-11-17 09:14:32', '2018-11-17 09:14:32', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_model` VALUES ('f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块管理', NULL, '系统的各个模块定义', 90, '2018-11-05 20:45:11', '2018-11-05 20:45:11', NULL);
INSERT INTO `wk_model` VALUES ('fc24b001-e1a5-4968-94e2-19f51b627c9a', '银行管理', NULL, '银行管理-基础信息', 1, '2018-11-17 09:08:35', '2018-11-17 09:08:35', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');

SET FOREIGN_KEY_CHECKS = 1;
