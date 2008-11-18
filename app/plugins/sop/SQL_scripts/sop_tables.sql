-- Create SOP Tables

CREATE TABLE `sop_controls` (
  `id` int(11) NOT NULL auto_increment,
  `sop_group` varchar(50) collate utf8_bin default NULL,
  `type` varchar(50) collate utf8_bin default NULL,
  `detail_tablename` varchar(255) collate utf8_bin NOT NULL default '',
  `detail_form_alias` varchar(255) collate utf8_bin NOT NULL default '',
  `extend_tablename` varchar(255) collate utf8_bin NOT NULL default '',
  `extend_form_alias` varchar(255) collate utf8_bin NOT NULL default '',
  `created` date default NULL,
  `created_by` varchar(50) collate utf8_bin default NULL,
  `modified` date default NULL,
  `modified_by` varchar(50) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;



CREATE TABLE `sop_masters` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) collate utf8_bin default NULL,
  `notes` text collate utf8_bin,
  `code` varchar(50) collate utf8_bin default NULL,
  `sop_group` varchar(50) collate utf8_bin default NULL,
  `type` varchar(50) collate utf8_bin NOT NULL default '',
  `status` varchar(50) collate utf8_bin default NULL,
  `expiry` date default NULL,
  `activated` date default NULL,
  `scope` text collate utf8_bin,
  `purpose` text collate utf8_bin,
  `detail_tablename` varchar(255) collate utf8_bin NOT NULL default '',
  `detail_form_alias` varchar(255) collate utf8_bin NOT NULL default '',
  `extend_tablename` varchar(255) collate utf8_bin NOT NULL default '',
  `extend_form_alias` varchar(255) collate utf8_bin NOT NULL default '',
  `created` date default NULL,
  `created_by` varchar(50) collate utf8_bin default NULL,
  `modified` date default NULL,
  `modified_by` varchar(50) collate utf8_bin default NULL,
  `form_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;



CREATE TABLE `sopd_inventory_tissue` (
  `id` int(11) NOT NULL auto_increment,
  `detail_field` int(11) default NULL,
  `created` date NOT NULL default '0000-00-00',
  `created_by` varchar(50) collate utf8_bin NOT NULL default '',
  `modified` date NOT NULL default '0000-00-00',
  `modified_by` varchar(50) collate utf8_bin NOT NULL default '',
  `sop_master_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;


CREATE TABLE `sope_inventory_tissue` (
  `id` int(11) NOT NULL auto_increment,
  `site_specific` varchar(50) collate utf8_bin default NULL,
  `created` datetime default NULL,
  `created_by` varchar(50) collate utf8_bin default NULL,
  `modified` datetime default NULL,
  `modified_by` varchar(50) collate utf8_bin default NULL,
  `sop_master_id` int(11) default NULL,
  `material_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;
