-- ---------------------------------------------------------------------
-- CTRApp - storage layout
-- DB Script Type: DDL
--
-- Author: Nicolas Luc
-- Creation Date: 2008-01-31
-- Version: 0.01
-- ---------------------------------------------------------------------

UPDATE `aliquot_masters`
SET `storage_master_id` = NULL, 
`storage_coord_x`  = NULL, 
`storage_coord_y` = NULL;

-- 
-- DROP
-- 

DROP TABLE IF EXISTS `tma_slides`;

DROP TABLE IF EXISTS `std_tma_blocks`;
DROP TABLE IF EXISTS `std_incubators`;
DROP TABLE IF EXISTS `std_rooms`;
DROP TABLE IF EXISTS `std_nitrogen_containers`;

DROP TABLE IF EXISTS `storage_coordinates`;

DROP TABLE IF EXISTS `storage_masters`;

DROP TABLE IF EXISTS `storage_controls`;

-- 
-- Table - `storage_controls`
-- 

-- Action: CREATE
-- Comments: n/a 

CREATE TABLE `storage_controls` (
  `id` int(11) NOT NULL auto_increment,
  `storage_type` varchar(30) NOT NULL default '',
  `storage_type_code` varchar(10) NOT NULL default '',
  `coord_x_title` varchar(30) default NULL, 
  `coord_x_type` enum('alphabetical', 'integer', 'list') default NULL, 
  `coord_x_size` int(4) default NULL, 
  `coord_y_title` varchar(30) default NULL, 
  `coord_y_type` enum('alphabetical', 'integer', 'list') default NULL, 
  `coord_y_size` int(4) default NULL, 
  `set_temperature` varchar(7) default NULL,
  `is_tma_block` varchar(5) default NULL,
  `status` varchar(20) default NULL, 
  `form_alias` varchar(50) default NULL,
  `form_alias_for_children_pos` varchar(50) default NULL,
  `detail_tablename` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1;

-- 
-- Table - `storage_masters`
-- 

-- Action: CREATE
-- Comments: n/a 

CREATE TABLE `storage_masters` (
  `id` int(11) NOT NULL auto_increment,
  `code` varchar(30) NOT NULL default '',
  `storage_type` varchar(30) NOT NULL default '',
  `storage_control_id` int(11) NOT NULL default '0',
  `parent_id` int(11) default NULL,
  `barcode` varchar(30) default '',
  `short_label` varchar(6) default '',
  `selection_label` varchar(60) default '', 
  `storage_status` varchar(20) default '',
  `parent_storage_coord_x` varchar(11) default NULL,
  `parent_storage_coord_y` varchar(11) default NULL,
  `set_temperature` varchar(7) default NULL,
  `temperature` decimal(5,2) default NULL,
  `temp_unit` varchar(20) default NULL,
  `notes` text,  
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `storage_masters` ADD INDEX ( `storage_control_id` );

ALTER TABLE `storage_masters`
ADD FOREIGN KEY (storage_control_id)
REFERENCES storage_controls (id);

ALTER TABLE `storage_masters` ADD INDEX ( `parent_id` );

ALTER TABLE `storage_masters`
ADD FOREIGN KEY (parent_id)
REFERENCES storage_masters (id);

ALTER TABLE `aliquot_masters` ADD INDEX ( `storage_master_id` );

ALTER TABLE `aliquot_masters`
ADD FOREIGN KEY (storage_master_id)
REFERENCES storage_masters (id);

-- 
-- Table - `storage_coordinates`
-- 

-- Action: CREATE
-- Comments: n/a 

CREATE TABLE `storage_coordinates` (
  `id` int(11) NOT NULL auto_increment,
  `storage_master_id` int(11) NOT NULL default '0',
  `dimension` varchar(4) default '',
  `coordinate_value` varchar(30) default '', 
  `order` int(4) default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,   
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `storage_coordinates` ADD INDEX ( `storage_master_id` );

ALTER TABLE `storage_coordinates`
ADD FOREIGN KEY (storage_master_id)
REFERENCES storage_masters (id);

-- 
-- Table - `std_rooms`
-- 

-- Action: CREATE
-- Comments: n/a 

CREATE TABLE `std_rooms` (
  `id` int(11) NOT NULL auto_increment,
  `storage_master_id` int(11) NOT NULL default '0',
  `laboratory` varchar(50) default NULL,
  `floor` varchar(20) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `std_rooms` ADD INDEX ( `storage_master_id` );

ALTER TABLE `std_rooms`
ADD FOREIGN KEY (storage_master_id)
REFERENCES storage_masters (id);

-- 
-- Table - `std_incubators`
-- 

-- Action: CREATE
-- Comments: n/a 

CREATE TABLE `std_incubators` (
  `id` int(11) NOT NULL auto_increment,
  `storage_master_id` int(11) NOT NULL default '0',
  `oxygen_perc` varchar(10) default NULL,
  `carbonic_gaz_perc` varchar(10) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1;

ALTER TABLE `std_incubators` ADD INDEX ( `storage_master_id` );

ALTER TABLE `std_incubators`
ADD FOREIGN KEY (storage_master_id)
REFERENCES storage_masters (id);

-- 
-- Table - `std_tma_blocks`
-- 

-- Action: CREATE
-- Comments: n/a 

CREATE TABLE `std_tma_blocks` (
  `id` int(11) NOT NULL auto_increment,
  `storage_master_id` int(11) NOT NULL default '0',
  `sop_master_id` int(11) default NULL,
  `product_code` varchar(20) default NULL, 
  `creation_datetime` datetime default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1;

ALTER TABLE `std_tma_blocks` ADD INDEX ( `storage_master_id` );

ALTER TABLE `std_tma_blocks`
ADD FOREIGN KEY (storage_master_id)
REFERENCES storage_masters (id);

ALTER TABLE `std_tma_blocks` ADD INDEX ( `sop_master_id` );

ALTER TABLE `std_tma_blocks`
ADD FOREIGN KEY (sop_master_id)
REFERENCES sop_masters (id);

-- 
-- Table - `tma_slides`
-- 

-- Action: CREATE
-- Comments: n/a 

CREATE TABLE `tma_slides` (
  `id` int(11) NOT NULL auto_increment,
  `std_tma_block_id` int(11) default '0', 
  `barcode` varchar(30) NOT NULL default '',
  `product_code` varchar(20) default NULL,  
  `sop_master_id` int(11) default NULL,
  `immunochemistry` varchar(30) default NULL,
--  `intensity` varchar(10) default NULL,    
--  `percentage_intensity` varchar(10) default NULL,
  `picture_path` varchar(200) default NULL,  
  `storage_datetime` datetime default NULL,
  `storage_master_id` int(11) default NULL,
  `storage_coord_x` varchar(11) default NULL,
  `storage_coord_y` varchar(11) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1;

ALTER TABLE `tma_slides` ADD INDEX ( `storage_master_id` );

ALTER TABLE `tma_slides`
ADD FOREIGN KEY (storage_master_id)
REFERENCES storage_masters (id);

ALTER TABLE `tma_slides` ADD INDEX ( `sop_master_id` );

ALTER TABLE `tma_slides`
ADD FOREIGN KEY (sop_master_id)
REFERENCES sop_masters (id);

ALTER TABLE `tma_slides` ADD INDEX ( `std_tma_block_id` );

ALTER TABLE `tma_slides`
ADD FOREIGN KEY (`std_tma_block_id`)
REFERENCES `std_tma_blocks` (`id`);



