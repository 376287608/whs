/*
Navicat MySQL Data Transfer

Source Server         : whs
Source Server Version : 50557
Source Host           : 10.4.31.61:3306
Source Database       : whs

Target Server Type    : MYSQL
Target Server Version : 50557
File Encoding         : 65001

Date: 2017-11-03 21:01:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for approval_form
-- ----------------------------
DROP TABLE IF EXISTS `approval_form`;
CREATE TABLE `approval_form` (
  `id` varchar(32) NOT NULL COMMENT '序号',
  `business_id` int(11) NOT NULL COMMENT '业务序号',
  `business_name` varchar(255) NOT NULL COMMENT '业务名称',
  `apply_code` varchar(255) DEFAULT NULL COMMENT '申请单位代码',
  `apply_credit_code` varchar(255) DEFAULT NULL COMMENT '申请单位统一社会信用代码',
  `apply_org_code` varchar(255) DEFAULT NULL COMMENT '申请单位组织机构代码',
  `apply_name` varchar(255) NOT NULL COMMENT '申请单位/个人名称',
  `contact_name` varchar(255) DEFAULT NULL COMMENT '联系人名称 申办人姓名',
  `contact_tele` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `contact_mail` varchar(255) DEFAULT NULL COMMENT '联系邮箱',
  `contact_address` varchar(255) DEFAULT NULL COMMENT '邮寄地址',
  `notice_get` char(1) DEFAULT NULL COMMENT '通知获取方式',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `apply_by` varchar(255) DEFAULT NULL COMMENT '申请人',
  `submit_time` datetime DEFAULT NULL COMMENT '提交日期',
  `reason_desc` varchar(255) DEFAULT NULL COMMENT '申请原因描述',
  `complete_time` datetime DEFAULT NULL COMMENT '材料齐备时间',
  `apply_time` datetime DEFAULT NULL COMMENT '业务申请时间',
  `statu_company` varchar(255) DEFAULT NULL COMMENT '单据状态',
  `statu_bank` varchar(255) DEFAULT NULL COMMENT '审核状态',
  `modify_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `recieve_time` datetime DEFAULT NULL COMMENT '接收时间',
  `form_code` varchar(255) DEFAULT NULL COMMENT '表单单号',
  `assign_receive` varchar(255) DEFAULT NULL COMMENT '指定接收人',
  `finish_user` varchar(255) DEFAULT NULL COMMENT '办结人员',
  `finish_time` datetime DEFAULT NULL COMMENT '办结时间',
  `finish_result` varchar(255) DEFAULT NULL COMMENT '办结结论',
  `accept_time` datetime DEFAULT NULL COMMENT '受理时间',
  `accept_result` varchar(255) DEFAULT NULL COMMENT '受理结论',
  `isfinish` char(1) DEFAULT NULL COMMENT '是否办结',
  `receive_by` varchar(255) DEFAULT NULL COMMENT '实际接收人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_form
-- ----------------------------
INSERT INTO `approval_form` VALUES ('01a23279f9584f47be6548baaafb7b29', '16', '境内机构境外放款变更', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 19:51:00', '600001760', null, null, null, null, '待接收', null, '600001760', '2017-11-02 19:53:12', null, '20171102195100530', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('037473116c5a40f283270d8125cb8633', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', '', 'dsf2q342423r432r4', 'sar2r423rwfeassadf', 'asdfsadfsadfs', '1', '2017-10-31 17:37:49', '600001760', null, null, null, null, '未提交', null, null, '2017-10-31 17:37:49', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('067e8d19802f45f089111789a2996a1d', '24', '内保外贷签约登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 14:13:45', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 14:13:45', null, '20171102141345789', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('07edd7b54abf4abba5375ff468e654e9', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-11-01 20:17:54', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-01 20:17:54', null, '20171101201754971', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('0b06bc7271384aeaa437775898e71035', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 15:25:59', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 15:25:59', null, '20171102152559818', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('0db2749a6cae4ca6aae8a29bd5c6b141', '68', 'B/C类企业在监管期内发生的30天（不含）以上的延期收款现场报告', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 16:52:35', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 16:52:35', null, '20171102165235963', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('10c3d54e7ab5415d91a632916c7a42ad', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-11-01 20:51:31', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-01 20:51:31', null, '20171101205131390', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('122c6510fb6e484ea70d796cb487f6be', '81', '非银行债务人办理外债签约登记（全口径）', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 17:46:55', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 18:12:12', null, '20171102174655226', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('13edf8bf71bd4729ab63cb0587b3f640', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-11-01 18:46:16', '2', null, null, null, null, '待提交', null, null, '2017-11-01 18:46:16', null, '20171101184616398', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('17033738db84468f967c60e30db29a3f', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 16:11:15', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 16:11:15', null, '20171102161115675', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('17a41559de0e4a0ebda33f8dad7d6b93', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 14:51:02', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 14:51:02', null, '20171102145102676', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('18e40164a6d84204a4f2c566dba5cdf3', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-10-31 21:13:11', '600001760', null, null, null, null, '被退回', null, null, '2017-10-31 21:13:11', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('19b3b099d2424b98b0da80a4434ebead', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 17:01:30', '600001760', null, null, null, null, '已补正', null, '600001760', '2017-11-03 18:18:05', null, '20171103170130416', null, null, null, null, null, null, null, null);
INSERT INTO `approval_form` VALUES ('1c0e8c184f2b43f59ad30883a5711034', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 13:53:23', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-03 13:53:23', null, '20171103135323237', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('22f03c7d218c4c3d88ea6e6c17b4a0b2', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-10-31 21:12:36', '600001760', null, null, null, null, '未提交', null, null, '2017-10-31 21:12:36', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('24aa68f24da24699a451e77edb4a73ac', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 15:28:50', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 15:28:50', null, '20171102152850043', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('24dfcd628ef646dabc3454c05ca4f281', '18', '中关村国家自主创新示范区境外并购外汇管理试点业务登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 11:02:39', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 11:02:39', null, '20171102110239104', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('26e13fc955314cefa59188826c8c946a', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-10-31 21:12:54', '600001760', null, null, null, null, '已提交', null, null, '2017-10-31 21:12:54', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('2d1dd832837b466ebb90038c1955a1e1', '24', '内保外贷签约登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 14:13:59', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 14:13:59', null, '20171102141359320', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('2e5932172e74474bb4e2be2496b1b840', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 16:32:02', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 16:32:02', null, '20171102163202071', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('3841a0d8a88a49deb04beee31b8feaa9', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '0', '2017-10-31 16:36:24', '600001760', null, null, null, null, '已提交', null, null, '2017-10-31 16:36:24', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('3887c58867964cca8f231f2463cb46ee', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 13:40:58', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-03 13:52:37', null, '20171103134054939', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('38e8b2622dd24132b8c7515673ce9f84', '31', '境外上市变更登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 19:07:54', '600001760', null, null, null, null, '办理中(补正)', null, '600001760', '2017-11-03 20:25:32', null, '20171103190754114', null, null, null, null, null, null, null, null);
INSERT INTO `approval_form` VALUES ('3b7642abc1ae4c3f8cd7a758b6d4d486', '81', '非银行债务人办理外债签约登记（全口径）', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 19:46:56', '600001760', null, null, null, null, '待接收', null, '600001760', '2017-11-02 19:49:40', null, '20171102194656362', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('3c13d11091814d25b1518da2dbeb0a98', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-11-01 19:44:04', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-01 19:44:04', null, '20171101194404775', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('3c1926d74f1646958bd9e3ebd6512bfc', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 10:10:46', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 10:10:46', null, '20171102101046341', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('3dcc24ac8c2e436386b2cc65952f962d', '18', '中关村国家自主创新示范区境外并购外汇管理试点业务登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 16:08:39', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 16:08:39', null, '20171102160839645', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('40c67a2f3ac74273af28a8b79a934f3e', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-10-31 17:37:03', 'admin', null, null, null, null, '已提交', null, null, '2017-10-31 17:37:03', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('4222e871b4f147eeaad6c8abdb9fe51b', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-11-01 19:59:54', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-01 19:59:54', null, '20171101195954643', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('46ff69a920db4d0380405c9050916e25', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 16:16:35', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 16:16:35', null, '20171102161635343', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('4b82371420fa4f6ba2364ef27fef911d', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 19:17:58', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 19:18:39', null, '20171102191758884', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('4dc5111f71eb4cc4a7ea4dff2d5ec695', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '0', '2017-10-30 20:45:08', '600001760', null, null, null, null, '待接收', null, null, '2017-10-30 20:45:08', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('5b0ae10062e24b5b822337618cba8361', '24', '内保外贷签约登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 14:11:10', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 14:11:10', null, '20171102141110941', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('5c49a8a467fd4ddd95ca3859e804f0b7', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 14:20:50', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 14:20:50', null, '20171102142050971', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('5e04b8f4312a46918206cd7bf476258c', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-11-30 17:36:58', '600001760', null, null, null, null, '办理中', null, null, '2017-10-31 17:36:58', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('6696c263668f40b1a8c50f9f31d36d20', '18', '中关村国家自主创新示范区境外并购外汇管理试点业务登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 15:25:22', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 15:25:22', null, '20171102152522050', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('66f2fd3314a44fceb8fcbe0e27f55c26', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 14:20:24', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 14:20:24', null, '20171102142024104', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('68a070a7d421432abb4d172844ca5144', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 17:07:59', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 17:07:59', null, '20171102170759784', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('69a92508182548149d909683dd59c38f', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 16:31:26', '600001760', null, null, null, null, '待终止', null, '600001760', '2017-11-03 16:31:26', null, '20171103163126948', null, null, null, null, null, null, null, null);
INSERT INTO `approval_form` VALUES ('753731a5e9fb4ad49e6b7cc98078034e', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 16:18:11', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 16:18:11', null, '20171102161811244', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('77e00b02e44a44eaa69097e75c607777', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '0', '2017-10-31 16:25:10', '600001760', null, null, null, null, '处理中', null, null, '2017-10-31 16:25:10', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('78616af189f14c258c3178364a1493d7', '16', '境内机构境外放款变更', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-10-31 19:38:59', '600001760', null, null, null, null, '已办结', null, null, '2017-10-31 19:38:59', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('7a58962472994c1fb2519a3973eb1ab2', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'asdfsadfsadf23r4e', '2wfdsa', 'sar2r423rwfeassadf', 'asdfsadfsadfs', '1', '2017-10-31 17:37:54', '600001760', null, null, null, null, '已补正', null, null, '2017-10-31 17:37:54', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('8afa49c3b1f24bbfbc59f632d958a310', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-11-01 18:55:03', '600001760', null, null, null, null, '待提交', null, null, '2017-11-01 18:55:03', null, '20171101185503403', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('9020f73a179e4174b70716667747e19c', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '', '', '', '', '1', '2017-11-03 20:49:27', '600001760', '2017-11-03 00:00:00', null, '2017-11-03 20:49:30', null, '待终止', null, '600001760', '2017-11-03 20:49:27', null, '20171103204930489', 'changly', null, null, null, null, null, null, 'majq');
INSERT INTO `approval_form` VALUES ('917e2c405e9146f49e1d9f4c9c074c00', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 15:06:34', '600001760', '2017-11-03 00:00:00', null, '2017-11-03 15:06:49', null, '已办结', null, '600001760', '2017-11-03 15:06:34', null, '20171103150649558', '', null, null, null, null, null, null, null);
INSERT INTO `approval_form` VALUES ('919212b5a18e47bea3f73df14601a572', '84', '非银行债务人办理外债签约变更（全口径）', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 18:35:31', '600001760', null, null, null, null, '待接收', null, '600001760', '2017-11-02 18:35:31', null, '20171102183531511', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('92e2585c3fc8470ba782ee14136eae31', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 16:46:08', '600001760', null, null, null, null, '已补正', null, '600001760', '2017-11-03 16:46:08', null, '20171103164608281', null, null, null, null, null, null, null, null);
INSERT INTO `approval_form` VALUES ('93589f50c7284300a86bb6a651701a51', '81', '非银行债务人办理外债签约登记（全口径）', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 18:13:30', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 18:20:15', null, '20171102181330566', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('949e12018acd4a658433ce54a9721219', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-11-01 14:56:32', '600001760', null, null, null, null, '已办结', null, null, '2017-11-01 14:56:32', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('96fd88a3fb3a4b72902f389e154cd8c0', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 15:07:57', '600001760', '2017-11-03 00:00:00', null, '2017-11-03 15:08:40', null, '已办结', null, '600001760', '2017-11-03 15:08:38', null, '20171103150840640', '', null, null, null, null, null, null, null);
INSERT INTO `approval_form` VALUES ('97609ac262f54b72b6206bfb6f782acb', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 15:24:24', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 15:24:24', null, '20171102152424935', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('97813a389c0f4bfa88da45074975724c', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-10-31 17:37:21', '600001760', null, null, null, null, '已撤销', null, null, '2017-10-31 17:37:21', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('9c4fbfd084c8458b8ef7874e8bd88332', '22', '非银行债务人办理非资金划转类提款备案', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 18:48:10', '600001760', null, null, null, null, '办理中(补正)', null, '600001760', '2017-11-03 18:48:10', null, '20171103184810260', null, null, null, null, null, null, null, null);
INSERT INTO `approval_form` VALUES ('9e0a8227d90b4566b5f36632aeae8142', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 16:22:07', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 16:22:27', null, '20171102162207549', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('9f9a0d13767e4f01a628ea074bccbab3', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-10-31 16:52:52', '600001760', null, null, null, null, '已终止', null, null, '2017-10-31 16:52:52', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('a0b966fbe6164b5592d1f4ade6eb34ea', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '0', '2017-11-03 14:06:43', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-03 14:07:35', null, '20171103140643777', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('a0d42ac44ff6403caef9f805295859c6', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 15:42:11', '600001760', '2017-11-03 00:00:00', null, '2017-11-03 15:43:14', null, '办理中(补正)', null, '600001760', '2017-11-03 15:43:11', null, '20171103154315345', 'majq', null, null, null, null, null, null, 'majq');
INSERT INTO `approval_form` VALUES ('a1aa112ec55642ba82620d7b6f6d2808', '81', '非银行债务人办理外债签约登记（全口径）', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 17:10:02', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 17:10:02', null, '20171102171002466', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('a3a45aba36084c53b9b7a5217e0ed91a', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 14:25:01', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 14:25:01', null, '20171102142501648', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('a575417f793c4f3aa306c5226aefc3fd', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 14:24:40', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 14:24:40', null, '20171102142440907', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('b3007d8f6d01440faa788205a1116593', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '', '', '', '', '1', '2017-11-03 20:48:02', '600001760', null, null, null, null, '办理中', null, '600001760', '2017-11-03 20:48:02', null, '20171103204741456', null, null, null, null, null, null, null, null);
INSERT INTO `approval_form` VALUES ('b7e4f0ee2d4b456188284255467604a3', '31', '境外上市变更登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 17:58:43', '600001760', null, null, null, null, '已补正', null, '600001760', '2017-11-03 18:02:28', null, '20171103175843471', null, null, null, null, null, null, null, null);
INSERT INTO `approval_form` VALUES ('ba017bb389254980917ae675bbd4e061', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 14:44:28', '600001760', '2017-11-03 00:00:00', null, null, null, '已办结', null, '600001760', '2017-11-03 18:18:30', null, '20171103144428041', null, null, null, null, null, null, null, 'majq');
INSERT INTO `approval_form` VALUES ('bc86870897ab43b99706c558acedd915', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '0', '2017-11-03 14:04:56', '600001760', null, null, null, null, '待接收', null, '600001760', '2017-11-03 14:04:56', null, '20171103140456728', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('be084b6ac8534286a8e68840ce815353', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 18:54:15', '600001760', null, null, null, null, '待接收', null, '600001760', '2017-11-02 18:54:15', null, '20171102185415112', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('be6c515aa089429fbb5bf00d4be8a1b8', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-11-01 14:54:13', '600001760', null, null, null, null, '已终止', null, null, '2017-11-01 14:54:13', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('c083fbe8bbc4436485c565683ed21dce', '81', '非银行债务人办理外债签约登记（全口径）', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 19:24:26', '600001760', null, null, null, null, '待接收', null, '600001760', '2017-11-02 19:25:18', null, '20171102192426421', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('c1561aadbb1549efa2083d818d47f17b', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 20:18:09', '600001760', null, null, null, null, '待接收', null, '600001760', '2017-11-02 20:26:06', null, '20171102201809505', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('c355ae20e59247d9863affa024812073', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 10:59:09', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 10:59:09', null, '20171102105909898', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('c80ff356a489450d92a369b9035e003f', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 14:17:32', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-03 14:17:32', null, '20171103141732197', null, null, null, null, null, null, null, 'majq');
INSERT INTO `approval_form` VALUES ('c9d1efef5100459ca0cbb8f59e103243', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 16:14:50', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 16:14:50', null, '20171102161450162', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('cce53f82809646ff846c48f4bb056690', '80', '非银行债务人办理外债签约登记（投注差）', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 18:34:08', '600001760', null, null, null, null, '待接收', null, '600001760', '2017-11-02 18:34:08', null, '20171102183408750', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('cfa87d5d03c044d0861f9c80b17f8c59', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-11-01 14:52:38', '600001760', null, null, null, null, '待终止', null, null, '2017-11-01 14:52:38', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('d4be2cda0cb746b59b3cfef61844ee09', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 15:41:27', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 15:41:27', null, '20171102154127147', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('d5429cbd7ac941789fe574294562f813', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 16:32:24', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 16:32:24', null, '20171102163224326', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('dcefc6c37f044b7f8c291faa889b6903', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 16:18:03', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 16:18:03', null, '20171102161803115', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('defcfc06e0f0416bae32f7f5dfc88a38', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 16:45:50', '600001760', null, null, null, null, '已补正', null, '600001760', '2017-11-03 16:45:50', null, '20171103164550009', null, null, null, null, null, null, null, null);
INSERT INTO `approval_form` VALUES ('df177edf08494d6c91d165e24545dc17', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-11-01 19:46:14', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-01 19:46:14', null, '20171101194614266', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('e2026bc732de495d94b87730429feb8f', '81', '非银行债务人办理外债签约登记（全口径）', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 20:06:04', '600001760', null, null, null, null, '待接收', null, '600001760', '2017-11-02 20:13:44', null, '20171102200604374', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('e499b7c56116490bb9b7e41c90fd5d2b', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 14:28:00', '600001760', null, null, null, null, '待提交', null, '600001760', '2017-11-02 14:28:00', null, '20171102142800252', null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('e8f0d70e196a4137a87f4941ab1f21b9', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 14:25:13', '600001760', '2017-11-03 00:00:00', null, '2017-11-03 14:25:22', null, '待提交', null, '600001760', '2017-11-03 14:25:21', null, '20171103142522044', '', null, null, null, null, null, null, 'majq');
INSERT INTO `approval_form` VALUES ('edcde1ee3cec4797904c3ce4088715c9', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 16:45:33', '600001760', null, null, null, null, '被退回', null, '600001760', '2017-11-03 16:45:33', null, '20171103164533519', null, null, null, null, null, null, null, null);
INSERT INTO `approval_form` VALUES ('f22b7485f1084e159fbd839680977150', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-10-31 19:12:58', '600001760', null, null, null, null, '已终止', null, null, '2017-10-31 19:12:58', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('f538fdcd562a45bdb2448432ccd6a45a', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司', 'test', '', '', '', '1', '2017-10-31 21:13:40', '600001760', null, null, null, null, '已终止', null, null, '2017-10-31 21:13:40', null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `approval_form` VALUES ('f784cccca4134d65988d7bf8ac785cdd', '15', '境内机构境外放款额度登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-03 14:28:14', '600001760', '2017-11-03 00:00:00', null, null, null, '已办结', null, '600001760', '2017-11-03 14:28:14', null, '20171103142814178', null, null, null, null, null, null, null, 'majq');
INSERT INTO `approval_form` VALUES ('f793b2f7ea3643c38862e1e6636d4d12', '17', '境内机构境外放款额度注销登记', null, '91110000600001760P', '600001760', '用友网络科技股份有限公司i', '用友政务', '123456789', 'www@qq.com', '', '1', '2017-11-02 16:26:50', '600001760', '2017-11-02 00:00:00', null, '2017-11-02 16:27:01', null, '待接收', null, '600001760', '2017-11-02 16:26:50', null, '20171102162701753', '', null, null, null, null, null, null, 'admin');

-- ----------------------------
-- Table structure for approval_report
-- ----------------------------
DROP TABLE IF EXISTS `approval_report`;
CREATE TABLE `approval_report` (
  `id` varchar(32) NOT NULL COMMENT '序号',
  `business_id` int(11) NOT NULL COMMENT '业务序号',
  `business_name` varchar(255) NOT NULL COMMENT '业务名称',
  `apply_code` varchar(255) DEFAULT NULL COMMENT '申请单位代码',
  `apply_credit_code` varchar(255) DEFAULT NULL COMMENT '申请单位统一社会信用代码',
  `apply_org_code` varchar(255) DEFAULT NULL COMMENT '申请单位组织机构代码',
  `apply_name` varchar(255) NOT NULL COMMENT '申请单位/个人名称',
  `contact_name` varchar(255) DEFAULT NULL COMMENT '联系人名称 申办人姓名',
  `contact_tele` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `contact_mail` varchar(255) DEFAULT NULL COMMENT '联系邮箱',
  `contact_address` varchar(255) DEFAULT NULL COMMENT '邮寄地址',
  `notice_get` char(1) DEFAULT NULL COMMENT '通知获取方式',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `apply_by` varchar(255) DEFAULT NULL COMMENT '申请人',
  `submit_time` datetime NOT NULL COMMENT '提交日期',
  `reason_desc` varchar(255) DEFAULT NULL COMMENT '申请原因描述',
  `complete_time` datetime DEFAULT NULL COMMENT '材料齐备时间',
  `apply_time` datetime DEFAULT NULL COMMENT '业务申请时间',
  `statu_company` varchar(255) DEFAULT NULL COMMENT '单据状态',
  `statu_bank` varchar(255) DEFAULT NULL COMMENT '审核状态',
  `modify_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `recieve_time` datetime DEFAULT NULL COMMENT '接收时间',
  `form_code` varchar(255) DEFAULT NULL COMMENT '表单单号',
  `assign_receive` varchar(255) DEFAULT NULL COMMENT '指定接收人',
  `finish_user` varchar(255) DEFAULT NULL COMMENT '办结人员',
  `finish_time` datetime DEFAULT NULL COMMENT '办结时间',
  `finish_result` varchar(255) DEFAULT NULL COMMENT '办结结论',
  `accept_time` datetime DEFAULT NULL COMMENT '受理时间',
  `accept_result` varchar(255) DEFAULT NULL COMMENT '受理结论',
  `isfinish` char(1) DEFAULT NULL COMMENT '是否办结',
  `receive_by` varchar(255) DEFAULT NULL COMMENT '实际接收人',
  `remark` varchar(255) DEFAULT NULL COMMENT '说明事项',
  `process_id1` int(11) DEFAULT NULL COMMENT '受理流程id',
  `process_id2` int(11) DEFAULT NULL COMMENT '审批流程id',
  `processtype_id1` int(11) DEFAULT NULL COMMENT '受理流程定义id',
  `processtype_id2` int(11) DEFAULT NULL COMMENT '审批流程定义id2',
  `report_state` varchar(255) DEFAULT NULL COMMENT '审批单状态',
  `destroy_state` varchar(255) DEFAULT NULL COMMENT '销毁状态',
  `document_state` varchar(255) DEFAULT NULL COMMENT '归档状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_report
-- ----------------------------
INSERT INTO `approval_report` VALUES ('1', '1', 'xx', null, null, null, 'xx', null, null, null, null, null, '2017-10-31 20:29:35', null, '2017-10-31 20:30:00', null, null, null, null, '已办结', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, '已办结', null, null);
INSERT INTO `approval_report` VALUES ('10', '1', 'xx10', '', '', '', 'xx10', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已办结', '', null, null, '', '', null, null, '', null, '', '', '', '', '10', null, null, null, '已办结', '', '');
INSERT INTO `approval_report` VALUES ('11', '1', 'xx11', '', '', '', 'xx11', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已办结', '', null, null, '', '', null, null, '', null, '', '', '', '', '11', null, null, null, '已办结', '', '');
INSERT INTO `approval_report` VALUES ('12', '1', 'xx12', '', '', '', 'xx12', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '处理中', '', null, null, '', '', null, null, '', null, '', '', '', '', '12', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('13', '1', 'xx13', '', '', '', 'xx13', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '审批中', '', null, null, '', '', null, null, '', null, '', '', '', '', '13', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('14', '1', 'xx14', '', '', '', 'xx14', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '处理中', '', null, null, '', '', null, null, '', null, '', '', '', '', '14', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('15', '1', 'xx15', '', '', '', 'xx15', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '处理中', '', null, null, '', '', null, null, '', null, '', '', '', '', '15', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('16', '1', 'xx16', '', '', '', 'xx16', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '16', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('17', '1', 'xx17', '', '', '', 'xx17', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '审批中', '', null, null, '', '', null, null, '', null, '', '', '', '', '17', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('18', '1', 'xx18', '', '', '', 'xx18', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '审批中', '', null, null, '', '', null, null, '', null, '', '', '', '', '18', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('19', '1', 'xx19', '', '', '', 'xx19', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '审批中', '', null, null, '', '', null, null, '', null, '', '', '', '', '19', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('2', '1', 'xx2', '', '', '', 'xx2', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '审批中', '', null, null, '', '', null, null, '', null, '', '', '', '', '2', null, null, null, '待受理', '', '');
INSERT INTO `approval_report` VALUES ('20', '1', 'xx20', '', '', '', 'xx20', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '20', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('21', '1', 'xx21', '', '', '', 'xx21', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '21', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('22', '1', 'xx22', '', '', '', 'xx22', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '22', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('23', '1', 'xx23', '', '', '', 'xx23', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '23', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('24', '1', 'xx24', '', '', '', 'xx24', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '24', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('25', '1', 'xx25', '', '', '', 'xx25', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '25', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('26', '1', 'xx26', '', '', '', 'xx26', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '26', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('27', '1', 'xx27', '', '', '', 'xx27', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '27', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('28', '1', 'xx28', '', '', '', 'xx28', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '28', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('29', '1', 'xx29', '', '', '', 'xx29', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '29', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('3', '1', 'xx3', '', '', '', 'xx3', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '3', null, null, null, '待受理', '', '');
INSERT INTO `approval_report` VALUES ('30', '1', 'xx30', '', '', '', 'xx30', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '30', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('31', '1', 'xx31', '', '', '', 'xx31', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '31', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('32', '1', 'xx32', '', '', '', 'xx32', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '32', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('33', '1', 'xx33', '', '', '', 'xx33', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '33', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('34', '1', 'xx34', '', '', '', 'xx34', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '34', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('35', '1', 'xx35', '', '', '', 'xx35', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '35', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('36', '1', 'xx36', '', '', '', 'xx36', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '36', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('37', '1', 'xx37', '', '', '', 'xx37', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '37', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('38', '1', 'xx38', '', '', '', 'xx38', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '38', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('39', '1', 'xx39', '', '', '', 'xx39', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '39', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('4', '1', 'xx4', '', '', '', 'xx4', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '4', null, null, null, '已补正', '', '');
INSERT INTO `approval_report` VALUES ('40', '1', 'xx40', '', '', '', 'xx40', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '40', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('41', '1', 'xx41', '', '', '', 'xx41', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '41', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('42', '1', 'xx42', '', '', '', 'xx42', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '42', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('43', '1', 'xx43', '', '', '', 'xx43', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '43', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('44', '1', 'xx44', '', '', '', 'xx44', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '44', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('45', '1', 'xx45', '', '', '', 'xx45', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '45', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('46', '1', 'xx46', '', '', '', 'xx46', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '46', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('47', '1', 'xx47', '', '', '', 'xx47', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '47', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('48', '1', 'xx48', '', '', '', 'xx48', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '48', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('49', '1', 'xx49', '', '', '', 'xx49', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', '49', null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('5', '1', 'xx5', '', '', '', 'xx5', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '5', null, null, null, '已补正', '', '');
INSERT INTO `approval_report` VALUES ('50', '1', 'xx50', '', '', '', 'xx50', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('51', '1', 'xx51', '', '', '', 'xx51', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('52', '1', 'xx52', '', '', '', 'xx52', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('53', '1', 'xx53', '', '', '', 'xx53', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('54', '1', 'xx54', '', '', '', 'xx54', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('55', '1', 'xx55', '', '', '', 'xx55', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('56', '1', 'xx56', '', '', '', 'xx56', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('57', '1', 'xx57', '', '', '', 'xx57', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('58', '1', 'xx58', '', '', '', 'xx58', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('59', '1', 'xx59', '', '', '', 'xx59', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('6', '1', 'xx6', '', '', '', 'xx6', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '6', null, null, null, '待审批', '', '');
INSERT INTO `approval_report` VALUES ('60', '1', 'xx60', '', '', '', 'xx60', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '已补正', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('61', '1', 'xx61', '', '', '', 'xx61', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('62', '1', 'xx62', '', '', '', 'xx62', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('63', '1', 'xx63', '', '', '', 'xx63', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('64', '1', 'xx64', '', '', '', 'xx64', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('65', '1', 'xx65', '', '', '', 'xx65', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('66', '1', 'xx66', '', '', '', 'xx66', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('67', '1', 'xx67', '', '', '', 'xx67', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('68', '1', 'xx68', '', '', '', 'xx68', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('69', '1', 'xx69', '', '', '', 'xx69', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('7', '1', 'xx7', '', '', '', 'xx7', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '7', null, null, null, '待审批', '', '');
INSERT INTO `approval_report` VALUES ('70', '1', 'xx70', '', '', '', 'xx70', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('71', '1', 'xx71', '', '', '', 'xx71', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('72', '1', 'xx72', '', '', '', 'xx72', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('73', '1', 'xx73', '', '', '', 'xx73', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('74', '1', 'xx74', '', '', '', 'xx74', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('75', '1', 'xx75', '', '', '', 'xx75', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('76', '1', 'xx76', '', '', '', 'xx76', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('77', '1', 'xx77', '', '', '', 'xx77', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('78', '1', 'xx78', '', '', '', 'xx78', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('79', '1', 'xx79', '', '', '', 'xx79', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('8', '1', 'xx8', '', '', '', 'xx8', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '8', null, null, null, '待审批', '', '');
INSERT INTO `approval_report` VALUES ('80', '1', 'xx80', '', '', '', 'xx80', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('81', '1', 'xx81', '', '', '', 'xx81', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('82', '1', 'xx82', '', '', '', 'xx82', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('83', '1', 'xx83', '', '', '', 'xx83', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('84', '1', 'xx84', '', '', '', 'xx84', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('85', '1', 'xx85', '', '', '', 'xx85', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('86', '1', 'xx86', '', '', '', 'xx86', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('87', '1', 'xx87', '', '', '', 'xx87', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('88', '1', 'xx88', '', '', '', 'xx88', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('89', '1', 'xx89', '', '', '', 'xx89', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待审批', '', null, null, '', '', null, null, '', null, '', '', '', '', null, null, null, null, '', '', '');
INSERT INTO `approval_report` VALUES ('9', '1', 'xx9', '', '', '', 'xx9', '', '', '', '', '', '2017-10-31 20:29:35', '', '2017-10-31 20:29:35', '', null, null, '', '待受理', '', null, null, '', '', null, null, '', null, '', '', '', '', '9', null, null, null, '', '', '');

-- ----------------------------
-- Table structure for bank_user
-- ----------------------------
DROP TABLE IF EXISTS `bank_user`;
CREATE TABLE `bank_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(11) NOT NULL COMMENT '用户ID 用户表主键',
  `org_id` int(11) NOT NULL COMMENT '归属公司',
  `dept_id` int(11) NOT NULL COMMENT '归属部门',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(12) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`id`),
  KEY `bank_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank_user
-- ----------------------------
INSERT INTO `bank_user` VALUES ('1', '1', '2', '3', 'admin', null, null, null);
INSERT INTO `bank_user` VALUES ('3', '3', '2', '3', '马金琪', null, null, null);
INSERT INTO `bank_user` VALUES ('4', '4', '2', '3', '常里远', null, null, null);
INSERT INTO `bank_user` VALUES ('5', '5', '2', '3', '韩雨', null, null, null);
INSERT INTO `bank_user` VALUES ('6', '6', '2', '3', '李昊明', null, null, null);
INSERT INTO `bank_user` VALUES ('7', '7', '2', '3', '刘瑾', null, null, null);
INSERT INTO `bank_user` VALUES ('8', '8', '2', '3', '宋谷予', null, null, null);
INSERT INTO `bank_user` VALUES ('9', '9', '2', '3', '马艺铭', null, null, null);
INSERT INTO `bank_user` VALUES ('10', '10', '2', '3', '陈涛', null, null, null);
INSERT INTO `bank_user` VALUES ('11', '11', '2', '3', '杨长喜', null, null, null);
INSERT INTO `bank_user` VALUES ('12', '12', '2', '3', '李玉秀', null, null, null);
INSERT INTO `bank_user` VALUES ('13', '13', '2', '3', '张涵予', null, null, null);
INSERT INTO `bank_user` VALUES ('14', '14', '2', '3', '严宝玉', null, null, null);

-- ----------------------------
-- Table structure for business_log
-- ----------------------------
DROP TABLE IF EXISTS `business_log`;
CREATE TABLE `business_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `operator_by` varchar(255) DEFAULT NULL COMMENT '操作者',
  `receive_date` datetime DEFAULT NULL COMMENT '任务接收时间',
  `end_date` datetime DEFAULT NULL COMMENT '任务结束时间',
  `opertion_name` varchar(255) DEFAULT NULL COMMENT '操作名称',
  `operation_opinon` varchar(255) DEFAULT NULL,
  `form_id` varchar(32) DEFAULT NULL COMMENT '申请单id',
  `report_id` varchar(32) DEFAULT NULL COMMENT '审批单id',
  `step_id` int(11) DEFAULT NULL COMMENT '当前步骤',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_log
-- ----------------------------
INSERT INTO `business_log` VALUES ('1', 'admin', '2017-11-01 16:30:46', '2017-11-01 18:57:24', 'xx', null, null, '1', null);
INSERT INTO `business_log` VALUES ('2', 'admin', '2017-11-01 16:34:30', '2017-11-01 18:57:24', 'xx', null, null, '10', null);
INSERT INTO `business_log` VALUES ('3', 'admin2', '2017-11-01 16:35:59', '2017-11-01 18:57:24', 'xx', null, null, '1', null);
INSERT INTO `business_log` VALUES ('4', 'admin', '2017-11-01 16:37:09', '2017-11-01 18:57:24', 'xx', null, null, '1', null);
INSERT INTO `business_log` VALUES ('5', 'admin', '2017-11-02 18:56:12', '2017-11-01 18:57:24', 'xx', null, null, '12', null);
INSERT INTO `business_log` VALUES ('6', 'admin2', '2017-11-02 18:56:53', '2017-11-01 18:57:24', 'xx', null, null, '12', null);
INSERT INTO `business_log` VALUES ('7', 'admin', '2017-11-02 18:57:04', '2017-11-02 18:57:04', 'xx', null, null, '13', null);
INSERT INTO `business_log` VALUES ('8', '600001760', '2017-11-01 18:57:24', '2017-11-01 18:57:24', 'xx', null, null, '13', null);
INSERT INTO `business_log` VALUES ('9', 'admin3', '2017-11-01 19:57:24', '2017-11-01 19:57:24', 'xx', null, null, '13', null);

-- ----------------------------
-- Table structure for bu_attachment_type
-- ----------------------------
DROP TABLE IF EXISTS `bu_attachment_type`;
CREATE TABLE `bu_attachment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `business_id` int(11) NOT NULL COMMENT '业务id',
  `filetype_index` int(11) DEFAULT NULL COMMENT '序号',
  `filename` varchar(255) DEFAULT NULL COMMENT '单证类型',
  `is_legal` char(1) DEFAULT NULL COMMENT '是否法定',
  `check_type` char(1) DEFAULT NULL COMMENT '是否必填',
  `checktype_desc` varchar(32) DEFAULT NULL COMMENT 'Checktype中文描述',
  `file_template` varchar(32) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `business_id` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bu_attachment_type
-- ----------------------------
INSERT INTO `bu_attachment_type` VALUES ('1', '15', '1', '《境外放款外汇登记业务申请表》', null, '0', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('2', '15', '2', '境外放款协议或变更后的境外放款协议', null, '1', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('3', '15', '3', '放款人最近一期财务审计报告及财务报表 ', null, '1', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('4', '15', '4', '外汇局根据本规定认为需要补充的相关证明材料', null, '1', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('5', '17', '1', '《境外放款外汇登记业务申请表》', null, '1', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('6', '17', '2', '如确有客观原因无法收回境外放款本息的，需提交相关证明材料', null, '1', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('7', '16', '1', '《境外放款外汇登记业务申请表》', null, '1', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('8', '16', '2', '境外放款协议或变更后的境外放款协议', null, '1', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('9', '16', '3', '放款人最近一期财务审计报告及财务报表 ', null, '1', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('10', '16', '4', '外汇局根据本规定认为需要补充的相关证明材料', null, '1', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('11', '18', '1', '境外并购外汇登记业务申请表', null, '1', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('12', '18', '2', '组织机构代码证书', null, '1', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('13', '18', '3', '营业执照副本', null, '1', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('14', '18', '4', '中关村管委会关于该项目作为境外并购试点业务的确认文件', null, '1', '', null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('15', '19', '1', '申请书', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('16', '19', '2', '外债合同正本及合同主要条款复印件，合同为外文的应另附合同主要条款的中文译本', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('17', '19', '3', '外商投资企业应提供批准证书、营业执照和外方股东资本金到位证明材料等文件，中资企业应提供营业执照、外债主管部门批准其对外借款的文件', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('18', '19', '4', '针对前述材料应当提供的补充说明', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('19', '24', '1', '申请书', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('20', '24', '2', '担保合同和担保项下主债务合同', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('21', '24', '3', '外汇局根据本规定认为需要补充的相关证明材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('22', '26', '1', '申请书', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('23', '26', '2', '原内保外贷《对外担保登记表》', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('24', '26', '3', '相关证明材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('25', '29', '1', '申请书，包括但不限于公司基本情况及租赁项目的基本情况', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('26', '29', '2', '主管部门同意设立融资租赁公司或项目公司的批复和工商营业执照', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('27', '29', '3', '上年度经审计的财务报告及最近一期财务报表', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('28', '29', '4', '租赁合同及租赁物转移的证明材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('29', '29', '5', '外汇局根据本规定认为需要补充的相关证明材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('30', '30', '1', '书面申请，并附《境外上市登记表》', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('31', '30', '2', '中国证监会许可境内公司境外上市的证明文件', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('32', '30', '3', '境外发行结束的公告文件', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('33', '30', '4', '前述材料内容不一致或不能说明交易真实性时，要求提供的补充材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('34', '31', '1', '书面申请（含变更或注销有关情况的说明）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('35', '31', '2', '原业务登记凭证及最新填写的《境外上市登记表》', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('36', '31', '3', '主管部门关于变更（注销）事项的相关批复或备案文件', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('37', '31', '4', '相关账户和资金处理情况说明，相关账户销户证明材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('38', '31', '5', '前述材料内容不一致或不能说明交易真实性时，要求提供的补充材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('39', '32', '1', '书面申请（含变更或注销有关情况的说明）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('40', '32', '2', '原业务登记凭证及最新填写的《境外上市登记表》', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('41', '32', '3', '主管部门关于变更（注销）事项的相关批复或备案文件', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('42', '32', '4', '相关账户和资金处理情况说明，相关账户销户证明材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('43', '32', '5', '前述材料内容不一致或不能说明交易真实性时，要求提供的补充材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('44', '33', '1', '书面申请，并附《境外持股登记表》', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('45', '33', '2', '关于增持或减持事项的董事会或股东大会决议', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('46', '33', '3', '需经财政部门、国有资产管理部门等相关部门批准的，应提供相关部门的批准文件', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('47', '33', '4', '前述材料内容不一致或不能说明交易真实性时，要求提供的补充材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('48', '34', '1', '境内股东书面书面申请（持股基本情况、变更事项等）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('49', '34', '2', '原业务登记凭证及最新填写的《境外上市持股登记表》', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('50', '34', '3', '相关交易真实性证明材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('51', '34', '4', '前述材料内容不一致或不能说明交易真实性时，要求提供的补充材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('52', '35', '1', '书面申请（说明回购的原因、方案，是否已向国家证券监督管理部门报备等情况）                                                                                                     ', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('53', '35', '2', '工商营业执照和组织机构代码证复印件', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('54', '35', '3', '经公告的有关回购事项的股东大会决议', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('55', '35', '4', '经公告的回顾报告书', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('56', '35', '5', '主管部门的批复文件复印件', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('57', '35', '6', '前述材料内容不一致或不能说明交易真实性时，要求提供的补充材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('58', '36', '1', '书面申请，并附《境内个人参与境外上市公司股权激励计划外汇登记表》', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('59', '36', '2', '境外上市公司相关公告等能够证明股权激励计划真实性的证明材料（涉及国有企业等需经主管部门批准的，另需出具有关主管部门的认可文件）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('60', '36', '3', '境内公司授权境内代理机构统一办理个人参与股权激励计划的授权书或协议', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('61', '36', '4', '境内公司出具的个人与其雇佣或劳务关系属实的承诺函（附个人名单、身份证件号码、所涉股权激励类型等）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('62', '36', '5', '参与公司（含境内代理机构）工商营业执照和组织机构代码证', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('63', '36', '6', '前述材料内容不一致或不能说明交易真实性时，要求提供的补充材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('64', '37', '1', '书面申请', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('65', '37', '2', '原股权激励计划外汇登记凭证', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('66', '37', '3', '最新填写的《境内个人参与境外上市公司股权激励计划外汇登记表》', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('67', '37', '4', '变更事项相关的真实性证明材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('68', '37', '5', '前述材料内容不一致或不能说明交易真实性时，要求提供的补充材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('69', '38', '1', '书面申请（注明权激励计划终止的原因）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('70', '38', '2', '原股权激励计划外汇登记凭证', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('71', '38', '3', '与权激励计划终止相关的真实性证明材料；', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('72', '38', '4', '前述材料内容不一致或不能说明交易真实性时，要求提供的补充材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('73', '48', '1', '《辅导期企业报告表(进口/付汇)》', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('74', '48', '2', '相关证明材料。', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('75', '75', '1', '书面申请（说明需登记的事项和具体内容）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('76', '75', '2', '以信用证、托收方式结算的，提交收入申报单证、出口合同', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('77', '75', '3', '以汇款方式结算的（预收货款除外），提交收入申报单证，出口合同、出口货物报关单', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('78', '75', '4', '以预收货款方式结算的，提交收入申报单证、出口合同、发票', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('79', '75', '5', '出口贸易融资放款，提交与金融机构签订的融资协议、出口合同、发票、出口货物报关单', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('80', '75', '6', '对于出口与收入主体不一致的业务，除按不同结算方式提交相关材料外，还应区分情况提交证明材料：因企业分立、合并原因导致的，提交相关部门出具的分立、合并证明文件；对于外汇局认定的其他情况，提交相关材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('81', '75', '7', '对于贸易付汇的退汇收入，应在书面申请中具体说明退汇原因及是否发生货物退运。因错误汇出产生的，应提交原支出申报单证、收入申报单证；因错误汇出以外的其他原因产生的，还应提交原进口合同；发生货物退运的，还应提交贸易方式为“退运货物”的出口货物报关单', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('82', '75', '8', '对于因汇路不畅需要使用外币现钞结算的，办理外币现钞结汇业务登记时应提交出口合同、出口货物报关单；结汇现钞金额达到规定入境申报金额的，还应提交海关签章的携带外币现钞入境申报单正本', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('83', '75', '9', '货物贸易外汇业务登记表', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('84', '75', '10', '国家外汇管理局中关村中心支局要求的其他材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('85', '76', '1', '书面申请（说明需登记的事项和具体内容）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('86', '76', '2', '以信用证、托收方式结算的，提交进口合同', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('87', '76', '3', '以汇款方式结算的（预收货款除外），提交进口合同、进口货物报关单', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('88', '76', '4', '以预付货款方式结算的，提交进口合同、发票；单笔预付货款金额超过等值5万美元的，还须提交经金融机构核对密押的外方金融机构出具的预付货款保函', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('89', '76', '5', '对于进口与支出主体不一致的业务，除按不同结算方式提交相关材料外，还应区分情况提交证明材料：属于捐赠进口业务的，提交捐赠协议；因企业分立、合并原因导致的，提交相关部门出具的分立、合并证明文件；对于外汇局认定的其他情况，提交相关材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('90', '76', '6', '对于贸易收汇的退汇支付，应在书面申请中具体说明退汇原因及是否发生货物退运。因错误汇入产生的，应提交原收汇凭证；因错误汇入以外的其他原因产生的，还应提交原收入申报单证、原出口合同；发生货物退运的，还应提交贸易方式为“退运货物”的进口货物报关单', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('91', '76', '7', '货物贸易外汇业务登记表', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('92', '76', '8', '国家外汇管理局中关村中心支局要求的其他材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('93', '77', '1', '书面申请（说明需登记的事项和具体内容）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('94', '77', '2', '额度不足证明材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('95', '77', '3', '以信用证、托收方式结算的，提交进口合同', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('96', '77', '4', '以汇款方式结算的（预收货款除外），提交进口合同、进口货物报关单', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('97', '77', '5', '以预付货款方式结算的，提交进口合同、发票；单笔预付货款金额超过等值5万美元的，还须提交经金融机构核对密押的外方金融机构出具的预付货款保函', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('98', '77', '6', '对于进口与支出主体不一致的业务，除按不同结算方式提交相关材料外，还应区分情况提交证明材料：属于捐赠进口业务的，提交捐赠协议；因企业分立、合并原因导致的，提交相关部门出具的分立、合并证明文件；对于外汇局认定的其他情况，提交相关材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('99', '77', '7', '对于贸易收汇的退汇支付，应在书面申请中具体说明退汇原因及是否发生货物退运。因错误汇入产生的，应提交原收汇凭证；因错误汇入以外的其他原因产生的，还应提交原收入申报单证、原出口合同；发生货物退运的，还应提交贸易方式为“退运货物”的进口货物报关单', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('100', '77', '8', '货物贸易外汇业务登记表', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('101', '77', '9', '国家外汇管理局中关村中心支局要求的其他材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('102', '78', '1', '书面申请（说明需登记的事项和具体内容）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('103', '78', '2', '额度不足证明材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('104', '78', '3', '以信用证、托收方式结算的，提交收入申报单证、出口合同', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('105', '78', '4', '以汇款方式结算的（预收货款除外），提交收入申报单证，出口合同、出口货物报关单', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('106', '78', '5', '以预收货款方式结算的，提交收入申报单证、出口合同、发票', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('107', '78', '6', '出口贸易融资放款，提交与金融机构签订的融资协议、出口合同、发票、出口货物报关单', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('108', '78', '7', '对于出口与收入主体不一致的业务，除按不同结算方式提交相关材料外，还应区分情况提交证明材料：因企业分立、合并原因导致的，提交相关部门出具的分立、合并证明文件；对于外汇局认定的其他情况，提交相关材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('109', '78', '8', '对于贸易付汇的退汇收入，应在书面申请中具体说明退汇原因及是否发生货物退运。因错误汇出产生的，应提交原支出申报单证、收入申报单证；因错误汇出以外的其他原因产生的，还应提交原进口合同；发生货物退运的，还应提交贸易方式为“退运货物”的出口货物报关单', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('110', '78', '9', '对于因汇路不畅需要使用外币现钞结算的，办理外币现钞结汇业务登记时应提交出口合同、出口货物报关单；结汇现钞金额达到规定入境申报金额的，还应提交海关签章的携带外币现钞入境申报单正本', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('111', '78', '10', '货物贸易外汇业务登记表', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('112', '78', '11', '国家外汇管理局中关村中心支局要求的其他材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('113', '54', '1', '书面申请（说明需登记的事项和具体内容）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('114', '54', '2', '买卖合同', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('115', '54', '3', '提单或仓单或其他货权凭证', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('116', '54', '4', '收入和支出申报单证（收入登记时提供）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('117', '54', '5', '货物贸易外汇业务登记表', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('118', '54', '6', '国家外汇管理局中关村中心支局要求的其他材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('119', '55', '1', '书面申请（说明需登记的事项和具体内容）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('120', '55', '2', '进口合同', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('121', '55', '3', '进口货物报关单', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('122', '55', '4', '货物贸易外汇业务登记表', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('123', '55', '5', '国家外汇管理局中关村中心支局要求的其他材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('124', '56', '1', '书面申请（说明需登记的事项和具体内容）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('125', '56', '2', '出口合同', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('126', '56', '3', '出口货物报关单', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('127', '56', '4', '货物贸易外汇业务登记表', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('128', '56', '5', '国家外汇管理局中关村中心支局要求的其他材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('129', '57', '1', '书面申请（说明需登记的事项和具体内容以及资本项目外汇账号）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('130', '57', '2', '涉外收入申报单原件及复印件，复印件加盖公章', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('131', '57', '3', '货物贸易外汇业务登记表', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('132', '57', '4', '国家外汇管理局中关村中心支局要求的其他材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('133', '59', '1', '书面申请（说明需登记的事项和具体内容）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('134', '59', '2', '货物贸易外汇业务登记表', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('135', '59', '3', '国家外汇管理局中关村中心支局要求的其他材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('136', '60', '1', '书面申请（出境目的国名称、出境携带超限额外币现钞事由及携带外币现钞数额等）', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('137', '60', '2', '护照或往来港澳通行证、往来台湾通行证', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('138', '60', '3', '有效签证或签注', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('139', '60', '4', '存款证明（利息清单或取款凭条）、相关购汇凭证或入境申报外币现钞数额的海关申报单等来源证明', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('140', '60', '5', '国家外汇管理局中关村中心支局要求的其他相关证明材料', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('141', '25', '1', '申请书', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('142', '25', '2', '担保合同和担保项下主债务合同', null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `bu_attachment_type` VALUES ('143', '25', '3', '外汇局根据本规定认为需要补充的相关证明材料', null, '1', null, null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for bu_business
-- ----------------------------
DROP TABLE IF EXISTS `bu_business`;
CREATE TABLE `bu_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(11) DEFAULT NULL COMMENT '父编号',
  `business_no` varchar(255) DEFAULT NULL COMMENT '业务编号',
  `business_name` varchar(255) NOT NULL COMMENT '业务名称',
  `business_order` int(11) DEFAULT NULL COMMENT '外网业务显示序号',
  `time_limited` int(11) NOT NULL DEFAULT '5' COMMENT '法定办理时限',
  `time_limited2` int(11) NOT NULL DEFAULT '20' COMMENT '法定办理时限2',
  `time_limited3` int(11) DEFAULT NULL COMMENT '法定办理时限3',
  `delay_limited` int(11) DEFAULT NULL COMMENT '可延期办理时限 以工作日计算',
  `filetemplate_doc_id` varchar(255) DEFAULT NULL,
  `file_doc_id` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  `end_node` varchar(1) NOT NULL COMMENT '节点标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bu_business
-- ----------------------------
INSERT INTO `bu_business` VALUES ('1', null, null, '资本业务', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('2', null, null, '经常业务', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('3', '1', null, '境外放款', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('4', '1', null, '中关村境外并购试点', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('5', '1', null, '外债', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('6', '1', null, '跨境担保', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('7', '1', null, '融资租赁公司', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('8', '1', null, '证券投资', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('9', '1', null, '资本项下个人外汇业务', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('10', '1', null, '资本其他业务', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('11', '2', null, '出口收入存放境外', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('12', '2', null, '货物贸易企业报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('13', '2', null, '货物贸易企业登记管理', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('14', '2', null, '服务贸易外汇业务', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('15', '3', null, '境内机构境外放款额度登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('16', '3', null, '境内机构境外放款变更', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('17', '3', null, '境内机构境外放款额度注销登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('18', '4', null, '中关村国家自主创新示范区境外并购外汇管理试点业务登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('19', '5', null, '非银行债务人办理外债签约登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('20', '5', null, '非银行债务人办理外债签约变更', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('21', '5', null, '非银行债务人办理外债签约注销', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('22', '5', null, '非银行债务人办理非资金划转类提款备案', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('23', '5', null, '非银行债务人办理非资金划转类还本付息备案', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('24', '6', null, '内保外贷签约登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('25', '6', null, '内保外贷变更登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('26', '6', null, '内保外贷注销登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('27', '6', null, '内保外贷担保履约对外债权登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('28', '6', null, '外保内贷境外担保履约外债登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('29', '7', null, '融资租赁公司对外债权登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('30', '8', null, '境外上市登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('31', '8', null, '境外上市变更登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('32', '8', null, '境外上市注销登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('33', '8', null, '境内股东持股登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('34', '8', null, '境内股东持股变更登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('35', '8', null, '上市公司回购B股股份购汇额度审批', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('36', '9', null, '境内个人参与境外上市公司股权激励计划外汇登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('37', '9', null, '境内个人参与境外上市公司股权激励计划外汇变更', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('38', '9', null, '境内个人参与境外上市公司股权激励计划外汇注销', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('39', '10', null, '资本项目信息系统数据修改', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('40', '11', null, '开立存放出口收入境外账户登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('41', '11', null, '后续开户登记与信息变更', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('42', '11', null, '存放境外业务变更', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('43', '11', null, '存放境外规模变更登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('44', '11', null, '境外账户关闭', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('45', '12', null, '贸易信贷业务现场报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('46', '12', null, '贸易融资业务现场报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('47', '12', null, '转口贸易手指业务报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('48', '12', null, '辅导期业务报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('49', '12', null, '贸易主体不一致业务报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('50', '12', null, '差额业务报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('51', '12', null, '其他特殊交易报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('52', '13', null, 'C类企业贸易外汇收支登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('53', '13', null, 'B类企业超可收付汇额度的贸易外汇收支登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('54', '13', null, 'B类企业转口贸易收支超比例或超期限登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('55', '13', null, 'B类企业90天以上延期付款登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('56', '13', null, 'B类企业90天以上延期收款登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('57', '13', null, '待核查账户资金结汇或划出登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('58', '13', null, '超期限或无法原路退汇登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '1');
INSERT INTO `bu_business` VALUES ('59', '13', null, '其他业务登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('60', '14', null, '开立《携带外汇出境许可证》', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('61', '14', null, '特殊情况提取外币现钞业务', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('62', '14', null, '服务贸易外汇收入存放境外开立账户核准', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('63', '45', null, 'A类企业30天（不含)以上的预收货款现场报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('64', '45', null, 'B/C类企业在监管期发生的预收货款现场报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('65', '45', null, 'A类企业30天（不含)以上的预付货款现场报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('66', '45', null, 'B/C类企业在监管期发生的预付货款现场报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('67', '45', null, 'A类企业90天（不含)以上的延期收款现场报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('68', '45', null, 'B/C类企业在监管期内发生的30天（不含）以上的延期收款现场报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('69', '45', null, 'A类企业90天（不含)以上的延期付款现场报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('70', '45', null, 'B/C类企业在监管期内发生的30天（不含）以上的延期付款现场报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('71', '46', null, '进口远期信用证业务报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('72', '46', null, '海外代付业务报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('73', '46', null, '其他贸易融资业务报告', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('74', '52', null, 'C类企业贸易外汇收入登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('75', '52', null, 'C类企业贸易外汇支出登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('76', '53', null, 'B类企业超可付汇额度的贸易外汇支出登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('77', '53', null, 'B类企业超可收汇额度的贸易外汇收入登记', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('78', '58', null, '超期限退汇登记（退入）', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('79', '58', null, '超期限退汇登记（退出）', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('80', '19', null, '非银行债务人办理外债签约登记（投注差）', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('81', '19', null, '非银行债务人办理外债签约登记（全口径）', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('82', '19', null, '非银行债务人办理外债签约登记（全口径-便利化）', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('83', '20', null, '非银行债务人办理外债签约变更（投注差）', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('84', '20', null, '非银行债务人办理外债签约变更（全口径）', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');
INSERT INTO `bu_business` VALUES ('85', '20', null, '非银行债务人办理外债签约变更（全口径-便利化）', null, '5', '20', null, null, '014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', null, null, null, null, null, '1', '0');

-- ----------------------------
-- Table structure for bu_dept_business
-- ----------------------------
DROP TABLE IF EXISTS `bu_dept_business`;
CREATE TABLE `bu_dept_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `business_id` int(11) NOT NULL COMMENT '业务id',
  `verify_org_id` varchar(255) DEFAULT NULL COMMENT '审核机构',
  `verify_org_name` varchar(255) DEFAULT NULL COMMENT '审核机构名称',
  `verify_dept_id` varchar(255) NOT NULL COMMENT '审核部门id',
  `verify_dept_name` varchar(255) NOT NULL COMMENT '审核部门名称',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `business_id` (`business_id`),
  CONSTRAINT `bu_dept_business_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `bu_business` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bu_dept_business
-- ----------------------------
INSERT INTO `bu_dept_business` VALUES ('1', '2', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('2', '3', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('3', '1', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('4', '4', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('5', '5', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('6', '6', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('7', '7', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('8', '8', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('9', '9', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('10', '10', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('11', '11', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('12', '12', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('13', '13', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('14', '14', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('15', '15', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('16', '16', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('17', '17', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('18', '18', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('19', '19', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('20', '20', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('21', '21', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('22', '22', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('23', '23', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('24', '24', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('25', '25', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('26', '26', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('27', '27', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('28', '28', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('29', '29', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('30', '30', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('31', '31', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('32', '32', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('33', '33', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('34', '34', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('35', '35', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('36', '36', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('37', '37', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('38', '38', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('39', '39', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('40', '40', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('41', '41', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('42', '42', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('43', '43', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('44', '44', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('45', '45', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('46', '46', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('47', '47', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('48', '48', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('49', '49', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('50', '50', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('51', '51', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('52', '52', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('53', '53', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('54', '54', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('55', '55', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('56', '56', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('57', '57', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('58', '58', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('59', '59', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('60', '60', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('61', '61', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('62', '62', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('63', '63', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('64', '64', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('65', '65', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('66', '66', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('67', '67', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('68', '68', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('69', '69', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('70', '70', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('71', '71', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('72', '72', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('73', '73', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('74', '74', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('75', '75', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('76', '76', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('77', '77', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('78', '78', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('79', '79', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('80', '80', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('81', '81', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('82', '82', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('83', '83', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('84', '84', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);
INSERT INTO `bu_dept_business` VALUES ('85', '85', '2', '中国人民银行中关村支行', '3', '业务审核部门', null, null, null, null, null);

-- ----------------------------
-- Table structure for bu_guides
-- ----------------------------
DROP TABLE IF EXISTS `bu_guides`;
CREATE TABLE `bu_guides` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `business_id` int(11) NOT NULL COMMENT '业务id',
  `guides_id` int(11) NOT NULL COMMENT '指南id',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bu_guides
-- ----------------------------
INSERT INTO `bu_guides` VALUES ('1', '15', '1', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('2', '16', '2', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('3', '17', '3', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('4', '18', '4', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('5', '19', '5', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('6', '20', '6', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('7', '21', '7', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('8', '22', '8', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('9', '23', '9', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('10', '24', '10', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('11', '25', '21', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('12', '26', '22', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('13', '27', '23', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('14', '28', '24', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('15', '29', '25', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('16', '30', '26', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('17', '31', '27', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('18', '32', '28', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('19', '33', '29', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('20', '34', '30', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('21', '35', '1', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('22', '36', '2', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('23', '37', '3', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('24', '38', '4', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('25', '39', '5', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('26', '40', '6', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('27', '41', '7', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('28', '42', '8', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('29', '43', '9', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('30', '44', '10', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('31', '47', '21', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('32', '48', '22', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('33', '49', '23', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('34', '50', '24', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('35', '51', '25', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('36', '54', '26', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('37', '55', '27', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('38', '56', '28', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('39', '57', '29', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('40', '58', '30', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('41', '59', '1', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('42', '60', '2', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('43', '61', '3', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('44', '62', '4', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('45', '63', '5', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('46', '64', '6', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('47', '65', '7', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('48', '66', '8', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('49', '67', '9', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('50', '68', '10', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('51', '69', '21', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('52', '70', '22', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('53', '71', '23', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('54', '72', '24', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('55', '73', '25', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('56', '74', '26', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('57', '75', '27', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('58', '76', '28', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('59', '77', '29', null, null, null, null, null);
INSERT INTO `bu_guides` VALUES ('60', '78', '30', null, null, null, null, null);

-- ----------------------------
-- Table structure for bu_laws
-- ----------------------------
DROP TABLE IF EXISTS `bu_laws`;
CREATE TABLE `bu_laws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL COMMENT '业务id',
  `law_id` int(11) NOT NULL COMMENT '法律id',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bu_laws
-- ----------------------------
INSERT INTO `bu_laws` VALUES ('1', '15', '1', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('2', '16', '2', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('3', '17', '3', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('4', '18', '4', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('5', '19', '5', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('6', '20', '6', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('7', '21', '7', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('8', '22', '8', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('9', '23', '9', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('10', '24', '10', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('11', '25', '21', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('12', '26', '22', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('13', '27', '23', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('14', '28', '24', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('15', '29', '25', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('16', '30', '26', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('17', '31', '27', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('18', '32', '28', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('19', '33', '29', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('20', '34', '30', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('21', '35', '1', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('22', '36', '2', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('23', '37', '3', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('24', '38', '4', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('25', '39', '5', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('26', '40', '6', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('27', '41', '7', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('28', '42', '8', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('29', '43', '9', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('30', '44', '10', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('31', '47', '21', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('32', '48', '22', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('33', '49', '23', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('34', '50', '24', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('35', '51', '25', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('36', '54', '26', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('37', '55', '27', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('38', '56', '28', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('39', '57', '29', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('40', '58', '30', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('41', '59', '1', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('42', '60', '2', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('43', '61', '3', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('44', '62', '4', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('45', '63', '5', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('46', '64', '6', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('47', '65', '7', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('48', '66', '8', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('49', '67', '9', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('50', '68', '10', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('51', '69', '21', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('52', '70', '22', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('53', '71', '23', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('54', '72', '24', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('55', '73', '25', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('56', '74', '26', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('57', '75', '27', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('58', '76', '28', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('59', '77', '29', null, null, null, null, null);
INSERT INTO `bu_laws` VALUES ('60', '78', '30', null, null, null, null, null);

-- ----------------------------
-- Table structure for bu_process
-- ----------------------------
DROP TABLE IF EXISTS `bu_process`;
CREATE TABLE `bu_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL COMMENT '业务id',
  `process_id` int(11) NOT NULL COMMENT '流程id',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bu_process
-- ----------------------------

-- ----------------------------
-- Table structure for companyuser_attachment
-- ----------------------------
DROP TABLE IF EXISTS `companyuser_attachment`;
CREATE TABLE `companyuser_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `doc_name` varchar(255) NOT NULL COMMENT '文件名称',
  `doc_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `law_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companyuser_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for company_list
-- ----------------------------
DROP TABLE IF EXISTS `company_list`;
CREATE TABLE `company_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `legal_code` varchar(255) NOT NULL COMMENT '法人代码',
  `company_name` varchar(255) NOT NULL COMMENT '企业名称',
  `org_barcode` varchar(255) DEFAULT NULL COMMENT '组织机构代码',
  `trade_code` varchar(20) DEFAULT NULL COMMENT '对外贸易经营企业代码',
  `certificate_code` varchar(255) DEFAULT NULL COMMENT '统一社会信用代码',
  `area` varchar(255) NOT NULL COMMENT '所属园区',
  `technical_field` varchar(255) NOT NULL COMMENT '技术领域',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_list
-- ----------------------------

-- ----------------------------
-- Table structure for company_user
-- ----------------------------
DROP TABLE IF EXISTS `company_user`;
CREATE TABLE `company_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `company_name` varchar(255) NOT NULL COMMENT '企业名称',
  `org_barcode` varchar(9) DEFAULT NULL COMMENT '组织机构代码',
  `trade_code` varchar(13) DEFAULT NULL COMMENT '对外贸易经营企业代码',
  `certificate_code` varchar(18) DEFAULT NULL COMMENT '统一社会信用代码',
  `register_name` varchar(255) DEFAULT NULL COMMENT '注册人姓名',
  `credentials_type` varchar(255) NOT NULL COMMENT '注册人证件类型',
  `credential_number` varchar(255) NOT NULL COMMENT '证件号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `office_phone` varchar(12) DEFAULT NULL COMMENT '办公电话',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `attachment` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `save_addr` varchar(255) DEFAULT NULL COMMENT '附件存储地址',
  `register_date` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`),
  KEY `company_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_user
-- ----------------------------
INSERT INTO `company_user` VALUES ('1', '2', '用友网络科技股份有限公司i', '600001760', '', '91110000600001760P', '用友政务', '2', '124456789', 'www@qq.com', null, '123456789', null, null, null);

-- ----------------------------
-- Table structure for company_user_attachment
-- ----------------------------
DROP TABLE IF EXISTS `company_user_attachment`;
CREATE TABLE `company_user_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `doc_name` varchar(255) NOT NULL COMMENT '文件名称 存储在磁盘上的文件名称',
  `doc_id` varchar(32) DEFAULT NULL COMMENT '引用HAS_DOC',
  PRIMARY KEY (`id`),
  KEY `companyuser_attachment_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_user_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for document
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL COMMENT '审批单id',
  `keeptime` varchar(255) NOT NULL COMMENT '档案保管期限',
  `keep_by` varchar(255) DEFAULT NULL COMMENT '档案保管人',
  `documentid` varchar(2000) DEFAULT NULL COMMENT '档案编号',
  `saveaddress` varchar(20) DEFAULT NULL COMMENT '档案保管地点',
  `boxid` varchar(20) DEFAULT NULL COMMENT '档案保管盒号',
  `totalpage` int(11) DEFAULT NULL COMMENT '档案页数',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document
-- ----------------------------

-- ----------------------------
-- Table structure for form_attachment
-- ----------------------------
DROP TABLE IF EXISTS `form_attachment`;
CREATE TABLE `form_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` varchar(32) DEFAULT NULL COMMENT '处理单ID',
  `doc_type` int(11) DEFAULT NULL COMMENT '文件类型',
  `doc_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `doc_id` varchar(32) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL COMMENT '顺序',
  `islegal` char(1) DEFAULT NULL COMMENT '是否法定',
  `check_type` char(1) DEFAULT NULL COMMENT '是否必填',
  `scene` int(11) DEFAULT NULL COMMENT '场景',
  `statu` char(1) DEFAULT NULL COMMENT '文件状态',
  `create_time` datetime DEFAULT NULL,
  `other_flag` varchar(255) DEFAULT NULL COMMENT '其它附件标记',
  `filetype_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form_attachment
-- ----------------------------
INSERT INTO `form_attachment` VALUES ('1', '4dc5111f71eb4cc4a7ea4dff2d5ec695', '1', 'hello', 'e008a06b53e743deb52dc14c85b90756', null, '1', '1', '0', '0', null, null, null);
INSERT INTO `form_attachment` VALUES ('2', '77e00b02e44a44eaa69097e75c607777', '1', null, 'dc771758f33649e19e50a18e92ef6a55', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('3', '77e00b02e44a44eaa69097e75c607777', '2', null, '6c6aadde964f4821b0e31a764db767e4', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('4', '77e00b02e44a44eaa69097e75c607777', '3', null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('5', '77e00b02e44a44eaa69097e75c607777', '4', null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('6', '3841a0d8a88a49deb04beee31b8feaa9', '1', null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('7', '3841a0d8a88a49deb04beee31b8feaa9', '2', null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('8', '3841a0d8a88a49deb04beee31b8feaa9', '3', null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('9', '3841a0d8a88a49deb04beee31b8feaa9', '4', null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('10', '9f9a0d13767e4f01a628ea074bccbab3', '1', null, '320f3b5147164e4abf109bdc6d4ccf0f', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('11', '9f9a0d13767e4f01a628ea074bccbab3', '2', null, 'c50a40b8c3ef466f8257683118da7b2b', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('12', '9f9a0d13767e4f01a628ea074bccbab3', '3', null, '17dd5d02da354129995f7dd63406c1bb', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('13', '9f9a0d13767e4f01a628ea074bccbab3', '4', null, '3a8e479562114b1c92d367741835413b', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('14', '9f9a0d13767e4f01a628ea074bccbab3', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('15', '9f9a0d13767e4f01a628ea074bccbab3', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('16', '9f9a0d13767e4f01a628ea074bccbab3', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('17', '9f9a0d13767e4f01a628ea074bccbab3', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('18', '9f9a0d13767e4f01a628ea074bccbab3', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('19', '9f9a0d13767e4f01a628ea074bccbab3', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('20', '9f9a0d13767e4f01a628ea074bccbab3', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('21', '9f9a0d13767e4f01a628ea074bccbab3', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('22', '9f9a0d13767e4f01a628ea074bccbab3', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('23', '9f9a0d13767e4f01a628ea074bccbab3', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('24', '5e04b8f4312a46918206cd7bf476258c', '1', null, 'ec62ba70460645dea7cdd16b0abad3c4', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('25', '5e04b8f4312a46918206cd7bf476258c', '2', null, 'a9869458ed5948869472912368bdb7a4', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('26', '5e04b8f4312a46918206cd7bf476258c', '3', null, 'ebe6223f961d4361b873fb23a9b51cfa', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('27', '5e04b8f4312a46918206cd7bf476258c', '4', null, 'b3b5edd8f3a94de5849107b5842dcc0f', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('28', '5e04b8f4312a46918206cd7bf476258c', null, null, 'c43ef631a2684801afdf0f115510cd3d', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('29', '5e04b8f4312a46918206cd7bf476258c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('30', '5e04b8f4312a46918206cd7bf476258c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('31', '5e04b8f4312a46918206cd7bf476258c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('32', '5e04b8f4312a46918206cd7bf476258c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('33', '5e04b8f4312a46918206cd7bf476258c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('34', '5e04b8f4312a46918206cd7bf476258c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('35', '5e04b8f4312a46918206cd7bf476258c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('36', '5e04b8f4312a46918206cd7bf476258c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('37', '5e04b8f4312a46918206cd7bf476258c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('38', '40c67a2f3ac74273af28a8b79a934f3e', '1', null, 'ec62ba70460645dea7cdd16b0abad3c4', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('39', '40c67a2f3ac74273af28a8b79a934f3e', '2', null, 'a9869458ed5948869472912368bdb7a4', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('40', '40c67a2f3ac74273af28a8b79a934f3e', '3', null, 'ebe6223f961d4361b873fb23a9b51cfa', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('41', '40c67a2f3ac74273af28a8b79a934f3e', '4', null, 'b3b5edd8f3a94de5849107b5842dcc0f', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('42', '40c67a2f3ac74273af28a8b79a934f3e', null, null, 'c43ef631a2684801afdf0f115510cd3d', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('43', '40c67a2f3ac74273af28a8b79a934f3e', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('44', '40c67a2f3ac74273af28a8b79a934f3e', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('45', '40c67a2f3ac74273af28a8b79a934f3e', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('46', '40c67a2f3ac74273af28a8b79a934f3e', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('47', '40c67a2f3ac74273af28a8b79a934f3e', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('48', '40c67a2f3ac74273af28a8b79a934f3e', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('49', '40c67a2f3ac74273af28a8b79a934f3e', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('50', '40c67a2f3ac74273af28a8b79a934f3e', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('51', '40c67a2f3ac74273af28a8b79a934f3e', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('52', '97813a389c0f4bfa88da45074975724c', '1', null, 'ec62ba70460645dea7cdd16b0abad3c4', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('53', '97813a389c0f4bfa88da45074975724c', '2', null, 'a9869458ed5948869472912368bdb7a4', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('54', '97813a389c0f4bfa88da45074975724c', '3', null, 'ebe6223f961d4361b873fb23a9b51cfa', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('55', '97813a389c0f4bfa88da45074975724c', '4', null, 'b3b5edd8f3a94de5849107b5842dcc0f', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('56', '97813a389c0f4bfa88da45074975724c', null, null, 'c43ef631a2684801afdf0f115510cd3d', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('57', '97813a389c0f4bfa88da45074975724c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('58', '97813a389c0f4bfa88da45074975724c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('59', '97813a389c0f4bfa88da45074975724c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('60', '97813a389c0f4bfa88da45074975724c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('61', '97813a389c0f4bfa88da45074975724c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('62', '97813a389c0f4bfa88da45074975724c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('63', '97813a389c0f4bfa88da45074975724c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('64', '97813a389c0f4bfa88da45074975724c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('65', '97813a389c0f4bfa88da45074975724c', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('66', '037473116c5a40f283270d8125cb8633', '1', null, 'ec62ba70460645dea7cdd16b0abad3c4', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('67', '037473116c5a40f283270d8125cb8633', '2', null, 'a9869458ed5948869472912368bdb7a4', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('68', '037473116c5a40f283270d8125cb8633', '3', null, 'ebe6223f961d4361b873fb23a9b51cfa', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('69', '037473116c5a40f283270d8125cb8633', '4', null, 'b3b5edd8f3a94de5849107b5842dcc0f', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('70', '037473116c5a40f283270d8125cb8633', null, null, 'c43ef631a2684801afdf0f115510cd3d', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('71', '037473116c5a40f283270d8125cb8633', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('72', '037473116c5a40f283270d8125cb8633', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('73', '037473116c5a40f283270d8125cb8633', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('74', '037473116c5a40f283270d8125cb8633', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('75', '037473116c5a40f283270d8125cb8633', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('76', '037473116c5a40f283270d8125cb8633', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('77', '037473116c5a40f283270d8125cb8633', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('78', '037473116c5a40f283270d8125cb8633', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('79', '037473116c5a40f283270d8125cb8633', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('80', '7a58962472994c1fb2519a3973eb1ab2', '1', null, 'ec62ba70460645dea7cdd16b0abad3c4', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('81', '7a58962472994c1fb2519a3973eb1ab2', '2', null, 'a9869458ed5948869472912368bdb7a4', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('82', '7a58962472994c1fb2519a3973eb1ab2', '3', null, 'ebe6223f961d4361b873fb23a9b51cfa', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('83', '7a58962472994c1fb2519a3973eb1ab2', '4', null, 'b3b5edd8f3a94de5849107b5842dcc0f', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('84', '7a58962472994c1fb2519a3973eb1ab2', null, null, 'c43ef631a2684801afdf0f115510cd3d', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('85', '7a58962472994c1fb2519a3973eb1ab2', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('86', '7a58962472994c1fb2519a3973eb1ab2', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('87', '7a58962472994c1fb2519a3973eb1ab2', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('88', '7a58962472994c1fb2519a3973eb1ab2', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('89', '7a58962472994c1fb2519a3973eb1ab2', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('90', '7a58962472994c1fb2519a3973eb1ab2', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('91', '7a58962472994c1fb2519a3973eb1ab2', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('92', '7a58962472994c1fb2519a3973eb1ab2', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('93', '7a58962472994c1fb2519a3973eb1ab2', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('94', 'f22b7485f1084e159fbd839680977150', '1', null, '7a47c45f1c9f4cda84ebc7b86281d1e9', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('95', 'f22b7485f1084e159fbd839680977150', '2', null, 'bd499ecf62c644c48cdd19a895306321', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('96', 'f22b7485f1084e159fbd839680977150', '3', null, 'aad5a25f84d64d7abf077275e2091d37', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('97', 'f22b7485f1084e159fbd839680977150', '4', null, '2ae75ca9f6784a15933d603859c436fb', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('98', 'f22b7485f1084e159fbd839680977150', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('99', 'f22b7485f1084e159fbd839680977150', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('100', 'f22b7485f1084e159fbd839680977150', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('101', 'f22b7485f1084e159fbd839680977150', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('102', 'f22b7485f1084e159fbd839680977150', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('103', 'f22b7485f1084e159fbd839680977150', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('104', 'f22b7485f1084e159fbd839680977150', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('105', 'f22b7485f1084e159fbd839680977150', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('106', 'f22b7485f1084e159fbd839680977150', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('107', 'f22b7485f1084e159fbd839680977150', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('108', '78616af189f14c258c3178364a1493d7', '7', null, '581795e3608a4958bdf099930dee13af', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('109', '78616af189f14c258c3178364a1493d7', '8', null, '261eff50a63d46cba24955e0b7266c12', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('110', '78616af189f14c258c3178364a1493d7', '9', null, '04bbc3e0640944cfb3c310bf57e110ab', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('111', '78616af189f14c258c3178364a1493d7', '10', null, 'be212e77513846e882b82393b2d4965b', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('112', '78616af189f14c258c3178364a1493d7', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('113', '78616af189f14c258c3178364a1493d7', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('114', '78616af189f14c258c3178364a1493d7', null, null, null, null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('115', '22f03c7d218c4c3d88ea6e6c17b4a0b2', '1', null, '583418481aeb4e889b5840b24db45832', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('116', '22f03c7d218c4c3d88ea6e6c17b4a0b2', '2', null, 'd9aedf7dc34b44b4be2bbeb54fa68865', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('117', '22f03c7d218c4c3d88ea6e6c17b4a0b2', '3', null, 'b2a8e1c437c64815a8b235d05c0bb207', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('118', '22f03c7d218c4c3d88ea6e6c17b4a0b2', '4', null, 'd74ec8d46b044120adedafbfdc9a1137', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('119', '26e13fc955314cefa59188826c8c946a', '1', null, '583418481aeb4e889b5840b24db45832', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('120', '26e13fc955314cefa59188826c8c946a', '2', null, 'd9aedf7dc34b44b4be2bbeb54fa68865', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('121', '26e13fc955314cefa59188826c8c946a', '3', null, 'b2a8e1c437c64815a8b235d05c0bb207', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('122', '26e13fc955314cefa59188826c8c946a', '4', null, 'd74ec8d46b044120adedafbfdc9a1137', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('123', '18e40164a6d84204a4f2c566dba5cdf3', '1', null, '583418481aeb4e889b5840b24db45832', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('124', '18e40164a6d84204a4f2c566dba5cdf3', '2', null, 'd9aedf7dc34b44b4be2bbeb54fa68865', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('125', '18e40164a6d84204a4f2c566dba5cdf3', '3', null, 'b2a8e1c437c64815a8b235d05c0bb207', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('126', '18e40164a6d84204a4f2c566dba5cdf3', '4', null, 'd74ec8d46b044120adedafbfdc9a1137', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('127', 'f538fdcd562a45bdb2448432ccd6a45a', '1', null, '583418481aeb4e889b5840b24db45832', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('128', 'f538fdcd562a45bdb2448432ccd6a45a', '2', null, 'd9aedf7dc34b44b4be2bbeb54fa68865', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('129', 'f538fdcd562a45bdb2448432ccd6a45a', '3', null, 'b2a8e1c437c64815a8b235d05c0bb207', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('130', 'f538fdcd562a45bdb2448432ccd6a45a', '4', null, 'd74ec8d46b044120adedafbfdc9a1137', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('131', 'f538fdcd562a45bdb2448432ccd6a45a', null, null, 'bc80b072ca3540b49c50f76e1ead69f9', null, '1', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('152', 'be6c515aa089429fbb5bf00d4be8a1b8', '1', null, '885d1653e9514397bd3473663fe4d7e1', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('153', 'be6c515aa089429fbb5bf00d4be8a1b8', '2', null, '3b8465b7e4bc4c34b9d1963cbd5297be', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('154', 'be6c515aa089429fbb5bf00d4be8a1b8', '3', null, '167d08e9876645cf9d940668ac674cf4', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('155', 'be6c515aa089429fbb5bf00d4be8a1b8', '4', null, '1b43dc008919462d915cca5d4ed9776e', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('156', '949e12018acd4a658433ce54a9721219', '1', null, '34e7a6b096524ce38db478ee67a04b64', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('157', '949e12018acd4a658433ce54a9721219', '2', null, '7f761cf8e8ab458b9463b35f37a960dc', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('158', '949e12018acd4a658433ce54a9721219', '3', null, '8e1540f67bac4a9ebfbec75d90485c53', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('159', '949e12018acd4a658433ce54a9721219', '4', null, '10cac3fe8c8b4eb398df12b849e6873a', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('160', '13edf8bf71bd4729ab63cb0587b3f640', '1', null, '6ac0df399d264226b79639f5582f6a7e', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('161', '13edf8bf71bd4729ab63cb0587b3f640', '2', null, 'bd9857b5b7b14381943aeb321df981ec', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('162', '13edf8bf71bd4729ab63cb0587b3f640', '3', null, '99e6538123d04c5a842f3cbb50c1a885', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('163', '13edf8bf71bd4729ab63cb0587b3f640', '4', null, '170e63f48cb34035bf2d5c4a1ecaa3dd', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('164', '8afa49c3b1f24bbfbc59f632d958a310', '1', null, '0163ecdd33804a938fa5fda1fb73dcf2', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('165', '8afa49c3b1f24bbfbc59f632d958a310', '2', null, '70bfdfae78984d599c5892919afec179', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('166', '8afa49c3b1f24bbfbc59f632d958a310', '3', null, '3244dcd5c3d7435ca79c51d1cf6a5029', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('167', '8afa49c3b1f24bbfbc59f632d958a310', '4', null, '576479e03a314df38c0f6b7ef4591f61', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('168', '3c13d11091814d25b1518da2dbeb0a98', '1', null, 'f4e6f0e315b24537a2f67f8f6cd5dc21', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('169', '3c13d11091814d25b1518da2dbeb0a98', '2', null, '1c49e6d66eb940c8a23ede80d7c03e82', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('170', '3c13d11091814d25b1518da2dbeb0a98', '3', null, '7ecbeb756b9d4d859a6bc5dc9e51addc', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('171', '3c13d11091814d25b1518da2dbeb0a98', '4', null, 'c9d87c0b69cd4e22964f4641dbcb5573', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('172', 'df177edf08494d6c91d165e24545dc17', '5', null, '99db598f04314182b804356cab8f4c5c', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('173', 'df177edf08494d6c91d165e24545dc17', '6', null, 'd50fd3928a3a4b6caa19a10b510009b8', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('174', '4222e871b4f147eeaad6c8abdb9fe51b', '5', null, '02acfb06d9fd4c2d8597208fb6751dd9', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('175', '4222e871b4f147eeaad6c8abdb9fe51b', '6', null, '64dfcdcb4e5045b9aaecd91fb5401820', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('176', '07edd7b54abf4abba5375ff468e654e9', '5', null, '2fd14c1ef4da475c9eb98288111f63b3', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('177', '07edd7b54abf4abba5375ff468e654e9', '6', null, 'a2806da36b5f41a28291d17ec1c66e16', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('178', '10c3d54e7ab5415d91a632916c7a42ad', '5', null, 'b23a6e7eee954d49ae22907f481e3f77', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('179', '10c3d54e7ab5415d91a632916c7a42ad', '6', null, '4f25d74d202d43d3a09bf6bd246334bd', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('180', '3c1926d74f1646958bd9e3ebd6512bfc', '5', null, 'f13f069ddd17487b89b14dd35ad12b06', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('182', 'c355ae20e59247d9863affa024812073', '5', null, 'f717ac24ff1e419cb66779e5c56ea472', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('183', 'c355ae20e59247d9863affa024812073', '6', null, '1513d1a53c6b4046b1971d19a3f7bef8', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('188', '24dfcd628ef646dabc3454c05ca4f281', '11', null, '3c2d60147ba249c7a247e3fd7830b049', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('189', '24dfcd628ef646dabc3454c05ca4f281', '12', null, 'd4d55ede237d4d08928e083a83af9b52', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('191', '24dfcd628ef646dabc3454c05ca4f281', '14', null, 'f984468f6b534101b310eade05e2a879', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('196', '5b0ae10062e24b5b822337618cba8361', '19', null, 'b5b06d5d6522461291e64987ba554262', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('197', '5b0ae10062e24b5b822337618cba8361', '20', null, '6eb524b3ee77478bb7cd95da80ed19df', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('198', '5b0ae10062e24b5b822337618cba8361', '21', null, 'b7faa65b6750444ab369936e07e114ff', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('199', '067e8d19802f45f089111789a2996a1d', '19', null, 'b5b06d5d6522461291e64987ba554262', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('200', '067e8d19802f45f089111789a2996a1d', '20', null, '6eb524b3ee77478bb7cd95da80ed19df', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('201', '067e8d19802f45f089111789a2996a1d', '21', null, 'b7faa65b6750444ab369936e07e114ff', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('202', '2d1dd832837b466ebb90038c1955a1e1', '19', null, 'b5b06d5d6522461291e64987ba554262', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('203', '2d1dd832837b466ebb90038c1955a1e1', '20', null, '6eb524b3ee77478bb7cd95da80ed19df', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('204', '2d1dd832837b466ebb90038c1955a1e1', '21', null, 'b7faa65b6750444ab369936e07e114ff', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('205', '66f2fd3314a44fceb8fcbe0e27f55c26', '1', null, '8a8fb00635c74b69a8055ababc59fedb', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('206', '66f2fd3314a44fceb8fcbe0e27f55c26', '2', null, 'a471136dbc7d45a39f407718b9122d29', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('207', '66f2fd3314a44fceb8fcbe0e27f55c26', '3', null, '030639fa5b274b789b5e6b682a7dc050', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('208', '66f2fd3314a44fceb8fcbe0e27f55c26', '4', null, 'b64aea1fccfc46c381872a040b491014', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('209', '5c49a8a467fd4ddd95ca3859e804f0b7', '1', null, '8a8fb00635c74b69a8055ababc59fedb', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('210', '5c49a8a467fd4ddd95ca3859e804f0b7', '2', null, 'a471136dbc7d45a39f407718b9122d29', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('211', '5c49a8a467fd4ddd95ca3859e804f0b7', '3', null, '030639fa5b274b789b5e6b682a7dc050', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('212', '5c49a8a467fd4ddd95ca3859e804f0b7', '4', null, 'b64aea1fccfc46c381872a040b491014', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('213', 'a575417f793c4f3aa306c5226aefc3fd', '1', null, '7e77fc441dee42ce9b9c946dcc695759', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('214', 'a575417f793c4f3aa306c5226aefc3fd', '2', null, 'c9bcbb8e46e949578b817e5e00e7a504', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('215', 'a575417f793c4f3aa306c5226aefc3fd', '3', null, 'ae7e9acfdc1149279922b893037f90c0', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('216', 'a575417f793c4f3aa306c5226aefc3fd', '4', null, 'd1e2d3dd78c34bae9ddc986e3e203a75', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('217', 'a3a45aba36084c53b9b7a5217e0ed91a', '5', null, 'aa7769c2e6bd4bd2835e247f94ca83db', '1', '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('218', 'a3a45aba36084c53b9b7a5217e0ed91a', '6', null, '168b5d03a9c848d49e64b1d3adf56723', '2', '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('219', 'e499b7c56116490bb9b7e41c90fd5d2b', '5', null, '8645de9192144c5ca2497caf4c63cbda', '1', '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('220', 'e499b7c56116490bb9b7e41c90fd5d2b', '6', null, '8e25170ac1494f15a5a3ba136e8d5649', '2', '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('221', '17a41559de0e4a0ebda33f8dad7d6b93', '5', null, '8645de9192144c5ca2497caf4c63cbda', '1', '', '1', '0', '1', '2017-11-02 14:51:07', null, null);
INSERT INTO `form_attachment` VALUES ('222', '17a41559de0e4a0ebda33f8dad7d6b93', '6', null, '8e25170ac1494f15a5a3ba136e8d5649', '2', '', '1', '0', '1', '2017-11-02 14:51:08', null, null);
INSERT INTO `form_attachment` VALUES ('223', '97609ac262f54b72b6206bfb6f782acb', '5', null, 'a5b3000ac09a4a2cafddc9916e7e7bc4', '1', '', '1', '0', '1', '2017-11-02 15:24:29', null, null);
INSERT INTO `form_attachment` VALUES ('224', '97609ac262f54b72b6206bfb6f782acb', '6', null, '14e5198eff1b4ca89719634b3c4167a0', '2', '', '1', '0', '1', '2017-11-02 15:24:30', null, null);
INSERT INTO `form_attachment` VALUES ('225', '6696c263668f40b1a8c50f9f31d36d20', '11', null, '6443e84c5f4742a88bd3a290ec21a3de', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('226', '6696c263668f40b1a8c50f9f31d36d20', '12', null, 'f8a5d2e4eea1468cafdf8275c65a4c28', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('227', '6696c263668f40b1a8c50f9f31d36d20', '13', null, '24624c318b224a2697268bb0afa7a868', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('228', '6696c263668f40b1a8c50f9f31d36d20', '14', null, '0d8f434ae06d47e2aecffa9fc45a64a4', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('229', '0b06bc7271384aeaa437775898e71035', '5', null, 'a5b3000ac09a4a2cafddc9916e7e7bc4', '1', '', '1', '0', '1', '2017-11-02 15:26:19', null, null);
INSERT INTO `form_attachment` VALUES ('230', '0b06bc7271384aeaa437775898e71035', '6', null, '14e5198eff1b4ca89719634b3c4167a0', '2', '', '1', '0', '1', '2017-11-02 15:26:20', null, null);
INSERT INTO `form_attachment` VALUES ('231', '24aa68f24da24699a451e77edb4a73ac', '1', null, '1f510e42d9cd49b0bde1be69954c54f1', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('232', '24aa68f24da24699a451e77edb4a73ac', '2', null, '2161dbf785c840028c24876aa3419767', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('233', '24aa68f24da24699a451e77edb4a73ac', '3', null, 'f311b0d5b5574a11b537b32668312ca6', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('234', '24aa68f24da24699a451e77edb4a73ac', '4', null, 'd22370977ecd4f14954f74be689a3e9c', null, '', '1', '0', '1', null, null, null);
INSERT INTO `form_attachment` VALUES ('235', 'd4be2cda0cb746b59b3cfef61844ee09', '5', null, 'cf1a7b13dbfc4bb9a1fcefedff0e95ce', '1', '', '1', '0', '1', '2017-11-02 15:41:37', null, null);
INSERT INTO `form_attachment` VALUES ('236', 'd4be2cda0cb746b59b3cfef61844ee09', '6', null, '2b41435d72dc499787dda8f22590b8c9', '2', '', '1', '0', '1', '2017-11-02 15:41:38', null, null);
INSERT INTO `form_attachment` VALUES ('237', '3dcc24ac8c2e436386b2cc65952f962d', '11', null, '95d9446297fa42469148332224c89eb5', '1', '', '1', '0', '1', '2017-11-02 16:08:39', null, null);
INSERT INTO `form_attachment` VALUES ('238', '3dcc24ac8c2e436386b2cc65952f962d', '12', null, 'abaa5485ecf24ac192d70bdf633048da', '2', '', '1', '0', '1', '2017-11-02 16:08:39', null, null);
INSERT INTO `form_attachment` VALUES ('239', '3dcc24ac8c2e436386b2cc65952f962d', '13', null, '99ab184a52f24154b5497271a46a3d7e', '3', '', '1', '0', '1', '2017-11-02 16:08:39', null, null);
INSERT INTO `form_attachment` VALUES ('240', '3dcc24ac8c2e436386b2cc65952f962d', '14', null, '0bf0891942d446b3870b634103eda732', '4', '', '1', '0', '1', '2017-11-02 16:08:39', null, null);
INSERT INTO `form_attachment` VALUES ('241', '17033738db84468f967c60e30db29a3f', '1', null, '3c2fd0f6720d449296a731dcc59dad8c', '1', '', '1', '0', '1', '2017-11-02 16:11:15', null, null);
INSERT INTO `form_attachment` VALUES ('242', '17033738db84468f967c60e30db29a3f', '2', null, 'ae538ad192424e57bb5f9385f96b93da', '2', '', '1', '0', '1', '2017-11-02 16:11:15', null, null);
INSERT INTO `form_attachment` VALUES ('243', '17033738db84468f967c60e30db29a3f', '3', null, 'b50950d81d3a41f6b3c19d25618bbc3b', '3', '', '1', '0', '1', '2017-11-02 16:11:15', null, null);
INSERT INTO `form_attachment` VALUES ('244', '17033738db84468f967c60e30db29a3f', '4', null, '0794a5c8a0bd4f258ae151d0d09330d1', '4', '', '1', '0', '1', '2017-11-02 16:11:15', null, null);
INSERT INTO `form_attachment` VALUES ('245', 'c9d1efef5100459ca0cbb8f59e103243', '5', null, '9ce75b659dbf44bd8c32ffabf2d89b3a', '1', '', '1', '0', '1', '2017-11-02 16:14:50', null, null);
INSERT INTO `form_attachment` VALUES ('246', 'c9d1efef5100459ca0cbb8f59e103243', '6', null, '523773ee43334c03901a014378dbd7b0', '2', '', '1', '0', '1', '2017-11-02 16:14:50', null, null);
INSERT INTO `form_attachment` VALUES ('247', '46ff69a920db4d0380405c9050916e25', '5', null, '9ce75b659dbf44bd8c32ffabf2d89b3a', '1', '', '1', '0', '1', '2017-11-02 16:16:35', null, null);
INSERT INTO `form_attachment` VALUES ('248', '46ff69a920db4d0380405c9050916e25', '6', null, '523773ee43334c03901a014378dbd7b0', '2', '', '1', '0', '1', '2017-11-02 16:16:35', null, null);
INSERT INTO `form_attachment` VALUES ('249', 'dcefc6c37f044b7f8c291faa889b6903', '5', null, '9ce75b659dbf44bd8c32ffabf2d89b3a', '1', '', '1', '0', '1', '2017-11-02 16:18:03', null, null);
INSERT INTO `form_attachment` VALUES ('250', 'dcefc6c37f044b7f8c291faa889b6903', '6', null, '523773ee43334c03901a014378dbd7b0', '2', '', '1', '0', '1', '2017-11-02 16:18:03', null, null);
INSERT INTO `form_attachment` VALUES ('251', '753731a5e9fb4ad49e6b7cc98078034e', '5', null, 'dddbddcfba654d24b276a410548cfdce', '1', '', '1', '0', '1', '2017-11-02 16:18:15', null, null);
INSERT INTO `form_attachment` VALUES ('252', '753731a5e9fb4ad49e6b7cc98078034e', '6', null, '6785cf143d644aa29ad6a71678eaa0e2', '2', '', '1', '0', '1', '2017-11-02 16:18:16', null, null);
INSERT INTO `form_attachment` VALUES ('257', '9e0a8227d90b4566b5f36632aeae8142', '5', null, '820bdd5edb2d45f48009a1ae1cd34d30', '1', '', '1', '0', '1', '2017-11-02 16:22:27', null, null);
INSERT INTO `form_attachment` VALUES ('258', '9e0a8227d90b4566b5f36632aeae8142', '6', null, '3f924d2937424f5c8d6561f8744f8a9e', '2', '', '1', '0', '1', '2017-11-02 16:22:27', null, null);
INSERT INTO `form_attachment` VALUES ('261', 'f793b2f7ea3643c38862e1e6636d4d12', '5', null, 'dddbddcfba654d24b276a410548cfdce', '1', '', '1', '0', '1', '2017-11-02 16:26:50', null, null);
INSERT INTO `form_attachment` VALUES ('262', 'f793b2f7ea3643c38862e1e6636d4d12', '6', null, '6785cf143d644aa29ad6a71678eaa0e2', '2', '', '1', '0', '1', '2017-11-02 16:26:50', null, null);
INSERT INTO `form_attachment` VALUES ('263', '2e5932172e74474bb4e2be2496b1b840', '5', null, '6d4056ba20dc419f96a3e1ed2dcbe63e', '1', '', '1', '0', '1', '2017-11-02 16:32:02', null, null);
INSERT INTO `form_attachment` VALUES ('264', '2e5932172e74474bb4e2be2496b1b840', '6', null, '002eb2c3285c4efb81440e38c490363e', '2', '', '1', '0', '1', '2017-11-02 16:32:02', null, null);
INSERT INTO `form_attachment` VALUES ('265', 'd5429cbd7ac941789fe574294562f813', '5', null, '6d4056ba20dc419f96a3e1ed2dcbe63e', '1', '', '1', '0', '1', '2017-11-02 16:32:24', null, null);
INSERT INTO `form_attachment` VALUES ('266', 'd5429cbd7ac941789fe574294562f813', '6', null, '002eb2c3285c4efb81440e38c490363e', '2', '', '1', '0', '1', '2017-11-02 16:32:24', null, null);
INSERT INTO `form_attachment` VALUES ('267', '0db2749a6cae4ca6aae8a29bd5c6b141', null, null, '1d655c6ac8e44813aacf882a2c0e0725', '1', '0', '0', '0', '1', '2017-11-02 16:52:35', null, null);
INSERT INTO `form_attachment` VALUES ('268', '68a070a7d421432abb4d172844ca5144', '5', null, '1caf6155e4f24af5826d9188b8870d7e', '1', '', '1', '0', '1', '2017-11-02 17:07:59', null, null);
INSERT INTO `form_attachment` VALUES ('269', '68a070a7d421432abb4d172844ca5144', '6', null, '21dd122d549b46c0b76af6ab540b4774', '2', '', '1', '0', '1', '2017-11-02 17:07:59', null, null);
INSERT INTO `form_attachment` VALUES ('270', '68a070a7d421432abb4d172844ca5144', null, null, '2614c200de204a60ac107cdce1043501', '3', '0', '0', '0', '1', '2017-11-02 17:07:59', null, null);
INSERT INTO `form_attachment` VALUES ('272', 'a1aa112ec55642ba82620d7b6f6d2808', null, null, '04d7e9bee7184604ab86831e82e72843', '2', '0', '0', '0', '1', '2017-11-02 17:10:02', null, null);
INSERT INTO `form_attachment` VALUES ('274', '122c6510fb6e484ea70d796cb487f6be', null, null, 'f3020e30101b4359880c995abb13a90a', '2', '0', '0', '0', '1', '2017-11-02 17:46:55', null, null);
INSERT INTO `form_attachment` VALUES ('275', '122c6510fb6e484ea70d796cb487f6be', null, null, 'f3020e30101b4359880c995abb13a90a', '3', '0', '0', '0', '1', '2017-11-02 18:11:35', null, null);
INSERT INTO `form_attachment` VALUES ('276', '122c6510fb6e484ea70d796cb487f6be', null, null, 'f3020e30101b4359880c995abb13a90a', '4', '0', '0', '0', '1', '2017-11-02 18:12:24', null, null);
INSERT INTO `form_attachment` VALUES ('277', '93589f50c7284300a86bb6a651701a51', null, null, 'd332b1490b934a3691e97ef476ff9907', '1', '0', '0', '0', '1', '2017-11-02 18:13:30', null, null);
INSERT INTO `form_attachment` VALUES ('278', '93589f50c7284300a86bb6a651701a51', null, null, 'd332b1490b934a3691e97ef476ff9907', '2', '0', '0', '0', '1', '2017-11-02 18:14:34', null, null);
INSERT INTO `form_attachment` VALUES ('279', '93589f50c7284300a86bb6a651701a51', null, null, 'd332b1490b934a3691e97ef476ff9907', '3', '0', '0', '0', '1', '2017-11-02 18:14:58', null, null);
INSERT INTO `form_attachment` VALUES ('280', '93589f50c7284300a86bb6a651701a51', null, null, 'd332b1490b934a3691e97ef476ff9907', '4', '0', '0', '0', '1', '2017-11-02 18:20:18', null, null);
INSERT INTO `form_attachment` VALUES ('281', 'cce53f82809646ff846c48f4bb056690', null, null, 'd693424ccb5540429c4597a9fbdd1d91', '1', '0', '0', '0', '1', '2017-11-02 18:34:08', null, null);
INSERT INTO `form_attachment` VALUES ('282', '919212b5a18e47bea3f73df14601a572', null, null, '1e6be4899c9a4d3bb51afc43fb81dba6', '1', '0', '0', '0', '1', '2017-11-02 18:35:31', null, null);
INSERT INTO `form_attachment` VALUES ('283', 'be084b6ac8534286a8e68840ce815353', '5', null, 'ff07385d871e4ae997b5a300b7f4c742', '1', '', '1', '0', '1', '2017-11-02 18:54:15', null, null);
INSERT INTO `form_attachment` VALUES ('284', 'be084b6ac8534286a8e68840ce815353', '6', null, '5751449ae19545c18af5eac12d7332b4', '2', '', '1', '0', '1', '2017-11-02 18:54:15', null, null);
INSERT INTO `form_attachment` VALUES ('287', '4b82371420fa4f6ba2364ef27fef911d', null, null, 'da84f8aa656d4163887195014de70c92', '3', '0', '0', '0', '1', '2017-11-02 19:17:58', null, null);
INSERT INTO `form_attachment` VALUES ('290', '4b82371420fa4f6ba2364ef27fef911d', null, null, 'da84f8aa656d4163887195014de70c92', '4', '0', '0', '0', '1', '2017-11-02 19:18:24', null, null);
INSERT INTO `form_attachment` VALUES ('293', '4b82371420fa4f6ba2364ef27fef911d', null, null, 'da84f8aa656d4163887195014de70c92', '5', '0', '0', '0', '1', '2017-11-02 19:18:30', null, null);
INSERT INTO `form_attachment` VALUES ('294', '4b82371420fa4f6ba2364ef27fef911d', '5', null, '9ef9572904d5464a8299e9e6a9b3e4f2', '1', '', '1', '0', '1', '2017-11-02 19:18:39', null, null);
INSERT INTO `form_attachment` VALUES ('295', '4b82371420fa4f6ba2364ef27fef911d', '6', null, 'ae9d84b1e8e64f0eb2c31f1651bfb179', '2', '', '1', '0', '1', '2017-11-02 19:18:39', null, null);
INSERT INTO `form_attachment` VALUES ('296', '4b82371420fa4f6ba2364ef27fef911d', null, null, 'da84f8aa656d4163887195014de70c92', '6', '0', '0', '0', '1', '2017-11-02 19:18:39', null, null);
INSERT INTO `form_attachment` VALUES ('297', 'c083fbe8bbc4436485c565683ed21dce', null, null, '6b4d24c980de485a8ef74d2980c55496', '1', '0', '0', '0', '1', '2017-11-02 19:24:26', null, null);
INSERT INTO `form_attachment` VALUES ('298', 'c083fbe8bbc4436485c565683ed21dce', null, null, '3940c9153d844f6fa8cdd8817f5f538c', '2', '0', '0', '0', '1', '2017-11-02 19:24:26', null, null);
INSERT INTO `form_attachment` VALUES ('299', 'c083fbe8bbc4436485c565683ed21dce', null, null, '6b4d24c980de485a8ef74d2980c55496', '3', '0', '0', '0', '1', '2017-11-02 19:25:33', null, null);
INSERT INTO `form_attachment` VALUES ('300', 'c083fbe8bbc4436485c565683ed21dce', null, null, '3940c9153d844f6fa8cdd8817f5f538c', '4', '0', '0', '0', '1', '2017-11-02 19:25:33', null, null);
INSERT INTO `form_attachment` VALUES ('303', '3b7642abc1ae4c3f8cd7a758b6d4d486', null, null, '34948aee286948079addbfca023edd24', '1', '0', '0', '0', '1', '2017-11-02 19:49:41', 'otherFile1', null);
INSERT INTO `form_attachment` VALUES ('308', '01a23279f9584f47be6548baaafb7b29', null, null, '58d71270f2bc418a929ef926bb66355a', '5', '0', '0', '0', '1', '2017-11-02 19:51:00', null, null);
INSERT INTO `form_attachment` VALUES ('313', '01a23279f9584f47be6548baaafb7b29', null, null, '58d71270f2bc418a929ef926bb66355a', '6', '0', '0', '0', '1', '2017-11-02 19:51:15', null, null);
INSERT INTO `form_attachment` VALUES ('314', '01a23279f9584f47be6548baaafb7b29', '7', null, '55116bea3d4f476aa8dec57daa8741a3', '1', '', '1', '0', '1', '2017-11-02 19:53:12', null, null);
INSERT INTO `form_attachment` VALUES ('315', '01a23279f9584f47be6548baaafb7b29', '8', null, 'a37b1326ed5442ae9b89e1100bfd9038', '2', '', '1', '0', '1', '2017-11-02 19:53:12', null, null);
INSERT INTO `form_attachment` VALUES ('316', '01a23279f9584f47be6548baaafb7b29', '9', null, '0a57c5e415f34a58b9942af2c335c7f4', '3', '', '1', '0', '1', '2017-11-02 19:53:12', null, null);
INSERT INTO `form_attachment` VALUES ('317', '01a23279f9584f47be6548baaafb7b29', '10', null, '961f3c2f512a4fbe9558f7bad9740fcb', '4', '', '1', '0', '1', '2017-11-02 19:53:12', null, null);
INSERT INTO `form_attachment` VALUES ('318', '01a23279f9584f47be6548baaafb7b29', null, null, '58d71270f2bc418a929ef926bb66355a', '7', '0', '0', '0', '1', '2017-11-02 19:53:12', null, null);
INSERT INTO `form_attachment` VALUES ('325', 'e2026bc732de495d94b87730429feb8f', null, null, '9329528c833a42128b2dc07642afc98b', '1', '0', '0', '0', '1', '2017-11-02 20:14:17', 'otherFile1', '其他附件1');
INSERT INTO `form_attachment` VALUES ('326', 'e2026bc732de495d94b87730429feb8f', null, null, '0537929a3b184d928676e7de4c78f112', '2', '0', '0', '0', '1', '2017-11-02 20:14:36', 'otherFile2', '其他附件2');
INSERT INTO `form_attachment` VALUES ('353', 'c1561aadbb1549efa2083d818d47f17b', '5', null, 'c1554e0a12014f8ebf67d84c89dc541a', '1', '', '1', '0', '1', '2017-11-02 20:26:07', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('354', 'c1561aadbb1549efa2083d818d47f17b', '6', null, '1efe7e6e5c994c1e87e44323406b5393', '2', '', '1', '0', '1', '2017-11-02 20:26:08', null, '如确有客观原因无法收回境外放款本息的，需提交相关证明材料');
INSERT INTO `form_attachment` VALUES ('355', 'c1561aadbb1549efa2083d818d47f17b', null, null, '325adcb9709b4135b01066d793449df4', '3', '0', '0', '0', '1', '2017-11-02 20:26:09', 'otherFile5', '其他附件3');
INSERT INTO `form_attachment` VALUES ('356', 'c1561aadbb1549efa2083d818d47f17b', null, null, '26c68bfecaaf4ed182915e9fcce96af5', '4', '0', '0', '0', '1', '2017-11-02 20:26:10', 'otherFile7', '其他附件5');
INSERT INTO `form_attachment` VALUES ('357', 'c1561aadbb1549efa2083d818d47f17b', null, null, '6d217ab7a86040fb967ea69e2ee023a4', '5', '0', '0', '0', '1', '2017-11-02 20:26:27', 'otherFile8', '其他附件6');
INSERT INTO `form_attachment` VALUES ('364', '3887c58867964cca8f231f2463cb46ee', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 13:51:43', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('368', '3887c58867964cca8f231f2463cb46ee', '2', null, '5bebf1588b7c410b932d6528da059f8e', '2', '', '1', '0', '1', '2017-11-03 13:52:39', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('369', '3887c58867964cca8f231f2463cb46ee', '3', null, '66deccc5fd4a4a5794d12de997899ee3', '3', '', '1', '0', '1', '2017-11-03 13:52:41', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('370', '3887c58867964cca8f231f2463cb46ee', '4', null, '4832d3feba0e4b4ca506700d04087af6', '4', '', '1', '0', '1', '2017-11-03 13:52:41', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('371', '1c0e8c184f2b43f59ad30883a5711034', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 13:53:23', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('372', '1c0e8c184f2b43f59ad30883a5711034', '2', null, '774b8d364056484283ac2cceef7dfd36', '2', '', '1', '0', '1', '2017-11-03 13:53:23', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('373', '1c0e8c184f2b43f59ad30883a5711034', '3', null, '7dcf9d4286594d0483f47778d2cc3354', '3', '', '1', '0', '1', '2017-11-03 13:53:23', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('374', '1c0e8c184f2b43f59ad30883a5711034', '4', null, 'c978cee62c6740d2b7d09c2c099484e4', '4', '', '1', '0', '1', '2017-11-03 13:53:23', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('375', 'bc86870897ab43b99706c558acedd915', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 14:04:56', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('376', 'bc86870897ab43b99706c558acedd915', '2', null, 'dcaad29ba46343248fc2d2bd8d7d1244', '2', '', '1', '0', '1', '2017-11-03 14:04:56', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('377', 'bc86870897ab43b99706c558acedd915', '3', null, '0383d6d09a484745942e9e20fee9ddab', '3', '', '1', '0', '1', '2017-11-03 14:04:56', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('378', 'bc86870897ab43b99706c558acedd915', '4', null, '76775dba23ae468a92256a79f75bbb06', '4', '', '1', '0', '1', '2017-11-03 14:04:56', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('382', 'a0b966fbe6164b5592d1f4ade6eb34ea', '2', null, '105624af170e4550848c971d2faa1b18', '2', '', '1', '0', '1', '2017-11-03 14:07:35', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('383', 'a0b966fbe6164b5592d1f4ade6eb34ea', '3', null, 'a6ef203292844a5598670b7482329456', '3', '', '1', '0', '1', '2017-11-03 14:07:35', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('384', 'a0b966fbe6164b5592d1f4ade6eb34ea', '4', null, 'c48b3d82432848b9b6bc814603f1ce61', '4', '', '1', '0', '1', '2017-11-03 14:07:35', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('385', 'a0b966fbe6164b5592d1f4ade6eb34ea', null, null, '2cf03405ee6745849dc67d0febec7047', '5', '0', '0', '0', '1', '2017-11-03 14:07:35', 'otherFile4', '其他附件1');
INSERT INTO `form_attachment` VALUES ('386', 'a0b966fbe6164b5592d1f4ade6eb34ea', null, null, '5a36d1ab6ccc48338f78143fbebaa466', '6', '0', '0', '0', '1', '2017-11-03 14:07:35', 'otherFile5', '其他附件2');
INSERT INTO `form_attachment` VALUES ('387', 'c80ff356a489450d92a369b9035e003f', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 14:17:32', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('388', 'c80ff356a489450d92a369b9035e003f', '2', null, 'e1cfb6508ce049adad3db3f49e05e46f', '2', '', '1', '0', '1', '2017-11-03 14:17:32', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('389', 'c80ff356a489450d92a369b9035e003f', '3', null, 'ba14124f9ae341f4845d9ed848ce3af7', '3', '', '1', '0', '1', '2017-11-03 14:17:32', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('390', 'c80ff356a489450d92a369b9035e003f', '4', null, '55f5f04fbccf410aa868bd9d6322413a', '4', '', '1', '0', '1', '2017-11-03 14:17:32', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('394', 'e8f0d70e196a4137a87f4941ab1f21b9', '2', null, 'b83b9f4f667545b28f206b9d90ec6b58', '2', '', '1', '0', '1', '2017-11-03 14:25:21', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('395', 'e8f0d70e196a4137a87f4941ab1f21b9', '3', null, '65d1473143324398a3b027c2d4eee603', '3', '', '1', '0', '1', '2017-11-03 14:25:21', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('396', 'e8f0d70e196a4137a87f4941ab1f21b9', '4', null, '5b2fe7ef3261438e8ba3c2bf798a10bf', '4', '', '1', '0', '1', '2017-11-03 14:25:21', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('397', 'f784cccca4134d65988d7bf8ac785cdd', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 14:28:14', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('398', 'f784cccca4134d65988d7bf8ac785cdd', '2', null, 'ddd2b2c596d4495aae145e479eb045cc', '2', '', '1', '0', '1', '2017-11-03 14:28:14', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('399', 'f784cccca4134d65988d7bf8ac785cdd', '3', null, '81592fef0c8d4961a0b777fb907a4a1b', '3', '', '1', '0', '1', '2017-11-03 14:28:14', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('400', 'f784cccca4134d65988d7bf8ac785cdd', '4', null, '5bc3a9eef43e442dab012079cd37c874', '4', '', '1', '0', '1', '2017-11-03 14:28:14', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('405', '917e2c405e9146f49e1d9f4c9c074c00', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 15:06:38', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('406', '917e2c405e9146f49e1d9f4c9c074c00', '2', null, '8c1791ba3c8f4dfdb68fb0d4c30b4f5f', '2', '', '1', '0', '1', '2017-11-03 15:06:38', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('407', '917e2c405e9146f49e1d9f4c9c074c00', '3', null, 'b9b139a6c39b40a0a32b522ef3190536', '3', '', '1', '0', '1', '2017-11-03 15:06:38', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('408', '917e2c405e9146f49e1d9f4c9c074c00', '4', null, '72aa6f4bf42743329843bf698bce00eb', '4', '', '1', '0', '1', '2017-11-03 15:06:38', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('413', '96fd88a3fb3a4b72902f389e154cd8c0', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 15:08:38', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('414', '96fd88a3fb3a4b72902f389e154cd8c0', '2', null, '7f231c6c8d854ca4bba232e898c95d93', '2', '', '1', '0', '1', '2017-11-03 15:08:38', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('415', '96fd88a3fb3a4b72902f389e154cd8c0', '3', null, 'ce096c63bc0544c8b4bb5047377e5fcf', '3', '', '1', '0', '1', '2017-11-03 15:08:38', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('416', '96fd88a3fb3a4b72902f389e154cd8c0', '4', null, 'ae9fd76cd0364dc5ac4eb0ca7b135eca', '4', '', '1', '0', '1', '2017-11-03 15:08:38', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('421', 'a0d42ac44ff6403caef9f805295859c6', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 15:43:11', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('422', 'a0d42ac44ff6403caef9f805295859c6', '2', null, 'bb579751404c42ad8e5dd4e7830fea56', '2', '', '1', '0', '1', '2017-11-03 15:43:11', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('423', 'a0d42ac44ff6403caef9f805295859c6', '3', null, '128ecc2f3d4b458f9ff8bebfba395a8f', '3', '', '1', '0', '1', '2017-11-03 15:43:11', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('424', 'a0d42ac44ff6403caef9f805295859c6', '4', null, 'b26eca05661e4e06976e1b77e65fa243', '4', '', '1', '0', '1', '2017-11-03 15:43:11', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('425', '69a92508182548149d909683dd59c38f', '1', null, 'ebdc9ca4fb7945cfa5799f3a88dac3c6', '1', '', '0', '0', '1', '2017-11-03 16:31:26', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('426', '69a92508182548149d909683dd59c38f', '2', null, '267045f854904a8f9cf866588191ec62', '2', '', '1', '0', '1', '2017-11-03 16:31:26', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('427', '69a92508182548149d909683dd59c38f', '3', null, 'dd6ab7d1baef456e83dca17d18d4aa2d', '3', '', '1', '0', '1', '2017-11-03 16:31:27', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('428', '69a92508182548149d909683dd59c38f', '4', null, '56430fdbec1142ee80e07556811782c3', '4', '', '1', '0', '1', '2017-11-03 16:31:27', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('429', 'edcde1ee3cec4797904c3ce4088715c9', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 16:45:33', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('430', 'edcde1ee3cec4797904c3ce4088715c9', '2', null, '1d4c4195fead4ec2b2182c3b57bac97f', '2', '', '1', '0', '1', '2017-11-03 16:45:33', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('431', 'edcde1ee3cec4797904c3ce4088715c9', '3', null, '3ad6bb6b20ce4d27841beb2122b77811', '3', '', '1', '0', '1', '2017-11-03 16:45:33', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('432', 'edcde1ee3cec4797904c3ce4088715c9', '4', null, '89f25a1e358745c28fbeeb89a1b5817f', '4', '', '1', '0', '1', '2017-11-03 16:45:33', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('433', 'defcfc06e0f0416bae32f7f5dfc88a38', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 16:45:50', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('434', 'defcfc06e0f0416bae32f7f5dfc88a38', '2', null, '1a8abcbbab7d4aebaabd344f426d08b3', '2', '', '1', '0', '1', '2017-11-03 16:45:50', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('435', 'defcfc06e0f0416bae32f7f5dfc88a38', '3', null, '3ad6bb6b20ce4d27841beb2122b77811', '3', '', '1', '0', '1', '2017-11-03 16:45:50', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('436', 'defcfc06e0f0416bae32f7f5dfc88a38', '4', null, '89f25a1e358745c28fbeeb89a1b5817f', '4', '', '1', '0', '1', '2017-11-03 16:45:50', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('437', '92e2585c3fc8470ba782ee14136eae31', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 16:46:08', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('438', '92e2585c3fc8470ba782ee14136eae31', '2', null, '1a8abcbbab7d4aebaabd344f426d08b3', '2', '', '1', '0', '1', '2017-11-03 16:46:08', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('439', '92e2585c3fc8470ba782ee14136eae31', '3', null, '4c15bf06698741ba807582b7e84e320e', '3', '', '1', '0', '1', '2017-11-03 16:46:08', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('440', '92e2585c3fc8470ba782ee14136eae31', '4', null, '89f25a1e358745c28fbeeb89a1b5817f', '4', '', '1', '0', '1', '2017-11-03 16:46:08', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('463', 'b7e4f0ee2d4b456188284255467604a3', '34', null, '74e184d323034e41be204aca354dab8a', '1', '', '1', '0', '1', '2017-11-03 18:02:28', null, '书面申请（含变更或注销有关情况的说明）');
INSERT INTO `form_attachment` VALUES ('464', 'b7e4f0ee2d4b456188284255467604a3', '35', null, '25f5a08c01f04c7d9f6afe8e9381277e', '2', '', '1', '0', '1', '2017-11-03 18:02:55', null, '原业务登记凭证及最新填写的《境外上市登记表》');
INSERT INTO `form_attachment` VALUES ('465', 'b7e4f0ee2d4b456188284255467604a3', '36', null, '144e1bac1c8e4ea98489c045706fb79f', '3', '', '1', '0', '1', '2017-11-03 18:02:55', null, '主管部门关于变更（注销）事项的相关批复或备案文件');
INSERT INTO `form_attachment` VALUES ('466', 'b7e4f0ee2d4b456188284255467604a3', '37', null, '8248e1e5fad54f6a95475a862fe7229f', '4', '', '1', '0', '1', '2017-11-03 18:02:56', null, '相关账户和资金处理情况说明，相关账户销户证明材料');
INSERT INTO `form_attachment` VALUES ('467', 'b7e4f0ee2d4b456188284255467604a3', '38', null, 'f164724c001c4be9b7e3ab5283a84946', '5', '', '1', '0', '1', '2017-11-03 18:02:56', null, '前述材料内容不一致或不能说明交易真实性时，要求提供的补充材料');
INSERT INTO `form_attachment` VALUES ('472', '19b3b099d2424b98b0da80a4434ebead', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 18:18:05', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('473', '19b3b099d2424b98b0da80a4434ebead', '2', null, 'f77090e2c8234139856684c7c3d58520', '2', '', '1', '0', '1', '2017-11-03 18:18:05', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('474', '19b3b099d2424b98b0da80a4434ebead', '3', null, 'b80ac6e88a0f42d695fc93763f20ece1', '3', '', '1', '0', '1', '2017-11-03 18:18:05', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('475', '19b3b099d2424b98b0da80a4434ebead', '4', null, '1401055cf08641a898fe923372a55fc8', '4', '', '1', '0', '1', '2017-11-03 18:18:05', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('480', 'ba017bb389254980917ae675bbd4e061', '1', null, 'null', '1', '', '0', '0', '1', '2017-11-03 18:18:30', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('481', 'ba017bb389254980917ae675bbd4e061', '2', null, 'be452193e87e49a9bf8094682423a153', '2', '', '1', '0', '1', '2017-11-03 18:18:30', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('482', 'ba017bb389254980917ae675bbd4e061', '3', null, '290efbb44a5041039b08414b5b903612', '3', '', '1', '0', '1', '2017-11-03 18:18:30', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('483', 'ba017bb389254980917ae675bbd4e061', '4', null, '02f0f50e50214d65b0f7030cc81daca0', '4', '', '1', '0', '1', '2017-11-03 18:18:30', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('484', '9c4fbfd084c8458b8ef7874e8bd88332', null, null, '97b09174bd3b4e268d6ef9a25f88556f', '1', '0', '0', '0', '3', '2017-11-03 18:48:10', 'otherFile1', '其他附件1');
INSERT INTO `form_attachment` VALUES ('486', '38e8b2622dd24132b8c7515673ce9f84', '35', null, '6804866dbd054115add4422b37a9fd54', '2', '', '1', '0', '2', '2017-11-03 19:07:54', null, '原业务登记凭证及最新填写的《境外上市登记表》');
INSERT INTO `form_attachment` VALUES ('487', '38e8b2622dd24132b8c7515673ce9f84', '36', null, 'f1a228a87da047c6bbfd6d09c7912fe6', '3', '', '1', '0', '2', '2017-11-03 19:07:54', null, '主管部门关于变更（注销）事项的相关批复或备案文件');
INSERT INTO `form_attachment` VALUES ('488', '38e8b2622dd24132b8c7515673ce9f84', '37', null, '3acba00ab4f94154956418fea3874d74', '4', '', '1', '0', '3', '2017-11-03 19:07:54', null, '相关账户和资金处理情况说明，相关账户销户证明材料');
INSERT INTO `form_attachment` VALUES ('490', '38e8b2622dd24132b8c7515673ce9f84', '34', null, '5fb41ef6385d46b787b6acf642b95781', '1', '', '1', '0', '1', '2017-11-03 20:25:32', null, '书面申请（含变更或注销有关情况的说明）');
INSERT INTO `form_attachment` VALUES ('491', '38e8b2622dd24132b8c7515673ce9f84', '35', null, '6804866dbd054115add4422b37a9fd54', '2', '', '1', '0', '1', '2017-11-03 20:25:32', null, '原业务登记凭证及最新填写的《境外上市登记表》');
INSERT INTO `form_attachment` VALUES ('492', '38e8b2622dd24132b8c7515673ce9f84', '36', null, 'f1a228a87da047c6bbfd6d09c7912fe6', '3', '', '1', '0', '1', '2017-11-03 20:25:32', null, '主管部门关于变更（注销）事项的相关批复或备案文件');
INSERT INTO `form_attachment` VALUES ('493', '38e8b2622dd24132b8c7515673ce9f84', '37', null, '3acba00ab4f94154956418fea3874d74', '4', '', '1', '0', '1', '2017-11-03 20:25:32', null, '相关账户和资金处理情况说明，相关账户销户证明材料');
INSERT INTO `form_attachment` VALUES ('494', '38e8b2622dd24132b8c7515673ce9f84', '38', null, 'a741ac7a0ca142349f10ba67577efeea', '5', '', '1', '0', '1', '2017-11-03 20:25:32', null, '前述材料内容不一致或不能说明交易真实性时，要求提供的补充材料');
INSERT INTO `form_attachment` VALUES ('495', 'b3007d8f6d01440faa788205a1116593', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 20:48:02', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('496', 'b3007d8f6d01440faa788205a1116593', '2', null, '75f7f30216f04fa3b5cc1896a07fffaf', '2', '', '1', '0', '1', '2017-11-03 20:48:05', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('497', 'b3007d8f6d01440faa788205a1116593', '3', null, '12c448a231324b31ba4fa00b2546e652', '3', '', '1', '0', '1', '2017-11-03 20:48:09', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('498', 'b3007d8f6d01440faa788205a1116593', '4', null, 'aa81ef5554e2479e8b1e0f226a30eeca', '4', '', '1', '0', '1', '2017-11-03 20:48:09', null, '外汇局根据本规定认为需要补充的相关证明材料');
INSERT INTO `form_attachment` VALUES ('499', '9020f73a179e4174b70716667747e19c', '1', null, null, '1', '', '0', '0', '1', '2017-11-03 20:49:27', null, '《境外放款外汇登记业务申请表》');
INSERT INTO `form_attachment` VALUES ('500', '9020f73a179e4174b70716667747e19c', '2', null, '75f7f30216f04fa3b5cc1896a07fffaf', '2', '', '1', '0', '1', '2017-11-03 20:49:27', null, '境外放款协议或变更后的境外放款协议');
INSERT INTO `form_attachment` VALUES ('501', '9020f73a179e4174b70716667747e19c', '3', null, '12c448a231324b31ba4fa00b2546e652', '3', '', '1', '0', '1', '2017-11-03 20:49:27', null, '放款人最近一期财务审计报告及财务报表 ');
INSERT INTO `form_attachment` VALUES ('502', '9020f73a179e4174b70716667747e19c', '4', null, 'aa81ef5554e2479e8b1e0f226a30eeca', '4', '', '1', '0', '1', '2017-11-03 20:49:27', null, '外汇局根据本规定认为需要补充的相关证明材料');

-- ----------------------------
-- Table structure for guides
-- ----------------------------
DROP TABLE IF EXISTS `guides`;
CREATE TABLE `guides` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `guides_name` varchar(255) NOT NULL COMMENT '办事指南名称',
  `guides_content` varchar(255) DEFAULT NULL COMMENT '办事指南内容',
  `is_public` char(1) DEFAULT NULL COMMENT '是否发布到外网',
  `order` int(11) DEFAULT NULL COMMENT '外网显示顺序',
  `type` char(1) DEFAULT NULL COMMENT '范围 银行可见、企业用户可见',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guides
-- ----------------------------
INSERT INTO `guides` VALUES ('1', '办事指南1', '办事指南内容页1 此记录为对外发布、置顶、仅企业用户看到', '1', '1', '1', null, '2017-01-01 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('2', '办事指南2', '办事指南内容页2 此记录为对外发布、不置顶、仅企业用户看到', '1', '0', '0', null, '2017-01-02 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('3', '办事指南3', '办事指南内容页3 此记录为对外发布、置顶、仅企业用户看到', '1', '2', '0', null, '2017-01-03 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('4', '办事指南4', '办事指南内容页4 此记录为对外发布、不置顶、仅企业用户看到', '1', '0', '0', null, '2017-01-04 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('5', '办事指南5', '办事指南内容页5 此记录为对外发布、置顶、仅企业用户看到', '1', '3', '0', null, '2017-01-05 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('6', '办事指南6', '办事指南内容页6 此记录为对外发布、不置顶、仅企业用户看到', '1', '0', '0', null, '2017-01-06 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('7', '办事指南7', '办事指南内容页7 此记录为对外发布、置顶、仅企业用户看到', '1', '4', '0', null, '2017-01-07 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('8', '办事指南8', '办事指南内容页8 此记录为对外发布、不置顶、仅企业用户看到', '1', '0', '0', null, '2017-01-08 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('9', '办事指南9', '办事指南内容页9 此记录为对外发布、置顶、仅企业用户看到', '1', '5', '0', null, '2017-01-09 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('10', '办事指南10', '办事指南内容页10 此记录为对外发布、不置顶、仅企业用户看到', '0', '0', '0', null, '2017-01-10 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('11', '办事指南11', '办事指南内容页11 此记录为对外发布、置顶、仅银行用户看到', '1', '1', '1', null, '2017-01-11 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('12', '办事指南12', '办事指南内容页12 此记录为对外发布、不置顶、仅银行用户看到', '1', '0', '1', null, '2017-01-12 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('13', '办事指南13', '办事指南内容页13 此记录为对外发布、置顶、仅银行用户看到', '1', '2', '1', null, '2017-01-13 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('14', '办事指南14', '办事指南内容页14 此记录为对外发布、不置顶、仅银行用户看到', '1', '0', '1', null, '2017-01-14 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('15', '办事指南15', '办事指南内容页15 此记录为对外发布、置顶、仅银行用户看到', '1', '3', '1', null, '2017-01-15 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('16', '办事指南16', '办事指南内容页16 此记录为对外发布、不置顶、仅银行用户看到', '1', '0', '1', null, '2017-01-16 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('17', '办事指南17', '办事指南内容页17 此记录为对外发布、置顶、仅银行用户看到', '1', '4', '1', null, '2017-01-17 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('18', '办事指南18', '办事指南内容页18 此记录为对外发布、不置顶、仅银行用户看到', '1', '0', '1', null, '2017-01-18 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('19', '办事指南19', '办事指南内容页19 此记录为对外发布、置顶、仅银行用户看到', '1', '5', '1', null, '2017-01-19 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('20', '办事指南20', '办事指南内容页20 此记录为对外发布、不置顶、仅银行用户看到', '0', '0', '1', null, '2017-01-20 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('21', '办事指南21', '办事指南内容页21 此记录为对外发布、置顶、全用户看到', '1', '1', '2', null, '2017-01-21 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('22', '办事指南22', '办事指南内容页22 此记录为对外发布、不置顶、全用户看到', '1', '0', '2', null, '2017-01-22 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('23', '办事指南23', '办事指南内容页23 此记录为对外发布、置顶、全用户看到', '1', '2', '2', null, '2017-01-23 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('24', '办事指南24', '办事指南内容页24 此记录为对外发布、不置顶、全用户看到', '1', '0', '2', null, '2017-01-24 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('25', '办事指南25', '办事指南内容页25 此记录为对外发布、置顶、全用户看到', '1', '3', '2', null, '2017-01-25 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('26', '办事指南26', '办事指南内容页26 此记录为对外发布、不置顶、全用户看到', '1', '0', '2', null, '2017-01-26 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('27', '办事指南27', '办事指南内容页27 此记录为对外发布、置顶、全用户看到', '1', '4', '2', null, '2017-01-27 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('28', '办事指南28', '办事指南内容页28 此记录为对外发布、不置顶、全用户看到', '1', '0', '2', null, '2017-01-28 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('29', '办事指南29', '办事指南内容页29 此记录为对外发布、置顶、全用户看到', '1', '5', '2', null, '2017-01-29 00:00:00', null, null, null, '1');
INSERT INTO `guides` VALUES ('30', '办事指南30', '办事指南内容页30 此记录为对外发布、不置顶、全用户看到', '0', '0', '2', null, '2017-01-30 00:00:00', null, null, null, '1');

-- ----------------------------
-- Table structure for guide_attachment
-- ----------------------------
DROP TABLE IF EXISTS `guide_attachment`;
CREATE TABLE `guide_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `guide_id` int(11) NOT NULL COMMENT '处理单ID',
  `doc_name` varchar(255) NOT NULL COMMENT '文件名称',
  `doc_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guide_id` (`guide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guide_attachment
-- ----------------------------
INSERT INTO `guide_attachment` VALUES ('1', '1', '办事指南1的附件', '1');
INSERT INTO `guide_attachment` VALUES ('2', '2', '办事指南2的附件', '2');
INSERT INTO `guide_attachment` VALUES ('3', '3', '办事指南3的附件', '3');
INSERT INTO `guide_attachment` VALUES ('4', '4', '办事指南4的附件', '4');
INSERT INTO `guide_attachment` VALUES ('5', '5', '办事指南5的附件', '5');
INSERT INTO `guide_attachment` VALUES ('6', '6', '办事指南6的附件', '6');
INSERT INTO `guide_attachment` VALUES ('7', '7', '办事指南7的附件', '7');
INSERT INTO `guide_attachment` VALUES ('8', '8', '办事指南8的附件', '8');
INSERT INTO `guide_attachment` VALUES ('9', '9', '办事指南9的附件', '9');
INSERT INTO `guide_attachment` VALUES ('10', '10', '办事指南10的附件', '10');
INSERT INTO `guide_attachment` VALUES ('11', '11', '办事指南11的附件', '11');
INSERT INTO `guide_attachment` VALUES ('12', '12', '办事指南12的附件', '12');
INSERT INTO `guide_attachment` VALUES ('13', '13', '办事指南13的附件', '13');
INSERT INTO `guide_attachment` VALUES ('14', '14', '办事指南14的附件', '14');
INSERT INTO `guide_attachment` VALUES ('15', '15', '办事指南15的附件', '15');
INSERT INTO `guide_attachment` VALUES ('16', '16', '办事指南16的附件', '16');
INSERT INTO `guide_attachment` VALUES ('17', '17', '办事指南17的附件', '17');
INSERT INTO `guide_attachment` VALUES ('18', '18', '办事指南18的附件', '18');
INSERT INTO `guide_attachment` VALUES ('19', '19', '办事指南19的附件', '19');
INSERT INTO `guide_attachment` VALUES ('20', '20', '办事指南20的附件', '20');
INSERT INTO `guide_attachment` VALUES ('21', '21', '办事指南21的附件', '21');
INSERT INTO `guide_attachment` VALUES ('22', '22', '办事指南22的附件', '22');
INSERT INTO `guide_attachment` VALUES ('23', '23', '办事指南23的附件', '23');
INSERT INTO `guide_attachment` VALUES ('24', '24', '办事指南24的附件', '24');
INSERT INTO `guide_attachment` VALUES ('25', '25', '办事指南25的附件', '25');
INSERT INTO `guide_attachment` VALUES ('26', '26', '办事指南26的附件', '26');
INSERT INTO `guide_attachment` VALUES ('27', '27', '办事指南27的附件', '27');
INSERT INTO `guide_attachment` VALUES ('28', '28', '办事指南28的附件', '28');
INSERT INTO `guide_attachment` VALUES ('29', '29', '办事指南29的附件', '29');
INSERT INTO `guide_attachment` VALUES ('30', '30', '办事指南30的附件', '30');

-- ----------------------------
-- Table structure for has_addr_info
-- ----------------------------
DROP TABLE IF EXISTS `has_addr_info`;
CREATE TABLE `has_addr_info` (
  `logic_addr` varchar(32) NOT NULL COMMENT '主机逻辑地址',
  `real_addr` varchar(255) NOT NULL COMMENT 'CIFS访问地址',
  `web_addr` varchar(255) DEFAULT NULL COMMENT 'WEB方式访问地址',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT 'REMOTE地址',
  `low_logic_addr` varchar(255) DEFAULT NULL COMMENT 'LOW_LOGIC地址',
  `low_real_addr` varchar(255) DEFAULT NULL COMMENT 'LOW_REAL地址',
  `read_enabled` char(1) NOT NULL COMMENT '可读',
  `write_enabled` char(1) NOT NULL COMMENT '可写',
  `username` varchar(64) NOT NULL COMMENT 'CIFS访问用户名',
  `pwd` varchar(64) NOT NULL COMMENT 'CIFS访问密码',
  PRIMARY KEY (`logic_addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of has_addr_info
-- ----------------------------
INSERT INTO `has_addr_info` VALUES ('HAS2', '\\\\10.4.31.61\\bankshare', 'HAS2', null, null, null, '0', '0', 'ZGCZH', '123456');

-- ----------------------------
-- Table structure for has_doc
-- ----------------------------
DROP TABLE IF EXISTS `has_doc`;
CREATE TABLE `has_doc` (
  `doc_id` varchar(32) NOT NULL,
  `doc_name` varchar(64) NOT NULL COMMENT '文件名称',
  `doc_src_name` varchar(255) NOT NULL COMMENT '文件原始名称',
  `doc_size` decimal(10,0) NOT NULL COMMENT '文件大小',
  `host_addr` varchar(32) DEFAULT NULL COMMENT '主机逻辑地址',
  `save_addr` varchar(255) NOT NULL COMMENT '保存地址',
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of has_doc
-- ----------------------------
INSERT INTO `has_doc` VALUES ('002eb2c3285c4efb81440e38c490363e', '002eb2c3285c4efb81440e38c490363e', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('00cea0559c3547fe8b52037b58cd99c7', '00cea0559c3547fe8b52037b58cd99c7', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('014c240cbfb147deacd301fa72471381', '014c240cbfb147deacd301fa72471381', '企业-登录.psd', '3122672', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('0163097512de4a0ea0d3039c33bc7970', '0163097512de4a0ea0d3039c33bc7970', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('016374d3fd9441b4b05fa695298797df', '016374d3fd9441b4b05fa695298797df', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('0163ecdd33804a938fa5fda1fb73dcf2', '0163ecdd33804a938fa5fda1fb73dcf2', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('01f75312b4be455aa14b7297cb2d9ca6', '01f75312b4be455aa14b7297cb2d9ca6', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('02acfb06d9fd4c2d8597208fb6751dd9', '02acfb06d9fd4c2d8597208fb6751dd9', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('02f0f50e50214d65b0f7030cc81daca0', '02f0f50e50214d65b0f7030cc81daca0', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('030639fa5b274b789b5e6b682a7dc050', '030639fa5b274b789b5e6b682a7dc050', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('034462080e3943f8b8ca85af86c27c1e', '034462080e3943f8b8ca85af86c27c1e', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('0383d6d09a484745942e9e20fee9ddab', '0383d6d09a484745942e9e20fee9ddab', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('04bbc3e0640944cfb3c310bf57e110ab', '04bbc3e0640944cfb3c310bf57e110ab', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('04d7e9bee7184604ab86831e82e72843', '04d7e9bee7184604ab86831e82e72843', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('0522166889804c1ca936f6e8b8c10851', '0522166889804c1ca936f6e8b8c10851', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('0528584043464361b0443f18d6189687', '0528584043464361b0443f18d6189687', '审批.psd', '1721084', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('0537929a3b184d928676e7de4c78f112', '0537929a3b184d928676e7de4c78f112', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('053afb7994e949e7ba4a205eacbb1bcd', '053afb7994e949e7ba4a205eacbb1bcd', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('06c6fcb23df24152beaf8c505a23a037', '06c6fcb23df24152beaf8c505a23a037', 'caidan .txt', '406', null, 'null/files/2017/10/25/');
INSERT INTO `has_doc` VALUES ('0753153935dc48b093e48a12e40932d5', '0753153935dc48b093e48a12e40932d5', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('07885464daf84363b7ec7780be2d05aa', '07885464daf84363b7ec7780be2d05aa', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('0794a5c8a0bd4f258ae151d0d09330d1', '0794a5c8a0bd4f258ae151d0d09330d1', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('08aaa224a6bf40d0b86996aeb29258f1', '08aaa224a6bf40d0b86996aeb29258f1', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('08dd7b26351649a48f6af8d01aa00f02', '08dd7b26351649a48f6af8d01aa00f02', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('090dfa8be9d7477ea8252d46844af6d9', '090dfa8be9d7477ea8252d46844af6d9', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('0a57c5e415f34a58b9942af2c335c7f4', '0a57c5e415f34a58b9942af2c335c7f4', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('0be4462f108e46429e016bae4d338f11', '0be4462f108e46429e016bae4d338f11', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('0bf0891942d446b3870b634103eda732', '0bf0891942d446b3870b634103eda732', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('0c179b9eb2c04a88854c03661eb6058f', '0c179b9eb2c04a88854c03661eb6058f', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('0c94f9110e7e4398abded4e1afd7a698', '0c94f9110e7e4398abded4e1afd7a698', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('0ccd40bc96064a0cb439d3312dd86072', '0ccd40bc96064a0cb439d3312dd86072', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('0d7bf731642f43bd986fff2f7f55da1a', '0d7bf731642f43bd986fff2f7f55da1a', 'Y01+外汇业务网上预审批系统_详细设计说明书V1.40（加批注）(1).pdf', '4049440', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('0d84a148e92a44b683b229becb876550', '0d84a148e92a44b683b229becb876550', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('0d8f434ae06d47e2aecffa9fc45a64a4', '0d8f434ae06d47e2aecffa9fc45a64a4', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('0dad5a5bdd4d4f1cb56a8f9e92578fea', '0dad5a5bdd4d4f1cb56a8f9e92578fea', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('0de9013d03a34c03a67e84747e59c819', '0de9013d03a34c03a67e84747e59c819', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('0e81d7a4d098497e9c92c26426105eeb', '0e81d7a4d098497e9c92c26426105eeb', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('0eb45e396fc94c36934204e3a6c5e702', '0eb45e396fc94c36934204e3a6c5e702', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('0f01122b8a9b409a986b8108e125148c', '0f01122b8a9b409a986b8108e125148c', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('0f2c188645c24e1ea60127f21080b3c3', '0f2c188645c24e1ea60127f21080b3c3', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('0fa806c3c7264029a6cfe769b7162dd3', '0fa806c3c7264029a6cfe769b7162dd3', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('105624af170e4550848c971d2faa1b18', '105624af170e4550848c971d2faa1b18', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('1066a1fa4da6463cb44e3b3b2e2da546', '1066a1fa4da6463cb44e3b3b2e2da546', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('107d021b5d4b46cb9559a27b128ba275', '107d021b5d4b46cb9559a27b128ba275', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('10e3e958cac5416aa2d40aff8d98b194', '10e3e958cac5416aa2d40aff8d98b194', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('11b079836c5a40c89107293ce8d581b9', '11b079836c5a40c89107293ce8d581b9', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('128ecc2f3d4b458f9ff8bebfba395a8f', '128ecc2f3d4b458f9ff8bebfba395a8f', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('12966c25e5494136b35978259ad53523', '12966c25e5494136b35978259ad53523', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('129c1bccd0824850a0260eba55d11d0a', '129c1bccd0824850a0260eba55d11d0a', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('12c448a231324b31ba4fa00b2546e652', '12c448a231324b31ba4fa00b2546e652', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('136e314638594b94b427652f94aaaf2b', '136e314638594b94b427652f94aaaf2b', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('139fbe3ebcd64e0daebb1d15d2583aba', '139fbe3ebcd64e0daebb1d15d2583aba', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('1401055cf08641a898fe923372a55fc8', '1401055cf08641a898fe923372a55fc8', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('14454c42b19545ce940c5c6fb939c52c', '14454c42b19545ce940c5c6fb939c52c', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('144e1bac1c8e4ea98489c045706fb79f', '144e1bac1c8e4ea98489c045706fb79f', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('14a2e6c27f834fa791b27af93c2a8831', '14a2e6c27f834fa791b27af93c2a8831', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('14e5198eff1b4ca89719634b3c4167a0', '14e5198eff1b4ca89719634b3c4167a0', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('1513d1a53c6b4046b1971d19a3f7bef8', '1513d1a53c6b4046b1971d19a3f7bef8', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('158b3829f5f14ae7b9fe556fd32b9d15', '158b3829f5f14ae7b9fe556fd32b9d15', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('1591a1e5f09040a5be64c6ca05f323d2', '1591a1e5f09040a5be64c6ca05f323d2', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('15fe13e222714e77b1e3989da02cd26a', '15fe13e222714e77b1e3989da02cd26a', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('160225e5f1ba485f952b70cc13a89e20', '160225e5f1ba485f952b70cc13a89e20', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('167d08e9876645cf9d940668ac674cf4', '167d08e9876645cf9d940668ac674cf4', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('168b5d03a9c848d49e64b1d3adf56723', '168b5d03a9c848d49e64b1d3adf56723', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('170e63f48cb34035bf2d5c4a1ecaa3dd', '170e63f48cb34035bf2d5c4a1ecaa3dd', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('17dd5d02da354129995f7dd63406c1bb', '17dd5d02da354129995f7dd63406c1bb', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('180bb098bd274ef4b732f0e544ceff38', '180bb098bd274ef4b732f0e544ceff38', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('187edc8bc15341988bc51547e303ee12', '187edc8bc15341988bc51547e303ee12', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('19f0168487be4a95a8ea6e85f8544d40', '19f0168487be4a95a8ea6e85f8544d40', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('1a11aff21bc1405e80bcc904b3c82036', '1a11aff21bc1405e80bcc904b3c82036', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('1a627a3b31a849968c243b5af48427f3', '1a627a3b31a849968c243b5af48427f3', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('1a8abcbbab7d4aebaabd344f426d08b3', '1a8abcbbab7d4aebaabd344f426d08b3', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('1a8b2b53653649c58e420b6e92b30565', '1a8b2b53653649c58e420b6e92b30565', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('1b275e28174d49d7a3e107cbbbdbdd72', '1b275e28174d49d7a3e107cbbbdbdd72', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('1b43dc008919462d915cca5d4ed9776e', '1b43dc008919462d915cca5d4ed9776e', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('1c49e6d66eb940c8a23ede80d7c03e82', '1c49e6d66eb940c8a23ede80d7c03e82', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('1caf6155e4f24af5826d9188b8870d7e', '1caf6155e4f24af5826d9188b8870d7e', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('1ce3c14a5d7d40788ce743159df45498', '1ce3c14a5d7d40788ce743159df45498', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('1d4c4195fead4ec2b2182c3b57bac97f', '1d4c4195fead4ec2b2182c3b57bac97f', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('1d63f76102644b5c829e419cd8967487', '1d63f76102644b5c829e419cd8967487', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('1d655c6ac8e44813aacf882a2c0e0725', '1d655c6ac8e44813aacf882a2c0e0725', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('1d8e6eae46da401cbfa916a88730fed5', '1d8e6eae46da401cbfa916a88730fed5', 'v2-b7cfa4cbb9f3bc4811625081914cb6b7_r.jpg', '229025', null, 'file/files/2017/10/27/');
INSERT INTO `has_doc` VALUES ('1e44ef536bd94fb89da444d30a1d9a45', '1e44ef536bd94fb89da444d30a1d9a45', 'aaa.pdf', '0', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('1e6be4899c9a4d3bb51afc43fb81dba6', '1e6be4899c9a4d3bb51afc43fb81dba6', '264X201710310546.pdf', '187900', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('1efe7e6e5c994c1e87e44323406b5393', '1efe7e6e5c994c1e87e44323406b5393', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('1f3731c317fb4517a6ecc9f68ff644ca', '1f3731c317fb4517a6ecc9f68ff644ca', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('1f3bc8b7422448e3b35a9ce7c66384e0', '1f3bc8b7422448e3b35a9ce7c66384e0', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('1f510e42d9cd49b0bde1be69954c54f1', '1f510e42d9cd49b0bde1be69954c54f1', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('214403ce794648a1b07497ab57cc0405', '214403ce794648a1b07497ab57cc0405', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('2161dbf785c840028c24876aa3419767', '2161dbf785c840028c24876aa3419767', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('21da978311774f28a31a181698c23430', '21da978311774f28a31a181698c23430', '查询-办事指南.psd', '757872', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('21dd122d549b46c0b76af6ab540b4774', '21dd122d549b46c0b76af6ab540b4774', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('2226ece9d0e94642aaf0c64e6acfc322', '2226ece9d0e94642aaf0c64e6acfc322', '企业-登录.psd', '3122672', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('2275c766cbde4fc693c84aa725d0f5a3', '2275c766cbde4fc693c84aa725d0f5a3', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('244061070b7f4123a7d921b6aedda00e', '244061070b7f4123a7d921b6aedda00e', 'noFound.png', '4702', null, 'null/files/2017/10/25/');
INSERT INTO `has_doc` VALUES ('24624c318b224a2697268bb0afa7a868', '24624c318b224a2697268bb0afa7a868', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('25f5a08c01f04c7d9f6afe8e9381277e', '25f5a08c01f04c7d9f6afe8e9381277e', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('2614c200de204a60ac107cdce1043501', '2614c200de204a60ac107cdce1043501', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('261eff50a63d46cba24955e0b7266c12', '261eff50a63d46cba24955e0b7266c12', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('265d3a6e2901476a87cfb8ce8c349966', '265d3a6e2901476a87cfb8ce8c349966', '企业-登录.psd', '3122672', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('267045f854904a8f9cf866588191ec62', '267045f854904a8f9cf866588191ec62', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('26c68bfecaaf4ed182915e9fcce96af5', '26c68bfecaaf4ed182915e9fcce96af5', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('271a7cd7b00e44da9b1ec66f61557e47', '271a7cd7b00e44da9b1ec66f61557e47', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('276a59515be54062a664dfce729e2096', '276a59515be54062a664dfce729e2096', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('279eab85de7c4fa886489d24d660624f', '279eab85de7c4fa886489d24d660624f', '审批.psd', '1721084', null, 'file/files/2017/10/27/');
INSERT INTO `has_doc` VALUES ('27f17656a62c456a9a74c688df288024', '27f17656a62c456a9a74c688df288024', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('28434953889d40ee8d90e9e6680ec7aa', '28434953889d40ee8d90e9e6680ec7aa', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('2868416cf35945ed9f183eb66c45ae67', '2868416cf35945ed9f183eb66c45ae67', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('290efbb44a5041039b08414b5b903612', '290efbb44a5041039b08414b5b903612', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('2a239456ba5a4ffbb16ff7f48521119d', '2a239456ba5a4ffbb16ff7f48521119d', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('2a9e6579c9a546ad9f21c4cd66240573', '2a9e6579c9a546ad9f21c4cd66240573', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('2ae75ca9f6784a15933d603859c436fb', '2ae75ca9f6784a15933d603859c436fb', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('2b41435d72dc499787dda8f22590b8c9', '2b41435d72dc499787dda8f22590b8c9', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('2b9d26244d8e48f2af5d8d9c35d1f5a6', '2b9d26244d8e48f2af5d8d9c35d1f5a6', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('2cb5a1e74f6d4313a17193ff35538a73', '2cb5a1e74f6d4313a17193ff35538a73', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('2cf03405ee6745849dc67d0febec7047', '2cf03405ee6745849dc67d0febec7047', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('2cf7157fe936435f88efb3c953e306d2', '2cf7157fe936435f88efb3c953e306d2', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('2d244fcbfc2742d5a90ab261e5f4b9f6', '2d244fcbfc2742d5a90ab261e5f4b9f6', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('2dde6aa563aa427b9cc88cb9520de418', '2dde6aa563aa427b9cc88cb9520de418', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('2de23e2debc3477dba2c3028d9591935', '2de23e2debc3477dba2c3028d9591935', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('2e4efe40963240f0a59ec5078ecaab8a', '2e4efe40963240f0a59ec5078ecaab8a', '审批.psd', '1721084', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('2e5d843123fc4d47b32e03cfcb980868', '2e5d843123fc4d47b32e03cfcb980868', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('2f26f4962af94e23a78e6fcace161b72', '2f26f4962af94e23a78e6fcace161b72', '申请.psd', '2239220', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('2f65fc1e7fc04638837aa42575660916', '2f65fc1e7fc04638837aa42575660916', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('2fd14c1ef4da475c9eb98288111f63b3', '2fd14c1ef4da475c9eb98288111f63b3', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('309b0b58debd4130a63358515495b40c', '309b0b58debd4130a63358515495b40c', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('320ba07f466f404da952ef8f123092a9', '320ba07f466f404da952ef8f123092a9', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('320f3b5147164e4abf109bdc6d4ccf0f', '320f3b5147164e4abf109bdc6d4ccf0f', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('3244dcd5c3d7435ca79c51d1cf6a5029', '3244dcd5c3d7435ca79c51d1cf6a5029', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('325adcb9709b4135b01066d793449df4', '325adcb9709b4135b01066d793449df4', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('334af27b1bfa44fda81ad5bf82b19b48', '334af27b1bfa44fda81ad5bf82b19b48', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('341a26987c414c9d967eb7dc17609dc2', '341a26987c414c9d967eb7dc17609dc2', '申请.psd', '2239220', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('34948aee286948079addbfca023edd24', '34948aee286948079addbfca023edd24', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('34e7a6b096524ce38db478ee67a04b64', '34e7a6b096524ce38db478ee67a04b64', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('35f731b2b2dc4b648a1f322094c233ae', '35f731b2b2dc4b648a1f322094c233ae', '申请.psd', '2239220', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('3600092ec4e346c4b59f4880ebe08be8', '3600092ec4e346c4b59f4880ebe08be8', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('370ddb4899ac45d5807f7cea51cf9615', '370ddb4899ac45d5807f7cea51cf9615', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('376722aa429a49cfba466757db1ff621', '376722aa429a49cfba466757db1ff621', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('3788d96ed78d49cb84136301bdc3eac0', '3788d96ed78d49cb84136301bdc3eac0', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('37f82888eb9f4733a88c5d1985f80263', '37f82888eb9f4733a88c5d1985f80263', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('37fc083080474a34ac55a17aeec1c3b0', '37fc083080474a34ac55a17aeec1c3b0', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('38816798c7214dab8a635c260a75329f', '38816798c7214dab8a635c260a75329f', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('3940c9153d844f6fa8cdd8817f5f538c', '3940c9153d844f6fa8cdd8817f5f538c', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('39cd415523b7402c868acfbeb366868c', '39cd415523b7402c868acfbeb366868c', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('3a8e479562114b1c92d367741835413b', '3a8e479562114b1c92d367741835413b', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('3aa7bf9fa23346509e235851408da59c', '3aa7bf9fa23346509e235851408da59c', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('3acba00ab4f94154956418fea3874d74', '3acba00ab4f94154956418fea3874d74', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('3ad6bb6b20ce4d27841beb2122b77811', '3ad6bb6b20ce4d27841beb2122b77811', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('3b8465b7e4bc4c34b9d1963cbd5297be', '3b8465b7e4bc4c34b9d1963cbd5297be', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('3b9a9bef5c3549049ab0358f28baeec8', '3b9a9bef5c3549049ab0358f28baeec8', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('3bd66f7a8bb34862bf2be6c024b37f5e', '3bd66f7a8bb34862bf2be6c024b37f5e', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('3c2d60147ba249c7a247e3fd7830b049', '3c2d60147ba249c7a247e3fd7830b049', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('3c2fd0f6720d449296a731dcc59dad8c', '3c2fd0f6720d449296a731dcc59dad8c', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('3c9bc2c7aad84d7fb9f8ab6d41403e35', '3c9bc2c7aad84d7fb9f8ab6d41403e35', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('3f0b4dd6954746c481783b12b5d0c949', '3f0b4dd6954746c481783b12b5d0c949', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('3f924d2937424f5c8d6561f8744f8a9e', '3f924d2937424f5c8d6561f8744f8a9e', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('408253da40ed400abbe0f52f757d1eff', '408253da40ed400abbe0f52f757d1eff', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('4091619df6a740d2b2cc7f7704644f7a', '4091619df6a740d2b2cc7f7704644f7a', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('415c587ff9544b16ad9b0e50ed40d86b', '415c587ff9544b16ad9b0e50ed40d86b', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('41eef3f65af549c29d128fd2d8e57a98', '41eef3f65af549c29d128fd2d8e57a98', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('422b97c7dd3745da9d85ed1571d94bf6', '422b97c7dd3745da9d85ed1571d94bf6', '企业-登录.psd', '3122672', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('4270df8c43e345d2821e422ddb98a8d4', '4270df8c43e345d2821e422ddb98a8d4', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('42ee8cf6bf9547559f7d1fc2c100d6ce', '42ee8cf6bf9547559f7d1fc2c100d6ce', '企业-登录.psd', '3122672', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('42f354911ee142b48f38c22580113b8a', '42f354911ee142b48f38c22580113b8a', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('4354fee665e447e3b05629e42b12005d', '4354fee665e447e3b05629e42b12005d', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('4393b8c736504d2cba1b21cf3d05972d', '4393b8c736504d2cba1b21cf3d05972d', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('450c0e503a664a2fbfca79bf81ead7ff', '450c0e503a664a2fbfca79bf81ead7ff', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('4659a9e942134adeb8a0fa573d3ca375', '4659a9e942134adeb8a0fa573d3ca375', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('46bf533a81874452a76198f85d24ceb4', '46bf533a81874452a76198f85d24ceb4', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('478403f36bad42d583a9183c17fef68e', '478403f36bad42d583a9183c17fef68e', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('47a44c7b9b7147c38e39592b6949efc1', '47a44c7b9b7147c38e39592b6949efc1', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('4832d3feba0e4b4ca506700d04087af6', '4832d3feba0e4b4ca506700d04087af6', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('48ab128fdaef43639f75b19b53f77846', '48ab128fdaef43639f75b19b53f77846', '264X201710310546.pdf', '187900', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('48d51367b9f648d9aa5e5f398db05a2e', '48d51367b9f648d9aa5e5f398db05a2e', '申请.psd', '2239220', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('48f5d072d82940558af198daf9734932', '48f5d072d82940558af198daf9734932', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('496a537880fc4fb0b40857c87c73492f', '496a537880fc4fb0b40857c87c73492f', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('4b578af67aa04aadae8b338f1522e178', '4b578af67aa04aadae8b338f1522e178', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('4c05f4f9ab804e5c83c5e8b127093f89', '4c05f4f9ab804e5c83c5e8b127093f89', '申请.psd', '2239220', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('4c15bf06698741ba807582b7e84e320e', '4c15bf06698741ba807582b7e84e320e', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('4c95b4753ed249b69053f141d7691795', '4c95b4753ed249b69053f141d7691795', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('4c9a09365d1d472192c888816803cec0', '4c9a09365d1d472192c888816803cec0', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('4d7924e67001493daf28747c21a85a81', '4d7924e67001493daf28747c21a85a81', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('4e5e5a5d3e4f4171b2900911dc815cbf', '4e5e5a5d3e4f4171b2900911dc815cbf', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('4f6903214cdd474a870da4d40aaa26a6', '4f6903214cdd474a870da4d40aaa26a6', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('4fb6ec741e134c24ba0a307f08215584', '4fb6ec741e134c24ba0a307f08215584', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('50afe014a66f4a97834564840abbd0e3', '50afe014a66f4a97834564840abbd0e3', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('50ffcb0f7a5542849b19c48850e14835', '50ffcb0f7a5542849b19c48850e14835', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('521f82b72001448597dd562bbf494d57', '521f82b72001448597dd562bbf494d57', '企业-登录.psd', '3122672', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('523773ee43334c03901a014378dbd7b0', '523773ee43334c03901a014378dbd7b0', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('538fa36f9b01442cb5fa9e5adb78cb95', '538fa36f9b01442cb5fa9e5adb78cb95', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('55116bea3d4f476aa8dec57daa8741a3', '55116bea3d4f476aa8dec57daa8741a3', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('552c50610d3541c8903f1497b895ad3c', '552c50610d3541c8903f1497b895ad3c', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('55e4d980d2824fb2add141fe8f2143c4', '55e4d980d2824fb2add141fe8f2143c4', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('55f5f04fbccf410aa868bd9d6322413a', '55f5f04fbccf410aa868bd9d6322413a', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('563555caad9b4062823e581b734c953e', '563555caad9b4062823e581b734c953e', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('56430fdbec1142ee80e07556811782c3', '56430fdbec1142ee80e07556811782c3', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('569da499a7e04ad5a8e0bba6375f3fcb', '569da499a7e04ad5a8e0bba6375f3fcb', 'aaa.pdf', '0', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('5704def62bb04e919b09bcd0e8b22ad5', '5704def62bb04e919b09bcd0e8b22ad5', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('5716456bdd2f430d97f40c533788ea8c', '5716456bdd2f430d97f40c533788ea8c', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('5751449ae19545c18af5eac12d7332b4', '5751449ae19545c18af5eac12d7332b4', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('5755785aba984de5965204b2942ef835', '5755785aba984de5965204b2942ef835', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('576479e03a314df38c0f6b7ef4591f61', '576479e03a314df38c0f6b7ef4591f61', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('5764e7f900a14eb79d59e5cc11833eb7', '5764e7f900a14eb79d59e5cc11833eb7', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('58083301ae894c7bb0d9d2bc022d9f87', '58083301ae894c7bb0d9d2bc022d9f87', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('581795e3608a4958bdf099930dee13af', '581795e3608a4958bdf099930dee13af', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('583418481aeb4e889b5840b24db45832', '583418481aeb4e889b5840b24db45832', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('584361a17f624721825710f098d77642', '584361a17f624721825710f098d77642', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('586644b12e3b403988586d8f077cc5e0', '586644b12e3b403988586d8f077cc5e0', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('58d71270f2bc418a929ef926bb66355a', '58d71270f2bc418a929ef926bb66355a', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('5921ffb6bbc1487db91878131aa0fda4', '5921ffb6bbc1487db91878131aa0fda4', 'noFound.png', '4702', null, 'null/files/2017/10/25/');
INSERT INTO `has_doc` VALUES ('593e771edbf24bbf88f527e0e2d0df64', '593e771edbf24bbf88f527e0e2d0df64', '审批.psd', '1721084', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('59eda6f5c5ed4b0c957b771ce0d68838', '59eda6f5c5ed4b0c957b771ce0d68838', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('5a36d1ab6ccc48338f78143fbebaa466', '5a36d1ab6ccc48338f78143fbebaa466', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('5a59a045680c4d98a08e72bcf820d0bf', '5a59a045680c4d98a08e72bcf820d0bf', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('5b199e66bfa24d188e078882008ba7b4', '5b199e66bfa24d188e078882008ba7b4', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('5b2fe7ef3261438e8ba3c2bf798a10bf', '5b2fe7ef3261438e8ba3c2bf798a10bf', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('5b54cb8ed09e4bc38d726b69481fb7a6', '5b54cb8ed09e4bc38d726b69481fb7a6', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('5b95f0af2c9549bb80aa482b8752c2c5', '5b95f0af2c9549bb80aa482b8752c2c5', '审批.psd', '1721084', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('5bc3a9eef43e442dab012079cd37c874', '5bc3a9eef43e442dab012079cd37c874', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('5bebf1588b7c410b932d6528da059f8e', '5bebf1588b7c410b932d6528da059f8e', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('5c09bf3723ef44f08269bd72ccafe15c', '5c09bf3723ef44f08269bd72ccafe15c', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('5fb41ef6385d46b787b6acf642b95781', '5fb41ef6385d46b787b6acf642b95781', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('5fc18ee7dac84e02b9d5608b72571f9a', '5fc18ee7dac84e02b9d5608b72571f9a', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('5fef7b6f12364678ae401befc3d7f8be', '5fef7b6f12364678ae401befc3d7f8be', '申请.psd', '2239220', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('638e4f1d5caf4c4b863a9875ba6c3019', '638e4f1d5caf4c4b863a9875ba6c3019', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('6443e84c5f4742a88bd3a290ec21a3de', '6443e84c5f4742a88bd3a290ec21a3de', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('645414cb209849ccb4c81a66fcc79b01', '645414cb209849ccb4c81a66fcc79b01', '企业-登录.psd', '3122672', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('646e39b04ab54aa28476ecddebeda604', '646e39b04ab54aa28476ecddebeda604', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('64dfcdcb4e5045b9aaecd91fb5401820', '64dfcdcb4e5045b9aaecd91fb5401820', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('651e6cef2a844105a78dd6cfa07b7c22', '651e6cef2a844105a78dd6cfa07b7c22', '审批.psd', '1721084', null, 'file/files/2017/10/27/');
INSERT INTO `has_doc` VALUES ('65b0e8b633b442aeb88d080b8d0882ea', '65b0e8b633b442aeb88d080b8d0882ea', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('65d1473143324398a3b027c2d4eee603', '65d1473143324398a3b027c2d4eee603', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('65e9afb9b6fc41209ab4368dcaee0eea', '65e9afb9b6fc41209ab4368dcaee0eea', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('65f91c86d6334e72933b43a0339cea6f', '65f91c86d6334e72933b43a0339cea6f', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('66deccc5fd4a4a5794d12de997899ee3', '66deccc5fd4a4a5794d12de997899ee3', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('671078670ea044ec98bef059f92dd8f3', '671078670ea044ec98bef059f92dd8f3', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('6759fc9fae8c46288ac2f3311d83cc57', '6759fc9fae8c46288ac2f3311d83cc57', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('6785cf143d644aa29ad6a71678eaa0e2', '6785cf143d644aa29ad6a71678eaa0e2', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('67b826f2824c423eb0b6d056c4bbf4fc', '67b826f2824c423eb0b6d056c4bbf4fc', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('6804866dbd054115add4422b37a9fd54', '6804866dbd054115add4422b37a9fd54', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('69625fe48ab34222b616cade3d82644c', '69625fe48ab34222b616cade3d82644c', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('696e0af929784cfc8b56eeda1b27de85', '696e0af929784cfc8b56eeda1b27de85', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('69b2d407e53540f7994a65e2229efbd1', '69b2d407e53540f7994a65e2229efbd1', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('6ab45967db4a41918da60f975bb89113', '6ab45967db4a41918da60f975bb89113', 'v2-b7cfa4cbb9f3bc4811625081914cb6b7_r.jpg', '229025', null, 'null/files/2017/10/25/');
INSERT INTO `has_doc` VALUES ('6ac0df399d264226b79639f5582f6a7e', '6ac0df399d264226b79639f5582f6a7e', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('6af787b88559414788f3f937006c0657', '6af787b88559414788f3f937006c0657', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('6b375d1bc882465da817cd46086808e4', '6b375d1bc882465da817cd46086808e4', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('6b4d24c980de485a8ef74d2980c55496', '6b4d24c980de485a8ef74d2980c55496', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('6ba1e008453542b8ae5036458d2f3721', '6ba1e008453542b8ae5036458d2f3721', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('6bf5fb7585624f2c8eaad82f0ffed9a2', '6bf5fb7585624f2c8eaad82f0ffed9a2', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('6c111502b3fa4ecdaabde4947925a595', '6c111502b3fa4ecdaabde4947925a595', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('6c6aadde964f4821b0e31a764db767e4', '6c6aadde964f4821b0e31a764db767e4', '完成情况.xlsx', '81787', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('6c8a04bf6194414685e38700cc2d30ff', '6c8a04bf6194414685e38700cc2d30ff', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('6d217ab7a86040fb967ea69e2ee023a4', '6d217ab7a86040fb967ea69e2ee023a4', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('6d4056ba20dc419f96a3e1ed2dcbe63e', '6d4056ba20dc419f96a3e1ed2dcbe63e', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('6db75528e7a54b4cb980bb74f77241fc', '6db75528e7a54b4cb980bb74f77241fc', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('6ea8b236e76a458b986543bcf240c896', '6ea8b236e76a458b986543bcf240c896', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('6eb524b3ee77478bb7cd95da80ed19df', '6eb524b3ee77478bb7cd95da80ed19df', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('6f6b5efac11b4d1491fce64c2f7afa6f', '6f6b5efac11b4d1491fce64c2f7afa6f', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('703199d3bc9e4963bd9dae4cb060511c', '703199d3bc9e4963bd9dae4cb060511c', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('70bfdfae78984d599c5892919afec179', '70bfdfae78984d599c5892919afec179', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('71e5a1f22ee04fc4897e4c77f3b0ca32', '71e5a1f22ee04fc4897e4c77f3b0ca32', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('72a78de4b9ce47dda0a3736eb67aa0e3', '72a78de4b9ce47dda0a3736eb67aa0e3', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('72aa6f4bf42743329843bf698bce00eb', '72aa6f4bf42743329843bf698bce00eb', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('73f189676f8a4bd0ae0c5abdb5d20d39', '73f189676f8a4bd0ae0c5abdb5d20d39', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('74d5ef40aa3f45f29c48d8b2cd26ec64', '74d5ef40aa3f45f29c48d8b2cd26ec64', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('74e184d323034e41be204aca354dab8a', '74e184d323034e41be204aca354dab8a', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('752a8da02b434f0e94690b4d082e6c47', '752a8da02b434f0e94690b4d082e6c47', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('75c9ae174b304390b01ce6590c5c9626', '75c9ae174b304390b01ce6590c5c9626', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('75f68108d19f4bbe9393d0d4ee6c3c41', '75f68108d19f4bbe9393d0d4ee6c3c41', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('75f7f30216f04fa3b5cc1896a07fffaf', '75f7f30216f04fa3b5cc1896a07fffaf', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('765191ffff1e455da195134d6058770c', '765191ffff1e455da195134d6058770c', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('76775dba23ae468a92256a79f75bbb06', '76775dba23ae468a92256a79f75bbb06', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('774b8d364056484283ac2cceef7dfd36', '774b8d364056484283ac2cceef7dfd36', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('77587e6988144a9cb5ad9ee649625abd', '77587e6988144a9cb5ad9ee649625abd', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('7790926a068048dc9329c0c4f1efeb0f', '7790926a068048dc9329c0c4f1efeb0f', '审批.psd', '1721084', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('78859001a9ce444a84428db3c2f0d945', '78859001a9ce444a84428db3c2f0d945', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('788adda694714fb687063ba3eba0e143', '788adda694714fb687063ba3eba0e143', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('7a47c45f1c9f4cda84ebc7b86281d1e9', '7a47c45f1c9f4cda84ebc7b86281d1e9', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('7a978b48eb3649e3b5ff338bb2869eae', '7a978b48eb3649e3b5ff338bb2869eae', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('7bf0ce07873e418da24bf362e59b5c10', '7bf0ce07873e418da24bf362e59b5c10', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('7ceb102caf5d47bdb2fbfefd863443bf', '7ceb102caf5d47bdb2fbfefd863443bf', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('7cef1970865d428197c506927445ebd2', '7cef1970865d428197c506927445ebd2', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('7dcf9d4286594d0483f47778d2cc3354', '7dcf9d4286594d0483f47778d2cc3354', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('7df28008b82244c3a12aefa494d69c89', '7df28008b82244c3a12aefa494d69c89', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('7e77fc441dee42ce9b9c946dcc695759', '7e77fc441dee42ce9b9c946dcc695759', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('7eace4eb5f594dcd95a98418e77184cf', '7eace4eb5f594dcd95a98418e77184cf', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('7ecbeb756b9d4d859a6bc5dc9e51addc', '7ecbeb756b9d4d859a6bc5dc9e51addc', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('7f0ca083288d4ce2b303398f54f8732c', '7f0ca083288d4ce2b303398f54f8732c', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('7f231c6c8d854ca4bba232e898c95d93', '7f231c6c8d854ca4bba232e898c95d93', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('7f30b755dae54012ad50ac1d8ff911c3', '7f30b755dae54012ad50ac1d8ff911c3', '申请.psd', '2239220', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('7f761cf8e8ab458b9463b35f37a960dc', '7f761cf8e8ab458b9463b35f37a960dc', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('7fd949a34fcf4558ad6cb3743e17e67e', '7fd949a34fcf4558ad6cb3743e17e67e', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('8005b29099144e32992323cc8e50c3f9', '8005b29099144e32992323cc8e50c3f9', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('80f8b41a266c45dbb450876e6802fc05', '80f8b41a266c45dbb450876e6802fc05', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('81592fef0c8d4961a0b777fb907a4a1b', '81592fef0c8d4961a0b777fb907a4a1b', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('81ebfc3c65fb44b9a222184ff8b3637f', '81ebfc3c65fb44b9a222184ff8b3637f', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('820bdd5edb2d45f48009a1ae1cd34d30', '820bdd5edb2d45f48009a1ae1cd34d30', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('8248e1e5fad54f6a95475a862fe7229f', '8248e1e5fad54f6a95475a862fe7229f', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('82dbfedce3ff42768bf05d893d4098f1', '82dbfedce3ff42768bf05d893d4098f1', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('8354cb8b62a94bacb9a44a65c1c43ea6', '8354cb8b62a94bacb9a44a65c1c43ea6', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('8369a0854b8c47c186db326a13033aaf', '8369a0854b8c47c186db326a13033aaf', '企业-登录.psd', '3122672', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('8379bb91defb4d1e9dc110e649815b5c', '8379bb91defb4d1e9dc110e649815b5c', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('84722156676a4e0896b1468098f92cea', '84722156676a4e0896b1468098f92cea', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('84dd9a96d0034c279fc1094eecfc4a8c', '84dd9a96d0034c279fc1094eecfc4a8c', '流程.png', '85032', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('858addf4796849f282cfe19a8d3dd056', '858addf4796849f282cfe19a8d3dd056', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('8645de9192144c5ca2497caf4c63cbda', '8645de9192144c5ca2497caf4c63cbda', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('87186aee53824dc38cb11f6dce226da8', '87186aee53824dc38cb11f6dce226da8', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('87a231d1983d4bc1ac632f47b18e2092', '87a231d1983d4bc1ac632f47b18e2092', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('87d3c428d9cf4720b5270a860327325c', '87d3c428d9cf4720b5270a860327325c', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('87eaea5a73194d3c914021962b14727a', '87eaea5a73194d3c914021962b14727a', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('885d1653e9514397bd3473663fe4d7e1', '885d1653e9514397bd3473663fe4d7e1', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('89b1dbf13e64452d91a3507b5bdca65d', '89b1dbf13e64452d91a3507b5bdca65d', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('89f25a1e358745c28fbeeb89a1b5817f', '89f25a1e358745c28fbeeb89a1b5817f', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('8a8fb00635c74b69a8055ababc59fedb', '8a8fb00635c74b69a8055ababc59fedb', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('8b2bb7280af14640a3908919c0c5922d', '8b2bb7280af14640a3908919c0c5922d', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('8bf40003eb4446d9bddb78c15745184e', '8bf40003eb4446d9bddb78c15745184e', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('8c05132296db470782e55db450388eb5', '8c05132296db470782e55db450388eb5', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('8c1791ba3c8f4dfdb68fb0d4c30b4f5f', '8c1791ba3c8f4dfdb68fb0d4c30b4f5f', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('8c446e76e7c1408482601327cca1dc02', '8c446e76e7c1408482601327cca1dc02', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('8d1c0dd8c22c4981a181b6af81a142c7', '8d1c0dd8c22c4981a181b6af81a142c7', 'noFound.png', '4702', null, 'null/files/2017/10/25/');
INSERT INTO `has_doc` VALUES ('8e1540f67bac4a9ebfbec75d90485c53', '8e1540f67bac4a9ebfbec75d90485c53', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('8e25170ac1494f15a5a3ba136e8d5649', '8e25170ac1494f15a5a3ba136e8d5649', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('8fc7ec5b2d89462dbafa72b2e22176c7', '8fc7ec5b2d89462dbafa72b2e22176c7', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('90cbde65f0d74241a6103b2be623307c', '90cbde65f0d74241a6103b2be623307c', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('90d93d56dc154b43bdc643697a73cedd', '90d93d56dc154b43bdc643697a73cedd', 'aaa.pdf', '0', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('90fb67de3ce74c2fa03243ff8c6d1f17', '90fb67de3ce74c2fa03243ff8c6d1f17', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('92398e9f2aff419987247d5e396169b6', '92398e9f2aff419987247d5e396169b6', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('924878fb09da44419372d1a40243fb95', '924878fb09da44419372d1a40243fb95', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('9329528c833a42128b2dc07642afc98b', '9329528c833a42128b2dc07642afc98b', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('93c12fbc4b4b468b84bf99d51d49db83', '93c12fbc4b4b468b84bf99d51d49db83', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('940861acf1d24c3691219812f238458c', '940861acf1d24c3691219812f238458c', '企业-登录.psd', '3122672', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('94a14cca13564ae5825b1917960590c7', '94a14cca13564ae5825b1917960590c7', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('95d9446297fa42469148332224c89eb5', '95d9446297fa42469148332224c89eb5', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('961f3c2f512a4fbe9558f7bad9740fcb', '961f3c2f512a4fbe9558f7bad9740fcb', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('97754bb7a18d489eb549ed00cc97a3c1', '97754bb7a18d489eb549ed00cc97a3c1', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('97b09174bd3b4e268d6ef9a25f88556f', '97b09174bd3b4e268d6ef9a25f88556f', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('9834462da9d7458d8080c83f38b139c2', '9834462da9d7458d8080c83f38b139c2', 'aaa.pdf', '0', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('99ab184a52f24154b5497271a46a3d7e', '99ab184a52f24154b5497271a46a3d7e', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('99db598f04314182b804356cab8f4c5c', '99db598f04314182b804356cab8f4c5c', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('99e6538123d04c5a842f3cbb50c1a885', '99e6538123d04c5a842f3cbb50c1a885', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('9aa0568bc0a34a78a7a5b1b4659ce255', '9aa0568bc0a34a78a7a5b1b4659ce255', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('9ab32b478d10498f993062ff951e1c22', '9ab32b478d10498f993062ff951e1c22', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('9b9f2fe03585461e99e3c56e28c585d7', '9b9f2fe03585461e99e3c56e28c585d7', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('9bfe7feac58d4f218dc2ef5288de2643', '9bfe7feac58d4f218dc2ef5288de2643', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('9c61ad8cea684e1887784b1e4a2451ea', '9c61ad8cea684e1887784b1e4a2451ea', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('9ce157c4791343bcaee0ae4d457b527d', '9ce157c4791343bcaee0ae4d457b527d', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('9ce75b659dbf44bd8c32ffabf2d89b3a', '9ce75b659dbf44bd8c32ffabf2d89b3a', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('9dacbcba902049728e9ff8fb638078b7', '9dacbcba902049728e9ff8fb638078b7', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('9dd6a779685941cfa55287e243a6a2c1', '9dd6a779685941cfa55287e243a6a2c1', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('9df886efabee427596d0542d36c81345', '9df886efabee427596d0542d36c81345', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('9ee387a338464f0f9f08c3cc34ec66c7', '9ee387a338464f0f9f08c3cc34ec66c7', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('9ef9572904d5464a8299e9e6a9b3e4f2', '9ef9572904d5464a8299e9e6a9b3e4f2', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('9f3c8dae7564421f804fd2a6e14cd2c8', '9f3c8dae7564421f804fd2a6e14cd2c8', '申请.psd', '2239220', null, 'file/files/2017/10/27/');
INSERT INTO `has_doc` VALUES ('9f5670dce8e145a2b069b921d0b200c6', '9f5670dce8e145a2b069b921d0b200c6', '企业-登录.psd', '3122672', null, 'file/files/2017/10/27/');
INSERT INTO `has_doc` VALUES ('a00f80b7273e4545bc4aa540ca2c6ad9', 'a00f80b7273e4545bc4aa540ca2c6ad9', '审批.psd', '1721084', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('a1b52820fce74ff3811b11362f55d55b', 'a1b52820fce74ff3811b11362f55d55b', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('a244dcdb0a724b87832ac4d9326b664c', 'a244dcdb0a724b87832ac4d9326b664c', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('a2806da36b5f41a28291d17ec1c66e16', 'a2806da36b5f41a28291d17ec1c66e16', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('a2f9017e3a3e4e96b493a7c41e27fedd', 'a2f9017e3a3e4e96b493a7c41e27fedd', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('a339efc093514cc8a27328db1ccb9a7a', 'a339efc093514cc8a27328db1ccb9a7a', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('a34140a3f0644a95bdb6e80b247d1c86', 'a34140a3f0644a95bdb6e80b247d1c86', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('a371b774ce614668b3c865e78f8467f7', 'a371b774ce614668b3c865e78f8467f7', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('a37b1326ed5442ae9b89e1100bfd9038', 'a37b1326ed5442ae9b89e1100bfd9038', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('a40fcdad998e45f089457641743e38d5', 'a40fcdad998e45f089457641743e38d5', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('a471136dbc7d45a39f407718b9122d29', 'a471136dbc7d45a39f407718b9122d29', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('a4bbd6441e0742d4802fe01ef51713d3', 'a4bbd6441e0742d4802fe01ef51713d3', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('a5b3000ac09a4a2cafddc9916e7e7bc4', 'a5b3000ac09a4a2cafddc9916e7e7bc4', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('a6ef203292844a5598670b7482329456', 'a6ef203292844a5598670b7482329456', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('a741ac7a0ca142349f10ba67577efeea', 'a741ac7a0ca142349f10ba67577efeea', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('a78c7861f0db4957855f7a21aed50a1c', 'a78c7861f0db4957855f7a21aed50a1c', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('a8f3b874fabd46a083e1a160650800f6', 'a8f3b874fabd46a083e1a160650800f6', '审批.psd', '1721084', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('a97f2393781648088b876aeb946011ef', 'a97f2393781648088b876aeb946011ef', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('a9869458ed5948869472912368bdb7a4', 'a9869458ed5948869472912368bdb7a4', 'Y01+外汇业务网上预审批系统_详细设计说明书V1.40（加批注）(1).pdf', '4049440', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('aa7769c2e6bd4bd2835e247f94ca83db', 'aa7769c2e6bd4bd2835e247f94ca83db', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('aa81ef5554e2479e8b1e0f226a30eeca', 'aa81ef5554e2479e8b1e0f226a30eeca', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('aa906523f6c8488daaefade6a7633b0a', 'aa906523f6c8488daaefade6a7633b0a', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('aab1ef0b47814def949ebf09f27b4bed', 'aab1ef0b47814def949ebf09f27b4bed', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('aad5a25f84d64d7abf077275e2091d37', 'aad5a25f84d64d7abf077275e2091d37', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('aba8e332e7e64b218a4bfa94afceda10', 'aba8e332e7e64b218a4bfa94afceda10', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('abaa5485ecf24ac192d70bdf633048da', 'abaa5485ecf24ac192d70bdf633048da', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('ad08231504204b729d940cbf8b1154ea', 'ad08231504204b729d940cbf8b1154ea', '企业-登录.psd', '3122672', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('ae538ad192424e57bb5f9385f96b93da', 'ae538ad192424e57bb5f9385f96b93da', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('ae7e9acfdc1149279922b893037f90c0', 'ae7e9acfdc1149279922b893037f90c0', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('ae9d84b1e8e64f0eb2c31f1651bfb179', 'ae9d84b1e8e64f0eb2c31f1651bfb179', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('ae9fd76cd0364dc5ac4eb0ca7b135eca', 'ae9fd76cd0364dc5ac4eb0ca7b135eca', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('aed0687bd05645e7b21ec2db4695dbf3', 'aed0687bd05645e7b21ec2db4695dbf3', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('afb2d993f1114ccf850265ed5e7c6f21', 'afb2d993f1114ccf850265ed5e7c6f21', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('afdc4d5063dd4bdab79cae8d78341958', 'afdc4d5063dd4bdab79cae8d78341958', '申请.psd', '2239220', null, 'file/files/2017/10/27/');
INSERT INTO `has_doc` VALUES ('b00c6d3907a944df85c3717fd6260c02', 'b00c6d3907a944df85c3717fd6260c02', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('b09d399c8c4f4cf29990d329495c6317', 'b09d399c8c4f4cf29990d329495c6317', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('b11e75b28e1548158b4104c6117af2b3', 'b11e75b28e1548158b4104c6117af2b3', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('b13d4e51eb2d4efca3fff283e8aa0822', 'b13d4e51eb2d4efca3fff283e8aa0822', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('b23a6e7eee954d49ae22907f481e3f77', 'b23a6e7eee954d49ae22907f481e3f77', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('b26eca05661e4e06976e1b77e65fa243', 'b26eca05661e4e06976e1b77e65fa243', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('b27d1c80c0764e33b6927f8c9631ffee', 'b27d1c80c0764e33b6927f8c9631ffee', 'aaa.pdf', '0', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('b2a8e1c437c64815a8b235d05c0bb207', 'b2a8e1c437c64815a8b235d05c0bb207', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('b3049cbe51f74251bb8981162087d68c', 'b3049cbe51f74251bb8981162087d68c', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('b3b5edd8f3a94de5849107b5842dcc0f', 'b3b5edd8f3a94de5849107b5842dcc0f', 'Y01+外汇业务网上预审批系统_详细设计说明书V1.40（加批注）(1).pdf', '4049440', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('b47d110dc01147c0a41c80259ee0526d', 'b47d110dc01147c0a41c80259ee0526d', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('b50950d81d3a41f6b3c19d25618bbc3b', 'b50950d81d3a41f6b3c19d25618bbc3b', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('b52d7c4d1f2f457785c0b98178af20d3', 'b52d7c4d1f2f457785c0b98178af20d3', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('b55b83469980459693d9a50840d414c3', 'b55b83469980459693d9a50840d414c3', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('b582970a546b4f1e84c01f336e83f404', 'b582970a546b4f1e84c01f336e83f404', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('b5b06d5d6522461291e64987ba554262', 'b5b06d5d6522461291e64987ba554262', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('b5f704d27fa8430992d1c582c64b632b', 'b5f704d27fa8430992d1c582c64b632b', '企业-登录.psd', '3122672', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('b608b43331ca49abb9fc8885f30aab2f', 'b608b43331ca49abb9fc8885f30aab2f', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('b64aea1fccfc46c381872a040b491014', 'b64aea1fccfc46c381872a040b491014', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('b6621ad42c884d578f86c75f44fd3957', 'b6621ad42c884d578f86c75f44fd3957', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('b7faa65b6750444ab369936e07e114ff', 'b7faa65b6750444ab369936e07e114ff', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('b80ac6e88a0f42d695fc93763f20ece1', 'b80ac6e88a0f42d695fc93763f20ece1', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('b8142118fbfc4800b21741ef168427c2', 'b8142118fbfc4800b21741ef168427c2', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('b83b9f4f667545b28f206b9d90ec6b58', 'b83b9f4f667545b28f206b9d90ec6b58', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('b8a4da61df7b46bc93256cf887076492', 'b8a4da61df7b46bc93256cf887076492', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('b97a8361b502434fa36d2781110a3eb1', 'b97a8361b502434fa36d2781110a3eb1', '申请.psd', '2239220', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('b9b139a6c39b40a0a32b522ef3190536', 'b9b139a6c39b40a0a32b522ef3190536', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('ba14124f9ae341f4845d9ed848ce3af7', 'ba14124f9ae341f4845d9ed848ce3af7', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('bb579751404c42ad8e5dd4e7830fea56', 'bb579751404c42ad8e5dd4e7830fea56', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('bc80b072ca3540b49c50f76e1ead69f9', 'bc80b072ca3540b49c50f76e1ead69f9', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('bcea3d3947d34857a631ab3d274e8989', 'bcea3d3947d34857a631ab3d274e8989', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('bd499ecf62c644c48cdd19a895306321', 'bd499ecf62c644c48cdd19a895306321', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('bd9857b5b7b14381943aeb321df981ec', 'bd9857b5b7b14381943aeb321df981ec', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('be212e77513846e882b82393b2d4965b', 'be212e77513846e882b82393b2d4965b', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('be452193e87e49a9bf8094682423a153', 'be452193e87e49a9bf8094682423a153', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('bee102f74c194308b855b53687d11b9d', 'bee102f74c194308b855b53687d11b9d', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('bfb4ddeb8af444c3a44616fd351633ab', 'bfb4ddeb8af444c3a44616fd351633ab', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('c0903a98a39d4619a25cb3a4329bce16', 'c0903a98a39d4619a25cb3a4329bce16', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('c1554e0a12014f8ebf67d84c89dc541a', 'c1554e0a12014f8ebf67d84c89dc541a', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('c1c2e777b06b4ffbb7a62c02e3fb3d93', 'c1c2e777b06b4ffbb7a62c02e3fb3d93', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('c1e28831631b44fca67d0206a812425e', 'c1e28831631b44fca67d0206a812425e', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('c1fd251df91a44b29c62b7bdbb69fc09', 'c1fd251df91a44b29c62b7bdbb69fc09', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('c3099e8dd58e4d17844b45b96af49d53', 'c3099e8dd58e4d17844b45b96af49d53', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('c3b532d70579403280fc1e7a21bbf404', 'c3b532d70579403280fc1e7a21bbf404', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('c43ef631a2684801afdf0f115510cd3d', 'c43ef631a2684801afdf0f115510cd3d', 'Y01+外汇业务网上预审批系统_详细设计说明书V1.40（加批注）(1).pdf', '4049440', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('c48b3d82432848b9b6bc814603f1ce61', 'c48b3d82432848b9b6bc814603f1ce61', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('c50a40b8c3ef466f8257683118da7b2b', 'c50a40b8c3ef466f8257683118da7b2b', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('c53cfd6dee0647968b3ca47aa87577ae', 'c53cfd6dee0647968b3ca47aa87577ae', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('c550034d29f04363bc9fef57ccb23615', 'c550034d29f04363bc9fef57ccb23615', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('c57a8ac028c64f9986d0fd74ca8280ac', 'c57a8ac028c64f9986d0fd74ca8280ac', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('c6693e2af3104c25a6248eaa7edd973b', 'c6693e2af3104c25a6248eaa7edd973b', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('c6c7366d98e14a9ba9c738a21f2e63a0', 'c6c7366d98e14a9ba9c738a21f2e63a0', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('c6ecccb328e0441fb4dadf39e7d31187', 'c6ecccb328e0441fb4dadf39e7d31187', 'aaa.pdf', '0', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('c760c2784085438a8dc27294169331a5', 'c760c2784085438a8dc27294169331a5', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('c88d873444fc4314898e00f59eb85466', 'c88d873444fc4314898e00f59eb85466', '申请.psd', '2239220', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('c8b3d585a2424734a8ea3c1061cce1a3', 'c8b3d585a2424734a8ea3c1061cce1a3', 'caidan .txt', '406', null, 'null/files/2017/10/25/');
INSERT INTO `has_doc` VALUES ('c8f66cea326143489d23c48f5177b8a1', 'c8f66cea326143489d23c48f5177b8a1', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('c978cee62c6740d2b7d09c2c099484e4', 'c978cee62c6740d2b7d09c2c099484e4', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('c978d59ef81945b8b6e093013917b7bf', 'c978d59ef81945b8b6e093013917b7bf', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('c9bcbb8e46e949578b817e5e00e7a504', 'c9bcbb8e46e949578b817e5e00e7a504', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('c9d87c0b69cd4e22964f4641dbcb5573', 'c9d87c0b69cd4e22964f4641dbcb5573', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('cae9e61ddab348508d0375e1307986c8', 'cae9e61ddab348508d0375e1307986c8', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('cb00a729188540378b40c506bbb2b91a', 'cb00a729188540378b40c506bbb2b91a', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('cb13b427cf9c4b12ac936fe70d560e89', 'cb13b427cf9c4b12ac936fe70d560e89', '企业-登录.psd', '3122672', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('cb4216f18ff6487c98b2199008e7a18b', 'cb4216f18ff6487c98b2199008e7a18b', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('cb7280d86c9c4185a2ab6daf5eb681c0', 'cb7280d86c9c4185a2ab6daf5eb681c0', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('cb907cc5b80840dfaf17e0321ab5a9e2', 'cb907cc5b80840dfaf17e0321ab5a9e2', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('cc94201ff2c047938f06c8535daf4ee9', 'cc94201ff2c047938f06c8535daf4ee9', '审批.psd', '1721084', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('cc963ff22cc84c07824edf041e82a189', 'cc963ff22cc84c07824edf041e82a189', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('ccef79e6bd8346f795f80960d073eb28', 'ccef79e6bd8346f795f80960d073eb28', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('cd2e4c933f5e4353a74aa286123d4093', 'cd2e4c933f5e4353a74aa286123d4093', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('ce096c63bc0544c8b4bb5047377e5fcf', 'ce096c63bc0544c8b4bb5047377e5fcf', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('ce2459f1540243beacfcf653f9e504cf', 'ce2459f1540243beacfcf653f9e504cf', 'noFound.png', '4702', null, 'null/files/2017/10/25/');
INSERT INTO `has_doc` VALUES ('cf1a7b13dbfc4bb9a1fcefedff0e95ce', 'cf1a7b13dbfc4bb9a1fcefedff0e95ce', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('cfa5132f960649b29a40e7b5daf23ebd', 'cfa5132f960649b29a40e7b5daf23ebd', '企业-登录.psd', '3122672', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('d054372b299a4d4aa9dca90419fd41b8', 'd054372b299a4d4aa9dca90419fd41b8', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('d0e8850ec2ee4ef4a36e5d6e41fcc5ff', 'd0e8850ec2ee4ef4a36e5d6e41fcc5ff', '审批.psd', '1721084', null, 'file/files/2017/10/27/');
INSERT INTO `has_doc` VALUES ('d1b46e78ff114561bc70157f0189301f', 'd1b46e78ff114561bc70157f0189301f', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('d1e2d3dd78c34bae9ddc986e3e203a75', 'd1e2d3dd78c34bae9ddc986e3e203a75', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('d22370977ecd4f14954f74be689a3e9c', 'd22370977ecd4f14954f74be689a3e9c', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('d258d9ce8cc94d4fae1491041565123e', 'd258d9ce8cc94d4fae1491041565123e', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('d2e329686e1f43ed951bef4c27c41f83', 'd2e329686e1f43ed951bef4c27c41f83', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('d332b1490b934a3691e97ef476ff9907', 'd332b1490b934a3691e97ef476ff9907', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('d36f54dc62d94e03b9a03b810b2cc4cd', 'd36f54dc62d94e03b9a03b810b2cc4cd', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('d376ac356b0c4188b24f31e40d16dfdb', 'd376ac356b0c4188b24f31e40d16dfdb', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('d4d55ede237d4d08928e083a83af9b52', 'd4d55ede237d4d08928e083a83af9b52', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('d4fb5e7e619746fbad31c03cc627e872', 'd4fb5e7e619746fbad31c03cc627e872', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('d50fd3928a3a4b6caa19a10b510009b8', 'd50fd3928a3a4b6caa19a10b510009b8', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('d693424ccb5540429c4597a9fbdd1d91', 'd693424ccb5540429c4597a9fbdd1d91', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('d7abab53516c4dc492188bc4cc82c5d1', 'd7abab53516c4dc492188bc4cc82c5d1', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('d8e84dffe27b49d29b5a0a21f229d12b', 'd8e84dffe27b49d29b5a0a21f229d12b', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('d9991afaff094aa6924d464ccbe434c5', 'd9991afaff094aa6924d464ccbe434c5', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('d9aedf7dc34b44b4be2bbeb54fa68865', 'd9aedf7dc34b44b4be2bbeb54fa68865', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('d9bae0a8ef0644cb97427f95d87e8e58', 'd9bae0a8ef0644cb97427f95d87e8e58', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('da84f8aa656d4163887195014de70c92', 'da84f8aa656d4163887195014de70c92', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('dc1452291cac46efbc7b547830778634', 'dc1452291cac46efbc7b547830778634', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('dc771758f33649e19e50a18e92ef6a55', 'dc771758f33649e19e50a18e92ef6a55', 'Y01 外汇业务网上预审批系统_详细设计说明书.docx', '256943', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('dcaad29ba46343248fc2d2bd8d7d1244', 'dcaad29ba46343248fc2d2bd8d7d1244', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('dd405037a29e44da8c4217d7ac2416d1', 'dd405037a29e44da8c4217d7ac2416d1', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('dd5f0c1bdc064f12bbab22fc730e38c3', 'dd5f0c1bdc064f12bbab22fc730e38c3', '申请.psd', '2239220', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('dd6ab7d1baef456e83dca17d18d4aa2d', 'dd6ab7d1baef456e83dca17d18d4aa2d', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('ddd2b2c596d4495aae145e479eb045cc', 'ddd2b2c596d4495aae145e479eb045cc', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('dddbddcfba654d24b276a410548cfdce', 'dddbddcfba654d24b276a410548cfdce', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('de0b489d5ced4172a8b61270de50a705', 'de0b489d5ced4172a8b61270de50a705', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('deed194a2d0d466f91c9e8a01151549a', 'deed194a2d0d466f91c9e8a01151549a', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('df38dbcd5fa24013a6881ffd8f1048d8', 'df38dbcd5fa24013a6881ffd8f1048d8', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('e008a06b53e743deb52dc14c85b90756', 'e008a06b53e743deb52dc14c85b90756', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('e044d9f48771476883902d947e367ca7', 'e044d9f48771476883902d947e367ca7', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('e0b37b838ee2441c8e6e6d5ca0fc06cf', 'e0b37b838ee2441c8e6e6d5ca0fc06cf', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('e0dcc5f9b2e743ed92246742bc4cf8a7', 'e0dcc5f9b2e743ed92246742bc4cf8a7', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('e1a749c290534a81bde8d967a458c756', 'e1a749c290534a81bde8d967a458c756', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('e1cfb6508ce049adad3db3f49e05e46f', 'e1cfb6508ce049adad3db3f49e05e46f', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('e1f642f9a87d4321ae66020ac7ff97e1', 'e1f642f9a87d4321ae66020ac7ff97e1', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('e2764db79aa64a309b80bf925709a85a', 'e2764db79aa64a309b80bf925709a85a', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('e37e557bfcd94a0c8ac323708d3ab93e', 'e37e557bfcd94a0c8ac323708d3ab93e', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('e3955f3d8c1f4b509b341ee9bb4c6003', 'e3955f3d8c1f4b509b341ee9bb4c6003', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('e3fd8f97f98c4f5abde1e50f7265bf74', 'e3fd8f97f98c4f5abde1e50f7265bf74', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('e41899d523634b3292390a79a6a673e9', 'e41899d523634b3292390a79a6a673e9', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('e4e7050597e44741a5acbbe210cd9a1d', 'e4e7050597e44741a5acbbe210cd9a1d', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('e525e1fb805d4d4780c9cfebe36cc457', 'e525e1fb805d4d4780c9cfebe36cc457', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('e63bbb985fcd40a09a0a47dab13d3051', 'e63bbb985fcd40a09a0a47dab13d3051', '申请.psd', '2239220', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('e6b2ec6ecabd4927a23a59288fbff2f2', 'e6b2ec6ecabd4927a23a59288fbff2f2', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('e7a07787d59f4359a992cc6f562cd798', 'e7a07787d59f4359a992cc6f562cd798', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('e7ac98fd42bc4823bdc41e465e56b03b', 'e7ac98fd42bc4823bdc41e465e56b03b', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('e80d9976c65a4291b0d62cbd9d61461a', 'e80d9976c65a4291b0d62cbd9d61461a', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('e8ec810eb1e644e0aed0ba4a455a5c9e', 'e8ec810eb1e644e0aed0ba4a455a5c9e', '邮箱配置.docx', '98156', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('e920c4c38b4b437b850c5f50f4fe6a4a', 'e920c4c38b4b437b850c5f50f4fe6a4a', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('e92c4037e7154a68a8eb3e9f0ebff691', 'e92c4037e7154a68a8eb3e9f0ebff691', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('e931da35fbbc44e389915fd9fb3ec83b', 'e931da35fbbc44e389915fd9fb3ec83b', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('e95015f8c3c64f63bd9bb892e1dee9e0', 'e95015f8c3c64f63bd9bb892e1dee9e0', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('e967564e35c645db84bf17265b0dac7c', 'e967564e35c645db84bf17265b0dac7c', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('e9891b61046e4b6588e5c058054f8b84', 'e9891b61046e4b6588e5c058054f8b84', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('ebc51b29d5344f72b317ed139018a2cb', 'ebc51b29d5344f72b317ed139018a2cb', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('ebdc9ca4fb7945cfa5799f3a88dac3c6', 'ebdc9ca4fb7945cfa5799f3a88dac3c6', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('ebe6223f961d4361b873fb23a9b51cfa', 'ebe6223f961d4361b873fb23a9b51cfa', 'Y01+外汇业务网上预审批系统_详细设计说明书V1.40（加批注）(1).pdf', '4049440', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('ec62ba70460645dea7cdd16b0abad3c4', 'ec62ba70460645dea7cdd16b0abad3c4', 'Y01 外汇业务网上预审批系统_详细设计说明书V1.40（加批注）.pdf', '4049440', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('ed83692414d247fa9cbf4a01568fcf86', 'ed83692414d247fa9cbf4a01568fcf86', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('eefa980b0bdb454b84271afb767f0cd9', 'eefa980b0bdb454b84271afb767f0cd9', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('ef6e78ff43544108861a01e3bf867854', 'ef6e78ff43544108861a01e3bf867854', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('f054c3e8a3884b318a62611ee65f4627', 'f054c3e8a3884b318a62611ee65f4627', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('f07fbe3f87f744f88f32a7afbbdc7187', 'f07fbe3f87f744f88f32a7afbbdc7187', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('f0fa0faceda94d02bff472c3d5204fea', 'f0fa0faceda94d02bff472c3d5204fea', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('f136be2f53084a988bc0b141af34a15c', 'f136be2f53084a988bc0b141af34a15c', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('f164724c001c4be9b7e3ab5283a84946', 'f164724c001c4be9b7e3ab5283a84946', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('f191f754915744a28e03a159deea03ba', 'f191f754915744a28e03a159deea03ba', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('f1a228a87da047c6bbfd6d09c7912fe6', 'f1a228a87da047c6bbfd6d09c7912fe6', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('f25d1d4756a34f66847e6be13947700c', 'f25d1d4756a34f66847e6be13947700c', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('f2a6439a951e40c082f51c20d8427fc0', 'f2a6439a951e40c082f51c20d8427fc0', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('f2d40364208349ed9d78d829b4d33b92', 'f2d40364208349ed9d78d829b4d33b92', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('f3020e30101b4359880c995abb13a90a', 'f3020e30101b4359880c995abb13a90a', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('f311b0d5b5574a11b537b32668312ca6', 'f311b0d5b5574a11b537b32668312ca6', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('f37e42add66c4fe2965abdd30191fa9d', 'f37e42add66c4fe2965abdd30191fa9d', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('f4e6f0e315b24537a2f67f8f6cd5dc21', 'f4e6f0e315b24537a2f67f8f6cd5dc21', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/1/');
INSERT INTO `has_doc` VALUES ('f4f95abc9a264cf8a59dd472994ce32f', 'f4f95abc9a264cf8a59dd472994ce32f', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('f5b7c3536e2c46418cebdf7b84c97a16', 'f5b7c3536e2c46418cebdf7b84c97a16', 'v2-b7cfa4cbb9f3bc4811625081914cb6b7_r.jpg', '229025', null, 'file/files/2017/10/27/');
INSERT INTO `has_doc` VALUES ('f6f1d45a4920479480da9ed276293f1c', 'f6f1d45a4920479480da9ed276293f1c', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('f6fb13afc2ee4d94b0b3d1743c5b6dfb', 'f6fb13afc2ee4d94b0b3d1743c5b6dfb', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('f717ac24ff1e419cb66779e5c56ea472', 'f717ac24ff1e419cb66779e5c56ea472', '59c68d88-f6fd-414a-8fc3-439e8e1a1249.pdf', '293422', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('f77090e2c8234139856684c7c3d58520', 'f77090e2c8234139856684c7c3d58520', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('f8a5d2e4eea1468cafdf8275c65a4c28', 'f8a5d2e4eea1468cafdf8275c65a4c28', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('f8da83caa16d4cf6a9cc1f833059f1e1', 'f8da83caa16d4cf6a9cc1f833059f1e1', '查询-办事指南.psd', '757872', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('f984468f6b534101b310eade05e2a879', 'f984468f6b534101b310eade05e2a879', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('fa00e79452a24ca492a1efa03811342f', 'fa00e79452a24ca492a1efa03811342f', '审批.psd', '1721084', null, 'file/files/2017/10/30/');
INSERT INTO `has_doc` VALUES ('fa3a08794c9b4078b34dbcdd6d9e7fb1', 'fa3a08794c9b4078b34dbcdd6d9e7fb1', 'aaa.pdf', '0', null, 'file/files/2017/11/3/');
INSERT INTO `has_doc` VALUES ('faab3b24e185434299484bcf44340817', 'faab3b24e185434299484bcf44340817', 'caidan .txt', '406', null, 'null/files/2017/10/25/');
INSERT INTO `has_doc` VALUES ('fb79901f68ab4756a2cb51543ab3f90d', 'fb79901f68ab4756a2cb51543ab3f90d', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('fc67be11dc4a4a6698aea37e130a187b', 'fc67be11dc4a4a6698aea37e130a187b', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('fcb916673da94a95bd6a4ec4817d4b6a', 'fcb916673da94a95bd6a4ec4817d4b6a', 'Weblogic配置Https以及集群配置问题解决方案.pdf', '2164386', null, 'file/files/2017/11/2/');
INSERT INTO `has_doc` VALUES ('fcc47b5faa8e4eecb3ffd9ead0bdf2a9', 'fcc47b5faa8e4eecb3ffd9ead0bdf2a9', 'aaa.pdf', '0', null, 'file/files/2017/10/31/');
INSERT INTO `has_doc` VALUES ('ff07385d871e4ae997b5a300b7f4c742', 'ff07385d871e4ae997b5a300b7f4c742', 'aaa.pdf', '0', null, 'file/files/2017/11/2/');

-- ----------------------------
-- Table structure for has_workcalendar
-- ----------------------------
DROP TABLE IF EXISTS `has_workcalendar`;
CREATE TABLE `has_workcalendar` (
  `id` varchar(32) NOT NULL COMMENT '工作日历ID',
  `start_date` varchar(10) NOT NULL COMMENT '开始日期',
  `end_date` varchar(10) NOT NULL COMMENT '结束日期',
  `onduty_time` varchar(8) NOT NULL COMMENT '上班时间',
  `offduty_time` varchar(8) NOT NULL COMMENT '下班时间',
  `workday_total` int(11) NOT NULL DEFAULT '0' COMMENT '工作日天数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of has_workcalendar
-- ----------------------------
INSERT INTO `has_workcalendar` VALUES ('2012', '2012-01-01', '2012-12-31', '00:00:00', '23:59:59', '255');
INSERT INTO `has_workcalendar` VALUES ('2013', '2013-01-01', '2013-12-31', '00:00:00', '23:59:59', '255');
INSERT INTO `has_workcalendar` VALUES ('2014', '2014-01-01', '2014-12-31', '08:30:00', '17:00:00', '254');
INSERT INTO `has_workcalendar` VALUES ('2015', '2015-01-01', '2015-12-31', '08:30:00', '17:00:00', '254');
INSERT INTO `has_workcalendar` VALUES ('2016', '2016-01-02', '2016-12-30', '00:00:01', '23:59:58', '249');
INSERT INTO `has_workcalendar` VALUES ('2017', '2017-01-01', '2017-12-31', '00:00:00', '23:59:59', '248');
INSERT INTO `has_workcalendar` VALUES ('2018', '2018-01-01', '2018-12-31', '00:00:00', '23:59:59', '255');
INSERT INTO `has_workcalendar` VALUES ('2019', '2019-01-02', '2019-12-30', '00:00:00', '23:59:59', '260');
INSERT INTO `has_workcalendar` VALUES ('2020', '2020-01-01', '2020-12-31', '00:00:00', '23:59:59', '255');
INSERT INTO `has_workcalendar` VALUES ('2025', '2025-01-01', '2025-12-31', '00:00:00', '23:59:59', '258');
INSERT INTO `has_workcalendar` VALUES ('3455', '3455-01-01', '3455-12-31', '00:00:00', '23:59:59', '255');
INSERT INTO `has_workcalendar` VALUES ('9999', '9999-01-01', '9999-12-31', '00:00:00', '23:59:59', '255');

-- ----------------------------
-- Table structure for has_workday
-- ----------------------------
DROP TABLE IF EXISTS `has_workday`;
CREATE TABLE `has_workday` (
  `id` varchar(32) NOT NULL COMMENT '工作日历ID',
  `work_index` int(11) NOT NULL COMMENT '工作日序号',
  `work_date` varchar(10) NOT NULL COMMENT '工作日期',
  `onduty_time` varchar(19) NOT NULL COMMENT '上班时间',
  `offduty_time` varchar(19) NOT NULL COMMENT '下班时间',
  PRIMARY KEY (`id`,`work_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of has_workday
-- ----------------------------
INSERT INTO `has_workday` VALUES ('2015', '1', '2015-01-01', '2015-01-01 09:00:00', '2015-01-01 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '2', '2015-01-02', '2015-01-02 09:00:00', '2015-01-02 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '3', '2015-01-05', '2015-01-05 09:00:00', '2015-01-05 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '4', '2015-01-06', '2015-01-06 09:00:00', '2015-01-06 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '5', '2015-01-07', '2015-01-07 09:00:00', '2015-01-07 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '6', '2015-01-08', '2015-01-08 09:00:00', '2015-01-08 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '7', '2015-01-09', '2015-01-09 09:00:00', '2015-01-09 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '8', '2015-01-12', '2015-01-12 09:00:00', '2015-01-12 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '9', '2015-01-13', '2015-01-13 09:00:00', '2015-01-13 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '10', '2015-01-14', '2015-01-14 09:00:00', '2015-01-14 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '11', '2015-01-15', '2015-01-15 09:00:00', '2015-01-15 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '12', '2015-01-16', '2015-01-16 09:00:00', '2015-01-16 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '13', '2015-01-19', '2015-01-19 09:00:00', '2015-01-19 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '14', '2015-01-20', '2015-01-20 09:00:00', '2015-01-20 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '15', '2015-01-21', '2015-01-21 09:00:00', '2015-01-21 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '16', '2015-01-22', '2015-01-22 09:00:00', '2015-01-22 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '17', '2015-01-23', '2015-01-23 09:00:00', '2015-01-23 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '18', '2015-01-26', '2015-01-26 09:00:00', '2015-01-26 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '19', '2015-01-27', '2015-01-27 09:00:00', '2015-01-27 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '20', '2015-01-28', '2015-01-28 09:00:00', '2015-01-28 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '21', '2015-01-29', '2015-01-29 09:00:00', '2015-01-29 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '22', '2015-01-30', '2015-01-30 09:00:00', '2015-01-30 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '23', '2015-02-02', '2015-02-02 09:00:00', '2015-02-02 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '24', '2015-02-03', '2015-02-03 09:00:00', '2015-02-03 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '25', '2015-02-04', '2015-02-04 09:00:00', '2015-02-04 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '26', '2015-02-05', '2015-02-05 09:00:00', '2015-02-05 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '27', '2015-02-06', '2015-02-06 09:00:00', '2015-02-06 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '28', '2015-02-09', '2015-02-09 09:00:00', '2015-02-09 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '29', '2015-02-10', '2015-02-10 09:00:00', '2015-02-10 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '30', '2015-02-11', '2015-02-11 09:00:00', '2015-02-11 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '31', '2015-02-12', '2015-02-12 09:00:00', '2015-02-12 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '32', '2015-02-13', '2015-02-13 09:00:00', '2015-02-13 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '33', '2015-02-16', '2015-02-16 09:00:00', '2015-02-16 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '34', '2015-02-17', '2015-02-17 09:00:00', '2015-02-17 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '35', '2015-02-18', '2015-02-18 09:00:00', '2015-02-18 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '36', '2015-02-19', '2015-02-19 09:00:00', '2015-02-19 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '37', '2015-02-20', '2015-02-20 09:00:00', '2015-02-20 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '38', '2015-02-23', '2015-02-23 09:00:00', '2015-02-23 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '39', '2015-02-24', '2015-02-24 09:00:00', '2015-02-24 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '40', '2015-02-25', '2015-02-25 09:00:00', '2015-02-25 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '41', '2015-02-26', '2015-02-26 09:00:00', '2015-02-26 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '42', '2015-02-27', '2015-02-27 09:00:00', '2015-02-27 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '43', '2015-03-02', '2015-03-02 09:00:00', '2015-03-02 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '44', '2015-03-03', '2015-03-03 09:00:00', '2015-03-03 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '45', '2015-03-04', '2015-03-04 09:00:00', '2015-03-04 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '46', '2015-03-05', '2015-03-05 09:00:00', '2015-03-05 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '47', '2015-03-06', '2015-03-06 09:00:00', '2015-03-06 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '48', '2015-03-09', '2015-03-09 09:00:00', '2015-03-09 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '49', '2015-03-10', '2015-03-10 09:00:00', '2015-03-10 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '50', '2015-03-11', '2015-03-11 09:00:00', '2015-03-11 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '51', '2015-03-12', '2015-03-12 09:00:00', '2015-03-12 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '52', '2015-03-13', '2015-03-13 09:00:00', '2015-03-13 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '53', '2015-03-16', '2015-03-16 09:00:00', '2015-03-16 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '54', '2015-03-17', '2015-03-17 09:00:00', '2015-03-17 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '55', '2015-03-18', '2015-03-18 09:00:00', '2015-03-18 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '56', '2015-03-19', '2015-03-19 09:00:00', '2015-03-19 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '57', '2015-03-20', '2015-03-20 09:00:00', '2015-03-20 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '58', '2015-03-23', '2015-03-23 09:00:00', '2015-03-23 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '59', '2015-03-24', '2015-03-24 09:00:00', '2015-03-24 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '60', '2015-03-25', '2015-03-25 09:00:00', '2015-03-25 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '61', '2015-03-26', '2015-03-26 09:00:00', '2015-03-26 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '62', '2015-03-27', '2015-03-27 09:00:00', '2015-03-27 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '63', '2015-03-30', '2015-03-30 09:00:00', '2015-03-30 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '64', '2015-03-31', '2015-03-31 09:00:00', '2015-03-31 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '65', '2015-04-01', '2015-04-01 09:00:00', '2015-04-01 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '66', '2015-04-02', '2015-04-02 09:00:00', '2015-04-02 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '67', '2015-04-03', '2015-04-03 09:00:00', '2015-04-03 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '68', '2015-04-06', '2015-04-06 09:00:00', '2015-04-06 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '69', '2015-04-07', '2015-04-07 09:00:00', '2015-04-07 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '70', '2015-04-08', '2015-04-08 09:00:00', '2015-04-08 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '71', '2015-04-09', '2015-04-09 09:00:00', '2015-04-09 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '72', '2015-04-10', '2015-04-10 09:00:00', '2015-04-10 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '73', '2015-04-13', '2015-04-13 09:00:00', '2015-04-13 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '74', '2015-04-14', '2015-04-14 09:00:00', '2015-04-14 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '75', '2015-04-15', '2015-04-15 09:00:00', '2015-04-15 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '76', '2015-04-16', '2015-04-16 09:00:00', '2015-04-16 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '77', '2015-04-17', '2015-04-17 09:00:00', '2015-04-17 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '78', '2015-04-20', '2015-04-20 09:00:00', '2015-04-20 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '79', '2015-04-21', '2015-04-21 09:00:00', '2015-04-21 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '80', '2015-04-22', '2015-04-22 09:00:00', '2015-04-22 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '81', '2015-04-23', '2015-04-23 09:00:00', '2015-04-23 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '82', '2015-04-24', '2015-04-24 09:00:00', '2015-04-24 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '83', '2015-04-27', '2015-04-27 09:00:00', '2015-04-27 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '84', '2015-04-28', '2015-04-28 09:00:00', '2015-04-28 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '85', '2015-04-29', '2015-04-29 09:00:00', '2015-04-29 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '86', '2015-04-30', '2015-04-30 09:00:00', '2015-04-30 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '87', '2015-05-04', '2015-05-04 09:00:00', '2015-05-04 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '88', '2015-05-05', '2015-05-05 09:00:00', '2015-05-05 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '89', '2015-05-06', '2015-05-06 09:00:00', '2015-05-06 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '90', '2015-05-07', '2015-05-07 09:00:00', '2015-05-07 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '91', '2015-05-08', '2015-05-08 09:00:00', '2015-05-08 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '92', '2015-05-11', '2015-05-11 09:00:00', '2015-05-11 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '93', '2015-05-12', '2015-05-12 09:00:00', '2015-05-12 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '94', '2015-05-13', '2015-05-13 09:00:00', '2015-05-13 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '95', '2015-05-14', '2015-05-14 09:00:00', '2015-05-14 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '96', '2015-05-15', '2015-05-15 09:00:00', '2015-05-15 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '97', '2015-05-18', '2015-05-18 09:00:00', '2015-05-18 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '98', '2015-05-19', '2015-05-19 09:00:00', '2015-05-19 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '99', '2015-05-20', '2015-05-20 09:00:00', '2015-05-20 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '100', '2015-05-21', '2015-05-21 09:00:00', '2015-05-21 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '101', '2015-05-22', '2015-05-22 09:00:00', '2015-05-22 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '102', '2015-05-25', '2015-05-25 09:00:00', '2015-05-25 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '103', '2015-05-26', '2015-05-26 09:00:00', '2015-05-26 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '104', '2015-05-27', '2015-05-27 09:00:00', '2015-05-27 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '105', '2015-05-28', '2015-05-28 09:00:00', '2015-05-28 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '106', '2015-05-29', '2015-05-29 09:00:00', '2015-05-29 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '107', '2015-06-01', '2015-06-01 09:00:00', '2015-06-01 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '108', '2015-06-02', '2015-06-02 09:00:00', '2015-06-02 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '109', '2015-06-03', '2015-06-03 09:00:00', '2015-06-03 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '110', '2015-06-04', '2015-06-04 09:00:00', '2015-06-04 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '111', '2015-06-05', '2015-06-05 09:00:00', '2015-06-05 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '112', '2015-06-08', '2015-06-08 09:00:00', '2015-06-08 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '113', '2015-06-09', '2015-06-09 09:00:00', '2015-06-09 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '114', '2015-06-10', '2015-06-10 09:00:00', '2015-06-10 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '115', '2015-06-11', '2015-06-11 09:00:00', '2015-06-11 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '116', '2015-06-12', '2015-06-12 09:00:00', '2015-06-12 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '117', '2015-06-15', '2015-06-15 09:00:00', '2015-06-15 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '118', '2015-06-16', '2015-06-16 09:00:00', '2015-06-16 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '119', '2015-06-17', '2015-06-17 09:00:00', '2015-06-17 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '120', '2015-06-18', '2015-06-18 09:00:00', '2015-06-18 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '121', '2015-06-19', '2015-06-19 09:00:00', '2015-06-19 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '122', '2015-06-22', '2015-06-22 09:00:00', '2015-06-22 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '123', '2015-06-23', '2015-06-23 09:00:00', '2015-06-23 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '124', '2015-06-24', '2015-06-24 09:00:00', '2015-06-24 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '125', '2015-06-25', '2015-06-25 09:00:00', '2015-06-25 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '126', '2015-06-26', '2015-06-26 09:00:00', '2015-06-26 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '127', '2015-06-29', '2015-06-29 09:00:00', '2015-06-29 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '128', '2015-06-30', '2015-06-30 09:00:00', '2015-06-30 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '129', '2015-07-01', '2015-07-01 09:00:00', '2015-07-01 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '130', '2015-07-02', '2015-07-02 09:00:00', '2015-07-02 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '131', '2015-07-03', '2015-07-03 09:00:00', '2015-07-03 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '132', '2015-07-06', '2015-07-06 09:00:00', '2015-07-06 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '133', '2015-07-07', '2015-07-07 09:00:00', '2015-07-07 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '134', '2015-07-08', '2015-07-08 09:00:00', '2015-07-08 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '135', '2015-07-09', '2015-07-09 09:00:00', '2015-07-09 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '136', '2015-07-10', '2015-07-10 09:00:00', '2015-07-10 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '137', '2015-07-13', '2015-07-13 09:00:00', '2015-07-13 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '138', '2015-07-14', '2015-07-14 09:00:00', '2015-07-14 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '139', '2015-07-15', '2015-07-15 09:00:00', '2015-07-15 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '140', '2015-07-16', '2015-07-16 09:00:00', '2015-07-16 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '141', '2015-07-17', '2015-07-17 09:00:00', '2015-07-17 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '142', '2015-07-20', '2015-07-20 09:00:00', '2015-07-20 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '143', '2015-07-21', '2015-07-21 09:00:00', '2015-07-21 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '144', '2015-07-22', '2015-07-22 09:00:00', '2015-07-22 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '145', '2015-07-23', '2015-07-23 09:00:00', '2015-07-23 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '146', '2015-07-24', '2015-07-24 09:00:00', '2015-07-24 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '147', '2015-07-27', '2015-07-27 09:00:00', '2015-07-27 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '148', '2015-07-28', '2015-07-28 09:00:00', '2015-07-28 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '149', '2015-07-29', '2015-07-29 09:00:00', '2015-07-29 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '150', '2015-07-30', '2015-07-30 09:00:00', '2015-07-30 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '151', '2015-07-31', '2015-07-31 09:00:00', '2015-07-31 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '152', '2015-08-03', '2015-08-03 09:00:00', '2015-08-03 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '153', '2015-08-04', '2015-08-04 09:00:00', '2015-08-04 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '154', '2015-08-05', '2015-08-05 09:00:00', '2015-08-05 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '155', '2015-08-06', '2015-08-06 09:00:00', '2015-08-06 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '156', '2015-08-07', '2015-08-07 09:00:00', '2015-08-07 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '157', '2015-08-10', '2015-08-10 09:00:00', '2015-08-10 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '158', '2015-08-11', '2015-08-11 09:00:00', '2015-08-11 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '159', '2015-08-12', '2015-08-12 09:00:00', '2015-08-12 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '160', '2015-08-13', '2015-08-13 09:00:00', '2015-08-13 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '161', '2015-08-14', '2015-08-14 09:00:00', '2015-08-14 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '162', '2015-08-17', '2015-08-17 09:00:00', '2015-08-17 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '163', '2015-08-18', '2015-08-18 09:00:00', '2015-08-18 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '164', '2015-08-19', '2015-08-19 09:00:00', '2015-08-19 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '165', '2015-08-20', '2015-08-20 09:00:00', '2015-08-20 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '166', '2015-08-21', '2015-08-21 09:00:00', '2015-08-21 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '167', '2015-08-24', '2015-08-24 09:00:00', '2015-08-24 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '168', '2015-08-25', '2015-08-25 09:00:00', '2015-08-25 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '169', '2015-08-26', '2015-08-26 09:00:00', '2015-08-26 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '170', '2015-08-27', '2015-08-27 09:00:00', '2015-08-27 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '171', '2015-08-28', '2015-08-28 09:00:00', '2015-08-28 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '172', '2015-08-31', '2015-08-31 09:00:00', '2015-08-31 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '173', '2015-09-01', '2015-09-01 09:00:00', '2015-09-01 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '174', '2015-09-02', '2015-09-02 09:00:00', '2015-09-02 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '175', '2015-09-03', '2015-09-03 09:00:00', '2015-09-03 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '176', '2015-09-04', '2015-09-04 09:00:00', '2015-09-04 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '177', '2015-09-07', '2015-09-07 09:00:00', '2015-09-07 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '178', '2015-09-08', '2015-09-08 09:00:00', '2015-09-08 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '179', '2015-09-09', '2015-09-09 09:00:00', '2015-09-09 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '180', '2015-09-10', '2015-09-10 09:00:00', '2015-09-10 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '181', '2015-09-11', '2015-09-11 09:00:00', '2015-09-11 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '182', '2015-09-14', '2015-09-14 09:00:00', '2015-09-14 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '183', '2015-09-15', '2015-09-15 09:00:00', '2015-09-15 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '184', '2015-09-16', '2015-09-16 09:00:00', '2015-09-16 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '185', '2015-09-17', '2015-09-17 09:00:00', '2015-09-17 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '186', '2015-09-18', '2015-09-18 09:00:00', '2015-09-18 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '187', '2015-09-21', '2015-09-21 09:00:00', '2015-09-21 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '188', '2015-09-22', '2015-09-22 09:00:00', '2015-09-22 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '189', '2015-09-23', '2015-09-23 09:00:00', '2015-09-23 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '190', '2015-09-24', '2015-09-24 09:00:00', '2015-09-24 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '191', '2015-09-25', '2015-09-25 09:00:00', '2015-09-25 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '192', '2015-09-28', '2015-09-28 09:00:00', '2015-09-28 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '193', '2015-09-29', '2015-09-29 09:00:00', '2015-09-29 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '194', '2015-09-30', '2015-09-30 09:00:00', '2015-09-30 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '195', '2015-10-01', '2015-10-01 09:00:00', '2015-10-01 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '196', '2015-10-02', '2015-10-02 09:00:00', '2015-10-02 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '197', '2015-10-05', '2015-10-05 09:00:00', '2015-10-05 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '198', '2015-10-06', '2015-10-06 09:00:00', '2015-10-06 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '199', '2015-10-07', '2015-10-07 09:00:00', '2015-10-07 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '200', '2015-10-08', '2015-10-08 09:00:00', '2015-10-08 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '201', '2015-10-09', '2015-10-09 09:00:00', '2015-10-09 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '202', '2015-10-10', '2015-10-10 9:00:00', '2015-10-10 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '203', '2015-10-12', '2015-10-12 09:00:00', '2015-10-12 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '204', '2015-10-13', '2015-10-13 09:00:00', '2015-10-13 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '205', '2015-10-14', '2015-10-14 09:00:00', '2015-10-14 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '206', '2015-10-15', '2015-10-15 09:00:00', '2015-10-15 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '207', '2015-10-16', '2015-10-16 09:00:00', '2015-10-16 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '208', '2015-10-19', '2015-10-19 09:00:00', '2015-10-19 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '209', '2015-10-20', '2015-10-20 09:00:00', '2015-10-20 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '210', '2015-10-21', '2015-10-21 09:00:00', '2015-10-21 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '211', '2015-10-22', '2015-10-22 09:00:00', '2015-10-22 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '212', '2015-10-23', '2015-10-23 09:00:00', '2015-10-23 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '213', '2015-10-26', '2015-10-26 09:00:00', '2015-10-26 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '214', '2015-10-27', '2015-10-27 09:00:00', '2015-10-27 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '215', '2015-10-28', '2015-10-28 09:00:00', '2015-10-28 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '216', '2015-10-29', '2015-10-29 09:00:00', '2015-10-29 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '217', '2015-10-30', '2015-10-30 09:00:00', '2015-10-30 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '218', '2015-11-02', '2015-11-02 09:00:00', '2015-11-02 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '219', '2015-11-03', '2015-11-03 09:00:00', '2015-11-03 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '220', '2015-11-04', '2015-11-04 09:00:00', '2015-11-04 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '221', '2015-11-05', '2015-11-05 09:00:00', '2015-11-05 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '222', '2015-11-06', '2015-11-06 09:00:00', '2015-11-06 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '223', '2015-11-09', '2015-11-09 09:00:00', '2015-11-09 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '224', '2015-11-10', '2015-11-10 09:00:00', '2015-11-10 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '225', '2015-11-11', '2015-11-11 09:00:00', '2015-11-11 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '226', '2015-11-12', '2015-11-12 09:00:00', '2015-11-12 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '227', '2015-11-13', '2015-11-13 09:00:00', '2015-11-13 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '228', '2015-11-16', '2015-11-16 09:00:00', '2015-11-16 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '229', '2015-11-17', '2015-11-17 09:00:00', '2015-11-17 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '230', '2015-11-18', '2015-11-18 09:00:00', '2015-11-18 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '231', '2015-11-19', '2015-11-19 09:00:00', '2015-11-19 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '232', '2015-11-20', '2015-11-20 09:00:00', '2015-11-20 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '233', '2015-11-23', '2015-11-23 09:00:00', '2015-11-23 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '234', '2015-11-24', '2015-11-24 09:00:00', '2015-11-24 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '235', '2015-11-25', '2015-11-25 09:00:00', '2015-11-25 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '236', '2015-11-26', '2015-11-26 09:00:00', '2015-11-26 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '237', '2015-11-27', '2015-11-27 09:00:00', '2015-11-27 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '238', '2015-11-30', '2015-11-30 09:00:00', '2015-11-30 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '239', '2015-12-01', '2015-12-01 09:00:00', '2015-12-01 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '240', '2015-12-02', '2015-12-02 09:00:00', '2015-12-02 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '241', '2015-12-03', '2015-12-03 09:00:00', '2015-12-03 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '242', '2015-12-04', '2015-12-04 09:00:00', '2015-12-04 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '243', '2015-12-07', '2015-12-07 09:00:00', '2015-12-07 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '244', '2015-12-08', '2015-12-08 09:00:00', '2015-12-08 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '245', '2015-12-09', '2015-12-09 09:00:00', '2015-12-09 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '246', '2015-12-10', '2015-12-10 09:00:00', '2015-12-10 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '247', '2015-12-11', '2015-12-11 09:00:00', '2015-12-11 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '248', '2015-12-14', '2015-12-14 09:00:00', '2015-12-14 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '249', '2015-12-15', '2015-12-15 09:00:00', '2015-12-15 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '250', '2015-12-16', '2015-12-16 09:00:00', '2015-12-16 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '251', '2015-12-17', '2015-12-17 09:00:00', '2015-12-17 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '252', '2015-12-18', '2015-12-18 09:00:00', '2015-12-18 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '253', '2015-12-21', '2015-12-21 09:00:00', '2015-12-21 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '254', '2015-12-22', '2015-12-22 09:00:00', '2015-12-22 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '255', '2015-12-23', '2015-12-23 09:00:00', '2015-12-23 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '256', '2015-12-24', '2015-12-24 09:00:00', '2015-12-24 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '257', '2015-12-25', '2015-12-25 09:00:00', '2015-12-25 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '258', '2015-12-28', '2015-12-28 09:00:00', '2015-12-28 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '259', '2015-12-29', '2015-12-29 09:00:00', '2015-12-29 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '260', '2015-12-30', '2015-12-30 09:00:00', '2015-12-30 17:30:00');
INSERT INTO `has_workday` VALUES ('2015', '261', '2015-12-31', '2015-12-31 09:00:00', '2015-12-31 17:30:00');
INSERT INTO `has_workday` VALUES ('2016', '1', '2016-01-04', '2016-01-04 00:00:01', '2016-01-04 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '2', '2016-01-05', '2016-01-05 00:00:01', '2016-01-05 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '3', '2016-01-06', '2016-01-06 00:00:01', '2016-01-06 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '4', '2016-01-07', '2016-01-07 00:00:01', '2016-01-07 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '5', '2016-01-08', '2016-01-08 00:00:01', '2016-01-08 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '6', '2016-01-11', '2016-01-11 00:00:01', '2016-01-11 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '7', '2016-01-12', '2016-01-12 00:00:01', '2016-01-12 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '8', '2016-01-13', '2016-01-13 00:00:01', '2016-01-13 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '9', '2016-01-14', '2016-01-14 00:00:01', '2016-01-14 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '10', '2016-01-15', '2016-01-15 00:00:01', '2016-01-15 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '11', '2016-01-18', '2016-01-18 00:00:01', '2016-01-18 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '12', '2016-01-19', '2016-01-19 00:00:01', '2016-01-19 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '13', '2016-01-20', '2016-01-20 00:00:01', '2016-01-20 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '14', '2016-01-21', '2016-01-21 00:00:01', '2016-01-21 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '15', '2016-01-22', '2016-01-22 00:00:01', '2016-01-22 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '16', '2016-01-25', '2016-01-25 00:00:01', '2016-01-25 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '17', '2016-01-26', '2016-01-26 00:00:01', '2016-01-26 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '18', '2016-01-27', '2016-01-27 00:00:01', '2016-01-27 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '19', '2016-01-28', '2016-01-28 00:00:01', '2016-01-28 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '20', '2016-01-29', '2016-01-29 00:00:01', '2016-01-29 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '21', '2016-02-01', '2016-02-01 00:00:01', '2016-02-01 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '22', '2016-02-02', '2016-02-02 00:00:01', '2016-02-02 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '23', '2016-02-03', '2016-02-03 00:00:01', '2016-02-03 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '24', '2016-02-04', '2016-02-04 00:00:01', '2016-02-04 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '25', '2016-02-05', '2016-02-05 00:00:01', '2016-02-05 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '26', '2016-02-06', '2016-02-06 09:00:00', '2016-02-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2016', '27', '2016-02-14', '2016-02-14 09:00:00', '2016-02-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2016', '28', '2016-02-15', '2016-02-15 00:00:01', '2016-02-15 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '29', '2016-02-16', '2016-02-16 00:00:01', '2016-02-16 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '30', '2016-02-17', '2016-02-17 00:00:01', '2016-02-17 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '31', '2016-02-18', '2016-02-18 00:00:01', '2016-02-18 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '32', '2016-02-19', '2016-02-19 00:00:01', '2016-02-19 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '33', '2016-02-22', '2016-02-22 00:00:01', '2016-02-22 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '34', '2016-02-23', '2016-02-23 00:00:01', '2016-02-23 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '35', '2016-02-24', '2016-02-24 00:00:01', '2016-02-24 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '36', '2016-02-25', '2016-02-25 00:00:01', '2016-02-25 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '37', '2016-02-26', '2016-02-26 00:00:01', '2016-02-26 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '38', '2016-02-29', '2016-02-29 00:00:01', '2016-02-29 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '39', '2016-03-01', '2016-03-01 00:00:01', '2016-03-01 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '40', '2016-03-02', '2016-03-02 00:00:01', '2016-03-02 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '41', '2016-03-03', '2016-03-03 00:00:01', '2016-03-03 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '42', '2016-03-04', '2016-03-04 00:00:01', '2016-03-04 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '43', '2016-03-07', '2016-03-07 00:00:01', '2016-03-07 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '44', '2016-03-08', '2016-03-08 00:00:01', '2016-03-08 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '45', '2016-03-09', '2016-03-09 00:00:01', '2016-03-09 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '46', '2016-03-10', '2016-03-10 00:00:01', '2016-03-10 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '47', '2016-03-11', '2016-03-11 00:00:01', '2016-03-11 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '48', '2016-03-14', '2016-03-14 00:00:01', '2016-03-14 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '49', '2016-03-15', '2016-03-15 00:00:01', '2016-03-15 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '50', '2016-03-16', '2016-03-16 00:00:01', '2016-03-16 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '51', '2016-03-17', '2016-03-17 00:00:01', '2016-03-17 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '52', '2016-03-18', '2016-03-18 00:00:01', '2016-03-18 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '53', '2016-03-21', '2016-03-21 00:00:01', '2016-03-21 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '54', '2016-03-22', '2016-03-22 00:00:01', '2016-03-22 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '55', '2016-03-23', '2016-03-23 00:00:01', '2016-03-23 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '56', '2016-03-24', '2016-03-24 00:00:01', '2016-03-24 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '57', '2016-03-25', '2016-03-25 00:00:01', '2016-03-25 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '58', '2016-03-28', '2016-03-28 00:00:01', '2016-03-28 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '59', '2016-03-29', '2016-03-29 00:00:01', '2016-03-29 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '60', '2016-03-30', '2016-03-30 00:00:01', '2016-03-30 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '61', '2016-03-31', '2016-03-31 00:00:01', '2016-03-31 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '62', '2016-04-01', '2016-04-01 00:00:01', '2016-04-01 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '63', '2016-04-05', '2016-04-05 00:00:01', '2016-04-05 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '64', '2016-04-06', '2016-04-06 00:00:01', '2016-04-06 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '65', '2016-04-07', '2016-04-07 00:00:01', '2016-04-07 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '66', '2016-04-08', '2016-04-08 00:00:01', '2016-04-08 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '67', '2016-04-11', '2016-04-11 00:00:01', '2016-04-11 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '68', '2016-04-12', '2016-04-12 00:00:01', '2016-04-12 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '69', '2016-04-13', '2016-04-13 00:00:01', '2016-04-13 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '70', '2016-04-14', '2016-04-14 00:00:01', '2016-04-14 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '71', '2016-04-15', '2016-04-15 00:00:01', '2016-04-15 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '72', '2016-04-18', '2016-04-18 00:00:01', '2016-04-18 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '73', '2016-04-19', '2016-04-19 00:00:01', '2016-04-19 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '74', '2016-04-20', '2016-04-20 00:00:01', '2016-04-20 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '75', '2016-04-21', '2016-04-21 00:00:01', '2016-04-21 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '76', '2016-04-22', '2016-04-22 00:00:01', '2016-04-22 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '77', '2016-04-25', '2016-04-25 00:00:01', '2016-04-25 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '78', '2016-04-26', '2016-04-26 00:00:01', '2016-04-26 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '79', '2016-04-27', '2016-04-27 00:00:01', '2016-04-27 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '80', '2016-04-28', '2016-04-28 00:00:01', '2016-04-28 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '81', '2016-04-29', '2016-04-29 00:00:01', '2016-04-29 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '82', '2016-05-03', '2016-05-03 00:00:01', '2016-05-03 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '83', '2016-05-04', '2016-05-04 00:00:01', '2016-05-04 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '84', '2016-05-05', '2016-05-05 00:00:01', '2016-05-05 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '85', '2016-05-06', '2016-05-06 00:00:01', '2016-05-06 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '86', '2016-05-09', '2016-05-09 00:00:01', '2016-05-09 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '87', '2016-05-10', '2016-05-10 00:00:01', '2016-05-10 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '88', '2016-05-11', '2016-05-11 00:00:01', '2016-05-11 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '89', '2016-05-12', '2016-05-12 00:00:01', '2016-05-12 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '90', '2016-05-13', '2016-05-13 00:00:01', '2016-05-13 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '91', '2016-05-16', '2016-05-16 00:00:01', '2016-05-16 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '92', '2016-05-17', '2016-05-17 00:00:01', '2016-05-17 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '93', '2016-05-18', '2016-05-18 00:00:01', '2016-05-18 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '94', '2016-05-19', '2016-05-19 00:00:01', '2016-05-19 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '95', '2016-05-20', '2016-05-20 00:00:01', '2016-05-20 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '96', '2016-05-23', '2016-05-23 00:00:01', '2016-05-23 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '97', '2016-05-24', '2016-05-24 00:00:01', '2016-05-24 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '98', '2016-05-25', '2016-05-25 00:00:01', '2016-05-25 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '99', '2016-05-26', '2016-05-26 00:00:01', '2016-05-26 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '100', '2016-05-27', '2016-05-27 00:00:01', '2016-05-27 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '101', '2016-05-30', '2016-05-30 00:00:01', '2016-05-30 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '102', '2016-05-31', '2016-05-31 00:00:01', '2016-05-31 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '103', '2016-06-01', '2016-06-01 00:00:01', '2016-06-01 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '104', '2016-06-02', '2016-06-02 00:00:01', '2016-06-02 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '105', '2016-06-03', '2016-06-03 00:00:01', '2016-06-03 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '106', '2016-06-06', '2016-06-06 00:00:01', '2016-06-06 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '107', '2016-06-07', '2016-06-07 00:00:01', '2016-06-07 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '108', '2016-06-08', '2016-06-08 00:00:01', '2016-06-08 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '109', '2016-06-12', '2016-06-12 09:00:00', '2016-06-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2016', '110', '2016-06-13', '2016-06-13 00:00:01', '2016-06-13 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '111', '2016-06-14', '2016-06-14 00:00:01', '2016-06-14 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '112', '2016-06-15', '2016-06-15 00:00:01', '2016-06-15 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '113', '2016-06-16', '2016-06-16 00:00:01', '2016-06-16 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '114', '2016-06-17', '2016-06-17 00:00:01', '2016-06-17 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '115', '2016-06-20', '2016-06-20 00:00:01', '2016-06-20 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '116', '2016-06-21', '2016-06-21 00:00:01', '2016-06-21 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '117', '2016-06-22', '2016-06-22 00:00:01', '2016-06-22 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '118', '2016-06-23', '2016-06-23 00:00:01', '2016-06-23 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '119', '2016-06-24', '2016-06-24 00:00:01', '2016-06-24 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '120', '2016-06-27', '2016-06-27 00:00:01', '2016-06-27 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '121', '2016-06-28', '2016-06-28 00:00:01', '2016-06-28 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '122', '2016-06-29', '2016-06-29 00:00:01', '2016-06-29 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '123', '2016-06-30', '2016-06-30 00:00:01', '2016-06-30 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '124', '2016-07-01', '2016-07-01 00:00:01', '2016-07-01 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '125', '2016-07-04', '2016-07-04 00:00:01', '2016-07-04 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '126', '2016-07-05', '2016-07-05 00:00:01', '2016-07-05 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '127', '2016-07-06', '2016-07-06 00:00:01', '2016-07-06 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '128', '2016-07-07', '2016-07-07 00:00:01', '2016-07-07 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '129', '2016-07-08', '2016-07-08 00:00:01', '2016-07-08 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '130', '2016-07-11', '2016-07-11 00:00:01', '2016-07-11 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '131', '2016-07-12', '2016-07-12 00:00:01', '2016-07-12 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '132', '2016-07-13', '2016-07-13 00:00:01', '2016-07-13 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '133', '2016-07-14', '2016-07-14 00:00:01', '2016-07-14 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '134', '2016-07-15', '2016-07-15 00:00:01', '2016-07-15 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '135', '2016-07-18', '2016-07-18 00:00:01', '2016-07-18 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '136', '2016-07-19', '2016-07-19 00:00:01', '2016-07-19 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '137', '2016-07-20', '2016-07-20 00:00:01', '2016-07-20 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '138', '2016-07-21', '2016-07-21 00:00:01', '2016-07-21 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '139', '2016-07-22', '2016-07-22 00:00:01', '2016-07-22 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '140', '2016-07-25', '2016-07-25 00:00:01', '2016-07-25 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '141', '2016-07-26', '2016-07-26 00:00:01', '2016-07-26 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '142', '2016-07-27', '2016-07-27 00:00:01', '2016-07-27 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '143', '2016-07-28', '2016-07-28 00:00:01', '2016-07-28 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '144', '2016-07-29', '2016-07-29 00:00:01', '2016-07-29 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '145', '2016-08-01', '2016-08-01 00:00:01', '2016-08-01 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '146', '2016-08-02', '2016-08-02 00:00:01', '2016-08-02 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '147', '2016-08-03', '2016-08-03 00:00:01', '2016-08-03 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '148', '2016-08-04', '2016-08-04 00:00:01', '2016-08-04 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '149', '2016-08-05', '2016-08-05 00:00:01', '2016-08-05 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '150', '2016-08-08', '2016-08-08 00:00:01', '2016-08-08 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '151', '2016-08-09', '2016-08-09 00:00:01', '2016-08-09 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '152', '2016-08-10', '2016-08-10 00:00:01', '2016-08-10 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '153', '2016-08-11', '2016-08-11 00:00:01', '2016-08-11 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '154', '2016-08-12', '2016-08-12 00:00:01', '2016-08-12 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '155', '2016-08-15', '2016-08-15 00:00:01', '2016-08-15 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '156', '2016-08-16', '2016-08-16 00:00:01', '2016-08-16 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '157', '2016-08-17', '2016-08-17 00:00:01', '2016-08-17 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '158', '2016-08-18', '2016-08-18 00:00:01', '2016-08-18 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '159', '2016-08-19', '2016-08-19 00:00:01', '2016-08-19 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '160', '2016-08-22', '2016-08-22 00:00:01', '2016-08-22 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '161', '2016-08-23', '2016-08-23 00:00:01', '2016-08-23 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '162', '2016-08-24', '2016-08-24 00:00:01', '2016-08-24 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '163', '2016-08-25', '2016-08-25 00:00:01', '2016-08-25 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '164', '2016-08-26', '2016-08-26 00:00:01', '2016-08-26 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '165', '2016-08-29', '2016-08-29 00:00:01', '2016-08-29 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '166', '2016-08-30', '2016-08-30 00:00:01', '2016-08-30 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '167', '2016-08-31', '2016-08-31 00:00:01', '2016-08-31 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '168', '2016-09-01', '2016-09-01 00:00:01', '2016-09-01 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '169', '2016-09-02', '2016-09-02 00:00:01', '2016-09-02 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '170', '2016-09-05', '2016-09-05 00:00:01', '2016-09-05 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '171', '2016-09-06', '2016-09-06 00:00:01', '2016-09-06 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '172', '2016-09-07', '2016-09-07 00:00:01', '2016-09-07 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '173', '2016-09-08', '2016-09-08 00:00:01', '2016-09-08 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '174', '2016-09-09', '2016-09-09 00:00:01', '2016-09-09 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '175', '2016-09-12', '2016-09-12 00:00:01', '2016-09-12 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '176', '2016-09-13', '2016-09-13 00:00:01', '2016-09-13 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '177', '2016-09-14', '2016-09-14 00:00:01', '2016-09-14 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '178', '2016-09-18', '2016-09-18 09:00:00', '2016-09-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2016', '179', '2016-09-19', '2016-09-19 00:00:01', '2016-09-19 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '180', '2016-09-20', '2016-09-20 00:00:01', '2016-09-20 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '181', '2016-09-21', '2016-09-21 00:00:01', '2016-09-21 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '182', '2016-09-22', '2016-09-22 00:00:01', '2016-09-22 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '183', '2016-09-23', '2016-09-23 00:00:01', '2016-09-23 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '184', '2016-09-26', '2016-09-26 00:00:01', '2016-09-26 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '185', '2016-09-27', '2016-09-27 00:00:01', '2016-09-27 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '186', '2016-09-28', '2016-09-28 00:00:01', '2016-09-28 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '187', '2016-09-29', '2016-09-29 00:00:01', '2016-09-29 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '188', '2016-09-30', '2016-09-30 00:00:01', '2016-09-30 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '189', '2016-10-08', '2016-10-08 09:00:00', '2016-10-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2016', '190', '2016-10-09', '2016-10-09 09:00:00', '2016-10-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2016', '191', '2016-10-10', '2016-10-10 00:00:01', '2016-10-10 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '192', '2016-10-11', '2016-10-11 00:00:01', '2016-10-11 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '193', '2016-10-12', '2016-10-12 00:00:01', '2016-10-12 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '194', '2016-10-13', '2016-10-13 00:00:01', '2016-10-13 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '195', '2016-10-14', '2016-10-14 00:00:01', '2016-10-14 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '196', '2016-10-17', '2016-10-17 00:00:01', '2016-10-17 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '197', '2016-10-18', '2016-10-18 00:00:01', '2016-10-18 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '198', '2016-10-19', '2016-10-19 00:00:01', '2016-10-19 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '199', '2016-10-20', '2016-10-20 00:00:01', '2016-10-20 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '200', '2016-10-21', '2016-10-21 00:00:01', '2016-10-21 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '201', '2016-10-24', '2016-10-24 00:00:01', '2016-10-24 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '202', '2016-10-25', '2016-10-25 00:00:01', '2016-10-25 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '203', '2016-10-26', '2016-10-26 00:00:01', '2016-10-26 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '204', '2016-10-27', '2016-10-27 00:00:01', '2016-10-27 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '205', '2016-10-28', '2016-10-28 00:00:01', '2016-10-28 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '206', '2016-10-31', '2016-10-31 00:00:01', '2016-10-31 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '207', '2016-11-01', '2016-11-01 00:00:01', '2016-11-01 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '208', '2016-11-02', '2016-11-02 00:00:01', '2016-11-02 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '209', '2016-11-05', '2016-11-05 09:00:00', '2016-11-05 22:22:44');
INSERT INTO `has_workday` VALUES ('2016', '210', '2016-11-07', '2016-11-07 00:00:01', '2016-11-07 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '211', '2016-11-08', '2016-11-08 00:00:01', '2016-11-08 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '212', '2016-11-09', '2016-11-09 00:00:01', '2016-11-09 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '213', '2016-11-10', '2016-11-10 00:00:01', '2016-11-10 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '214', '2016-11-11', '2016-11-11 00:00:01', '2016-11-11 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '215', '2016-11-14', '2016-11-14 00:00:01', '2016-11-14 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '216', '2016-11-15', '2016-11-15 00:00:01', '2016-11-15 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '217', '2016-11-16', '2016-11-16 00:00:01', '2016-11-16 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '218', '2016-11-17', '2016-11-17 00:00:01', '2016-11-17 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '219', '2016-11-18', '2016-11-18 00:00:01', '2016-11-18 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '220', '2016-11-21', '2016-11-21 00:00:01', '2016-11-21 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '221', '2016-11-22', '2016-11-22 00:00:01', '2016-11-22 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '222', '2016-11-23', '2016-11-23 00:00:01', '2016-11-23 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '223', '2016-11-24', '2016-11-24 00:00:01', '2016-11-24 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '224', '2016-11-25', '2016-11-25 00:00:01', '2016-11-25 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '225', '2016-11-28', '2016-11-28 00:00:01', '2016-11-28 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '226', '2016-11-29', '2016-11-29 00:00:01', '2016-11-29 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '227', '2016-11-30', '2016-11-30 00:00:01', '2016-11-30 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '228', '2016-12-01', '2016-12-01 00:00:01', '2016-12-01 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '229', '2016-12-02', '2016-12-02 00:00:01', '2016-12-02 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '230', '2016-12-05', '2016-12-05 00:00:01', '2016-12-05 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '231', '2016-12-06', '2016-12-06 00:00:01', '2016-12-06 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '232', '2016-12-07', '2016-12-07 00:00:01', '2016-12-07 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '233', '2016-12-08', '2016-12-08 00:00:01', '2016-12-08 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '234', '2016-12-09', '2016-12-09 00:00:01', '2016-12-09 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '235', '2016-12-12', '2016-12-12 00:00:01', '2016-12-12 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '236', '2016-12-13', '2016-12-13 00:00:01', '2016-12-13 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '237', '2016-12-14', '2016-12-14 00:00:01', '2016-12-14 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '238', '2016-12-15', '2016-12-15 00:00:01', '2016-12-15 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '239', '2016-12-16', '2016-12-16 00:00:01', '2016-12-16 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '240', '2016-12-19', '2016-12-19 00:00:01', '2016-12-19 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '241', '2016-12-20', '2016-12-20 00:00:01', '2016-12-20 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '242', '2016-12-21', '2016-12-21 00:00:01', '2016-12-21 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '243', '2016-12-22', '2016-12-22 00:00:01', '2016-12-22 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '244', '2016-12-23', '2016-12-23 00:00:01', '2016-12-23 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '245', '2016-12-26', '2016-12-26 00:00:01', '2016-12-26 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '246', '2016-12-27', '2016-12-27 00:00:01', '2016-12-27 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '247', '2016-12-28', '2016-12-28 00:00:01', '2016-12-28 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '248', '2016-12-29', '2016-12-29 00:00:01', '2016-12-29 23:59:58');
INSERT INTO `has_workday` VALUES ('2016', '249', '2016-12-30', '2016-12-30 00:00:01', '2016-12-30 23:59:58');
INSERT INTO `has_workday` VALUES ('2017', '1', '2017-01-04', '2017-01-04 09:00:00', '2017-01-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '2', '2017-01-05', '2017-01-05 09:00:00', '2017-01-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '3', '2017-01-06', '2017-01-06 09:00:00', '2017-01-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '4', '2017-01-09', '2017-01-09 09:00:00', '2017-01-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '5', '2017-01-10', '2017-01-10 09:00:00', '2017-01-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '6', '2017-01-11', '2017-01-11 09:00:00', '2017-01-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '7', '2017-01-12', '2017-01-12 09:00:00', '2017-01-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '8', '2017-01-13', '2017-01-13 09:00:00', '2017-01-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '9', '2017-01-16', '2017-01-16 09:00:00', '2017-01-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '10', '2017-01-17', '2017-01-17 09:00:00', '2017-01-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '11', '2017-01-18', '2017-01-18 09:00:00', '2017-01-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '12', '2017-01-19', '2017-01-19 09:00:00', '2017-01-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '13', '2017-01-20', '2017-01-20 09:00:00', '2017-01-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '14', '2017-01-23', '2017-01-23 09:00:00', '2017-01-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '15', '2017-01-24', '2017-01-24 09:00:00', '2017-01-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '16', '2017-01-25', '2017-01-25 09:00:00', '2017-01-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '17', '2017-01-26', '2017-01-26 09:00:00', '2017-01-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '18', '2017-02-03', '2017-02-03 09:00:00', '2017-02-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '19', '2017-02-04', '2017-02-04 09:00:00', '2017-02-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '20', '2017-02-06', '2017-02-06 09:00:00', '2017-02-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '21', '2017-02-07', '2017-02-07 09:00:00', '2017-02-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '22', '2017-02-08', '2017-02-08 09:00:00', '2017-02-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '23', '2017-02-09', '2017-02-09 09:00:00', '2017-02-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '24', '2017-02-10', '2017-02-10 09:00:00', '2017-02-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '25', '2017-02-13', '2017-02-13 09:00:00', '2017-02-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '26', '2017-02-14', '2017-02-14 09:00:00', '2017-02-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '27', '2017-02-15', '2017-02-15 09:00:00', '2017-02-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '28', '2017-02-16', '2017-02-16 09:00:00', '2017-02-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '29', '2017-02-17', '2017-02-17 09:00:00', '2017-02-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '30', '2017-02-20', '2017-02-20 09:00:00', '2017-02-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '31', '2017-02-21', '2017-02-21 09:00:00', '2017-02-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '32', '2017-02-22', '2017-02-22 09:00:00', '2017-02-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '33', '2017-02-23', '2017-02-23 09:00:00', '2017-02-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '34', '2017-02-24', '2017-02-24 09:00:00', '2017-02-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '35', '2017-02-27', '2017-02-27 09:00:00', '2017-02-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '36', '2017-02-28', '2017-02-28 09:00:00', '2017-02-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '37', '2017-03-01', '2017-03-01 09:00:00', '2017-03-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '38', '2017-03-02', '2017-03-02 09:00:00', '2017-03-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '39', '2017-03-03', '2017-03-03 09:00:00', '2017-03-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '40', '2017-03-06', '2017-03-06 09:00:00', '2017-03-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '41', '2017-03-07', '2017-03-07 09:00:00', '2017-03-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '42', '2017-03-08', '2017-03-08 09:00:00', '2017-03-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '43', '2017-03-09', '2017-03-09 09:00:00', '2017-03-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '44', '2017-03-10', '2017-03-10 09:00:00', '2017-03-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '45', '2017-03-13', '2017-03-13 09:00:00', '2017-03-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '46', '2017-03-14', '2017-03-14 09:00:00', '2017-03-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '47', '2017-03-15', '2017-03-15 09:00:00', '2017-03-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '48', '2017-03-16', '2017-03-16 09:00:00', '2017-03-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '49', '2017-03-17', '2017-03-17 09:00:00', '2017-03-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '50', '2017-03-20', '2017-03-20 09:00:00', '2017-03-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '51', '2017-03-21', '2017-03-21 09:00:00', '2017-03-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '52', '2017-03-22', '2017-03-22 09:00:00', '2017-03-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '53', '2017-03-23', '2017-03-23 09:00:00', '2017-03-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '54', '2017-03-24', '2017-03-24 09:00:00', '2017-03-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '55', '2017-03-27', '2017-03-27 09:00:00', '2017-03-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '56', '2017-03-28', '2017-03-28 09:00:00', '2017-03-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '57', '2017-03-29', '2017-03-29 09:00:00', '2017-03-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '58', '2017-03-30', '2017-03-30 09:00:00', '2017-03-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '59', '2017-03-31', '2017-03-31 09:00:00', '2017-03-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '60', '2017-04-01', '2017-04-01 09:00:00', '2017-04-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '61', '2017-04-02', '2017-04-02 09:00:00', '2017-04-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '62', '2017-04-06', '2017-04-06 09:00:00', '2017-04-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '63', '2017-04-07', '2017-04-07 09:00:00', '2017-04-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '64', '2017-04-10', '2017-04-10 09:00:00', '2017-04-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '65', '2017-04-11', '2017-04-11 09:00:00', '2017-04-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '66', '2017-04-12', '2017-04-12 09:00:00', '2017-04-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '67', '2017-04-13', '2017-04-13 09:00:00', '2017-04-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '68', '2017-04-14', '2017-04-14 09:00:00', '2017-04-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '69', '2017-04-17', '2017-04-17 09:00:00', '2017-04-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '70', '2017-04-18', '2017-04-18 09:00:00', '2017-04-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '71', '2017-04-19', '2017-04-19 09:00:00', '2017-04-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '72', '2017-04-20', '2017-04-20 09:00:00', '2017-04-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '73', '2017-04-21', '2017-04-21 09:00:00', '2017-04-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '74', '2017-04-24', '2017-04-24 09:00:00', '2017-04-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '75', '2017-04-25', '2017-04-25 09:00:00', '2017-04-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '76', '2017-04-26', '2017-04-26 09:00:00', '2017-04-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '77', '2017-04-27', '2017-04-27 09:00:00', '2017-04-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '78', '2017-04-28', '2017-04-28 09:00:00', '2017-04-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '79', '2017-04-29', '2017-04-29 09:00:00', '2017-04-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '80', '2017-04-30', '2017-04-30 09:00:00', '2017-04-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '81', '2017-05-04', '2017-05-04 09:00:00', '2017-05-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '82', '2017-05-05', '2017-05-05 09:00:00', '2017-05-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '83', '2017-05-08', '2017-05-08 09:00:00', '2017-05-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '84', '2017-05-09', '2017-05-09 09:00:00', '2017-05-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '85', '2017-05-10', '2017-05-10 09:00:00', '2017-05-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '86', '2017-05-11', '2017-05-11 09:00:00', '2017-05-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '87', '2017-05-12', '2017-05-12 09:00:00', '2017-05-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '88', '2017-05-15', '2017-05-15 09:00:00', '2017-05-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '89', '2017-05-16', '2017-05-16 09:00:00', '2017-05-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '90', '2017-05-17', '2017-05-17 09:00:00', '2017-05-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '91', '2017-05-18', '2017-05-18 09:00:00', '2017-05-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '92', '2017-05-19', '2017-05-19 09:00:00', '2017-05-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '93', '2017-05-22', '2017-05-22 09:00:00', '2017-05-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '94', '2017-05-23', '2017-05-23 09:00:00', '2017-05-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '95', '2017-05-24', '2017-05-24 09:00:00', '2017-05-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '96', '2017-05-25', '2017-05-25 09:00:00', '2017-05-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '97', '2017-05-26', '2017-05-26 09:00:00', '2017-05-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '98', '2017-05-27', '2017-05-27 09:00:00', '2017-05-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '99', '2017-05-31', '2017-05-31 09:00:00', '2017-05-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '100', '2017-06-01', '2017-06-01 09:00:00', '2017-06-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '101', '2017-06-02', '2017-06-02 09:00:00', '2017-06-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '102', '2017-06-05', '2017-06-05 09:00:00', '2017-06-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '103', '2017-06-06', '2017-06-06 09:00:00', '2017-06-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '104', '2017-06-07', '2017-06-07 09:00:00', '2017-06-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '105', '2017-06-08', '2017-06-08 09:00:00', '2017-06-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '106', '2017-06-09', '2017-06-09 09:00:00', '2017-06-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '107', '2017-06-12', '2017-06-12 09:00:00', '2017-06-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '108', '2017-06-13', '2017-06-13 09:00:00', '2017-06-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '109', '2017-06-14', '2017-06-14 09:00:00', '2017-06-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '110', '2017-06-15', '2017-06-15 09:00:00', '2017-06-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '111', '2017-06-16', '2017-06-16 09:00:00', '2017-06-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '112', '2017-06-19', '2017-06-19 09:00:00', '2017-06-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '113', '2017-06-20', '2017-06-20 09:00:00', '2017-06-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '114', '2017-06-21', '2017-06-21 09:00:00', '2017-06-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '115', '2017-06-22', '2017-06-22 09:00:00', '2017-06-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '116', '2017-06-23', '2017-06-23 09:00:00', '2017-06-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '117', '2017-06-26', '2017-06-26 09:00:00', '2017-06-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '118', '2017-06-27', '2017-06-27 09:00:00', '2017-06-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '119', '2017-06-28', '2017-06-28 09:00:00', '2017-06-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '120', '2017-06-29', '2017-06-29 09:00:00', '2017-06-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '121', '2017-06-30', '2017-06-30 09:00:00', '2017-06-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '122', '2017-07-03', '2017-07-03 09:00:00', '2017-07-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '123', '2017-07-04', '2017-07-04 09:00:00', '2017-07-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '124', '2017-07-05', '2017-07-05 09:00:00', '2017-07-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '125', '2017-07-06', '2017-07-06 09:00:00', '2017-07-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '126', '2017-07-07', '2017-07-07 09:00:00', '2017-07-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '127', '2017-07-10', '2017-07-10 09:00:00', '2017-07-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '128', '2017-07-11', '2017-07-11 09:00:00', '2017-07-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '129', '2017-07-12', '2017-07-12 09:00:00', '2017-07-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '130', '2017-07-13', '2017-07-13 09:00:00', '2017-07-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '131', '2017-07-14', '2017-07-14 09:00:00', '2017-07-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '132', '2017-07-17', '2017-07-17 09:00:00', '2017-07-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '133', '2017-07-18', '2017-07-18 09:00:00', '2017-07-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '134', '2017-07-19', '2017-07-19 09:00:00', '2017-07-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '135', '2017-07-20', '2017-07-20 09:00:00', '2017-07-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '136', '2017-07-21', '2017-07-21 09:00:00', '2017-07-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '137', '2017-07-24', '2017-07-24 09:00:00', '2017-07-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '138', '2017-07-25', '2017-07-25 09:00:00', '2017-07-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '139', '2017-07-26', '2017-07-26 09:00:00', '2017-07-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '140', '2017-07-27', '2017-07-27 09:00:00', '2017-07-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '141', '2017-07-28', '2017-07-28 09:00:00', '2017-07-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '142', '2017-07-31', '2017-07-31 09:00:00', '2017-07-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '143', '2017-08-01', '2017-08-01 09:00:00', '2017-08-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '144', '2017-08-02', '2017-08-02 09:00:00', '2017-08-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '145', '2017-08-03', '2017-08-03 09:00:00', '2017-08-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '146', '2017-08-04', '2017-08-04 09:00:00', '2017-08-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '147', '2017-08-07', '2017-08-07 09:00:00', '2017-08-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '148', '2017-08-08', '2017-08-08 09:00:00', '2017-08-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '149', '2017-08-09', '2017-08-09 09:00:00', '2017-08-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '150', '2017-08-10', '2017-08-10 09:00:00', '2017-08-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '151', '2017-08-11', '2017-08-11 09:00:00', '2017-08-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '152', '2017-08-14', '2017-08-14 09:00:00', '2017-08-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '153', '2017-08-15', '2017-08-15 09:00:00', '2017-08-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '154', '2017-08-16', '2017-08-16 09:00:00', '2017-08-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '155', '2017-08-17', '2017-08-17 09:00:00', '2017-08-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '156', '2017-08-18', '2017-08-18 09:00:00', '2017-08-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '157', '2017-08-21', '2017-08-21 09:00:00', '2017-08-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '158', '2017-08-22', '2017-08-22 09:00:00', '2017-08-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '159', '2017-08-23', '2017-08-23 09:00:00', '2017-08-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '160', '2017-08-24', '2017-08-24 09:00:00', '2017-08-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '161', '2017-08-25', '2017-08-25 09:00:00', '2017-08-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '162', '2017-08-28', '2017-08-28 09:00:00', '2017-08-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '163', '2017-08-29', '2017-08-29 09:00:00', '2017-08-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '164', '2017-08-30', '2017-08-30 09:00:00', '2017-08-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '165', '2017-08-31', '2017-08-31 09:00:00', '2017-08-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '166', '2017-09-01', '2017-09-01 09:00:00', '2017-09-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '167', '2017-09-04', '2017-09-04 09:00:00', '2017-09-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '168', '2017-09-05', '2017-09-05 09:00:00', '2017-09-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '169', '2017-09-06', '2017-09-06 09:00:00', '2017-09-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '170', '2017-09-07', '2017-09-07 09:00:00', '2017-09-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '171', '2017-09-08', '2017-09-08 09:00:00', '2017-09-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '172', '2017-09-11', '2017-09-11 09:00:00', '2017-09-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '173', '2017-09-12', '2017-09-12 09:00:00', '2017-09-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '174', '2017-09-13', '2017-09-13 09:00:00', '2017-09-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '175', '2017-09-14', '2017-09-14 09:00:00', '2017-09-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '176', '2017-09-15', '2017-09-15 09:00:00', '2017-09-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '177', '2017-09-18', '2017-09-18 09:00:00', '2017-09-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '178', '2017-09-19', '2017-09-19 09:00:00', '2017-09-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '179', '2017-09-20', '2017-09-20 09:00:00', '2017-09-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '180', '2017-09-21', '2017-09-21 09:00:00', '2017-09-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '181', '2017-09-22', '2017-09-22 09:00:00', '2017-09-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '182', '2017-09-25', '2017-09-25 09:00:00', '2017-09-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '183', '2017-09-26', '2017-09-26 09:00:00', '2017-09-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '184', '2017-09-27', '2017-09-27 09:00:00', '2017-09-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '185', '2017-09-28', '2017-09-28 09:00:00', '2017-09-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '186', '2017-09-29', '2017-09-29 09:00:00', '2017-09-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '187', '2017-09-30', '2017-09-30 09:00:00', '2017-09-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '188', '2017-10-08', '2017-10-08 09:00:00', '2017-10-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '189', '2017-10-09', '2017-10-09 09:00:00', '2017-10-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '190', '2017-10-10', '2017-10-10 09:00:00', '2017-10-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '191', '2017-10-11', '2017-10-11 09:00:00', '2017-10-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '192', '2017-10-12', '2017-10-12 09:00:00', '2017-10-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '193', '2017-10-13', '2017-10-13 09:00:00', '2017-10-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '194', '2017-10-16', '2017-10-16 09:00:00', '2017-10-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '195', '2017-10-17', '2017-10-17 09:00:00', '2017-10-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '196', '2017-10-18', '2017-10-18 09:00:00', '2017-10-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '197', '2017-10-19', '2017-10-19 09:00:00', '2017-10-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '198', '2017-10-20', '2017-10-20 09:00:00', '2017-10-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '199', '2017-10-23', '2017-10-23 09:00:00', '2017-10-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '200', '2017-10-24', '2017-10-24 09:00:00', '2017-10-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '201', '2017-10-25', '2017-10-25 09:00:00', '2017-10-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '202', '2017-10-26', '2017-10-26 09:00:00', '2017-10-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '203', '2017-10-27', '2017-10-27 09:00:00', '2017-10-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '204', '2017-10-30', '2017-10-30 09:00:00', '2017-10-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '205', '2017-10-31', '2017-10-31 09:00:00', '2017-10-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '206', '2017-11-01', '2017-11-01 09:00:00', '2017-11-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '207', '2017-11-02', '2017-11-02 09:00:00', '2017-11-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '208', '2017-11-03', '2017-11-03 09:00:00', '2017-11-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '209', '2017-11-06', '2017-11-06 09:00:00', '2017-11-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '210', '2017-11-07', '2017-11-07 09:00:00', '2017-11-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '211', '2017-11-08', '2017-11-08 09:00:00', '2017-11-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '212', '2017-11-09', '2017-11-09 09:00:00', '2017-11-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '213', '2017-11-10', '2017-11-10 09:00:00', '2017-11-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '214', '2017-11-13', '2017-11-13 09:00:00', '2017-11-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '215', '2017-11-14', '2017-11-14 09:00:00', '2017-11-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '216', '2017-11-15', '2017-11-15 09:00:00', '2017-11-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '217', '2017-11-16', '2017-11-16 09:00:00', '2017-11-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '218', '2017-11-17', '2017-11-17 09:00:00', '2017-11-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '219', '2017-11-20', '2017-11-20 09:00:00', '2017-11-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '220', '2017-11-21', '2017-11-21 09:00:00', '2017-11-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '221', '2017-11-22', '2017-11-22 09:00:00', '2017-11-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '222', '2017-11-23', '2017-11-23 09:00:00', '2017-11-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '223', '2017-11-24', '2017-11-24 09:00:00', '2017-11-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '224', '2017-11-27', '2017-11-27 09:00:00', '2017-11-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '225', '2017-11-28', '2017-11-28 09:00:00', '2017-11-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '226', '2017-11-29', '2017-11-29 09:00:00', '2017-11-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '227', '2017-11-30', '2017-11-30 09:00:00', '2017-11-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '228', '2017-12-01', '2017-12-01 09:00:00', '2017-12-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '229', '2017-12-04', '2017-12-04 09:00:00', '2017-12-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '230', '2017-12-05', '2017-12-05 09:00:00', '2017-12-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '231', '2017-12-06', '2017-12-06 09:00:00', '2017-12-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '232', '2017-12-07', '2017-12-07 09:00:00', '2017-12-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '233', '2017-12-08', '2017-12-08 09:00:00', '2017-12-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '234', '2017-12-11', '2017-12-11 09:00:00', '2017-12-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '235', '2017-12-12', '2017-12-12 09:00:00', '2017-12-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '236', '2017-12-13', '2017-12-13 09:00:00', '2017-12-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '237', '2017-12-14', '2017-12-14 09:00:00', '2017-12-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '238', '2017-12-15', '2017-12-15 09:00:00', '2017-12-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '239', '2017-12-18', '2017-12-18 09:00:00', '2017-12-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '240', '2017-12-19', '2017-12-19 09:00:00', '2017-12-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '241', '2017-12-20', '2017-12-20 09:00:00', '2017-12-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '242', '2017-12-21', '2017-12-21 09:00:00', '2017-12-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '243', '2017-12-22', '2017-12-22 09:00:00', '2017-12-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '244', '2017-12-25', '2017-12-25 09:00:00', '2017-12-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '245', '2017-12-26', '2017-12-26 09:00:00', '2017-12-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '246', '2017-12-27', '2017-12-27 09:00:00', '2017-12-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '247', '2017-12-28', '2017-12-28 09:00:00', '2017-12-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2017', '248', '2017-12-29', '2017-12-29 09:00:00', '2017-12-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '1', '2019-01-02', '2019-01-02 09:00:00', '2019-01-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '2', '2019-01-03', '2019-01-03 09:00:00', '2019-01-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '3', '2019-01-04', '2019-01-04 09:00:00', '2019-01-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '4', '2019-01-07', '2019-01-07 09:00:00', '2019-01-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '5', '2019-01-08', '2019-01-08 09:00:00', '2019-01-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '6', '2019-01-09', '2019-01-09 09:00:00', '2019-01-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '7', '2019-01-10', '2019-01-10 09:00:00', '2019-01-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '8', '2019-01-11', '2019-01-11 09:00:00', '2019-01-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '9', '2019-01-14', '2019-01-14 09:00:00', '2019-01-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '10', '2019-01-15', '2019-01-15 09:00:00', '2019-01-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '11', '2019-01-16', '2019-01-16 09:00:00', '2019-01-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '12', '2019-01-17', '2019-01-17 09:00:00', '2019-01-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '13', '2019-01-18', '2019-01-18 09:00:00', '2019-01-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '14', '2019-01-21', '2019-01-21 09:00:00', '2019-01-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '15', '2019-01-22', '2019-01-22 09:00:00', '2019-01-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '16', '2019-01-23', '2019-01-23 09:00:00', '2019-01-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '17', '2019-01-24', '2019-01-24 09:00:00', '2019-01-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '18', '2019-01-25', '2019-01-25 09:00:00', '2019-01-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '19', '2019-01-28', '2019-01-28 09:00:00', '2019-01-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '20', '2019-01-29', '2019-01-29 09:00:00', '2019-01-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '21', '2019-01-30', '2019-01-30 09:00:00', '2019-01-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '22', '2019-01-31', '2019-01-31 09:00:00', '2019-01-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '23', '2019-02-01', '2019-02-01 09:00:00', '2019-02-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '24', '2019-02-04', '2019-02-04 09:00:00', '2019-02-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '25', '2019-02-05', '2019-02-05 09:00:00', '2019-02-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '26', '2019-02-06', '2019-02-06 09:00:00', '2019-02-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '27', '2019-02-07', '2019-02-07 09:00:00', '2019-02-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '28', '2019-02-08', '2019-02-08 09:00:00', '2019-02-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '29', '2019-02-11', '2019-02-11 09:00:00', '2019-02-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '30', '2019-02-12', '2019-02-12 09:00:00', '2019-02-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '31', '2019-02-13', '2019-02-13 09:00:00', '2019-02-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '32', '2019-02-14', '2019-02-14 09:00:00', '2019-02-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '33', '2019-02-15', '2019-02-15 09:00:00', '2019-02-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '34', '2019-02-18', '2019-02-18 09:00:00', '2019-02-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '35', '2019-02-19', '2019-02-19 09:00:00', '2019-02-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '36', '2019-02-20', '2019-02-20 09:00:00', '2019-02-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '37', '2019-02-21', '2019-02-21 09:00:00', '2019-02-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '38', '2019-02-22', '2019-02-22 09:00:00', '2019-02-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '39', '2019-02-25', '2019-02-25 09:00:00', '2019-02-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '40', '2019-02-26', '2019-02-26 09:00:00', '2019-02-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '41', '2019-02-27', '2019-02-27 09:00:00', '2019-02-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '42', '2019-02-28', '2019-02-28 09:00:00', '2019-02-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '43', '2019-03-01', '2019-03-01 09:00:00', '2019-03-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '44', '2019-03-04', '2019-03-04 09:00:00', '2019-03-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '45', '2019-03-05', '2019-03-05 09:00:00', '2019-03-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '46', '2019-03-06', '2019-03-06 09:00:00', '2019-03-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '47', '2019-03-07', '2019-03-07 09:00:00', '2019-03-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '48', '2019-03-08', '2019-03-08 09:00:00', '2019-03-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '49', '2019-03-11', '2019-03-11 09:00:00', '2019-03-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '50', '2019-03-12', '2019-03-12 09:00:00', '2019-03-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '51', '2019-03-13', '2019-03-13 09:00:00', '2019-03-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '52', '2019-03-14', '2019-03-14 09:00:00', '2019-03-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '53', '2019-03-15', '2019-03-15 09:00:00', '2019-03-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '54', '2019-03-18', '2019-03-18 09:00:00', '2019-03-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '55', '2019-03-19', '2019-03-19 09:00:00', '2019-03-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '56', '2019-03-20', '2019-03-20 09:00:00', '2019-03-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '57', '2019-03-21', '2019-03-21 09:00:00', '2019-03-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '58', '2019-03-22', '2019-03-22 09:00:00', '2019-03-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '59', '2019-03-25', '2019-03-25 09:00:00', '2019-03-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '60', '2019-03-26', '2019-03-26 09:00:00', '2019-03-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '61', '2019-03-27', '2019-03-27 09:00:00', '2019-03-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '62', '2019-03-28', '2019-03-28 09:00:00', '2019-03-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '63', '2019-03-29', '2019-03-29 09:00:00', '2019-03-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '64', '2019-04-01', '2019-04-01 09:00:00', '2019-04-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '65', '2019-04-02', '2019-04-02 09:00:00', '2019-04-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '66', '2019-04-03', '2019-04-03 09:00:00', '2019-04-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '67', '2019-04-04', '2019-04-04 09:00:00', '2019-04-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '68', '2019-04-05', '2019-04-05 09:00:00', '2019-04-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '69', '2019-04-08', '2019-04-08 09:00:00', '2019-04-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '70', '2019-04-09', '2019-04-09 09:00:00', '2019-04-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '71', '2019-04-10', '2019-04-10 09:00:00', '2019-04-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '72', '2019-04-11', '2019-04-11 09:00:00', '2019-04-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '73', '2019-04-12', '2019-04-12 09:00:00', '2019-04-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '74', '2019-04-15', '2019-04-15 09:00:00', '2019-04-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '75', '2019-04-16', '2019-04-16 09:00:00', '2019-04-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '76', '2019-04-17', '2019-04-17 09:00:00', '2019-04-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '77', '2019-04-18', '2019-04-18 09:00:00', '2019-04-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '78', '2019-04-19', '2019-04-19 09:00:00', '2019-04-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '79', '2019-04-22', '2019-04-22 09:00:00', '2019-04-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '80', '2019-04-23', '2019-04-23 09:00:00', '2019-04-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '81', '2019-04-24', '2019-04-24 09:00:00', '2019-04-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '82', '2019-04-25', '2019-04-25 09:00:00', '2019-04-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '83', '2019-04-26', '2019-04-26 09:00:00', '2019-04-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '84', '2019-04-29', '2019-04-29 09:00:00', '2019-04-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '85', '2019-04-30', '2019-04-30 09:00:00', '2019-04-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '86', '2019-05-01', '2019-05-01 09:00:00', '2019-05-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '87', '2019-05-02', '2019-05-02 09:00:00', '2019-05-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '88', '2019-05-03', '2019-05-03 09:00:00', '2019-05-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '89', '2019-05-06', '2019-05-06 09:00:00', '2019-05-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '90', '2019-05-07', '2019-05-07 09:00:00', '2019-05-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '91', '2019-05-08', '2019-05-08 09:00:00', '2019-05-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '92', '2019-05-09', '2019-05-09 09:00:00', '2019-05-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '93', '2019-05-10', '2019-05-10 09:00:00', '2019-05-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '94', '2019-05-13', '2019-05-13 09:00:00', '2019-05-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '95', '2019-05-14', '2019-05-14 09:00:00', '2019-05-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '96', '2019-05-15', '2019-05-15 09:00:00', '2019-05-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '97', '2019-05-16', '2019-05-16 09:00:00', '2019-05-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '98', '2019-05-17', '2019-05-17 09:00:00', '2019-05-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '99', '2019-05-20', '2019-05-20 09:00:00', '2019-05-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '100', '2019-05-21', '2019-05-21 09:00:00', '2019-05-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '101', '2019-05-22', '2019-05-22 09:00:00', '2019-05-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '102', '2019-05-23', '2019-05-23 09:00:00', '2019-05-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '103', '2019-05-24', '2019-05-24 09:00:00', '2019-05-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '104', '2019-05-27', '2019-05-27 09:00:00', '2019-05-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '105', '2019-05-28', '2019-05-28 09:00:00', '2019-05-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '106', '2019-05-29', '2019-05-29 09:00:00', '2019-05-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '107', '2019-05-30', '2019-05-30 09:00:00', '2019-05-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '108', '2019-05-31', '2019-05-31 09:00:00', '2019-05-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '109', '2019-06-03', '2019-06-03 09:00:00', '2019-06-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '110', '2019-06-04', '2019-06-04 09:00:00', '2019-06-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '111', '2019-06-05', '2019-06-05 09:00:00', '2019-06-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '112', '2019-06-06', '2019-06-06 09:00:00', '2019-06-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '113', '2019-06-07', '2019-06-07 09:00:00', '2019-06-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '114', '2019-06-10', '2019-06-10 09:00:00', '2019-06-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '115', '2019-06-11', '2019-06-11 09:00:00', '2019-06-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '116', '2019-06-12', '2019-06-12 09:00:00', '2019-06-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '117', '2019-06-13', '2019-06-13 09:00:00', '2019-06-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '118', '2019-06-14', '2019-06-14 09:00:00', '2019-06-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '119', '2019-06-17', '2019-06-17 09:00:00', '2019-06-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '120', '2019-06-18', '2019-06-18 09:00:00', '2019-06-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '121', '2019-06-19', '2019-06-19 09:00:00', '2019-06-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '122', '2019-06-20', '2019-06-20 09:00:00', '2019-06-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '123', '2019-06-21', '2019-06-21 09:00:00', '2019-06-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '124', '2019-06-24', '2019-06-24 09:00:00', '2019-06-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '125', '2019-06-25', '2019-06-25 09:00:00', '2019-06-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '126', '2019-06-26', '2019-06-26 09:00:00', '2019-06-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '127', '2019-06-27', '2019-06-27 09:00:00', '2019-06-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '128', '2019-06-28', '2019-06-28 09:00:00', '2019-06-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '129', '2019-07-01', '2019-07-01 09:00:00', '2019-07-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '130', '2019-07-02', '2019-07-02 09:00:00', '2019-07-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '131', '2019-07-03', '2019-07-03 09:00:00', '2019-07-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '132', '2019-07-04', '2019-07-04 09:00:00', '2019-07-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '133', '2019-07-05', '2019-07-05 09:00:00', '2019-07-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '134', '2019-07-08', '2019-07-08 09:00:00', '2019-07-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '135', '2019-07-09', '2019-07-09 09:00:00', '2019-07-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '136', '2019-07-10', '2019-07-10 09:00:00', '2019-07-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '137', '2019-07-11', '2019-07-11 09:00:00', '2019-07-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '138', '2019-07-12', '2019-07-12 09:00:00', '2019-07-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '139', '2019-07-15', '2019-07-15 09:00:00', '2019-07-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '140', '2019-07-16', '2019-07-16 09:00:00', '2019-07-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '141', '2019-07-17', '2019-07-17 09:00:00', '2019-07-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '142', '2019-07-18', '2019-07-18 09:00:00', '2019-07-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '143', '2019-07-19', '2019-07-19 09:00:00', '2019-07-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '144', '2019-07-22', '2019-07-22 09:00:00', '2019-07-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '145', '2019-07-23', '2019-07-23 09:00:00', '2019-07-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '146', '2019-07-24', '2019-07-24 09:00:00', '2019-07-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '147', '2019-07-25', '2019-07-25 09:00:00', '2019-07-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '148', '2019-07-26', '2019-07-26 09:00:00', '2019-07-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '149', '2019-07-29', '2019-07-29 09:00:00', '2019-07-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '150', '2019-07-30', '2019-07-30 09:00:00', '2019-07-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '151', '2019-07-31', '2019-07-31 09:00:00', '2019-07-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '152', '2019-08-01', '2019-08-01 09:00:00', '2019-08-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '153', '2019-08-02', '2019-08-02 09:00:00', '2019-08-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '154', '2019-08-05', '2019-08-05 09:00:00', '2019-08-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '155', '2019-08-06', '2019-08-06 09:00:00', '2019-08-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '156', '2019-08-07', '2019-08-07 09:00:00', '2019-08-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '157', '2019-08-08', '2019-08-08 09:00:00', '2019-08-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '158', '2019-08-09', '2019-08-09 09:00:00', '2019-08-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '159', '2019-08-12', '2019-08-12 09:00:00', '2019-08-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '160', '2019-08-13', '2019-08-13 09:00:00', '2019-08-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '161', '2019-08-14', '2019-08-14 09:00:00', '2019-08-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '162', '2019-08-15', '2019-08-15 09:00:00', '2019-08-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '163', '2019-08-16', '2019-08-16 09:00:00', '2019-08-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '164', '2019-08-19', '2019-08-19 09:00:00', '2019-08-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '165', '2019-08-20', '2019-08-20 09:00:00', '2019-08-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '166', '2019-08-21', '2019-08-21 09:00:00', '2019-08-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '167', '2019-08-22', '2019-08-22 09:00:00', '2019-08-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '168', '2019-08-23', '2019-08-23 09:00:00', '2019-08-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '169', '2019-08-26', '2019-08-26 09:00:00', '2019-08-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '170', '2019-08-27', '2019-08-27 09:00:00', '2019-08-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '171', '2019-08-28', '2019-08-28 09:00:00', '2019-08-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '172', '2019-08-29', '2019-08-29 09:00:00', '2019-08-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '173', '2019-08-30', '2019-08-30 09:00:00', '2019-08-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '174', '2019-09-02', '2019-09-02 09:00:00', '2019-09-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '175', '2019-09-03', '2019-09-03 09:00:00', '2019-09-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '176', '2019-09-04', '2019-09-04 09:00:00', '2019-09-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '177', '2019-09-05', '2019-09-05 09:00:00', '2019-09-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '178', '2019-09-06', '2019-09-06 09:00:00', '2019-09-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '179', '2019-09-09', '2019-09-09 09:00:00', '2019-09-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '180', '2019-09-10', '2019-09-10 09:00:00', '2019-09-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '181', '2019-09-11', '2019-09-11 09:00:00', '2019-09-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '182', '2019-09-12', '2019-09-12 09:00:00', '2019-09-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '183', '2019-09-13', '2019-09-13 09:00:00', '2019-09-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '184', '2019-09-16', '2019-09-16 09:00:00', '2019-09-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '185', '2019-09-17', '2019-09-17 09:00:00', '2019-09-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '186', '2019-09-18', '2019-09-18 09:00:00', '2019-09-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '187', '2019-09-19', '2019-09-19 09:00:00', '2019-09-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '188', '2019-09-20', '2019-09-20 09:00:00', '2019-09-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '189', '2019-09-23', '2019-09-23 09:00:00', '2019-09-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '190', '2019-09-24', '2019-09-24 09:00:00', '2019-09-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '191', '2019-09-25', '2019-09-25 09:00:00', '2019-09-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '192', '2019-09-26', '2019-09-26 09:00:00', '2019-09-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '193', '2019-09-27', '2019-09-27 09:00:00', '2019-09-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '194', '2019-09-30', '2019-09-30 09:00:00', '2019-09-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '195', '2019-10-01', '2019-10-01 09:00:00', '2019-10-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '196', '2019-10-02', '2019-10-02 09:00:00', '2019-10-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '197', '2019-10-03', '2019-10-03 09:00:00', '2019-10-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '198', '2019-10-04', '2019-10-04 09:00:00', '2019-10-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '199', '2019-10-07', '2019-10-07 09:00:00', '2019-10-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '200', '2019-10-08', '2019-10-08 09:00:00', '2019-10-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '201', '2019-10-09', '2019-10-09 09:00:00', '2019-10-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '202', '2019-10-10', '2019-10-10 09:00:00', '2019-10-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '203', '2019-10-11', '2019-10-11 09:00:00', '2019-10-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '204', '2019-10-14', '2019-10-14 09:00:00', '2019-10-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '205', '2019-10-15', '2019-10-15 09:00:00', '2019-10-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '206', '2019-10-16', '2019-10-16 09:00:00', '2019-10-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '207', '2019-10-17', '2019-10-17 09:00:00', '2019-10-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '208', '2019-10-18', '2019-10-18 09:00:00', '2019-10-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '209', '2019-10-21', '2019-10-21 09:00:00', '2019-10-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '210', '2019-10-22', '2019-10-22 09:00:00', '2019-10-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '211', '2019-10-23', '2019-10-23 09:00:00', '2019-10-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '212', '2019-10-24', '2019-10-24 09:00:00', '2019-10-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '213', '2019-10-25', '2019-10-25 09:00:00', '2019-10-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '214', '2019-10-28', '2019-10-28 09:00:00', '2019-10-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '215', '2019-10-29', '2019-10-29 09:00:00', '2019-10-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '216', '2019-10-30', '2019-10-30 09:00:00', '2019-10-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '217', '2019-10-31', '2019-10-31 09:00:00', '2019-10-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '218', '2019-11-01', '2019-11-01 09:00:00', '2019-11-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '219', '2019-11-04', '2019-11-04 09:00:00', '2019-11-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '220', '2019-11-05', '2019-11-05 09:00:00', '2019-11-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '221', '2019-11-06', '2019-11-06 09:00:00', '2019-11-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '222', '2019-11-07', '2019-11-07 09:00:00', '2019-11-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '223', '2019-11-08', '2019-11-08 09:00:00', '2019-11-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '224', '2019-11-11', '2019-11-11 09:00:00', '2019-11-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '225', '2019-11-12', '2019-11-12 09:00:00', '2019-11-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '226', '2019-11-13', '2019-11-13 09:00:00', '2019-11-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '227', '2019-11-14', '2019-11-14 09:00:00', '2019-11-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '228', '2019-11-15', '2019-11-15 09:00:00', '2019-11-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '229', '2019-11-18', '2019-11-18 09:00:00', '2019-11-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '230', '2019-11-19', '2019-11-19 09:00:00', '2019-11-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '231', '2019-11-20', '2019-11-20 09:00:00', '2019-11-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '232', '2019-11-21', '2019-11-21 09:00:00', '2019-11-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '233', '2019-11-22', '2019-11-22 09:00:00', '2019-11-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '234', '2019-11-25', '2019-11-25 09:00:00', '2019-11-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '235', '2019-11-26', '2019-11-26 09:00:00', '2019-11-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '236', '2019-11-27', '2019-11-27 09:00:00', '2019-11-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '237', '2019-11-28', '2019-11-28 09:00:00', '2019-11-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '238', '2019-11-29', '2019-11-29 09:00:00', '2019-11-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '239', '2019-12-02', '2019-12-02 09:00:00', '2019-12-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '240', '2019-12-03', '2019-12-03 09:00:00', '2019-12-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '241', '2019-12-04', '2019-12-04 09:00:00', '2019-12-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '242', '2019-12-05', '2019-12-05 09:00:00', '2019-12-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '243', '2019-12-06', '2019-12-06 09:00:00', '2019-12-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '244', '2019-12-09', '2019-12-09 09:00:00', '2019-12-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '245', '2019-12-10', '2019-12-10 09:00:00', '2019-12-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '246', '2019-12-11', '2019-12-11 09:00:00', '2019-12-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '247', '2019-12-12', '2019-12-12 09:00:00', '2019-12-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '248', '2019-12-13', '2019-12-13 09:00:00', '2019-12-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '249', '2019-12-16', '2019-12-16 09:00:00', '2019-12-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '250', '2019-12-17', '2019-12-17 09:00:00', '2019-12-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '251', '2019-12-18', '2019-12-18 09:00:00', '2019-12-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '252', '2019-12-19', '2019-12-19 09:00:00', '2019-12-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '253', '2019-12-20', '2019-12-20 09:00:00', '2019-12-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '254', '2019-12-23', '2019-12-23 09:00:00', '2019-12-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '255', '2019-12-24', '2019-12-24 09:00:00', '2019-12-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '256', '2019-12-25', '2019-12-25 09:00:00', '2019-12-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '257', '2019-12-26', '2019-12-26 09:00:00', '2019-12-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '258', '2019-12-27', '2019-12-27 09:00:00', '2019-12-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '259', '2019-12-30', '2019-12-30 09:00:00', '2019-12-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2019', '260', '2019-12-31', '2019-12-31 09:00:00', '2019-12-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '1', '2025-01-02', '2025-01-02 09:00:00', '2025-01-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '2', '2025-01-06', '2025-01-06 09:00:00', '2025-01-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '3', '2025-01-07', '2025-01-07 09:00:00', '2025-01-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '4', '2025-01-08', '2025-01-08 09:00:00', '2025-01-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '5', '2025-01-09', '2025-01-09 09:00:00', '2025-01-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '6', '2025-01-13', '2025-01-13 09:00:00', '2025-01-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '7', '2025-01-14', '2025-01-14 09:00:00', '2025-01-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '8', '2025-01-15', '2025-01-15 09:00:00', '2025-01-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '9', '2025-01-16', '2025-01-16 09:00:00', '2025-01-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '10', '2025-01-17', '2025-01-17 09:00:00', '2025-01-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '11', '2025-01-20', '2025-01-20 09:00:00', '2025-01-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '12', '2025-01-21', '2025-01-21 09:00:00', '2025-01-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '13', '2025-01-22', '2025-01-22 09:00:00', '2025-01-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '14', '2025-01-23', '2025-01-23 09:00:00', '2025-01-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '15', '2025-01-24', '2025-01-24 09:00:00', '2025-01-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '16', '2025-01-27', '2025-01-27 09:00:00', '2025-01-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '17', '2025-01-28', '2025-01-28 09:00:00', '2025-01-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '18', '2025-01-29', '2025-01-29 09:00:00', '2025-01-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '19', '2025-01-30', '2025-01-30 09:00:00', '2025-01-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '20', '2025-01-31', '2025-01-31 09:00:00', '2025-01-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '21', '2025-02-03', '2025-02-03 09:00:00', '2025-02-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '22', '2025-02-04', '2025-02-04 09:00:00', '2025-02-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '23', '2025-02-05', '2025-02-05 09:00:00', '2025-02-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '24', '2025-02-06', '2025-02-06 09:00:00', '2025-02-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '25', '2025-02-07', '2025-02-07 09:00:00', '2025-02-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '26', '2025-02-10', '2025-02-10 09:00:00', '2025-02-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '27', '2025-02-11', '2025-02-11 09:00:00', '2025-02-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '28', '2025-02-12', '2025-02-12 09:00:00', '2025-02-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '29', '2025-02-13', '2025-02-13 09:00:00', '2025-02-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '30', '2025-02-14', '2025-02-14 09:00:00', '2025-02-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '31', '2025-02-17', '2025-02-17 09:00:00', '2025-02-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '32', '2025-02-18', '2025-02-18 09:00:00', '2025-02-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '33', '2025-02-19', '2025-02-19 09:00:00', '2025-02-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '34', '2025-02-20', '2025-02-20 09:00:00', '2025-02-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '35', '2025-02-21', '2025-02-21 09:00:00', '2025-02-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '36', '2025-02-24', '2025-02-24 09:00:00', '2025-02-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '37', '2025-02-25', '2025-02-25 09:00:00', '2025-02-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '38', '2025-02-26', '2025-02-26 09:00:00', '2025-02-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '39', '2025-02-27', '2025-02-27 09:00:00', '2025-02-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '40', '2025-02-28', '2025-02-28 09:00:00', '2025-02-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '41', '2025-03-03', '2025-03-03 09:00:00', '2025-03-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '42', '2025-03-04', '2025-03-04 09:00:00', '2025-03-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '43', '2025-03-05', '2025-03-05 09:00:00', '2025-03-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '44', '2025-03-06', '2025-03-06 09:00:00', '2025-03-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '45', '2025-03-07', '2025-03-07 09:00:00', '2025-03-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '46', '2025-03-10', '2025-03-10 09:00:00', '2025-03-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '47', '2025-03-11', '2025-03-11 09:00:00', '2025-03-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '48', '2025-03-12', '2025-03-12 09:00:00', '2025-03-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '49', '2025-03-13', '2025-03-13 09:00:00', '2025-03-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '50', '2025-03-14', '2025-03-14 09:00:00', '2025-03-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '51', '2025-03-17', '2025-03-17 09:00:00', '2025-03-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '52', '2025-03-18', '2025-03-18 09:00:00', '2025-03-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '53', '2025-03-19', '2025-03-19 09:00:00', '2025-03-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '54', '2025-03-20', '2025-03-20 09:00:00', '2025-03-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '55', '2025-03-21', '2025-03-21 09:00:00', '2025-03-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '56', '2025-03-24', '2025-03-24 09:00:00', '2025-03-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '57', '2025-03-25', '2025-03-25 09:00:00', '2025-03-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '58', '2025-03-26', '2025-03-26 09:00:00', '2025-03-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '59', '2025-03-27', '2025-03-27 09:00:00', '2025-03-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '60', '2025-03-28', '2025-03-28 09:00:00', '2025-03-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '61', '2025-03-31', '2025-03-31 09:00:00', '2025-03-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '62', '2025-04-01', '2025-04-01 09:00:00', '2025-04-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '63', '2025-04-02', '2025-04-02 09:00:00', '2025-04-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '64', '2025-04-03', '2025-04-03 09:00:00', '2025-04-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '65', '2025-04-04', '2025-04-04 09:00:00', '2025-04-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '66', '2025-04-07', '2025-04-07 09:00:00', '2025-04-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '67', '2025-04-08', '2025-04-08 09:00:00', '2025-04-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '68', '2025-04-09', '2025-04-09 09:00:00', '2025-04-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '69', '2025-04-10', '2025-04-10 09:00:00', '2025-04-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '70', '2025-04-11', '2025-04-11 09:00:00', '2025-04-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '71', '2025-04-14', '2025-04-14 09:00:00', '2025-04-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '72', '2025-04-15', '2025-04-15 09:00:00', '2025-04-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '73', '2025-04-16', '2025-04-16 09:00:00', '2025-04-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '74', '2025-04-17', '2025-04-17 09:00:00', '2025-04-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '75', '2025-04-18', '2025-04-18 09:00:00', '2025-04-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '76', '2025-04-21', '2025-04-21 09:00:00', '2025-04-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '77', '2025-04-22', '2025-04-22 09:00:00', '2025-04-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '78', '2025-04-23', '2025-04-23 09:00:00', '2025-04-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '79', '2025-04-24', '2025-04-24 09:00:00', '2025-04-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '80', '2025-04-25', '2025-04-25 09:00:00', '2025-04-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '81', '2025-04-28', '2025-04-28 09:00:00', '2025-04-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '82', '2025-04-29', '2025-04-29 09:00:00', '2025-04-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '83', '2025-04-30', '2025-04-30 09:00:00', '2025-04-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '84', '2025-05-01', '2025-05-01 09:00:00', '2025-05-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '85', '2025-05-02', '2025-05-02 09:00:00', '2025-05-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '86', '2025-05-05', '2025-05-05 09:00:00', '2025-05-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '87', '2025-05-06', '2025-05-06 09:00:00', '2025-05-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '88', '2025-05-07', '2025-05-07 09:00:00', '2025-05-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '89', '2025-05-08', '2025-05-08 09:00:00', '2025-05-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '90', '2025-05-09', '2025-05-09 09:00:00', '2025-05-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '91', '2025-05-12', '2025-05-12 09:00:00', '2025-05-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '92', '2025-05-13', '2025-05-13 09:00:00', '2025-05-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '93', '2025-05-14', '2025-05-14 09:00:00', '2025-05-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '94', '2025-05-15', '2025-05-15 09:00:00', '2025-05-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '95', '2025-05-16', '2025-05-16 09:00:00', '2025-05-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '96', '2025-05-19', '2025-05-19 09:00:00', '2025-05-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '97', '2025-05-20', '2025-05-20 09:00:00', '2025-05-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '98', '2025-05-21', '2025-05-21 09:00:00', '2025-05-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '99', '2025-05-22', '2025-05-22 09:00:00', '2025-05-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '100', '2025-05-23', '2025-05-23 09:00:00', '2025-05-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '101', '2025-05-26', '2025-05-26 09:00:00', '2025-05-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '102', '2025-05-27', '2025-05-27 09:00:00', '2025-05-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '103', '2025-05-28', '2025-05-28 09:00:00', '2025-05-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '104', '2025-05-29', '2025-05-29 09:00:00', '2025-05-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '105', '2025-05-30', '2025-05-30 09:00:00', '2025-05-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '106', '2025-06-02', '2025-06-02 09:00:00', '2025-06-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '107', '2025-06-03', '2025-06-03 09:00:00', '2025-06-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '108', '2025-06-04', '2025-06-04 09:00:00', '2025-06-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '109', '2025-06-05', '2025-06-05 09:00:00', '2025-06-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '110', '2025-06-06', '2025-06-06 09:00:00', '2025-06-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '111', '2025-06-09', '2025-06-09 09:00:00', '2025-06-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '112', '2025-06-10', '2025-06-10 09:00:00', '2025-06-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '113', '2025-06-11', '2025-06-11 09:00:00', '2025-06-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '114', '2025-06-12', '2025-06-12 09:00:00', '2025-06-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '115', '2025-06-13', '2025-06-13 09:00:00', '2025-06-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '116', '2025-06-16', '2025-06-16 09:00:00', '2025-06-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '117', '2025-06-17', '2025-06-17 09:00:00', '2025-06-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '118', '2025-06-18', '2025-06-18 09:00:00', '2025-06-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '119', '2025-06-19', '2025-06-19 09:00:00', '2025-06-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '120', '2025-06-20', '2025-06-20 09:00:00', '2025-06-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '121', '2025-06-23', '2025-06-23 09:00:00', '2025-06-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '122', '2025-06-24', '2025-06-24 09:00:00', '2025-06-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '123', '2025-06-25', '2025-06-25 09:00:00', '2025-06-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '124', '2025-06-26', '2025-06-26 09:00:00', '2025-06-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '125', '2025-06-27', '2025-06-27 09:00:00', '2025-06-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '126', '2025-06-30', '2025-06-30 09:00:00', '2025-06-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '127', '2025-07-01', '2025-07-01 09:00:00', '2025-07-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '128', '2025-07-02', '2025-07-02 09:00:00', '2025-07-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '129', '2025-07-03', '2025-07-03 09:00:00', '2025-07-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '130', '2025-07-04', '2025-07-04 09:00:00', '2025-07-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '131', '2025-07-07', '2025-07-07 09:00:00', '2025-07-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '132', '2025-07-08', '2025-07-08 09:00:00', '2025-07-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '133', '2025-07-09', '2025-07-09 09:00:00', '2025-07-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '134', '2025-07-10', '2025-07-10 09:00:00', '2025-07-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '135', '2025-07-11', '2025-07-11 09:00:00', '2025-07-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '136', '2025-07-14', '2025-07-14 09:00:00', '2025-07-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '137', '2025-07-15', '2025-07-15 09:00:00', '2025-07-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '138', '2025-07-16', '2025-07-16 09:00:00', '2025-07-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '139', '2025-07-17', '2025-07-17 09:00:00', '2025-07-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '140', '2025-07-18', '2025-07-18 09:00:00', '2025-07-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '141', '2025-07-21', '2025-07-21 09:00:00', '2025-07-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '142', '2025-07-22', '2025-07-22 09:00:00', '2025-07-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '143', '2025-07-23', '2025-07-23 09:00:00', '2025-07-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '144', '2025-07-24', '2025-07-24 09:00:00', '2025-07-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '145', '2025-07-25', '2025-07-25 09:00:00', '2025-07-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '146', '2025-07-28', '2025-07-28 09:00:00', '2025-07-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '147', '2025-07-29', '2025-07-29 09:00:00', '2025-07-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '148', '2025-07-30', '2025-07-30 09:00:00', '2025-07-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '149', '2025-07-31', '2025-07-31 09:00:00', '2025-07-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '150', '2025-08-01', '2025-08-01 09:00:00', '2025-08-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '151', '2025-08-04', '2025-08-04 09:00:00', '2025-08-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '152', '2025-08-05', '2025-08-05 09:00:00', '2025-08-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '153', '2025-08-06', '2025-08-06 09:00:00', '2025-08-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '154', '2025-08-07', '2025-08-07 09:00:00', '2025-08-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '155', '2025-08-08', '2025-08-08 09:00:00', '2025-08-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '156', '2025-08-11', '2025-08-11 09:00:00', '2025-08-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '157', '2025-08-12', '2025-08-12 09:00:00', '2025-08-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '158', '2025-08-13', '2025-08-13 09:00:00', '2025-08-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '159', '2025-08-14', '2025-08-14 09:00:00', '2025-08-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '160', '2025-08-15', '2025-08-15 09:00:00', '2025-08-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '161', '2025-08-18', '2025-08-18 09:00:00', '2025-08-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '162', '2025-08-19', '2025-08-19 09:00:00', '2025-08-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '163', '2025-08-20', '2025-08-20 09:00:00', '2025-08-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '164', '2025-08-21', '2025-08-21 09:00:00', '2025-08-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '165', '2025-08-22', '2025-08-22 09:00:00', '2025-08-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '166', '2025-08-25', '2025-08-25 09:00:00', '2025-08-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '167', '2025-08-26', '2025-08-26 09:00:00', '2025-08-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '168', '2025-08-27', '2025-08-27 09:00:00', '2025-08-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '169', '2025-08-28', '2025-08-28 09:00:00', '2025-08-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '170', '2025-08-29', '2025-08-29 09:00:00', '2025-08-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '171', '2025-09-01', '2025-09-01 09:00:00', '2025-09-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '172', '2025-09-02', '2025-09-02 09:00:00', '2025-09-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '173', '2025-09-03', '2025-09-03 09:00:00', '2025-09-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '174', '2025-09-04', '2025-09-04 09:00:00', '2025-09-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '175', '2025-09-05', '2025-09-05 09:00:00', '2025-09-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '176', '2025-09-08', '2025-09-08 09:00:00', '2025-09-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '177', '2025-09-09', '2025-09-09 09:00:00', '2025-09-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '178', '2025-09-10', '2025-09-10 09:00:00', '2025-09-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '179', '2025-09-11', '2025-09-11 09:00:00', '2025-09-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '180', '2025-09-12', '2025-09-12 09:00:00', '2025-09-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '181', '2025-09-15', '2025-09-15 09:00:00', '2025-09-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '182', '2025-09-16', '2025-09-16 09:00:00', '2025-09-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '183', '2025-09-17', '2025-09-17 09:00:00', '2025-09-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '184', '2025-09-18', '2025-09-18 09:00:00', '2025-09-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '185', '2025-09-19', '2025-09-19 09:00:00', '2025-09-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '186', '2025-09-22', '2025-09-22 09:00:00', '2025-09-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '187', '2025-09-23', '2025-09-23 09:00:00', '2025-09-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '188', '2025-09-24', '2025-09-24 09:00:00', '2025-09-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '189', '2025-09-25', '2025-09-25 09:00:00', '2025-09-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '190', '2025-09-26', '2025-09-26 09:00:00', '2025-09-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '191', '2025-09-29', '2025-09-29 09:00:00', '2025-09-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '192', '2025-09-30', '2025-09-30 09:00:00', '2025-09-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '193', '2025-10-01', '2025-10-01 09:00:00', '2025-10-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '194', '2025-10-02', '2025-10-02 09:00:00', '2025-10-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '195', '2025-10-03', '2025-10-03 09:00:00', '2025-10-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '196', '2025-10-06', '2025-10-06 09:00:00', '2025-10-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '197', '2025-10-07', '2025-10-07 09:00:00', '2025-10-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '198', '2025-10-08', '2025-10-08 09:00:00', '2025-10-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '199', '2025-10-09', '2025-10-09 09:00:00', '2025-10-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '200', '2025-10-10', '2025-10-10 09:00:00', '2025-10-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '201', '2025-10-13', '2025-10-13 09:00:00', '2025-10-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '202', '2025-10-14', '2025-10-14 09:00:00', '2025-10-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '203', '2025-10-15', '2025-10-15 09:00:00', '2025-10-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '204', '2025-10-16', '2025-10-16 09:00:00', '2025-10-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '205', '2025-10-17', '2025-10-17 09:00:00', '2025-10-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '206', '2025-10-20', '2025-10-20 09:00:00', '2025-10-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '207', '2025-10-21', '2025-10-21 09:00:00', '2025-10-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '208', '2025-10-22', '2025-10-22 09:00:00', '2025-10-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '209', '2025-10-23', '2025-10-23 09:00:00', '2025-10-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '210', '2025-10-24', '2025-10-24 09:00:00', '2025-10-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '211', '2025-10-27', '2025-10-27 09:00:00', '2025-10-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '212', '2025-10-28', '2025-10-28 09:00:00', '2025-10-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '213', '2025-10-29', '2025-10-29 09:00:00', '2025-10-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '214', '2025-10-30', '2025-10-30 09:00:00', '2025-10-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '215', '2025-10-31', '2025-10-31 09:00:00', '2025-10-31 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '216', '2025-11-03', '2025-11-03 09:00:00', '2025-11-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '217', '2025-11-04', '2025-11-04 09:00:00', '2025-11-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '218', '2025-11-05', '2025-11-05 09:00:00', '2025-11-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '219', '2025-11-06', '2025-11-06 09:00:00', '2025-11-06 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '220', '2025-11-07', '2025-11-07 09:00:00', '2025-11-07 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '221', '2025-11-10', '2025-11-10 09:00:00', '2025-11-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '222', '2025-11-11', '2025-11-11 09:00:00', '2025-11-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '223', '2025-11-12', '2025-11-12 09:00:00', '2025-11-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '224', '2025-11-13', '2025-11-13 09:00:00', '2025-11-13 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '225', '2025-11-14', '2025-11-14 09:00:00', '2025-11-14 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '226', '2025-11-17', '2025-11-17 09:00:00', '2025-11-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '227', '2025-11-18', '2025-11-18 09:00:00', '2025-11-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '228', '2025-11-19', '2025-11-19 09:00:00', '2025-11-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '229', '2025-11-20', '2025-11-20 09:00:00', '2025-11-20 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '230', '2025-11-21', '2025-11-21 09:00:00', '2025-11-21 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '231', '2025-11-24', '2025-11-24 09:00:00', '2025-11-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '232', '2025-11-25', '2025-11-25 09:00:00', '2025-11-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '233', '2025-11-26', '2025-11-26 09:00:00', '2025-11-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '234', '2025-11-27', '2025-11-27 09:00:00', '2025-11-27 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '235', '2025-11-28', '2025-11-28 09:00:00', '2025-11-28 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '236', '2025-12-01', '2025-12-01 09:00:00', '2025-12-01 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '237', '2025-12-02', '2025-12-02 09:00:00', '2025-12-02 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '238', '2025-12-03', '2025-12-03 09:00:00', '2025-12-03 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '239', '2025-12-04', '2025-12-04 09:00:00', '2025-12-04 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '240', '2025-12-05', '2025-12-05 09:00:00', '2025-12-05 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '241', '2025-12-08', '2025-12-08 09:00:00', '2025-12-08 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '242', '2025-12-09', '2025-12-09 09:00:00', '2025-12-09 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '243', '2025-12-10', '2025-12-10 09:00:00', '2025-12-10 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '244', '2025-12-11', '2025-12-11 09:00:00', '2025-12-11 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '245', '2025-12-12', '2025-12-12 09:00:00', '2025-12-12 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '246', '2025-12-15', '2025-12-15 09:00:00', '2025-12-15 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '247', '2025-12-16', '2025-12-16 09:00:00', '2025-12-16 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '248', '2025-12-17', '2025-12-17 09:00:00', '2025-12-17 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '249', '2025-12-18', '2025-12-18 09:00:00', '2025-12-18 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '250', '2025-12-19', '2025-12-19 09:00:00', '2025-12-19 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '251', '2025-12-22', '2025-12-22 09:00:00', '2025-12-22 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '252', '2025-12-23', '2025-12-23 09:00:00', '2025-12-23 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '253', '2025-12-24', '2025-12-24 09:00:00', '2025-12-24 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '254', '2025-12-25', '2025-12-25 09:00:00', '2025-12-25 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '255', '2025-12-26', '2025-12-26 09:00:00', '2025-12-26 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '256', '2025-12-29', '2025-12-29 09:00:00', '2025-12-29 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '257', '2025-12-30', '2025-12-30 09:00:00', '2025-12-30 16:30:00');
INSERT INTO `has_workday` VALUES ('2025', '258', '2025-12-31', '2025-12-31 09:00:00', '2025-12-31 16:30:00');

-- ----------------------------
-- Table structure for laws
-- ----------------------------
DROP TABLE IF EXISTS `laws`;
CREATE TABLE `laws` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `law_name` varchar(255) NOT NULL COMMENT '法律法规名称',
  `law_content` varchar(255) DEFAULT NULL COMMENT '法规内容',
  `is_public` char(1) DEFAULT NULL COMMENT '是否发布到外网',
  `order` int(11) DEFAULT NULL COMMENT '外网显示顺序',
  `type` char(1) DEFAULT NULL COMMENT '范围 银行可见、企业用户可见',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of laws
-- ----------------------------
INSERT INTO `laws` VALUES ('1', '法律法规1', '法律法规内容页1 此记录为对外发布、置顶、仅企业用户看到', '1', '1', '1', null, '2017-01-01 00:00:00', null, '2017-01-01 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('2', '法律法规2', '法律法规内容页2 此记录为对外发布、不置顶、仅企业用户看到', '1', '0', '0', null, '2017-01-02 00:00:00', null, '2017-01-02 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('3', '法律法规3', '法律法规内容页3 此记录为对外发布、置顶、仅企业用户看到', '1', '2', '0', null, '2017-01-03 00:00:00', null, '2017-01-03 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('4', '法律法规4', '法律法规内容页4 此记录为对外发布、不置顶、仅企业用户看到', '1', '0', '0', null, '2017-01-04 00:00:00', null, '2017-01-04 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('5', '法律法规5', '法律法规内容页5 此记录为对外发布、置顶、仅企业用户看到', '1', '3', '0', null, '2017-01-05 00:00:00', null, '2017-01-05 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('6', '法律法规6', '法律法规内容页6 此记录为对外发布、不置顶、仅企业用户看到', '1', '0', '0', null, '2017-01-06 00:00:00', null, '2017-01-06 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('7', '法律法规7', '法律法规内容页7 此记录为对外发布、置顶、仅企业用户看到', '1', '4', '0', null, '2017-01-07 00:00:00', null, '2017-01-07 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('8', '法律法规8', '法律法规内容页8 此记录为对外发布、不置顶、仅企业用户看到', '1', '0', '0', null, '2017-01-08 00:00:00', null, '2017-01-08 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('9', '法律法规9', '法律法规内容页9 此记录为对外发布、置顶、仅企业用户看到', '1', '5', '0', null, '2017-01-09 00:00:00', null, '2017-01-09 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('10', '法律法规10', '法律法规内容页10 此记录为对外发布、不置顶、仅企业用户看到', '0', '0', '0', null, '2017-01-10 00:00:00', null, '2017-01-10 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('11', '法律法规11', '法律法规内容页11 此记录为对外发布、置顶、仅银行用户看到', '1', '1', '1', null, '2017-01-11 00:00:00', null, '2017-01-11 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('12', '法律法规12', '法律法规内容页12 此记录为对外发布、不置顶、仅银行用户看到', '1', '0', '1', null, '2017-01-12 00:00:00', null, '2017-01-12 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('13', '法律法规13', '法律法规内容页13 此记录为对外发布、置顶、仅银行用户看到', '1', '2', '1', null, '2017-01-13 00:00:00', null, '2017-01-13 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('14', '法律法规14', '法律法规内容页14 此记录为对外发布、不置顶、仅银行用户看到', '1', '0', '1', null, '2017-01-14 00:00:00', null, '2017-01-14 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('15', '法律法规15', '法律法规内容页15 此记录为对外发布、置顶、仅银行用户看到', '1', '3', '1', null, '2017-01-15 00:00:00', null, '2017-01-15 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('16', '法律法规16', '法律法规内容页16 此记录为对外发布、不置顶、仅银行用户看到', '1', '0', '1', null, '2017-01-16 00:00:00', null, '2017-01-16 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('17', '法律法规17', '法律法规内容页17 此记录为对外发布、置顶、仅银行用户看到', '1', '4', '1', null, '2017-01-17 00:00:00', null, '2017-01-17 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('18', '法律法规18', '法律法规内容页18 此记录为对外发布、不置顶、仅银行用户看到', '1', '0', '1', null, '2017-01-18 00:00:00', null, '2017-01-18 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('19', '法律法规19', '法律法规内容页19 此记录为对外发布、置顶、仅银行用户看到', '1', '5', '1', null, '2017-01-19 00:00:00', null, '2017-01-19 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('20', '法律法规20', '法律法规内容页20 此记录为对外发布、不置顶、仅银行用户看到', '0', '0', '1', null, '2017-01-20 00:00:00', null, '2017-01-20 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('21', '法律法规21', '法律法规内容页21 此记录为对外发布、置顶、全用户看到', '1', '1', '2', null, '2017-01-21 00:00:00', null, '2017-01-21 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('22', '法律法规22', '法律法规内容页22 此记录为对外发布、不置顶、全用户看到', '1', '0', '2', null, '2017-01-22 00:00:00', null, '2017-01-22 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('23', '法律法规23', '法律法规内容页23 此记录为对外发布、置顶、全用户看到', '1', '2', '2', null, '2017-01-23 00:00:00', null, '2017-01-23 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('24', '法律法规24', '法律法规内容页24 此记录为对外发布、不置顶、全用户看到', '1', '0', '2', null, '2017-01-24 00:00:00', null, '2017-01-24 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('25', '法律法规25', '法律法规内容页25 此记录为对外发布、置顶、全用户看到', '1', '3', '2', null, '2017-01-25 00:00:00', null, '2017-01-25 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('26', '法律法规26', '法律法规内容页26 此记录为对外发布、不置顶、全用户看到', '1', '0', '2', null, '2017-01-26 00:00:00', null, '2017-01-26 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('27', '法律法规27', '法律法规内容页27 此记录为对外发布、置顶、全用户看到', '1', '4', '2', null, '2017-01-27 00:00:00', null, '2017-01-27 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('28', '法律法规28', '法律法规内容页28 此记录为对外发布、不置顶、全用户看到', '1', '0', '2', null, '2017-01-28 00:00:00', null, '2017-01-28 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('29', '法律法规29', '法律法规内容页29 此记录为对外发布、置顶、全用户看到', '1', '5', '2', null, '2017-01-29 00:00:00', null, '2017-01-29 00:00:00', null, '1');
INSERT INTO `laws` VALUES ('30', '法律法规30', '法律法规内容页30 此记录为对外发布、不置顶、全用户看到', '0', '0', '2', null, '2017-01-30 00:00:00', null, '2017-01-30 00:00:00', null, '1');

-- ----------------------------
-- Table structure for law_attachment
-- ----------------------------
DROP TABLE IF EXISTS `law_attachment`;
CREATE TABLE `law_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `law_id` int(11) NOT NULL COMMENT '处理单ID',
  `doc_name` varchar(255) NOT NULL COMMENT '文件名称',
  `doc_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `law_id` (`law_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of law_attachment
-- ----------------------------
INSERT INTO `law_attachment` VALUES ('1', '1', '法律法规1的附件', '1');
INSERT INTO `law_attachment` VALUES ('2', '2', '法律法规2的附件', '2');
INSERT INTO `law_attachment` VALUES ('3', '3', '法律法规3的附件', '3');
INSERT INTO `law_attachment` VALUES ('4', '4', '法律法规4的附件', '4');
INSERT INTO `law_attachment` VALUES ('5', '5', '法律法规5的附件', '5');
INSERT INTO `law_attachment` VALUES ('6', '6', '法律法规6的附件', '6');
INSERT INTO `law_attachment` VALUES ('7', '7', '法律法规7的附件', '7');
INSERT INTO `law_attachment` VALUES ('8', '8', '法律法规8的附件', '8');
INSERT INTO `law_attachment` VALUES ('9', '9', '法律法规9的附件', '9');
INSERT INTO `law_attachment` VALUES ('10', '10', '法律法规10的附件', '10');
INSERT INTO `law_attachment` VALUES ('11', '11', '法律法规11的附件', '11');
INSERT INTO `law_attachment` VALUES ('12', '12', '法律法规12的附件', '12');
INSERT INTO `law_attachment` VALUES ('13', '13', '法律法规13的附件', '13');
INSERT INTO `law_attachment` VALUES ('14', '14', '法律法规14的附件', '14');
INSERT INTO `law_attachment` VALUES ('15', '15', '法律法规15的附件', '15');
INSERT INTO `law_attachment` VALUES ('16', '16', '法律法规16的附件', '16');
INSERT INTO `law_attachment` VALUES ('17', '17', '法律法规17的附件', '17');
INSERT INTO `law_attachment` VALUES ('18', '18', '法律法规18的附件', '18');
INSERT INTO `law_attachment` VALUES ('19', '19', '法律法规19的附件', '19');
INSERT INTO `law_attachment` VALUES ('20', '20', '法律法规20的附件', '20');
INSERT INTO `law_attachment` VALUES ('21', '21', '法律法规21的附件', '21');
INSERT INTO `law_attachment` VALUES ('22', '22', '法律法规22的附件', '22');
INSERT INTO `law_attachment` VALUES ('23', '23', '法律法规23的附件', '23');
INSERT INTO `law_attachment` VALUES ('24', '24', '法律法规24的附件', '24');
INSERT INTO `law_attachment` VALUES ('25', '25', '法律法规25的附件', '25');
INSERT INTO `law_attachment` VALUES ('26', '26', '法律法规26的附件', '26');
INSERT INTO `law_attachment` VALUES ('27', '27', '法律法规27的附件', '27');
INSERT INTO `law_attachment` VALUES ('28', '28', '法律法规28的附件', '28');
INSERT INTO `law_attachment` VALUES ('29', '29', '法律法规29的附件', '29');
INSERT INTO `law_attachment` VALUES ('30', '30', '法律法规30的附件', '30');

-- ----------------------------
-- Table structure for process
-- ----------------------------
DROP TABLE IF EXISTS `process`;
CREATE TABLE `process` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `process_name` varchar(255) DEFAULT NULL COMMENT '流程名称',
  `process_type` char(1) DEFAULT NULL COMMENT '流程分类',
  `business_id` int(11) NOT NULL COMMENT '业务id',
  `verify_level` int(11) NOT NULL COMMENT '审核层级',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `business_id` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of process
-- ----------------------------

-- ----------------------------
-- Table structure for pro_instance
-- ----------------------------
DROP TABLE IF EXISTS `pro_instance`;
CREATE TABLE `pro_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` varchar(32) NOT NULL COMMENT '审批表id',
  `process_id` int(11) NOT NULL COMMENT '流程类别id',
  `currentstep` int(11) NOT NULL COMMENT '当前步骤',
  `currentuser` varchar(255) DEFAULT NULL COMMENT '当前操作人',
  `currentstep_time` datetime DEFAULT NULL COMMENT '进入当前步骤人时间',
  `start_time` datetime DEFAULT NULL COMMENT '流程启动时间',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_instance
-- ----------------------------
INSERT INTO `pro_instance` VALUES ('1', '1', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('2', '2', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('3', '3', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('4', '4', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('5', '5', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('6', '6', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('7', '7', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('8', '8', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('9', '9', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('10', '10', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('11', '11', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('12', '12', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('13', '13', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('14', '14', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('15', '15', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('16', '16', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('17', '17', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('18', '18', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('19', '19', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('20', '20', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('21', '21', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('22', '22', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('23', '23', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('24', '24', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('25', '25', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('26', '26', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('27', '27', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('28', '28', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('29', '29', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('30', '30', '1', '1', 'liujin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('31', '31', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('32', '32', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('33', '33', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('34', '34', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('35', '35', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('36', '36', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('37', '37', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('38', '38', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('39', '39', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('40', '40', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('41', '41', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('42', '42', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('43', '43', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('44', '44', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('45', '45', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('46', '46', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('47', '47', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('48', '48', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('49', '49', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('50', '50', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('51', '51', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('52', '52', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('53', '53', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('54', '54', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('55', '55', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('56', '56', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('57', '57', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('58', '58', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('59', '59', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('60', '60', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('61', '61', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('62', '62', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('63', '63', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('64', '64', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('65', '65', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('66', '66', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('67', '67', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('68', '68', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('69', '69', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('70', '70', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('71', '71', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('72', '72', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('73', '73', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('74', '74', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('75', '75', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('76', '76', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('77', '77', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('78', '78', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('79', '79', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('80', '80', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('81', '81', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('82', '82', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('83', '83', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('84', '84', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('85', '85', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('86', '86', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('87', '87', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('88', '88', '1', '1', 'admin', null, null, '1', '');
INSERT INTO `pro_instance` VALUES ('89', '89', '1', '1', 'admin', null, null, '1', '');

-- ----------------------------
-- Table structure for pro_step
-- ----------------------------
DROP TABLE IF EXISTS `pro_step`;
CREATE TABLE `pro_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `process_id` int(11) NOT NULL COMMENT '流程id',
  `business_id` int(11) NOT NULL COMMENT '业务id',
  `step_name` varchar(255) NOT NULL COMMENT '环节名称',
  `step_order` int(11) NOT NULL COMMENT '步骤顺序',
  `approval_role_id` int(11) NOT NULL COMMENT '审批角色',
  `approval_role_name` varchar(255) NOT NULL COMMENT '审批角色名称',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `process_id` (`process_id`),
  KEY `business_id` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_step
-- ----------------------------

-- ----------------------------
-- Table structure for report_attachment
-- ----------------------------
DROP TABLE IF EXISTS `report_attachment`;
CREATE TABLE `report_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` varchar(32) DEFAULT NULL COMMENT '处理单ID',
  `doc_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `doc_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `doc_id` varchar(32) DEFAULT NULL,
  `order` int(11) DEFAULT NULL COMMENT '顺序',
  `islegal` char(1) DEFAULT NULL COMMENT '是否法定',
  `check_type` char(1) DEFAULT NULL COMMENT '是否必填',
  `scene` int(11) DEFAULT NULL COMMENT '场景',
  `status` char(1) DEFAULT NULL COMMENT '文件状态',
  `create_time` datetime DEFAULT NULL,
  `other_flag` varchar(255) DEFAULT NULL COMMENT '其它附件标记',
  `filetype_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `label` varchar(255) NOT NULL COMMENT '标签名',
  `value` varchar(255) NOT NULL COMMENT '数据值',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `sort` varchar(20) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_role`;
CREATE TABLE `sys_dept_role` (
  `id` int(11) NOT NULL COMMENT '序号',
  `dept_id` int(11) NOT NULL COMMENT '部门id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept_role
-- ----------------------------
INSERT INTO `sys_dept_role` VALUES ('1', '3', '1', null, null, null, null, null);
INSERT INTO `sys_dept_role` VALUES ('2', '3', '2', null, null, null, null, null);
INSERT INTO `sys_dept_role` VALUES ('3', '3', '3', null, null, null, null, null);
INSERT INTO `sys_dept_role` VALUES ('4', '3', '4', null, null, null, null, null);
INSERT INTO `sys_dept_role` VALUES ('5', '3', '5', null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LABEL` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `DEL_FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '银行用户', '1', 'user', '用户类型', null, '', '');
INSERT INTO `sys_dict` VALUES ('2', '企业用户', '0', 'user', '用户类型', null, '', '');
INSERT INTO `sys_dict` VALUES ('3', '身份证', '0', 'credentials', '注册人证件类型', null, null, null);
INSERT INTO `sys_dict` VALUES ('4', '护照', '1', 'credentials', '注册人证件类型', null, '', '');
INSERT INTO `sys_dict` VALUES ('5', '港澳居民证', '2', 'credentials', '注册人证件类型', null, '', '');
INSERT INTO `sys_dict` VALUES ('7', '银行角色', '0', 'role', '角色组', null, '', '');
INSERT INTO `sys_dict` VALUES ('8', '企业角色', '1', 'role', '角色组', null, null, null);
INSERT INTO `sys_dict` VALUES ('9', '企业', '0', 'orgtype', '机构类型', null, null, null);
INSERT INTO `sys_dict` VALUES ('10', '人民银行', '1', 'orgtype', '机构类型', null, null, null);
INSERT INTO `sys_dict` VALUES ('11', '部门', '2', 'orgtype', '机构类型', null, null, null);
INSERT INTO `sys_dict` VALUES ('12', '已删除', '0', 'delflag', '删除标识', null, '', '');
INSERT INTO `sys_dict` VALUES ('13', '未删除', '1', 'delflag', '删除标识', null, '', '');
INSERT INTO `sys_dict` VALUES ('14', '菜单', '0', 'resource_type', '资源类型', null, null, null);
INSERT INTO `sys_dict` VALUES ('15', '按钮', '1', 'resource_type', '资源类型', null, null, null);
INSERT INTO `sys_dict` VALUES ('16', '必填', '1', 'check_type', '附件是否必填', null, null, null);
INSERT INTO `sys_dict` VALUES ('17', '选填', '0或其它', 'check_type', '附件是否必填', null, null, null);
INSERT INTO `sys_dict` VALUES ('18', '自取', '1', 'notice_get', '通知获取方式', null, null, null);
INSERT INTO `sys_dict` VALUES ('19', '邮寄', '0', 'notice_get', '通知获取方式', null, null, null);
INSERT INTO `sys_dict` VALUES ('20', '作废', '0', 'formattach_statu', '申请单附件状态', null, null, null);
INSERT INTO `sys_dict` VALUES ('21', '保存', '1', 'formattach_statu', '申请单附件状态', null, null, null);
INSERT INTO `sys_dict` VALUES ('22', '审核未通过', '2', 'formattach_statu', '申请单附件状态', null, null, null);
INSERT INTO `sys_dict` VALUES ('23', '审核通过', '3', 'formattach_statu', '申请单附件状态', null, null, null);
INSERT INTO `sys_dict` VALUES ('24', '申请单', 'F', 'type', '单据类型', null, null, null);
INSERT INTO `sys_dict` VALUES ('25', '审批单', 'R', 'type', '单据类型', null, null, null);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL COMMENT '编号',
  `operation_code` varchar(255) DEFAULT NULL COMMENT '操作代码',
  `opertion_name` varchar(255) DEFAULT NULL COMMENT '操作名称',
  `create_by` varchar(255) DEFAULT NULL COMMENT '操作者',
  `create_date` datetime DEFAULT NULL COMMENT '操作时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `params` varchar(255) DEFAULT NULL COMMENT '请求参数',
  `execute_time` int(11) DEFAULT NULL COMMENT '执行时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级编号',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) DEFAULT NULL COMMENT '机构等级',
  `contact` varchar(255) DEFAULT NULL COMMENT '机构联系人',
  `phone` varchar(255) DEFAULT NULL COMMENT '机构联系人电话',
  `mail` varchar(255) DEFAULT NULL COMMENT '机构联系人邮箱',
  `useable` varchar(255) DEFAULT NULL COMMENT '是否启用',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('1', null, '中国人民银行', '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_org` VALUES ('2', '1', '中国人民银行中关村支行', '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_org` VALUES ('3', '2', '业务审核部门', '2', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级编号',
  `resource_type` char(1) DEFAULT NULL COMMENT '留出字段，控制到按钮',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `href` varchar(255) DEFAULT NULL COMMENT '链接 菜单访问路径',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', null, '0', '首页', '1', 'company/index', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('2', null, '0', '业务申请', '2', 'company/apply', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('3', null, '0', '业务查询', '3', 'company/query', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('4', null, '0', '法律法规查询', '4', 'laws/lawsList', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('5', null, '0', '办事指南查询', '5', 'guides/guidesList', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('6', null, '0', '我的工作', '1', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('7', '6', '0', '待接收业务', '1', 'bank/myWork/receive', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('8', '6', '0', '待办理业务', '2', 'bank/myWork/pendingorder', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('9', '6', '0', '在办理业务', '3', 'bank/myWork/transact', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('10', '6', '0', '已办结业务', '4', 'bank/myWork/finish', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('11', null, '0', '业务查询统计', '2', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('12', '11', '0', '业务查询', '1', 'query/query', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('13', '11', '0', '台帐导出', '2', '', '仅业务网', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('14', '11', '0', '业务统计', '3', 'query/statistics', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('15', null, '0', '信息资讯查询', '3', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('16', '15', '0', '法律法规查询', '1', 'laws/lawsList', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('17', '15', '0', '办事指南查询', '2', 'guides/guidesList', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('18', null, '0', '业务管理', '6', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('19', '16', '0', '业务项管理', '1', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('20', '16', '0', '流程管理', '2', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('21', null, '0', '信息资讯管理', '7', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('22', '21', '0', '法律法规管理', '1', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('23', '21', '0', '办事指南管理', '2', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('24', null, '0', '系统管理', '8', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('25', '24', '0', '用户管理', '1', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('26', '24', '0', '角色管理', '2', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('27', '24', '0', '日志审计', '3', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('28', null, '0', '档案管理', '5', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('29', '28', '0', '待归档业务', '1', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('30', '28', '0', '待销毁档案', '2', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('31', '28', '0', '档案查询', '3', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('32', '28', '0', '档案统计', '4', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('33', null, '1', '退回', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('34', null, '1', '接收并新建流程', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('35', null, '1', '启动审批', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('36', null, '1', '撤销审批', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('37', null, '1', '审批保存', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('38', null, '1', '补正', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('39', null, '1', '受理', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('40', null, '1', '办结通过', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('41', null, '1', '办结不通过', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('42', null, '1', '办结', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('43', null, '1', '审批终止', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('44', null, '1', '内部退回', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('45', null, '1', '内部撤销', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('46', null, '1', '分派', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('47', null, '1', '转派', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('48', null, '6', '数据导出', '5', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('49', null, '0', '数据导入', '0', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('50', '49', '0', '人工录入', '1', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('51', '49', '0', '互联网导入', '2', '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('52', null, '1', '归档', null, '', '', null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('53', null, '1', '档案销毁', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource` VALUES ('54', null, '1', '提交', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) NOT NULL COMMENT '英文名称',
  `type` varchar(20) DEFAULT NULL COMMENT '角色组 区分企业用户角色、银行用户',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '企业用户', 'qyyh', '1', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('2', '前台人员', 'gt', '0', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('3', '后台人员', 'ht', '0', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('4', '科长', 'kz', '0', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('5', '副行长', 'fhz', '0', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('6', '行长', 'hz', '0', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('7', '主任', 'zr', '0', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('8', '前台管理员', 'gtadmin', '0', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('9', '档案管理员', 'daadmin', '0', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('10', '系统管理员', 'sysadmin', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL COMMENT '序号',
  `permission_id` int(11) NOT NULL COMMENT '权限id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '6', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('2', '7', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('3', '8', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('4', '9', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('5', '10', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('6', '11', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('7', '12', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('8', '13', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('9', '14', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('10', '15', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('11', '16', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('12', '17', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('13', '6', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('14', '8', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('15', '9', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('16', '10', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('17', '11', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('18', '12', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('19', '13', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('20', '14', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('21', '15', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('22', '16', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('23', '17', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('24', '6', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('25', '8', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('26', '9', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('27', '10', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('28', '11', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('29', '12', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('30', '13', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('31', '14', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('32', '15', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('33', '16', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('34', '17', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('35', '6', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('36', '8', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('37', '9', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('38', '10', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('39', '11', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('40', '12', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('41', '13', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('42', '14', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('43', '15', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('44', '16', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('45', '17', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('46', '6', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('47', '8', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('48', '9', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('49', '10', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('50', '11', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('51', '12', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('52', '13', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('53', '14', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('54', '15', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('55', '16', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('56', '17', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('57', '6', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('58', '8', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('59', '9', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('60', '10', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('61', '11', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('62', '12', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('63', '13', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('64', '14', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('65', '15', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('66', '16', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('67', '17', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('68', '6', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('69', '8', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('70', '9', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('71', '10', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('72', '11', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('73', '12', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('74', '13', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('75', '14', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('76', '15', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('77', '16', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('78', '17', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('79', '28', '9', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('80', '29', '9', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('81', '30', '9', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('82', '31', '9', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('83', '32', '9', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('84', '18', '10', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('85', '19', '10', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('86', '20', '10', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('87', '21', '10', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('88', '22', '10', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('89', '23', '10', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('90', '24', '10', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('91', '25', '10', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('92', '26', '10', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('93', '27', '10', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('94', '33', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('95', '34', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('96', '35', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('97', '36', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('98', '37', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('99', '42', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('100', '44', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('101', '45', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('102', '47', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('103', '48', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('104', '49', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('105', '50', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('106', '51', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('107', '37', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('108', '38', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('109', '39', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('110', '40', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('111', '44', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('112', '45', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('113', '47', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('114', '37', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('115', '38', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('116', '39', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('117', '40', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('118', '44', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('119', '45', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('120', '47', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('121', '37', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('122', '38', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('123', '39', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('124', '40', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('125', '44', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('126', '45', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('127', '47', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('128', '37', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('129', '38', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('130', '39', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('131', '40', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('132', '41', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('133', '44', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('134', '45', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('135', '47', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('136', '37', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('137', '38', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('138', '39', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('139', '40', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('140', '44', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('141', '45', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('142', '47', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('143', '33', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('144', '34', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('145', '35', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('146', '36', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('147', '37', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('148', '42', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('149', '43', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('150', '44', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('151', '45', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('152', '46', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('153', '47', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('154', '48', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('155', '49', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('156', '50', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('157', '51', '8', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('158', '52', '9', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('159', '53', '9', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('160', '38', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('161', '54', '2', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('162', '38', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('163', '54', '3', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('164', '38', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('165', '54', '4', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('166', '38', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('167', '54', '5', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('168', '38', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('169', '54', '6', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('170', '38', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('171', '54', '7', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('172', '1', '1', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('173', '2', '1', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('174', '3', '1', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('175', '4', '1', null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('176', '5', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_special_case
-- ----------------------------
DROP TABLE IF EXISTS `sys_special_case`;
CREATE TABLE `sys_special_case` (
  `id` varchar(32) NOT NULL COMMENT '特例ID',
  `wc_id` varchar(32) NOT NULL COMMENT '工作日历ID',
  `case_type` varchar(1) NOT NULL COMMENT '特例类型',
  `case_date` varchar(10) NOT NULL COMMENT '特例日期',
  `onduty_time` varchar(8) NOT NULL COMMENT '上班时间',
  `offduty_time` varchar(8) NOT NULL COMMENT '下班时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_special_case
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `login_name` varchar(255) NOT NULL COMMENT '登录名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '159ae5f48f14e89f3f9f54dc995f1f276d472b54', '1', null, null, null, null, null, '1', '3d06a5c14d010804');
INSERT INTO `sys_user` VALUES ('2', '600001760', '0ec02d8e3908e30a8ca1e1f371adb38600e40186', '0', null, null, null, null, null, '1', 'a4b9382099ff5993');
INSERT INTO `sys_user` VALUES ('3', 'majq', '038ff3d7aef768f6b2e5a0bc6aa44f0648409b35', '1', null, null, null, null, null, '1', '55e80d4b9f6efbbf');
INSERT INTO `sys_user` VALUES ('4', 'changly', '9f37fbd3f472b4610c243b1f17505c1609e8a15a', '1', null, null, null, null, null, '1', '3dbc721187df559e');
INSERT INTO `sys_user` VALUES ('5', 'hanyu', 'bb938bf15a90456d5bbb17dbe4d5d5411c6aa4fe', '1', null, null, null, null, null, '1', '467e0bf794cd26df');
INSERT INTO `sys_user` VALUES ('6', 'lihm', '466c1afa4b013af7acc4c7e847f6157b8cf13773', '1', null, null, null, null, null, '1', '8cf73850ad06f4bc');
INSERT INTO `sys_user` VALUES ('7', 'liujin', 'c17dafc43714a0629e8333e9c8072b05955882b3', '1', null, null, null, null, null, '1', 'c565e5ea0a0a01dc');
INSERT INTO `sys_user` VALUES ('8', 'songgy', '6c24b4a84cdaf0aee2744b527471c9e2fd6ae112', '1', null, null, null, null, null, '1', '7d4d35122d2b9dc4');
INSERT INTO `sys_user` VALUES ('9', 'maym', '00ea77475c46aa924b36b9d1702a54705c648f68', '1', null, null, null, null, null, '1', '09236c084169f4ce');
INSERT INTO `sys_user` VALUES ('10', 'chentao', '1f81b97f78ad099e223d8ba4a492925ba3617647', '1', null, null, null, null, null, '1', '27608c5e87207ca2');
INSERT INTO `sys_user` VALUES ('11', 'yangcx', '049372cea179e67a39ec7bfbc7491961717552d9', '1', null, null, null, null, null, '1', 'f6d4fd760367d461');
INSERT INTO `sys_user` VALUES ('12', 'liyx', '8f5788032d48481949b246584b68870a8a36c075', '1', null, null, null, null, null, '1', 'e554f1f8506f909c');
INSERT INTO `sys_user` VALUES ('13', 'zhanghy', 'ab43ad197f17ed6d9c9a5f64a3bb2a2342012ab7', '1', null, null, null, null, null, '1', '11d9819783eab88d');
INSERT INTO `sys_user` VALUES ('14', 'yanby', '07aa7ce610731977d491518cbe8075477e2246c9', '1', null, null, null, null, null, '1', '419ab3dfdfe5aea4');
INSERT INTO `sys_user` VALUES ('16', 'xubo', '159ae5f48f14e89f3f9f54dc995f1f276d472b54', '1', null, null, null, null, null, '1', '3d06a5c14d010804');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` int(11) NOT NULL COMMENT '人员id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '3', '2', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('2', '4', '2', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('3', '5', '2', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('4', '6', '2', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('5', '7', '3', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('6', '8', '3', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('7', '9', '3', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('8', '10', '4', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('9', '11', '4', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('10', '12', '5', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('11', '13', '6', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('12', '14', '7', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('13', '6', '8', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('14', '15', '9', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('15', '15', '10', null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('16', '2', '1', null, null, null, null, null);

-- ----------------------------
-- View structure for v_bankuser
-- ----------------------------
DROP VIEW IF EXISTS `v_bankuser`;
CREATE VIEW `v_bankuser` AS select `s`.`id` AS `id`,`b`.`user_id` AS `user_id`,`b`.`org_id` AS `org_id`,`b`.`dept_id` AS `dept_id`,`b`.`name` AS `name`,`s`.`login_name` AS `login_name` from (`bank_user` `b` join `sys_user` `s` on((`s`.`id` = `b`.`user_id`))) ;

-- ----------------------------
-- View structure for v_sys_role_peremission
-- ----------------------------
DROP VIEW IF EXISTS `v_sys_role_peremission`;
CREATE VIEW `v_sys_role_peremission` AS select `r`.`id` AS `role_id`,`r`.`name` AS `role_name`,`rs`.`id` AS `resource_id`,`rs`.`name` AS `resource_name`,`rs`.`parent_id` AS `parent_id`,`rs`.`sort` AS `resourece_sort`,`rs`.`resource_type` AS `resource_type` from ((`sys_role_permission` `rp` left join `sys_role` `r` on((`r`.`id` = `rp`.`role_id`))) left join `sys_resource` `rs` on((`rs`.`id` = `rp`.`permission_id`))) ;

-- ----------------------------
-- View structure for v_sys_user_permission_function
-- ----------------------------
DROP VIEW IF EXISTS `v_sys_user_permission_function`;
CREATE VIEW `v_sys_user_permission_function` AS select `ur`.`user_id` AS `user_id`,`ur`.`login_name` AS `login_name`,`ur`.`role_name` AS `role_name`,`rp`.`resource_name` AS `resource_name`,`rp`.`parent_id` AS `parent_id`,`rp`.`resourece_sort` AS `resourece_sort` from (`v_sys_user_role` `ur` left join `v_sys_role_peremission` `rp` on((`ur`.`role_id` = `rp`.`role_id`))) where (`rp`.`resource_type` = 1) order by `ur`.`user_id`,`rp`.`parent_id`,`rp`.`resourece_sort` ;

-- ----------------------------
-- View structure for v_sys_user_permission_menu
-- ----------------------------
DROP VIEW IF EXISTS `v_sys_user_permission_menu`;
CREATE VIEW `v_sys_user_permission_menu` AS select `ur`.`user_id` AS `user_id`,`ur`.`login_name` AS `login_name`,`ur`.`role_name` AS `role_name`,`rp`.`resource_name` AS `resource_name`,`rp`.`parent_id` AS `parent_id`,`rp`.`resourece_sort` AS `resourece_sort` from (`v_sys_user_role` `ur` left join `v_sys_role_peremission` `rp` on((`ur`.`role_id` = `rp`.`role_id`))) where (`rp`.`resource_type` = 0) order by `ur`.`user_id`,`rp`.`parent_id`,`rp`.`resourece_sort` ;

-- ----------------------------
-- View structure for v_sys_user_role
-- ----------------------------
DROP VIEW IF EXISTS `v_sys_user_role`;
CREATE VIEW `v_sys_user_role` AS select `u`.`id` AS `user_id`,`u`.`login_name` AS `login_name`,`r`.`id` AS `role_id`,`r`.`name` AS `role_name` from ((`sys_user_role` `ur` left join `sys_user` `u` on((`ur`.`user_id` = `u`.`id`))) left join `sys_role` `r` on((`ur`.`role_id` = `r`.`id`))) order by `ur`.`user_id` ;
