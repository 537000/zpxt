/*
Navicat MySQL Data Transfer

Source Server         : 1444
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : cs_sale

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2018-08-04 11:54:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_asset
-- ----------------------------
DROP TABLE IF EXISTS `tb_asset`;
CREATE TABLE `tb_asset` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `assetName` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `saveDate` date DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_asset
-- ----------------------------
INSERT INTO `tb_asset` VALUES ('1', '1', '1', '2018-08-04', '1111111111');
INSERT INTO `tb_asset` VALUES ('3', '1555', '5', '2018-08-22', '5');
