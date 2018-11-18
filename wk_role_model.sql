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

 Date: 18/11/2018 17:53:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'df53b52b-676c-4b1b-b8ef-b5714a786bfe');
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'e689a2b9-62d8-460f-819c-0ac53d041662');
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'e6b68fac-8813-4f94-a214-bac807082585');
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5');
INSERT INTO `wk_role_model` VALUES ('b8865e66-4a93-48a0-8a35-b3a8eb26045a', 'fc24b001-e1a5-4968-94e2-19f51b627c9a');
INSERT INTO `wk_role_model` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', '24c2a625-18ab-495c-885b-ae06f539a1e9');
INSERT INTO `wk_role_model` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', '906b3ac8-b30f-47c8-8454-641bd02d57b8');
INSERT INTO `wk_role_model` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33');
INSERT INTO `wk_role_model` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a');
INSERT INTO `wk_role_model` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051');
INSERT INTO `wk_role_model` VALUES ('f1c8eb9c-7f3f-4193-a8d6-4f7a498ad713', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5');

SET FOREIGN_KEY_CHECKS = 1;
