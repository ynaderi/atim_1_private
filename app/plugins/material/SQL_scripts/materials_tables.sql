-- Materials tables

CREATE TABLE `materials` (
  `id` int(11) NOT NULL auto_increment,
  `item_name` varchar(50) collate utf8_bin NOT NULL default '',
  `item_type` varchar(50) collate utf8_bin default NULL,
  `description` varchar(255) collate utf8_bin default NULL,
  `created` date NOT NULL default '0000-00-00',
  `created_by` varchar(50) collate utf8_bin NOT NULL default '',
  `modified` date NOT NULL default '0000-00-00',
  `modified_by` varchar(50) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;
