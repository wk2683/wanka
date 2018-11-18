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

 Date: 18/11/2018 17:53:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
INSERT INTO `wk_permission` VALUES ('0734d527-8522-4695-809d-9be7e12ad372', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '查角色下的模块', 'model/searchByRoleId', 'click', '查一个角色下的所有模块', 1, '2018-11-17 09:17:11', '2018-11-17 09:17:11', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('0823b3aa-6d77-4369-a5f5-3d816ab03ab1', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户搜索', 'customer/search', 'click', '客户搜索请求', 1, '2018-11-05 22:00:07', '2018-11-05 22:00:07', NULL);
INSERT INTO `wk_permission` VALUES ('084c0173-60d5-46cb-8960-815f7ef6dfc1', 'df53b52b-676c-4b1b-b8ef-b5714a786bfe', '权限搜索', 'permission/search', 'click', '权限搜索', 1, '2018-11-17 10:06:29', '2018-11-17 10:06:29', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('08ff9ea0-65fd-41f7-9dfd-b695177cd81a', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '设置订单为完成状态', 'order/updateStatus2', 'click', '设置订单为完成状态请求', 11, '2018-11-18 16:14:14', '2018-11-18 16:14:14', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('0a680f3c-024a-49f2-b69b-63016bca024d', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单管理页面', 'page/order_manager.html', 'page', '订单管理页面', 60, '2018-11-05 21:48:57', '2018-11-05 21:48:57', NULL);
INSERT INTO `wk_permission` VALUES ('0a909fd1-bcc9-4856-9d71-77bafca2d0e7', 'e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机新增', 'pos/add', 'click', 'POS机新增请求', 1, '2018-11-05 21:32:43', '2018-11-05 21:32:43', NULL);
INSERT INTO `wk_permission` VALUES ('0afeffce-4996-489a-bf6d-86a3d4121433', '24c2a625-18ab-495c-885b-ae06f539a1e9', '组织管理页面', 'page/org_manager.html', 'page', '组织树，增删查改', 1, '2018-11-05 21:01:51', '2018-11-05 21:01:51', NULL);
INSERT INTO `wk_permission` VALUES ('0cb23c16-f278-41a0-9084-b36fa57dc40b', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '上传图片', 'worker/uploadImg', 'click', '上传图片', 1, '2018-11-17 10:14:02', '2018-11-17 10:14:02', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('0d531637-c37b-4269-b502-a13ef97a5968', '24c2a625-18ab-495c-885b-ae06f539a1e9', '组织修改', 'org/update', 'click', '组织修改请求', 12, '2018-11-05 21:21:11', '2018-11-05 21:21:11', NULL);
INSERT INTO `wk_permission` VALUES ('0e268d53-d1be-4a51-a2e8-2a82f0aa84d2', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '出账搜索', 'orderExport/search', 'click', '出账搜索', 35, '2018-11-17 09:21:56', '2018-11-17 09:21:56', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('0e268d53-d1be-4a51-a2e8-2a82f0aa84da', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '入账搜索', 'orderImport/search', 'click', '入账搜索', 25, '2018-11-17 09:21:56', '2018-11-17 09:21:56', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('10b90ecb-fbc8-4bf4-a876-325aa30abf51', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '出账修改', 'orderExport/update', 'click', '出账修改', 33, '2018-11-17 09:20:08', '2018-11-17 09:20:08', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('10b90ecb-fbc8-4bf4-a876-325aa30abfcc', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '入账修改', 'orderImport/update', 'click', '入账修改', 23, '2018-11-17 09:20:08', '2018-11-17 09:20:08', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('15babab3-f142-4254-8001-3f0a195f784b', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '设置订单状态为操作完成', 'order/updateStatus4', 'click', '设置订单状态为操作完成的请求', 12, '2018-11-18 16:16:18', '2018-11-18 16:16:18', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('19a68cf4-4592-4785-a9e5-0b6b359a6a63', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单删除', 'order/delete', 'click', '订单删除请求', 42, '2018-11-05 21:54:35', '2018-11-17 09:24:50', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('205b3a33-40aa-41d2-8ec0-a1773111146d', 'df53b52b-676c-4b1b-b8ef-b5714a786bfe', '权限新增', 'permission/add', 'click', '权限新增请求', 35, '2018-11-17 10:04:22', '2018-11-17 10:04:22', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('207b9351-e4f0-40fe-bd3a-1fdc3a3eda45', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工查询', 'worker/get', 'click', '查询一个员工信息', 1, '2018-11-05 21:14:14', '2018-11-05 21:14:14', NULL);
INSERT INTO `wk_permission` VALUES ('24a81e8f-0f7b-489e-83b5-09e559b4e5d5', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '查角色下的模块和权限ID', 'role/getModelPermission', 'click', '查一个角色拥有的模块和权限的ID,用于过虑操作权限', 1, '2018-11-17 10:10:41', '2018-11-17 10:10:41', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('27e876d0-0182-4be9-9a3d-0e0ac0306744', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单搜索', 'order/search', 'click', '订单搜索请求', 43, '2018-11-05 21:55:20', '2018-11-17 09:25:30', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('2981fe45-a18e-4e07-9e72-3859bfd64b11', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单新增页面', 'page/order_add.html', 'page', '订单新增页面', 50, '2018-11-05 21:52:54', '2018-11-05 21:52:54', NULL);
INSERT INTO `wk_permission` VALUES ('29d3a02d-7bca-4195-a23c-ea8b443ceb75', 'e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机新增页面', 'page/pos_add.html', 'page', 'POS机新增填写页面', 18, '2018-11-05 21:32:16', '2018-11-05 21:33:48', NULL);
INSERT INTO `wk_permission` VALUES ('2db732bd-15f6-403f-bb66-1e97be1d31da', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工删除', 'worker/delete', 'click', '删除请求', 1, '2018-11-05 21:12:41', '2018-11-05 21:12:41', NULL);
INSERT INTO `wk_permission` VALUES ('2faf78a7-fa11-4f3b-9999-5869f14491f6', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块新增', 'model/add', 'click', '新增模块提交数据到后台的请求地址', 30, '2018-11-05 20:49:07', '2018-11-05 20:49:07', NULL);
INSERT INTO `wk_permission` VALUES ('34b41684-73c4-408c-8c30-0273a3268a48', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色查询', 'role/get', 'click', '角色查询请求', 11, '2018-11-05 21:23:07', '2018-11-05 21:23:07', NULL);
INSERT INTO `wk_permission` VALUES ('3528b554-2837-4127-ac39-4c8779c7b0c9', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户新增页面', 'page/customer_add.html', 'page', '客户新增页面', 25, '2018-11-05 21:26:44', '2018-11-05 21:27:11', NULL);
INSERT INTO `wk_permission` VALUES ('370c3f03-845c-4649-9954-3325716a807e', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块新增页面', 'page/model_add.html', 'page', '添加一个新模块页面', 40, '2018-11-05 20:47:18', '2018-11-05 20:47:40', NULL);
INSERT INTO `wk_permission` VALUES ('37a57edd-14c9-4541-88bc-784b06d740b6', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户管理页面', 'page/customer_manager.html', 'page', '客户管理页面,增删查改', 30, '2018-11-05 21:25:54', '2018-11-05 21:25:54', NULL);
INSERT INTO `wk_permission` VALUES ('37f3792e-b042-461f-81dd-bec5beae997f', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工新增页面', 'page/worker_add.html', 'page', '填写新加入员工信息页面', 28, '2018-11-05 21:06:25', '2018-11-05 21:16:31', NULL);
INSERT INTO `wk_permission` VALUES ('40464435-4dc8-4929-acc3-1d02db7d1227', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '读取照片', 'customer/readImg', 'click', '读取照片', 1, '2018-11-17 09:13:46', '2018-11-17 09:13:46', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('415a2360-1f48-4025-9051-303133b505fe', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '设置订单状态为业务中', 'order/updateStatus3', 'click', '设置订单状态为业务中的请求', 13, '2018-11-18 16:15:27', '2018-11-18 16:15:27', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('42f17cc2-e502-4603-a573-be82d689e760', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡管理页面', 'page/card_manager.html', 'page', '信用卡管理页面', 40, '2018-11-05 21:36:37', '2018-11-05 21:36:37', NULL);
INSERT INTO `wk_permission` VALUES ('4315f908-1041-40e8-87b2-575cef86079e', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工搜索', 'worker/search', 'click', '搜索出列表', 11, '2018-11-05 21:15:08', '2018-11-05 21:15:08', NULL);
INSERT INTO `wk_permission` VALUES ('439eef68-a4ee-42ed-aeeb-142c74da1a20', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单修改', 'order/update', 'click', '修改订单', 44, '2018-11-17 09:26:08', '2018-11-17 09:26:08', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('48ff4405-63e6-44d5-9253-945333459cfa', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡删除', 'card/delete', 'click', '信用卡删除请求', 1, '2018-11-05 21:38:14', '2018-11-05 21:38:14', NULL);
INSERT INTO `wk_permission` VALUES ('495f9c39-cdeb-4a58-81da-c3ae715d8035', 'e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机修改', 'pos/update', 'click', 'POS机修改', 1, '2018-11-05 21:33:08', '2018-11-05 21:33:08', NULL);
INSERT INTO `wk_permission` VALUES ('4a0912b6-6182-4ca0-9fbf-aac7925f622e', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块管理列表', 'page/model_manager.html', 'page', '显示所有的模块及模块对应的权限页面', 50, '2018-11-05 20:46:27', '2018-11-05 20:46:27', NULL);
INSERT INTO `wk_permission` VALUES ('4a1e2b2a-866f-4cc3-b37b-b855a730ad08', 'fc24b001-e1a5-4968-94e2-19f51b627c9a', '加载银行列表', 'bank/load', 'click', '加载所有银行信息请求', 1, '2018-11-17 09:09:58', '2018-11-17 09:09:58', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('541497b1-a4f5-430e-af5e-78d207070db2', 'df53b52b-676c-4b1b-b8ef-b5714a786bfe', '权限删除', 'permission/delete', 'click', '权限删除', 1, '2018-11-17 10:04:57', '2018-11-17 10:04:57', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('54708a9b-453f-492c-adb7-8b84b09b5d6c', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '出账查询', 'orderExport/get', 'click', '读取一个出账信息', 34, '2018-11-17 09:20:57', '2018-11-17 09:20:57', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('54708a9b-453f-492c-adb7-8b84b09b5dbb', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '入账查询', 'orderImport/get', 'click', '读取一个入账信息', 24, '2018-11-17 09:20:57', '2018-11-17 09:20:57', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('5575b044-3603-4cee-aec4-9b12380c6df5', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块查询', 'model/search', 'click', '请求后台加载整个模块', 1, '2018-11-12 08:23:17', '2018-11-12 08:23:17', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('5b9f3ef1-19dc-48d1-9f53-4db964bf4739', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工详情信息', 'page/worker_detail.html', 'click', '详细信息页面，只可查看', 24, '2018-11-05 21:09:15', '2018-11-05 21:16:50', NULL);
INSERT INTO `wk_permission` VALUES ('5d310b96-1c7b-4472-90c6-47ecbcf2eb44', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色管理页面', 'page/role_manager.html', 'page', '角色的增删查改', 1, '2018-11-05 21:03:58', '2018-11-05 21:03:58', NULL);
INSERT INTO `wk_permission` VALUES ('5e72ded9-78b4-42a9-bb67-9e06b80f32ef', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户搜索', 'account/search', 'click', '资金账户信息搜索请求', 1, '2018-11-05 21:46:50', '2018-11-05 21:46:50', NULL);
INSERT INTO `wk_permission` VALUES ('60924bf9-862c-4ae5-9e19-fcaf90864a22', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户新增', 'customer/add', 'click', '客户新增请求', 10, '2018-11-05 21:27:49', '2018-11-05 21:27:49', NULL);
INSERT INTO `wk_permission` VALUES ('60ca75cd-45ec-4e36-b606-5618125f40db', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工修改页面', 'page/worker_update.html', 'page', '填写修改员工信息页面', 26, '2018-11-05 21:10:56', '2018-11-05 21:16:42', NULL);
INSERT INTO `wk_permission` VALUES ('616f5d45-8867-4023-9b5e-c3e11945494c', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单查询', 'order/get', 'click', '查询一个订单信息', 45, '2018-11-17 09:26:57', '2018-11-17 09:26:57', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('67156751-2c71-4ffa-bd2a-a440b81b99fa', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '上传图片', 'customer/uploadImg', 'click', '上传照片', 1, '2018-11-17 09:13:02', '2018-11-17 09:13:02', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('721470d6-8325-47b5-a0e1-e6ada4b0a5c7', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡修改', 'card/update', 'click', '信用卡修改', 1, '2018-11-05 21:38:43', '2018-11-05 21:38:43', NULL);
INSERT INTO `wk_permission` VALUES ('72da503e-9dc2-4f0b-b9d7-01307ef48afe', 'e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机管理页面', 'page/pos_manager.html', 'page', 'POS机管理页面', 20, '2018-11-05 21:31:39', '2018-11-05 21:31:39', NULL);
INSERT INTO `wk_permission` VALUES ('73730215-3a0d-41c5-a3f9-1718b965a4e2', 'df53b52b-676c-4b1b-b8ef-b5714a786bfe', '权限查询', 'permission/get', 'click', '权限查询请求', 1, '2018-11-17 10:05:59', '2018-11-17 10:05:59', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('785eaa24-48da-4a5b-97d6-baaebe89c146', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块删除', 'model/delete', 'click', '删除请求后台地址', 33, '2018-11-05 20:56:39', '2018-11-05 20:56:39', NULL);
INSERT INTO `wk_permission` VALUES ('79e8b4ab-b3f8-4b9b-82b7-aff783db3ce4', 'fc24b001-e1a5-4968-94e2-19f51b627c9a', '银行新增', 'bank/add', 'click', '添加银行请求', 1, '2018-11-17 09:09:14', '2018-11-17 09:09:14', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('7a5be87d-0203-47de-b3e4-bd81e6c2e963', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户修改', 'account/update', 'click', '资金账户修改', 1, '2018-11-05 21:45:38', '2018-11-05 21:45:38', NULL);
INSERT INTO `wk_permission` VALUES ('8151b8eb-b266-4b3c-a2f4-4f8eb9fd6ffd', '24c2a625-18ab-495c-885b-ae06f539a1e9', '组织删除', 'org/delete', 'click', '组织删除', 13, '2018-11-05 21:21:34', '2018-11-05 21:21:34', NULL);
INSERT INTO `wk_permission` VALUES ('86da73e7-c991-41c2-a2a9-423e5ea582da', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户信息修改', 'customer/update', 'click', '客户信息修改请求', 11, '2018-11-05 21:29:37', '2018-11-05 21:29:37', NULL);
INSERT INTO `wk_permission` VALUES ('8e0685f7-1619-44cf-8aaf-13322418eb24', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户新增', 'account/add', 'click', '资金账户新增请求', 1, '2018-11-05 21:44:48', '2018-11-05 21:44:48', NULL);
INSERT INTO `wk_permission` VALUES ('8eebc6ca-7a36-4c6e-8eb6-b08bce6283ab', '24c2a625-18ab-495c-885b-ae06f539a1e9', '组织查询', 'org/get', 'click', '组织查询', 14, '2018-11-05 21:22:04', '2018-11-05 21:22:04', NULL);
INSERT INTO `wk_permission` VALUES ('8f17cf99-4518-416e-98a5-a7c4f0653954', 'e6b68fac-8813-4f94-a214-bac807082585', '商户新增', 'mall/add', 'click', '商户新增请求', 1, '2018-11-17 09:15:02', '2018-11-17 09:15:02', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('9570f4b8-4320-411a-9017-7b65eab7881d', 'e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机搜索', 'pos/search', 'click', 'POS机搜索', 1, '2018-11-05 21:34:31', '2018-11-05 21:34:31', NULL);
INSERT INTO `wk_permission` VALUES ('990c3ec0-5740-4717-9d8c-03bc80b7bf07', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡搜索', 'card/search', 'click', '信用卡搜索', 1, '2018-11-05 21:40:14', '2018-11-05 21:40:14', NULL);
INSERT INTO `wk_permission` VALUES ('9c37b33b-98cd-4c0d-a88f-49c20e785f3f', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户查询', 'customer/get', 'click', '客户查询请求', 1, '2018-11-05 21:59:42', '2018-11-05 21:59:42', NULL);
INSERT INTO `wk_permission` VALUES ('a0e92d37-dbe6-4d5c-8731-ea234a6bad03', '24c2a625-18ab-495c-885b-ae06f539a1e9', '组织搜索', 'org/search', 'click', '组织搜索', 15, '2018-11-05 21:22:30', '2018-11-05 21:22:30', NULL);
INSERT INTO `wk_permission` VALUES ('a1f4782a-91b6-4a13-9bfb-7bcacb9bb7ed', '906b3ac8-b30f-47c8-8454-641bd02d57b8', '客户删除', 'customer/delete', 'click', '客户删除请求', 1, '2018-11-05 21:59:17', '2018-11-05 21:59:17', NULL);
INSERT INTO `wk_permission` VALUES ('a22ad731-3aea-471f-9f6f-77c736c569cb', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡新增页面', 'page/card_add.html', 'page', '信用卡管理新增页面', 38, '2018-11-05 21:37:10', '2018-11-05 21:37:10', NULL);
INSERT INTO `wk_permission` VALUES ('a26be0a3-a9b2-4c98-8884-d0c95c20c4af', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '出账删除', 'orderExport/delete', 'click', '删除出账', 32, '2018-11-17 09:19:38', '2018-11-17 09:19:38', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('a26be0a3-a9b2-4c98-8884-d0c95c20c4ff', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '入账删除', 'orderImport/delete', 'click', '删除入账', 22, '2018-11-17 09:19:38', '2018-11-17 09:19:38', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('a51ccb15-0b06-4e91-b42d-89047e488412', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡新增', 'card/add', 'click', '信用卡管理新增', 1, '2018-11-05 21:37:32', '2018-11-05 21:37:32', NULL);
INSERT INTO `wk_permission` VALUES ('a56c42d9-3fd3-4ed1-85b1-fd5274b74e9e', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '信用卡查询', 'card/get', 'click', '信用卡管理查询', 1, '2018-11-05 21:39:54', '2018-11-05 21:39:54', NULL);
INSERT INTO `wk_permission` VALUES ('a5a10ec2-0bdc-4b93-ac2c-fc83babc7353', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户新增页面', 'page/account_add.html', 'page', '资金账户新增页面', 40, '2018-11-05 21:42:51', '2018-11-05 21:42:51', NULL);
INSERT INTO `wk_permission` VALUES ('aaed2985-5c30-444c-bad9-9c21bc2072cf', 'e6b68fac-8813-4f94-a214-bac807082585', '商户加载', 'mall/load', 'click', '加载所有商户信息', 1, '2018-11-17 09:15:34', '2018-11-17 09:15:34', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('ab2142fb-a20d-4255-9aa9-0440e23d03e3', '24c2a625-18ab-495c-885b-ae06f539a1e9', '组织新增', 'org/add', 'click', '组织新增请求', 10, '2018-11-05 21:20:45', '2018-11-05 21:20:45', NULL);
INSERT INTO `wk_permission` VALUES ('ae559f35-73a8-44fe-969c-1bfd1a46ad30', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色新增', 'role/add', 'click', '角色新增请求', 10, '2018-11-05 21:18:21', '2018-11-05 21:18:21', NULL);
INSERT INTO `wk_permission` VALUES ('b1fc9f68-0857-4b50-bc1b-44273771dc07', '5ca012d4-942b-46e7-9fa1-d4b500f51cb7', '锁定与解锁', 'card/lock', 'click', '锁定与解锁信用卡，为一次只能有一个人操作', 1, '2018-11-17 09:11:02', '2018-11-17 09:11:02', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('b8e4a5cf-2b28-4884-b7af-f14bba82b539', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工修改', 'worker/update', 'click', '修改后台 请求地址', 1, '2018-11-05 21:11:34', '2018-11-05 21:11:34', NULL);
INSERT INTO `wk_permission` VALUES ('b92b48d3-1c27-4cef-ac38-1d0a66e54988', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '订单新增', 'order/add', 'click', '订单新增请求', 41, '2018-11-17 09:24:35', '2018-11-17 09:24:35', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('bd43a25c-9a2e-46cd-b10d-ed9d18fb355c', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色删除', 'role/delete', 'click', '角色删除请求', 11, '2018-11-05 21:19:20', '2018-11-05 21:19:20', NULL);
INSERT INTO `wk_permission` VALUES ('c2ace550-9ee8-41fe-98cd-b29a6ee4aa9f', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户查询', 'account/get', 'click', '资金账户查询', 1, '2018-11-05 21:46:04', '2018-11-05 21:46:04', NULL);
INSERT INTO `wk_permission` VALUES ('c8cdb2b7-4c95-451a-a91c-5ca55b258cc0', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块修改', 'model/update', 'click', '提交修改数据到后台的请求地址', 31, '2018-11-05 20:55:08', '2018-11-05 20:55:08', NULL);
INSERT INTO `wk_permission` VALUES ('cab276d8-1c6d-43cd-b938-fdac0cfdc2de', 'df53b52b-676c-4b1b-b8ef-b5714a786bfe', '查询角色下的权限', 'permission/getUserActionInRole', 'click', '查询角色下的权限,只返回action字段', 1, '2018-11-17 10:07:39', '2018-11-17 10:07:39', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('cc09e43b-a2ce-4bc7-9a5e-d336dba260c4', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色搜索', 'role/search', 'click', '角色搜索请求', 12, '2018-11-05 21:23:43', '2018-11-05 21:23:43', NULL);
INSERT INTO `wk_permission` VALUES ('d42892ee-e813-4f8f-bef8-2fe1fccd24b8', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '角色修改', 'role/update', 'click', '角色修改请求', 12, '2018-11-05 21:19:57', '2018-11-05 21:19:57', NULL);
INSERT INTO `wk_permission` VALUES ('d7febddf-16aa-4259-b102-d12e162387b9', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工管理页面', 'page/worker_manager.html', 'page', '员工管理页面，可增删查改', 30, '2018-11-05 21:07:14', '2018-11-05 21:16:09', NULL);
INSERT INTO `wk_permission` VALUES ('da198f37-7cd5-4ee7-8bec-f7c71a7e4370', 'e689a2b9-62d8-460f-819c-0ac53d041662', 'POS机查询', 'pos/get', 'click', 'POS机查询', 1, '2018-11-05 21:34:11', '2018-11-05 21:34:11', NULL);
INSERT INTO `wk_permission` VALUES ('dd6d125c-9ddd-4d92-8b51-ecc1ef557d8c', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '读取图片', 'worker/readImg', 'click', '读取图片流', 1, '2018-11-17 10:14:48', '2018-11-17 10:14:48', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('e1fff5a3-a2d7-4506-8471-82a20c1be973', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户删除', 'account/delete', 'click', '资金账户删除请求', 1, '2018-11-05 21:45:12', '2018-11-05 21:45:12', NULL);
INSERT INTO `wk_permission` VALUES ('e4400e17-fd9a-4cf6-ba5e-e24cb50f02e8', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '添加权限', 'role/selectPermission', 'click', '给角色添加权限', 1, '2018-11-18 16:21:20', '2018-11-18 16:30:30', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('e4af84e7-3642-4229-8c57-c10bdfb23f28', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '出账新增', 'orderExport/add', 'click', '新记一条出账', 31, '2018-11-17 09:18:38', '2018-11-17 09:18:38', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('e4af84e7-3642-4229-8c57-c10bdfb23f88', 'b681f67b-75dc-4734-9479-aa7fdfa4ec3a', '入账新增', 'orderImport/add', 'click', '新记一条入账', 21, '2018-11-17 09:18:38', '2018-11-17 09:18:38', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('e944b0df-db76-460b-acaf-aefa3061638f', 'df53b52b-676c-4b1b-b8ef-b5714a786bfe', '权限修改', 'permission/update', 'click', '权限修改请求', 1, '2018-11-17 10:05:29', '2018-11-17 10:05:29', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('f2559fdd-68e4-4894-b0b4-405b014021ec', 'f8d99f8e-fd37-4f7f-b732-7a56e5d028a5', '模块修改页面', 'page/model_update.html', 'click', '填写修改模块信息页面', 39, '2018-11-05 20:50:18', '2018-11-05 20:58:24', NULL);
INSERT INTO `wk_permission` VALUES ('f6d2315e-d2cb-4762-9412-f55563fbd1ef', '9ff50792-b092-4f1e-b5b9-9dce75651eff', '资金账户管理页面', 'page/account_manager.html', 'page', '资金账户管理页面', 50, '2018-11-05 21:42:17', '2018-11-05 21:42:17', NULL);
INSERT INTO `wk_permission` VALUES ('f915b2e9-3187-4653-afb2-6377acca3032', 'd56a4fa3-0e85-4600-b9ad-b585a9cd4051', '取消权限', 'role/unselectPermission', 'click', '取消一个权限', 1, '2018-11-18 16:30:10', '2018-11-18 16:30:10', 'b78c71ea-0051-44cc-9bd3-e021b0e1d16d');
INSERT INTO `wk_permission` VALUES ('fe15c1a7-d2ca-48be-8850-dc6e19fc7ceb', 'b34bd8ad-48c6-452d-b743-b9cb8835ac33', '员工新增', 'worker/add', 'click', '新增请求地址', 1, '2018-11-05 21:08:38', '2018-11-05 21:08:38', NULL);

SET FOREIGN_KEY_CHECKS = 1;
