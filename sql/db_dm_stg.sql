/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.24 : Database - dm_stg
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dm_stg` /*!40100 DEFAULT CHARACTER SET latin1 */;

/*Table structure for table `disc_jovenes_processed` */

DROP TABLE IF EXISTS `disc_jovenes_processed`;

CREATE TABLE `disc_jovenes_processed` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `disc_personal_processed` */

DROP TABLE IF EXISTS `disc_personal_processed`;

CREATE TABLE `disc_personal_processed` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `disc_processed` */

DROP TABLE IF EXISTS `disc_processed`;

CREATE TABLE `disc_processed` (
  `id` int(11) NOT NULL,
  `origen` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `evaluado_processed` */

DROP TABLE IF EXISTS `evaluado_processed`;

CREATE TABLE `evaluado_processed` (
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `evaluation_instance` */

DROP TABLE IF EXISTS `evaluation_instance`;

CREATE TABLE `evaluation_instance` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` smallint(5) unsigned DEFAULT NULL,
  `account_id` mediumint(5) unsigned DEFAULT NULL,
  `parent_id` mediumint(6) unsigned DEFAULT NULL,
  `level_id` smallint(4) unsigned DEFAULT NULL,
  `token` char(13) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(2) NOT NULL,
  `language` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `cost` smallint(4) unsigned NOT NULL,
  `cache_evaluation_type_extensions` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cache_evaluation_type_main` varchar(21) COLLATE utf8_unicode_ci NOT NULL,
  `cache_evaluation_type_id_main` varchar(53) COLLATE utf8_unicode_ci NOT NULL,
  `cache_evaluation_category_main` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `userAssigned_id` mediumint(5) unsigned DEFAULT NULL,
  `creatorUser_id` mediumint(5) unsigned DEFAULT NULL,
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `factorNatural` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main` tinyint(1) unsigned DEFAULT NULL,
  `job` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manual` tinyint(1) unsigned DEFAULT NULL,
  `d` tinyint(3) unsigned DEFAULT NULL,
  `i` tinyint(3) unsigned DEFAULT NULL,
  `s` tinyint(3) unsigned DEFAULT NULL,
  `c` tinyint(3) unsigned DEFAULT NULL,
  `finished_at` char(19) COLLATE utf8_unicode_ci DEFAULT NULL,
  `revaluation_id` mediumint(6) unsigned DEFAULT NULL,
  `disc_id` mediumint(6) unsigned DEFAULT NULL,
  `profile_id` mediumint(6) unsigned DEFAULT NULL,
  `system` tinyint(1) unsigned NOT NULL,
  `factorAdaptado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d_adaptado` tinyint(2) unsigned DEFAULT NULL,
  `i_adaptado` tinyint(2) unsigned DEFAULT NULL,
  `s_adaptado` tinyint(2) unsigned DEFAULT NULL,
  `c_adaptado` tinyint(2) unsigned DEFAULT NULL,
  `created_dm_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_DISC_PROFILE` (`disc_id`,`profile_id`),
  KEY `IDX_4F7EC8F8166D1F9C` (`project_id`),
  KEY `IDX_4F7EC8F89B6B5FBA` (`account_id`),
  KEY `IDX_4F7EC8F8A3E0A346` (`userAssigned_id`),
  KEY `IDX_4F7EC8F8BDB68017` (`creatorUser_id`),
  KEY `IDX_4F7EC8F8727ACA70` (`parent_id`),
  KEY `IDX_4F7EC8F85FB14BA7` (`level_id`),
  KEY `IDX_4F7EC8F890A21EEB` (`revaluation_id`),
  KEY `IDX_4F7EC8F8C38F37CA` (`disc_id`),
  KEY `IDX_4F7EC8F8CCFA12B8` (`profile_id`),
  KEY `IDX_System` (`system`)
) ENGINE=InnoDB AUTO_INCREMENT=114396 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `fos_user_user` */

DROP TABLE IF EXISTS `fos_user_user`;

CREATE TABLE `fos_user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_state_id` int(11) DEFAULT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biography` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `twitter_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `gplus_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_step_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstTimeToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) NOT NULL,
  `birthYear` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `studyLevel_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workActivity_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workSector_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subdivision` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` decimal(20,16) DEFAULT NULL,
  `lon` decimal(20,16) DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_dm_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C560D76192FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_C560D761A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_C560D761C05FB297` (`confirmation_token`),
  UNIQUE KEY `UNIQ_C560D761E555D8C1` (`user_state_id`),
  KEY `IDX_C560D761E79A35EE` (`studyLevel_id`),
  KEY `IDX_C560D7617F74B2EA` (`workActivity_id`),
  KEY `IDX_C560D761A71185F8` (`workSector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65886 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `valores` */

DROP TABLE IF EXISTS `valores`;

CREATE TABLE `valores` (
  `evaluation_id` int(11) DEFAULT NULL,
  `respuesta` char(20) COLLATE latin1_general_ci DEFAULT NULL,
  `meta_valor` char(20) COLLATE latin1_general_ci DEFAULT NULL,
  `valor` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
