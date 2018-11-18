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

 Date: 18/11/2018 17:52:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
