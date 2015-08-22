/*
	VeryIDE
	Version: 1.6
	Database: system
	Date: 2013/08/20
*/

-- ----------------------------
-- 即时消息
-- ----------------------------
DROP TABLE IF EXISTS `{TableSysPre}message`;
CREATE TABLE `{TableSysPre}message` (
  `id` int(11) NOT NULL auto_increment,
  `fromid` int(11) NOT NULL,
  `toid` int(11) default NULL,
  `message` tinytext,
  `ip` varchar(15) NOT NULL,
  `client` varchar(10) default NULL,
  `read` tinyint(4) default NULL,
  `dateline` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fromid` (`fromid`),
  KEY `toid` (`toid`),
  KEY `read` (`read`)
) ENGINE=MyISAM;

-- ----------------------------
-- 内部公告
-- ----------------------------
DROP TABLE IF EXISTS `{TableSysPre}notice`;
CREATE TABLE `{TableSysPre}notice` (
  `id` int(11) NOT NULL auto_increment,
  `aid` int(11) NOT NULL,
  `account` varchar(30) NOT NULL,
  `gid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text,
  `dateline` int(11) NOT NULL,
  `modify` int(11) default NULL,
  `ip` varchar(15) NOT NULL,
  `state` tinyint(4) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `id` (`id`),
  KEY `aid` (`aid`),
  KEY `account` (`account`),
  KEY `gid` (`gid`),
  KEY `title` (`title`)
) ENGINE=MyISAM;

-- ----------------------------
-- 应用收藏
-- ----------------------------
DROP TABLE IF EXISTS `{TableSysPre}quick`;
CREATE TABLE `{TableSysPre}quick` (
  `aid` int(11) NOT NULL,
  `appid` varchar(30) NOT NULL,
  `sort` tinyint(4) NOT NULL,
  `dateline` int(11) NOT NULL,
  KEY `aid` (`aid`),
  KEY `appid` (`appid`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM;

-- ----------------------------
-- 插件收藏
-- ----------------------------
DROP TABLE IF EXISTS `{TableSysPre}widget`;
CREATE TABLE `{TableSysPre}widget` (
  `aid` int(11) NOT NULL,
  `appid` varchar(30) NOT NULL,
  `widget` varchar(30) NOT NULL,
  `x` varchar(10) NOT NULL,
  `y` varchar(10) NOT NULL,
  `z` smallint(4) NOT NULL,
  `fx` smallint(6) NOT NULL,
  `fy` smallint(6) NOT NULL,
  `dateline` int(11) NOT NULL,
  KEY `aid` (`aid`),
  KEY `appid` (`appid`)
) ENGINE=MyISAM;

-- ----------------------------
-- 附件表
-- ----------------------------
DROP TABLE IF EXISTS `{TableSysPre}attach`;
CREATE TABLE `{TableSysPre}attach` (
  `id` int(11) NOT NULL auto_increment,
  `aid` int(11) NOT NULL,
  `account` varchar(30) NOT NULL,
  `name` varchar(100) default NULL,
  `type` varchar(10) default NULL,
  `size` int(11) default NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `input` varchar(20) default NULL,
  `remote` tinyint(4) NOT NULL,
  `dateline` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `aid` (`aid`),
  KEY `account` (`account`),
  KEY `name` (`name`),
  KEY `type` (`type`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `input` (`input`),
  KEY `remote` (`remote`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM;

-- ----------------------------
-- 用户组
-- ----------------------------
DROP TABLE IF EXISTS `{TableSysPre}group`;
CREATE TABLE `{TableSysPre}group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `aid` int(11) NOT NULL,
  `account` varchar(30) NOT NULL,
  `medal` varchar(30) default NULL,
  `config` text,
  `description` varchar(1000) default NULL,
  `module` text NOT NULL,
  `widget` text NOT NULL,
  `state` tinyint(4) NOT NULL,
  `dateline` int(11) NOT NULL,
  `modify` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`name`),
  KEY `aid` (`aid`),
  KEY `account` (`account`)
) ENGINE=MyISAM;

-- ----------------------------
-- 系统日志
-- ----------------------------
DROP TABLE IF EXISTS `{TableSysPre}event`;
CREATE TABLE `{TableSysPre}event` (
  `id` int(11) NOT NULL auto_increment,
  `aid` int(11) NOT NULL default '0',
  `account` varchar(30) default NULL,
  `event` varchar(50) NOT NULL,
  `description` varchar(255) default NULL,
  `dateline` int(11) NOT NULL default '0',
  `modify` int(11) NOT NULL default '0',
  `quote` varchar(50) default NULL,
  `rank` tinyint(4) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `aid` (`aid`),
  KEY `account` (`account`),
  KEY `event` (`event`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM;

-- ----------------------------
-- 管理员
-- ----------------------------
DROP TABLE IF EXISTS `{TableSysPre}admin`;
CREATE TABLE `{TableSysPre}admin` (
  `id` int(11) NOT NULL auto_increment,
  `gid` int(11) NOT NULL,
  `account` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` char(6) NOT NULL default '',
  `gender` tinyint(4) NOT NULL,
  `avatar` varchar(100) default NULL,
  `email` varchar(20) default NULL,
  `birthday` varchar(10) default NULL,
  `question` tinyint(4) NOT NULL,
  `answer` varchar(50) NOT NULL,
  `qq` varchar(20) default NULL,
  `blog` varchar(100) default NULL,
  `phone` varchar(20) default NULL,
  `theme` varchar(20) default NULL,
  `extra` varchar(255) NOT NULL default '{}',
  `stat_login` mediumint(9) NOT NULL default '0',
  `stat_modify` mediumint(9) NOT NULL default '0',
  `last_login` int(11) NOT NULL,
  `last_active` int(11) NOT NULL default '0',
  `last_ip` varchar(15) default NULL,
  `dateline` int(11) NOT NULL,
  `modify` int(11) NOT NULL,
  `config` text NOT NULL,
  `state` tinyint(4) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `gid` (`gid`),
  KEY `account` (`account`),
  KEY `password` (`password`)
) ENGINE=MyISAM;

-- ----------------------------
-- 初始分组
-- ----------------------------
INSERT INTO `{TableSysPre}group`(aid,account,name,medal,config,dateline,state,ip) VALUES ('1','{TableAdmin}','超级管理员', 'bronze_1.png', '{"*":"*"}',{TableTime}, '1', '{TableIP}');
INSERT INTO `{TableSysPre}group`(aid,account,name,medal,config,dateline,state,ip) VALUES ('1','{TableAdmin}','管理员', 'bronze_2.png', '{"*":"*"}',{TableTime}, '1', '{TableIP}');
INSERT INTO `{TableSysPre}group`(aid,account,name,medal,config,dateline,state,ip) VALUES ('1','{TableAdmin}','广告组', 'silver_1.png', '{"*":"*"}',{TableTime}, '1', '{TableIP}');
INSERT INTO `{TableSysPre}group`(aid,account,name,medal,config,dateline,state,ip) VALUES ('1','{TableAdmin}','编辑组', 'silver_1.png', '{"*":"*"}',{TableTime}, '1', '{TableIP}');

-- ----------------------------
-- 初始用户 admin:veryide
-- ----------------------------
INSERT INTO `{TableSysPre}admin`(gid,account,password,salt,avatar,blog,stat_login,last_ip,theme,dateline,modify,state,ip) VALUES ('1', '{TableAdmin}', md5( concat('{TablePass}','{TableSalt}') ), '{TableSalt}', '{TableBase}image/face.jpg', 'http://www.veryide.com/', '1', '{TableIP}', 'flower', {TableTime},{TableTime}, '1', '{TableIP}');


-- ----------------------------
-- 初始用户设置
-- ----------------------------
INSERT INTO `{TableSysPre}widget` VALUES ('1', 'system', 'control', '100', '200', '0', '0', '0', {TableTime});
