/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : croma

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-05-19 16:58:13
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ps_nrteditors_html`
-- ----------------------------
DROP TABLE IF EXISTS `ps_nrteditors_html`;
CREATE TABLE `ps_nrteditors_html` (
  `id_html` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_html`),
  KEY `id_html` (`id_html`,`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_nrteditors_html
-- ----------------------------
INSERT INTO `ps_nrteditors_html` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `ps_nrteditors_htmlc`
-- ----------------------------
DROP TABLE IF EXISTS `ps_nrteditors_htmlc`;
CREATE TABLE `ps_nrteditors_htmlc` (
  `id_html` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id_html`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_nrteditors_htmlc
-- ----------------------------
INSERT INTO `ps_nrteditors_htmlc` VALUES ('1', 'Home1_Intro');

-- ----------------------------
-- Table structure for `ps_nrteditors_htmlc_lang`
-- ----------------------------
DROP TABLE IF EXISTS `ps_nrteditors_htmlc_lang`;
CREATE TABLE `ps_nrteditors_htmlc_lang` (
  `id_html` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `html` text,
  KEY `id_html` (`id_html`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_nrteditors_htmlc_lang
-- ----------------------------
INSERT INTO `ps_nrteditors_htmlc_lang` VALUES ('1', '1', '0', '<div class=\"static-intro\">\r\n<div class=\"col-md-4 col-sm-6 col-xs-12\"><a href=\"#\" class=\"intro-box block\"> <span class=\"intro-top\"> <span class=\"fa fa-share\">.</span> </span> <span class=\"intro-bottom\"> <span class=\"title_intro\">RETURN & EXCHANGE</span> <span class=\"content_intro\">Committed to return the money in 30 days</span> </span> </a></div>\r\n<div class=\"col-md-4 col-sm-6 col-xs-12\"><a href=\"#\" class=\"intro-box block\"> <span class=\"intro-top\"> <span class=\"fa fa-plane\">.</span> </span> <span class=\"intro-bottom\"> <span class=\"title_intro\">WORLDWIDE SHIPPING</span> <span class=\"content_intro\">No place in the world can stop us bringing goods.</span> </span> </a></div>\r\n<div class=\"col-md-4 col-sm-6 col-xs-12\"><a href=\"#\" class=\"intro-box block\"> <span class=\"intro-top\"> <span class=\"fa fa-headphones\">.</span> </span> <span class=\"intro-bottom\"> <span class=\"title_intro\">ONLINE SUPPORT 24/7</span> <span class=\"content_intro\">24/7 online support is always ready</span> </span> </a></div>\r\n</div>');
INSERT INTO `ps_nrteditors_htmlc_lang` VALUES ('1', '2', '0', '<div class=\"static-intro\">\r\n<div class=\"col-md-4 col-sm-6 col-xs-12\"><a href=\"#\" class=\"intro-box block\"> <span class=\"intro-top\"> <span class=\"fa fa-share\">.</span> </span> <span class=\"intro-bottom\"> <span class=\"title_intro\">RETURN & EXCHANGE</span> <span class=\"content_intro\">Committed to return the money in 30 days</span> </span> </a></div>\r\n<div class=\"col-md-4 col-sm-6 col-xs-12\"><a href=\"#\" class=\"intro-box block\"> <span class=\"intro-top\"> <span class=\"fa fa-plane\">.</span> </span> <span class=\"intro-bottom\"> <span class=\"title_intro\">WORLDWIDE SHIPPING</span> <span class=\"content_intro\">No place in the world can stop us bringing goods.</span> </span> </a></div>\r\n<div class=\"col-md-4 col-sm-6 col-xs-12\"><a href=\"#\" class=\"intro-box block\"> <span class=\"intro-top\"> <span class=\"fa fa-headphones\">.</span> </span> <span class=\"intro-bottom\"> <span class=\"title_intro\">ONLINE SUPPORT 24/7</span> <span class=\"content_intro\">24/7 online support is always ready</span> </span> </a></div>\r\n</div>');
INSERT INTO `ps_nrteditors_htmlc_lang` VALUES ('1', '3', '0', '<div class=\"static-intro\">\r\n<div class=\"col-md-4 col-sm-6 col-xs-12\"><a href=\"#\" class=\"intro-box block\"> <span class=\"intro-top\"> <span class=\"fa fa-share\">.</span> </span> <span class=\"intro-bottom\"> <span class=\"title_intro\">RETURN & EXCHANGE</span> <span class=\"content_intro\">Committed to return the money in 30 days</span> </span> </a></div>\r\n<div class=\"col-md-4 col-sm-6 col-xs-12\"><a href=\"#\" class=\"intro-box block\"> <span class=\"intro-top\"> <span class=\"fa fa-plane\">.</span> </span> <span class=\"intro-bottom\"> <span class=\"title_intro\">WORLDWIDE SHIPPING</span> <span class=\"content_intro\">No place in the world can stop us bringing goods.</span> </span> </a></div>\r\n<div class=\"col-md-4 col-sm-6 col-xs-12\"><a href=\"#\" class=\"intro-box block\"> <span class=\"intro-top\"> <span class=\"fa fa-headphones\">.</span> </span> <span class=\"intro-bottom\"> <span class=\"title_intro\">ONLINE SUPPORT 24/7</span> <span class=\"content_intro\">24/7 online support is always ready</span> </span> </a></div>\r\n</div>');
INSERT INTO `ps_nrteditors_htmlc_lang` VALUES ('1', '4', '0', '<div class=\"static-intro\">\r\n<div class=\"col-md-4 col-sm-6 col-xs-12\"><a href=\"#\" class=\"intro-box block\"> <span class=\"intro-top\"> <span class=\"fa fa-share\">.</span> </span> <span class=\"intro-bottom\"> <span class=\"title_intro\">RETURN & EXCHANGE</span> <span class=\"content_intro\">Committed to return the money in 30 days</span> </span> </a></div>\r\n<div class=\"col-md-4 col-sm-6 col-xs-12\"><a href=\"#\" class=\"intro-box block\"> <span class=\"intro-top\"> <span class=\"fa fa-plane\">.</span> </span> <span class=\"intro-bottom\"> <span class=\"title_intro\">WORLDWIDE SHIPPING</span> <span class=\"content_intro\">No place in the world can stop us bringing goods.</span> </span> </a></div>\r\n<div class=\"col-md-4 col-sm-6 col-xs-12\"><a href=\"#\" class=\"intro-box block\"> <span class=\"intro-top\"> <span class=\"fa fa-headphones\">.</span> </span> <span class=\"intro-bottom\"> <span class=\"title_intro\">ONLINE SUPPORT 24/7</span> <span class=\"content_intro\">24/7 online support is always ready</span> </span> </a></div>\r\n</div>');
