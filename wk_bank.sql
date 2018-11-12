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

 Date: 12/11/2018 08:44:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
INSERT INTO `wk_bank` VALUES ('aaaafaewffefef', '农业银行', '农行', 97, NULL);
INSERT INTO `wk_bank` VALUES ('aeffefaeffwefaf', '交通银行', '交行', 96, NULL);
INSERT INTO `wk_bank` VALUES ('awefwffewafef', '光大银行', '光大银行', 85, NULL);
INSERT INTO `wk_bank` VALUES ('fawffawefaewfe', '中国银行', '中行', 99, NULL);
INSERT INTO `wk_bank` VALUES ('fef51f5ew15fe', '中信银行', '中信银行', 1, NULL);
INSERT INTO `wk_bank` VALUES ('fewfvgregergg', '招商银行', '招行', 90, NULL);
INSERT INTO `wk_bank` VALUES ('fjaopjfaohfai', '中国邮政储蓄银行', '邮政银行', 1, NULL);
INSERT INTO `wk_bank` VALUES ('fjawoefjoijojife', '浦发银行', '浦发银行', 1, NULL);
INSERT INTO `wk_bank` VALUES ('fweafjawoefj', '民生银行', '民生银行', 75, NULL);
INSERT INTO `wk_bank` VALUES ('fwefpfmaweh', '桂中农村合作银行', '桂中农村合作银行', 1, NULL);
INSERT INTO `wk_bank` VALUES ('ifwaofjfijioejfp', '兴业银行', '兴业银行', 1, NULL);
INSERT INTO `wk_bank` VALUES ('jfoawjfijfejifejio', '柳州银行', '柳州银行', 80, NULL);
INSERT INTO `wk_bank` VALUES ('jfowejfifwefewf', '工商银行', '工行', 100, NULL);
INSERT INTO `wk_bank` VALUES ('ofijawofmowaj', '华夏银行', '华夏银行', 1, NULL);
INSERT INTO `wk_bank` VALUES ('ofiwaefowofoe', '建设银行', '建行', 98, NULL);

SET FOREIGN_KEY_CHECKS = 1;
