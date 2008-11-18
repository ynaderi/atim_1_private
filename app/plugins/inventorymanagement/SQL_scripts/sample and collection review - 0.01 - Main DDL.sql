-- ---------------------------------------------------------------------
-- CTRApp - inventory management - sample and collection review 
-- DB Script Type: DDL
--
-- Author: Nicolas Luc
-- Creation Date: 2008-06-11
-- Version: 0.01
-- -----------------------------------------------------------------

DROP TABLE IF EXISTS `review_controls`;

CREATE TABLE `review_controls` (
  `id` int(11) NOT NULL auto_increment,
  `review_type` varchar(30) NOT NULL default '',
  `review_sample_group` varchar(30) NOT NULL default '',
  `status` varchar(20) NOT NULL default '',
  `form_alias` varchar(50) default NULL,
  `detail_tablename` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `review_masters`;

CREATE TABLE `review_masters` (
  `id` int(11) NOT NULL auto_increment,
  `review_control_id` int(11) NOT NULL default '0',
  `collection_id` int(11) NOT NULL default '0',
  `sample_master_id` int(11) NOT NULL default '0',
  `review_type` varchar(30) NOT NULL default '',
  `review_sample_group` varchar(30) NOT NULL default '',
  `review_date` date NOT NULL default '0000-00-00',
  `review_status` varchar(20) NOT NULL default '',
  `pathologist` varchar(50) default '',
  `comments` text default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT = 1 ;

-- -----------------------------------------------------------------

DROP TABLE IF EXISTS `rd_blood_cells`;

CREATE TABLE `rd_blood_cells` (
  `id` int(11) NOT NULL auto_increment,
  `review_master_id` int(11) NOT NULL default '0',
  `mmt` varchar(10) default '',
  `fish` decimal(6,2) default NULL,
  `zap70` decimal(6,2) default NULL,
  `nq01` varchar(10) default NULL,
  `cd38` decimal(6,2) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT = 1 ;

-- -----------------------------------------------------------------

DROP TABLE IF EXISTS `rd_breast_cancers`;

CREATE TABLE `rd_breast_cancers` (
  `id` int(11) NOT NULL auto_increment,
  `review_master_id` int(11) NOT NULL default '0',
  `tumour_type_id` int(11) NOT NULL default '0',
  `invasive_percentage` decimal(5,1) NOT NULL default '0.0',
  `in_situ_percentage` decimal(5,1) NOT NULL default '0.0',
  `normal_percentage` decimal(5,1) NOT NULL default '0.0',
  `stroma_percentage` decimal(5,1) NOT NULL default '0.0',
  `necrosis_inv_percentage` decimal(5,1) NOT NULL default '0.0',
  `necrosis_is_percentage` decimal(5,1) NOT NULL default '0.0',
  `fat_percentage` decimal(5,1) NOT NULL default '0.0',
  `inflammation` tinyint(4) NOT NULL default '0',
  `quality_score` tinyint(4) NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT = 1 ;




