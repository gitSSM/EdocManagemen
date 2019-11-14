/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.40 : Database - edoc_categorydb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`edoc_categorydb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `edoc_categorydb`;

/*Table structure for table `edoc_category` */

DROP TABLE IF EXISTS `edoc_category`;

CREATE TABLE `edoc_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `edoc_category` */

insert  into `edoc_category`(`id`,`name`) values (1,'计算机'),(2,'Excel'),(3,'Word'),(4,'PPT'),(5,'口语');

/*Table structure for table `edoc_entry` */

DROP TABLE IF EXISTS `edoc_entry`;

CREATE TABLE `edoc_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `categoryId` bigint(10) NOT NULL COMMENT '分类编号',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '标题',
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '摘要',
  `uploaduser` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传人',
  `createdate` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `edoc_entry_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `edoc_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `edoc_entry` */

insert  into `edoc_entry`(`id`,`categoryId`,`title`,`summary`,`uploaduser`,`createdate`) values (1,5,'通过美国大片学口语','通过美国大片学口语','张三','2012-01-18'),(2,5,'网聊必备100句流行英语','精品，网聊必备100句流行英语','张三','2012-01-18'),(3,2,'Excel在会计和财务','主要讲解Excel在会计和财务中的应用，由浅入深更新','李小明','2012-02-09'),(4,4,'PowerPoint','PowerPoint','小明','2012-01-28'),(5,1,'JavaScript学习笔记','JavaScript学习笔记，最好的笔记','小兰','2012-01-21'),(6,1,'Java经典入门教程','经典Java入门教程更新','王小明','2012-01-23'),(7,1,'全面解析Javaxml技术','全面解析Javaxml技术','张小兰','2012-02-22');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
