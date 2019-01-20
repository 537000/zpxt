/*
Navicat MySQL Data Transfer

Source Server         : 1444
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : cs_sale

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2018-08-04 11:54:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_deploy
-- ----------------------------
DROP TABLE IF EXISTS `tb_deploy`;
CREATE TABLE `tb_deploy` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `dname` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `dtype` varchar(30) DEFAULT NULL,
  `ddate` date DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_deploy
-- ----------------------------
