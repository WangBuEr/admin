# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 121.43.108.110 (MySQL 5.5.47-0ubuntu0.14.04.1)
# Database: wxpay
# Generation Time: 2017-03-30 07:38:21 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table organization
# ------------------------------------------------------------

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '组织名',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `code` varchar(64) DEFAULT NULL COMMENT '编号',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级主键',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构';

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;

INSERT INTO `organization` (`id`, `name`, `address`, `code`, `icon`, `pid`, `seq`, `create_time`)
VALUES
	(7,'IT','','02','fi-folder',NULL,0,'2017-02-12 23:09:23');

/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '资源名称',
  `url` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `open_mode` varchar(32) DEFAULT NULL COMMENT '打开方式 ajax,iframe',
  `description` varchar(255) DEFAULT NULL COMMENT '资源介绍',
  `icon` varchar(32) DEFAULT NULL COMMENT '资源图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级资源id',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `resource_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '资源类别',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源';

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;

INSERT INTO `resource` (`id`, `name`, `url`, `open_mode`, `description`, `icon`, `pid`, `seq`, `status`, `resource_type`, `create_time`)
VALUES
	(1,'系统管理','','menu','超级管理员','fi-folder',NULL,0,0,0,'2014-02-19 01:00:00'),
	(11,'资源管理','/resource/manager','ajax','资源管理','fi-database',1,1,0,0,'2014-02-19 01:00:00'),
	(12,'角色管理','/role/manager','ajax','角色管理','fi-torso-business',1,2,0,0,'2014-02-19 01:00:00'),
	(13,'用户管理','/user/manager','ajax','用户管理','fi-torsos-all',1,3,0,0,'2014-02-19 01:00:00'),
	(111,'列表','/resource/treeGrid','ajax','资源列表','fi-list',11,0,0,1,'2014-02-19 01:00:00'),
	(112,'添加','/resource/add','ajax','资源添加','fi-page-add',11,0,0,1,'2014-02-19 01:00:00'),
	(113,'编辑','/resource/edit','ajax','资源编辑','fi-page-edit',11,0,0,1,'2014-02-19 01:00:00'),
	(114,'删除','/resource/delete','ajax','资源删除','fi-page-delete',11,0,0,1,'2014-02-19 01:00:00'),
	(121,'列表','/role/dataGrid','ajax','角色列表','fi-list',12,0,0,1,'2014-02-19 01:00:00'),
	(122,'添加','/role/add','ajax','角色添加','fi-page-add',12,0,0,1,'2014-02-19 01:00:00'),
	(123,'编辑','/role/edit','ajax','角色编辑','fi-page-edit',12,0,0,1,'2014-02-19 01:00:00'),
	(124,'删除','/role/delete','ajax','角色删除','fi-page-delete',12,0,0,1,'2014-02-19 01:00:00'),
	(125,'授权','/role/grant','ajax','角色授权','fi-check',12,0,0,1,'2014-02-19 01:00:00'),
	(131,'列表','/user/dataGrid','ajax','用户列表','fi-list',13,0,0,1,'2014-02-19 01:00:00'),
	(132,'添加','/user/add','ajax','用户添加','fi-page-add',13,0,0,1,'2014-02-19 01:00:00'),
	(133,'编辑','/user/edit','ajax','用户编辑','fi-page-edit',13,0,0,1,'2014-02-19 01:00:00'),
	(134,'删除','/user/delete','ajax','用户删除','fi-page-delete',13,0,0,1,'2014-02-19 01:00:00');

/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '角色名',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序号',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`id`, `name`, `seq`, `description`, `status`)
VALUES
	(1,'admin',0,'超级管理员',0);

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_resource`;

CREATE TABLE `role_resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  `resource_id` bigint(19) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源';

LOCK TABLES `role_resource` WRITE;
/*!40000 ALTER TABLE `role_resource` DISABLE KEYS */;

INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`)
VALUES
	(158,3,1),
	(159,3,11),
	(160,3,111),
	(161,3,112),
	(162,3,113),
	(163,3,114),
	(164,3,12),
	(165,3,121),
	(166,3,122),
	(167,3,123),
	(168,3,124),
	(169,3,125),
	(170,3,13),
	(171,3,131),
	(172,3,132),
	(173,3,133),
	(174,3,134),
	(359,7,1),
	(364,7,222),
	(365,7,223),
	(366,7,224),
	(367,7,221),
	(368,7,226),
	(448,8,1),
	(449,8,11),
	(450,8,111),
	(451,8,12),
	(452,8,121),
	(453,8,13),
	(454,8,131),
	(457,8,222),
	(458,8,223),
	(459,8,224),
	(460,8,221),
	(461,8,227),
	(462,8,228),
	(478,8,229),
	(492,2,1),
	(493,2,11),
	(494,2,13),
	(495,2,131),
	(496,2,132),
	(497,2,133),
	(498,2,222),
	(499,2,223),
	(500,2,224),
	(501,2,221),
	(502,2,227),
	(503,2,228),
	(615,1,1),
	(616,1,11),
	(617,1,111),
	(618,1,112),
	(619,1,113),
	(620,1,114),
	(621,1,12),
	(622,1,121),
	(623,1,122),
	(624,1,123),
	(625,1,124),
	(626,1,125),
	(627,1,13),
	(628,1,131),
	(629,1,132),
	(630,1,133);

/*!40000 ALTER TABLE `role_resource` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(64) NOT NULL COMMENT '登陆名',
  `head_image` varchar(255) DEFAULT NULL COMMENT '头像',
  `name` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` tinyint(2) DEFAULT '0' COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `user_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户类别',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `organization_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属机构',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `login_name`, `head_image`, `name`, `password`, `sex`, `age`, `phone`, `user_type`, `status`, `organization_id`, `create_time`)
VALUES
	(1,'admin','FhYvaeDjkH2KJCu3QdE_KnxweJpq','admin','96e79218965eb72c92a549dd5a330112',0,25,'25',0,0,7,'2015-12-06 13:14:05');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色';

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;

INSERT INTO `user_role` (`id`, `user_id`, `role_id`)
VALUES
	(53,15,8),
	(63,13,2),
	(64,14,7),
	(96,20,9),
	(97,20,11),
	(98,20,12),
	(99,20,13),
	(107,1,1),
	(108,1,9);

/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
