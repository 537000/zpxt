/*
Navicat MySQL Data Transfer

Source Server         : 1444
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : cs_sale

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2018-08-04 11:54:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_sys_menu_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_menu_role`;
CREATE TABLE `tb_sys_menu_role` (
  `ID` int(11) NOT NULL,
  `MenuID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PK_Menu` (`MenuID`),
  KEY `PK_Role` (`RoleID`),
  CONSTRAINT `PK_Menu` FOREIGN KEY (`MenuID`) REFERENCES `tb_sys_menu` (`ID`),
  CONSTRAINT `PK_Role` FOREIGN KEY (`RoleID`) REFERENCES `tb_sys_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sys_menu_role
-- ----------------------------
INSERT INTO `tb_sys_menu_role` VALUES ('1', '1', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('2', '2', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('3', '3', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('4', '4', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('5', '5', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('6', '6', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('7', '7', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('8', '8', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('9', '9', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('10', '10', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('11', '11', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('12', '12', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('13', '13', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('14', '14', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('15', '15', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('16', '16', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('17', '17', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('18', '18', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('19', '19', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('20', '20', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('21', '21', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('22', '22', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('23', '23', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('24', '24', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('25', '25', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('26', '26', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('27', '27', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('29', '29', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('30', '30', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('31', '31', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('33', '33', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('34', '34', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('35', '35', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('36', '36', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('37', '37', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('38', '38', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('39', '39', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('41', '41', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('42', '42', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('43', '43', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('44', '44', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('45', '45', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('46', '46', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('47', '47', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('48', '48', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('49', '49', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('50', '50', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('51', '51', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('52', '52', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('53', '53', '1');
INSERT INTO `tb_sys_menu_role` VALUES ('54', '54', '1');
