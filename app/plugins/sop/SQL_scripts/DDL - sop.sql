-- Create SOP Tables

-- 
-- Table structure for table `sop_controls`
-- 

DROP TABLE IF EXISTS `sop_controls`;
CREATE TABLE `sop_controls` (
  `id` int(11) NOT NULL auto_increment,
  `sop_group` varchar(50) character set utf8 collate utf8_bin default NULL,
  `type` varchar(50) character set utf8 collate utf8_bin default NULL,
  `detail_tablename` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `detail_form_alias` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `extend_tablename` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `extend_form_alias` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `created` datetime default NULL,
  `created_by` varchar(50) character set utf8 collate utf8_bin default NULL,
  `modified` datetime default NULL,
  `modified_by` varchar(50) character set utf8 collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Table structure for table `sop_masters`
-- 

DROP TABLE IF EXISTS `sop_masters`;
CREATE TABLE `sop_masters` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `notes` text,
  `code` varchar(50) default NULL,
  `version` varchar(50) default NULL,
  `sop_group` varchar(50) default NULL,
  `type` varchar(50) NOT NULL,
  `status` varchar(50) default NULL,
  `expiry_date` date default NULL,
  `activated_date` date default NULL,
  `scope` text,
  `purpose` text,
  `detail_tablename` varchar(255) NOT NULL,
  `detail_form_alias` varchar(255) NOT NULL,
  `extend_tablename` varchar(255) NOT NULL,
  `extend_form_alias` varchar(255) NOT NULL,
  `created` datetime default NULL,
  `created_by` varchar(50) default NULL,
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  `form_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

-- 
-- Table structure for table `sope_general_all`
-- 

DROP TABLE IF EXISTS `sope_general_all`;
CREATE TABLE `sope_general_all` (
  `id` int(11) NOT NULL auto_increment,
  `site_specific` varchar(50) default NULL,
  `created` datetime default NULL,
  `created_by` varchar(50) default NULL,
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  `sop_master_id` int(11) default NULL,
  `material_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=220 ;

-- 
-- Table structure for table `sopd_general_all`
-- 

DROP TABLE IF EXISTS `sopd_general_all`;
CREATE TABLE `sopd_general_all` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(255) default NULL,
  `created` datetime NOT NULL default '0000-00-00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00',
  `modified_by` varchar(50) NOT NULL default '',
  `sop_master_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

-- 
-- Table structure for table `sopd_inventory_all`
-- 

DROP TABLE IF EXISTS `sopd_inventory_all`;
CREATE TABLE `sopd_inventory_all` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(255) NOT NULL,
  `sop_master_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Table structure for table `sope_inventory_all`
-- 

DROP TABLE IF EXISTS `sope_inventory_all`;
CREATE TABLE `sope_inventory_all` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(255) NOT NULL,
  `sop_master_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

