/*
Navicat MySQL Data Transfer

Source Server         : 1444
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : cs_sale

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2018-08-04 11:55:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_menu`;
CREATE TABLE `tb_sys_menu` (
  `ID` int(11) NOT NULL,
  `AccessUrl` varchar(120) DEFAULT NULL,
  `Enabled` bit(1) DEFAULT NULL,
  `OrderIndex` int(11) DEFAULT NULL,
  `IsDelete` bit(1) DEFAULT NULL,
  `MenuCode` varchar(32) DEFAULT NULL,
  `MenuName` varchar(120) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `ResourceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sys_menu
-- ----------------------------
INSERT INTO `tb_sys_menu` VALUES ('1', null, '', '1', '\0', '1', '打版管理', null, null);
INSERT INTO `tb_sys_menu` VALUES ('2', null, '', '4', '\0', '2', '包装管理', null, null);
INSERT INTO `tb_sys_menu` VALUES ('3', null, '', '5', '', '4', '调拨单管理', null, null);
INSERT INTO `tb_sys_menu` VALUES ('4', null, '', '6', '\0', '5', '采购管理', null, null);
INSERT INTO `tb_sys_menu` VALUES ('5', 'orderManager/getList.do', '', '2', '\0', '6', '销售管理', null, null);
INSERT INTO `tb_sys_menu` VALUES ('6', null, '', '8', '\0', '7', '报表管理', null, null);
INSERT INTO `tb_sys_menu` VALUES ('7', null, '', '11', '\0', '8', '员工管理', null, null);
INSERT INTO `tb_sys_menu` VALUES ('8', null, '', '3', '', '3', '仓库管理', null, null);
INSERT INTO `tb_sys_menu` VALUES ('9', 'DesignController/getList.do', '', '1', '\0', '9', '设计单', '1', null);
INSERT INTO `tb_sys_menu` VALUES ('10', 'design/DesignList1.jsp', '', '2', '', '11', '打版成本', '1', null);
INSERT INTO `tb_sys_menu` VALUES ('11', null, '', '7', '\0', '12', '样衣管理', null, null);
INSERT INTO `tb_sys_menu` VALUES ('12', 'ClothRequireController/getList.do', '', '1', '\0', '13', '样衣外借申请单', '11', null);
INSERT INTO `tb_sys_menu` VALUES ('13', 'ClothRequireStoreController/getList.do', '', '4', '\0', '14', '样衣库存', '11', null);
INSERT INTO `tb_sys_menu` VALUES ('14', 'ClothRequireStoreInfoController/getList.do', '', '3', '\0', '15', '样衣出入库明细', '11', null);
INSERT INTO `tb_sys_menu` VALUES ('15', 'UserController/getList.do', '', '3', '\0', '16', '员工信息', '7', null);
INSERT INTO `tb_sys_menu` VALUES ('16', 'orderManager/getList.do', '', '1', '\0', '17', '衣服订单', '5', null);
INSERT INTO `tb_sys_menu` VALUES ('17', 'orderManager/getListFabric.do', '', '2', '\0', '18', '布料订单', '5', null);
INSERT INTO `tb_sys_menu` VALUES ('18', 'RoleController/getList.do', '', '4', '\0', '19', '角色管理', '7', null);
INSERT INTO `tb_sys_menu` VALUES ('19', '', '', '9', '\0', '20', '基础资料管理', null, null);
INSERT INTO `tb_sys_menu` VALUES ('20', 'FactoryController/getList.do', '', '20', '\0', '21', '厂家信息', '19', null);
INSERT INTO `tb_sys_menu` VALUES ('21', '', '', '21', '\0', '22', '公告管理', null, null);
INSERT INTO `tb_sys_menu` VALUES ('22', 'NoticeController/getList.do', '', '22', '\0', '23', '公告信息', '21', null);
INSERT INTO `tb_sys_menu` VALUES ('23', '', '', '10', '\0', '24', '财务管理', null, null);
INSERT INTO `tb_sys_menu` VALUES ('24', 'FinancialController/getList.do', '', '9', '\0', '25', '财务管理', '23', null);
INSERT INTO `tb_sys_menu` VALUES ('25', 'StoreController/getList.do', '', '8', '\0', '26', '服装库存', '5', null);
INSERT INTO `tb_sys_menu` VALUES ('26', 'StoreInfoController/getList.do', '', '9', '\0', '27', '服装出入库明细', '5', null);
INSERT INTO `tb_sys_menu` VALUES ('27', 'package/getList.do', '', '1', '\0', '28', '包装明细', '2', null);
INSERT INTO `tb_sys_menu` VALUES ('29', 'ProcessSheetController/getList.do', '', '5', '\0', '30', '工艺制单', '1', null);
INSERT INTO `tb_sys_menu` VALUES ('30', null, '', '12', '\0', '31', '报价单', '5', null);
INSERT INTO `tb_sys_menu` VALUES ('31', 'BomController/getList.do', '', '3', '\0', '32', 'Bom清单', '1', null);
INSERT INTO `tb_sys_menu` VALUES ('33', null, '', '12', '\0', '34', '报价管理', '5', null);
INSERT INTO `tb_sys_menu` VALUES ('34', null, '', '13', '\0', '35', '预订单', '5', null);
INSERT INTO `tb_sys_menu` VALUES ('35', null, '', '14', '\0', '36', '大货订单', '5', null);
INSERT INTO `tb_sys_menu` VALUES ('36', 'returns/getList.do', '', '15', '\0', '37', '退货管理', '5', null);
INSERT INTO `tb_sys_menu` VALUES ('37', 'claim/getList.do', '', '16', '\0', '38', '索赔管理', '5', null);
INSERT INTO `tb_sys_menu` VALUES ('38', null, '', '17', '\0', '39', '投诉记录', '5', null);
INSERT INTO `tb_sys_menu` VALUES ('39', 'MaterController/getList.do', '', '18', '\0', '40', '物料管理', '1', null);
INSERT INTO `tb_sys_menu` VALUES ('41', null, '\0', '2', '\0', '42', '采购计划', '4', null);
INSERT INTO `tb_sys_menu` VALUES ('42', null, '', '3', '\0', '43', '采购申请', '4', null);
INSERT INTO `tb_sys_menu` VALUES ('43', null, '', '4', '\0', '44', '采购订单', '4', null);
INSERT INTO `tb_sys_menu` VALUES ('44', 'FabricReceiptController/getList.do', '', '20', '\0', '45', '面料签收', '1', null);
INSERT INTO `tb_sys_menu` VALUES ('45', 'MaterialController/getList.do', '', '19', '\0', '46', '物料清单', '1', null);
INSERT INTO `tb_sys_menu` VALUES ('46', 'StoreHouseController/getList.do', '', '1', '\0', '47', '仓库管理', '19', null);
INSERT INTO `tb_sys_menu` VALUES ('47', 'ColorController/getList.do', '', '1', '\0', '48', '颜色管理', '19', null);
INSERT INTO `tb_sys_menu` VALUES ('48', 'SupplierController/getList.do', '', '1', '\0', '49', '供应商管理', '19', null);
INSERT INTO `tb_sys_menu` VALUES ('49', 'CustomerController/getList.do', '', '1', '\0', '50', '客户管理', '19', null);
INSERT INTO `tb_sys_menu` VALUES ('50', 'MaterialController/getList.do', '', '1', '\0', '51', '面料管理', '19', null);
INSERT INTO `tb_sys_menu` VALUES ('51', 'factoryOrder/getList.do', '', '21', '\0', '20', '生产进度', '1', null);
INSERT INTO `tb_sys_menu` VALUES ('52', 'account/getList.do', '', '8', '\0', '52', '会计凭证', '23', null);
INSERT INTO `tb_sys_menu` VALUES ('53', 'asset/getList.do', '', '9', '\0', '53', '资产管理', '23', null);
INSERT INTO `tb_sys_menu` VALUES ('54', 'deploy/getList.do', '', '10', '\0', '54', '调款', '23', null);
