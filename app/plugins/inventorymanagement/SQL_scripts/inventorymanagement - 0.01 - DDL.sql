-- ---------------------------------------------------------------------
-- CTRApp - inventory management 
-- DB Script Type: DDL
--
-- Author: Nicolas Luc
-- Creation Date: 2008-06-11
-- Version: 0.01
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Truncate actions
-- ---------------------------------------------------------------------

TRUNCATE TABLE `clinical_collection_links`;
TRUNCATE TABLE `order_items`;

-- ---------------------------------------------------------------------
-- Drop actions
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `ad_cell_cores`; 
DROP TABLE IF EXISTS `ad_gel_matrices`; 
DROP TABLE IF EXISTS `ad_cell_tubes`; 
DROP TABLE IF EXISTS `ad_cell_slides`; 
DROP TABLE IF EXISTS `ad_tissue_cores`; 
DROP TABLE IF EXISTS `ad_whatman_papers`; 
DROP TABLE IF EXISTS `ad_tissue_slides`; 
DROP TABLE IF EXISTS `ad_blocks`;
DROP TABLE IF EXISTS `ad_tubes`; 

DROP TABLE IF EXISTS `qc_tested_aliquots`;
DROP TABLE IF EXISTS `quality_controls`;
DROP TABLE IF EXISTS `realiquotings`;
DROP TABLE IF EXISTS `source_aliquots`; 

DROP TABLE IF EXISTS `aliquot_uses`; 
DROP TABLE IF EXISTS `aliquot_masters`; 

DROP TABLE IF EXISTS `sample_aliquot_control_links`; 
DROP TABLE IF EXISTS `aliquot_controls`; 

DROP TABLE IF EXISTS `sd_der_tissue_suspensions`; 
DROP TABLE IF EXISTS `sd_der_tissue_lysates`; 
DROP TABLE IF EXISTS `sd_der_serums`; 
DROP TABLE IF EXISTS `sd_der_plasmas`; 
DROP TABLE IF EXISTS `sd_der_cell_cultures`; 
DROP TABLE IF EXISTS `derivative_details`; 

DROP TABLE IF EXISTS `sd_spe_other_fluids`; 
DROP TABLE IF EXISTS `sd_spe_cystic_fluids`; 
DROP TABLE IF EXISTS `sd_spe_peritoneal_washes`; 
DROP TABLE IF EXISTS `sd_spe_urines`; 
DROP TABLE IF EXISTS `sd_spe_tissues`; 
DROP TABLE IF EXISTS `sd_spe_bloods`; 
DROP TABLE IF EXISTS `sd_spe_ascites`; 
DROP TABLE IF EXISTS `specimen_details`; 

DROP TABLE IF EXISTS `sample_masters`; 

DROP TABLE IF EXISTS `derived_sample_links`;
DROP TABLE IF EXISTS `sample_controls`; 

DROP TABLE IF EXISTS `collections`; 

-- ---------------------------------------------------------------------
-- COLLECTION
-- ---------------------------------------------------------------------

-- 
-- Table - `collections`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `collections` (
  `id` int(11) NOT NULL auto_increment,
  `acquisition_label` varchar(50) NOT NULL default '',
  `bank` varchar(50) default NULL,
  `collection_site` varchar(30) default NULL,
  `collection_datetime` datetime default NULL,
  `reception_by` varchar(20) default NULL,
  `reception_datetime` datetime default NULL,
  `sop_master_id` int(11) default NULL,
  `collection_property` varchar(30) default NULL,  
  `collection_notes` text,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `collections` ADD INDEX ( `sop_master_id` );

ALTER TABLE `collections`
ADD FOREIGN KEY (sop_master_id)
REFERENCES sop_masters (id);

-- ---------------------------------------------------------------------
-- SAMPLE
-- ---------------------------------------------------------------------

-- 
-- Table - `sample_controls`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `sample_controls` (
  `id` int(11) NOT NULL auto_increment,
  `sample_type` varchar(30) NOT NULL default '',
  `sample_type_code` varchar(10) NOT NULL default '',
  `sample_category` varchar(20) NOT NULL default '',
  `status` varchar(20) default NULL,
  `form_alias` varchar(50) default NULL,
  `detail_tablename` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

-- 
-- Table - `derived_sample_links`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `derived_sample_links` (
  `id` int(11) NOT NULL auto_increment,
  `source_sample_control_id` int(11) NOT NULL default '0',
  `derived_sample_control_id` int(11) NOT NULL default '0',
  `status` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `derived_sample_links` ADD INDEX ( `source_sample_control_id` );

ALTER TABLE `derived_sample_links`
ADD FOREIGN KEY (source_sample_control_id)
REFERENCES sample_controls (id)
;

ALTER TABLE `derived_sample_links` ADD INDEX ( `derived_sample_control_id` );

ALTER TABLE `derived_sample_links`
ADD FOREIGN KEY (derived_sample_control_id)
REFERENCES sample_controls (id)
;

-- 
-- Table - `sample_masters`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `sample_masters` (
  `id` int(11) NOT NULL auto_increment,
  `sample_code` varchar(30) NOT NULL default '',
  `sample_category` varchar(30) NOT NULL default '',
  `sample_control_id` int(11) NOT NULL  default '0',
  `sample_type` varchar(30) NOT NULL default '',
  `initial_specimen_sample_id` int(11) default NULL,
  `initial_specimen_sample_type` varchar(30) NOT NULL default '',
  `collection_id` int(11) NOT NULL default '0',
  `parent_id` int(11) default NULL,
  `sop_master_id` int(11) default NULL,
  `product_code` varchar(20) default NULL,   
  `is_problematic` varchar(6) default NULL,   
  `notes` text,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `sample_masters` ADD INDEX ( `sample_control_id` );

ALTER TABLE `sample_masters`
ADD FOREIGN KEY (sample_control_id)
REFERENCES sample_controls (id)
;

ALTER TABLE `sample_masters` ADD INDEX ( `initial_specimen_sample_id` );

ALTER TABLE `sample_masters` ADD INDEX ( `parent_id` );

ALTER TABLE `sample_masters`
ADD FOREIGN KEY (parent_id)
REFERENCES sample_masters (id)
;

ALTER TABLE `sample_masters` ADD INDEX ( `collection_id` );

ALTER TABLE `sample_masters`
ADD FOREIGN KEY (collection_id)
REFERENCES collections (id)
;

ALTER TABLE `sample_masters` ADD INDEX ( `sop_master_id` );

ALTER TABLE `sample_masters`
ADD FOREIGN KEY (sop_master_id)
REFERENCES sop_masters (id)
;

-- 
-- Table - `specimen_details`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `specimen_details` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0',
  `supplier_dept` varchar(40) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `specimen_details` ADD INDEX ( `sample_master_id` );

ALTER TABLE `specimen_details`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- 
-- Table - `sd_spe_ascites`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `sd_spe_ascites` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0',
  `collected_volume` decimal(10,5) default NULL,
  `collected_volume_unit` varchar(20) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `sd_spe_ascites` ADD INDEX ( `sample_master_id` );

ALTER TABLE `sd_spe_ascites`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- 
-- Table - `sd_spe_bloods`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `sd_spe_bloods` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0',
  `type` varchar(30) default NULL,
  `collected_tube_nbr` int(4) default NULL,
  `collected_volume` decimal(10,5) default NULL,
  `collected_volume_unit` varchar(20) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `sd_spe_bloods` ADD INDEX ( `sample_master_id` );

ALTER TABLE `sd_spe_bloods`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- 
-- Table - `sd_spe_tissues`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `sd_spe_tissues` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0',
  `tissue_source` varchar(20) default NULL,
  `nature` varchar(15) default NULL,
  `laterality` varchar(10) default NULL,
  `pathology_reception_datetime` datetime default NULL,
  `size` varchar(20) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `sd_spe_tissues` ADD INDEX ( `sample_master_id` );

ALTER TABLE `sd_spe_tissues`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- 
-- Table - `sd_spe_urines`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `sd_spe_urines` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0',
  `aspect` varchar(30) default NULL,
  `collected_volume` decimal(10,5) default NULL,
  `collected_volume_unit` varchar(20) default NULL,
  `received_volume` decimal(10,5) default NULL,
  `received_volume_unit` varchar(20) default NULL,
  `pellet` varchar(10) default NULL,
  `pellet_volume` decimal(10,5) default NULL,
  `pellet_volume_unit` varchar(20) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `sd_spe_urines` ADD INDEX ( `sample_master_id` );

ALTER TABLE `sd_spe_urines`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- 
-- Table - `sd_spe_peritoneal_washes`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `sd_spe_peritoneal_washes` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0',
  `collected_volume` decimal(10,5) default NULL,
  `collected_volume_unit` varchar(20) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `sd_spe_peritoneal_washes` ADD INDEX ( `sample_master_id` );

ALTER TABLE `sd_spe_peritoneal_washes`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- 
-- Table - `sd_spe_cystic_fluids`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `sd_spe_cystic_fluids` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0',
  `collected_volume` decimal(10,5) default NULL,
  `collected_volume_unit` varchar(20) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `sd_spe_cystic_fluids` ADD INDEX ( `sample_master_id` );

ALTER TABLE `sd_spe_cystic_fluids`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- 
-- Table - `sd_spe_other_fluids`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `sd_spe_other_fluids` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0',
  `collected_volume` decimal(10,5) default NULL,
  `collected_volume_unit` varchar(20) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `sd_spe_other_fluids` ADD INDEX ( `sample_master_id` );

ALTER TABLE `sd_spe_other_fluids`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- 
-- Table - `derivative_details`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `derivative_details` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0',
  `creation_site` varchar(30) default NULL, 
  `creation_by` varchar(20) default NULL,
  `creation_datetime` datetime default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `derivative_details` ADD INDEX ( `sample_master_id` );

ALTER TABLE `derivative_details`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- 
-- Table - `sd_der_cell_cultures`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `sd_der_cell_cultures` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0',
  `culture_status` varchar(30) default NULL,  
  `culture_status_reason` varchar(30) default NULL,  
  `cell_passage_number` int(6) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `sd_der_cell_cultures` ADD INDEX ( `sample_master_id` );

ALTER TABLE `sd_der_cell_cultures`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- 
-- Table - `sd_der_plasmas`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `sd_der_plasmas` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0',
  `hemolyze_signs` varchar(10) default NULL, 
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `sd_der_plasmas` ADD INDEX ( `sample_master_id` );

ALTER TABLE `sd_der_plasmas`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- 
-- Table - `sd_der_serums`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `sd_der_serums` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0',
  `hemolyze_signs` varchar(10) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL, 
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `sd_der_serums` ADD INDEX ( `sample_master_id` );

ALTER TABLE `sd_der_serums`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- ---------------------------------------------------------------------
-- ALIQUOT
-- ---------------------------------------------------------------------

-- 
-- Table - `aliquot_controls`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `aliquot_controls` (
  `id` int(11) NOT NULL auto_increment,
  `aliquot_type` varchar(30) NOT NULL default '',
  `status` enum('inactive','active') default 'inactive',
  `form_alias` varchar(50) default NULL,
  `detail_tablename` varchar(50) default NULL,
  `volume_unit` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

-- 
-- Table - `sample_aliquot_control_links`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `sample_aliquot_control_links` (
  `id` int(11) NOT NULL auto_increment,
  `sample_control_id` int(11) NOT NULL default '0',
  `aliquot_control_id` int(11) NOT NULL default '0',
  `status` enum('inactive','active') default 'inactive',
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `sample_aliquot_control_links` ADD INDEX ( `sample_control_id` );

ALTER TABLE `sample_aliquot_control_links`
ADD FOREIGN KEY (sample_control_id)
REFERENCES sample_controls (id)
;

ALTER TABLE `sample_aliquot_control_links` ADD INDEX ( `aliquot_control_id` );

ALTER TABLE `sample_aliquot_control_links`
ADD FOREIGN KEY (aliquot_control_id)
REFERENCES aliquot_controls (id)
;

-- 
-- Table - `aliquot_masters`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `aliquot_masters` (
  `id` int(11) NOT NULL auto_increment,
  `barcode` varchar(60) NOT NULL default '',
  `aliquot_type` varchar(30) NOT NULL default '',
  `aliquot_control_id` int(11) NOT NULL default '0',
  `collection_id` int(11) NOT NULL default '0',
  `sample_master_id` int(11) NOT NULL default '0',
  `sop_master_id` int(11) default NULL,
  `initial_volume` decimal(10,5) default NULL,
  `current_volume` decimal(10,5) default NULL,
  `aliquot_volume_unit` varchar(20) default NULL,
  `status` varchar(30) default NULL,
  `status_reason` varchar(30) default NULL,
  `study_summary_id` int(11) default NULL,
  `storage_datetime` datetime default NULL,
  `storage_master_id` int(11) default NULL,
  `storage_coord_x` varchar(11) default NULL,
  `storage_coord_y` varchar(11) default NULL,
  `product_code` varchar(20) default NULL,   
  `notes` text,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `aliquot_masters` ADD INDEX ( `aliquot_control_id` );

ALTER TABLE `aliquot_masters`
ADD FOREIGN KEY (aliquot_control_id)
REFERENCES aliquot_controls (id)
;

ALTER TABLE `aliquot_masters` ADD INDEX ( `collection_id` );

ALTER TABLE `aliquot_masters`
ADD FOREIGN KEY (collection_id)
REFERENCES collections (id)
;

ALTER TABLE `aliquot_masters` ADD INDEX ( `sample_master_id` );

ALTER TABLE `aliquot_masters`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

ALTER TABLE `aliquot_masters` ADD INDEX ( `sop_master_id` );

ALTER TABLE `aliquot_masters`
ADD FOREIGN KEY (sop_master_id)
REFERENCES sop_masters (id)
;

ALTER TABLE `aliquot_masters` ADD INDEX ( `study_summary_id` );

ALTER TABLE `aliquot_masters`
ADD FOREIGN KEY (study_summary_id)
REFERENCES study_summaries (id)
;

-- 
-- Table - `aliquot_uses`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `aliquot_uses` (
  `id` int(11) NOT NULL auto_increment,
  `aliquot_master_id` int(11) NOT NULL default '0',
  `use_definition` varchar(30) default NULL,
  `use_details` varchar(250) default NULL,
  `use_recorded_into_table` varchar(40) default NULL,
  `used_volume` decimal(10,5) default NULL,
  `use_datetime` datetime default NULL,
  `study_summary_id` int(11) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `aliquot_uses` ADD INDEX ( `aliquot_master_id` );

ALTER TABLE `aliquot_uses`
ADD FOREIGN KEY (aliquot_master_id)
REFERENCES aliquot_masters (id)
;

ALTER TABLE `aliquot_uses` ADD INDEX ( `study_summary_id` );

ALTER TABLE `aliquot_uses`
ADD FOREIGN KEY (study_summary_id)
REFERENCES study_summaries (id)
;


-- 
-- Table - `source_aliquots`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `source_aliquots` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0',
  `aliquot_master_id` int(11) NOT NULL default '0',
  `aliquot_use_id` int(11) NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `source_aliquots` ADD INDEX ( `aliquot_master_id` );

ALTER TABLE `source_aliquots`
ADD FOREIGN KEY (aliquot_master_id)
REFERENCES aliquot_masters (id)
;

ALTER TABLE `source_aliquots` ADD INDEX ( `aliquot_use_id` );

ALTER TABLE `source_aliquots`
ADD FOREIGN KEY (aliquot_use_id)
REFERENCES aliquot_uses (id)
;

ALTER TABLE `source_aliquots` ADD INDEX ( `sample_master_id` );

ALTER TABLE `source_aliquots`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- 
-- Table - `ad_tubes`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `ad_tubes` (
  `id` int(11) NOT NULL auto_increment,
  `aliquot_master_id` int(11) NOT NULL default '0',
  `concentration` decimal(10,2) default NULL,
  `concentration_unit` varchar(20) default NULL,
  `lot_number` varchar(30) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=1 ;

ALTER TABLE `ad_tubes` ADD INDEX ( `aliquot_master_id` );

ALTER TABLE `ad_tubes`
ADD FOREIGN KEY (aliquot_master_id)
REFERENCES aliquot_masters (id)
;

-- 
-- Table - `ad_blocks`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `ad_blocks` (
  `id` int(11) NOT NULL auto_increment,
  `aliquot_master_id` int(11) NOT NULL default '0',
  `type` varchar(30) default NULL,
  `patho_dpt_block_code` varchar(30) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=1 ;

ALTER TABLE `ad_blocks` ADD INDEX ( `aliquot_master_id` );

ALTER TABLE `ad_blocks`
ADD FOREIGN KEY (aliquot_master_id)
REFERENCES aliquot_masters (id)
;

-- 
-- Table - `ad_tissue_slides`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `ad_tissue_slides` (
  `id` int(11) NOT NULL auto_increment,
  `aliquot_master_id` int(11) NOT NULL default '0',
  `immunochemistry` varchar(30) default NULL,
  `ad_block_id` int(11) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=1 ;

ALTER TABLE `ad_tissue_slides` ADD INDEX ( `aliquot_master_id` );

ALTER TABLE `ad_tissue_slides`
ADD FOREIGN KEY (aliquot_master_id)
REFERENCES aliquot_masters (id)
;

ALTER TABLE `ad_tissue_slides` ADD INDEX ( `ad_block_id` );

ALTER TABLE `ad_tissue_slides`
ADD FOREIGN KEY (ad_block_id)
REFERENCES ad_blocks (id)
;

-- 
-- Table - `ad_whatman_papers`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `ad_whatman_papers` (
  `id` int(11) NOT NULL auto_increment,
  `aliquot_master_id` int(11) NOT NULL default '0',
  `used_blood_volume` decimal(10,5) default NULL,
  `used_blood_volume_unit` varchar(20) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `ad_whatman_papers` ADD INDEX ( `aliquot_master_id` );

ALTER TABLE `ad_whatman_papers`
ADD FOREIGN KEY (aliquot_master_id)
REFERENCES aliquot_masters (id)
;

-- 
-- Table - `ad_tissue_cores`
-- 

CREATE TABLE `ad_tissue_cores` (
  `id` int(11) NOT NULL auto_increment,
  `aliquot_master_id` int(11) NOT NULL default '0',
  `ad_block_id` int(11) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `ad_tissue_cores` ADD INDEX ( `aliquot_master_id` );

ALTER TABLE `ad_tissue_cores`
ADD FOREIGN KEY (aliquot_master_id)
REFERENCES aliquot_masters (id)
;

ALTER TABLE `ad_tissue_cores` ADD INDEX ( `ad_block_id` );

ALTER TABLE `ad_tissue_cores`
ADD FOREIGN KEY (ad_block_id)
REFERENCES ad_blocks (id)
;

-- 
-- Table - `ad_cell_slides`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `ad_cell_slides` (
  `id` int(11) NOT NULL auto_increment,
  `aliquot_master_id` int(11) NOT NULL default '0',
  `immunochemistry` varchar(30) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=1 ;

ALTER TABLE `ad_cell_slides` ADD INDEX ( `aliquot_master_id` );

ALTER TABLE `ad_cell_slides`
ADD FOREIGN KEY (aliquot_master_id)
REFERENCES aliquot_masters (id)
;

-- 
-- Table - `ad_cell_tubes`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `ad_cell_tubes` (
  `id` int(11) NOT NULL auto_increment,
  `aliquot_master_id` int(11) NOT NULL default '0',
  `lot_number` varchar(30) default NULL,
  `concentration` decimal(10,2) default NULL,
  `concentration_unit` varchar(20) default NULL,
  `cell_count` decimal(10,2) default NULL,
  `cell_count_unit` varchar(20) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=1 ;

ALTER TABLE `ad_cell_tubes` ADD INDEX ( `aliquot_master_id` );

ALTER TABLE `ad_cell_tubes`
ADD FOREIGN KEY (aliquot_master_id)
REFERENCES aliquot_masters (id)
;

-- 
-- Table - `ad_gel_matrices`
-- 

CREATE TABLE `ad_gel_matrices` (
  `id` int(11) NOT NULL auto_increment,
  `aliquot_master_id` int(11) NOT NULL default '0',
  `cell_count` decimal(10,2) default NULL,
  `cell_count_unit` varchar(20) default NULL,  
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `ad_gel_matrices` ADD INDEX ( `aliquot_master_id` );

ALTER TABLE `ad_gel_matrices`
ADD FOREIGN KEY (aliquot_master_id)
REFERENCES aliquot_masters (id)
;

-- 
-- Table - `ad_cell_cores`
-- 

CREATE TABLE `ad_cell_cores` (
  `id` int(11) NOT NULL auto_increment,
  `aliquot_master_id` int(11) NOT NULL default '0',
  `ad_gel_matrix_id` int(11) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `ad_cell_cores` ADD INDEX ( `aliquot_master_id` );

ALTER TABLE `ad_cell_cores`
ADD FOREIGN KEY (aliquot_master_id)
REFERENCES aliquot_masters (id)
;

ALTER TABLE `ad_cell_cores` ADD INDEX ( `ad_gel_matrix_id` );

ALTER TABLE `ad_cell_cores`
ADD FOREIGN KEY (ad_gel_matrix_id)
REFERENCES ad_gel_matrices (id)
;

-- ---------------------------------------------------------------------
-- QUALITY CONTROL
-- ---------------------------------------------------------------------

-- 
-- Table - `quality_controls`
-- 

-- Action: CREATE
-- Comments: n/a

CREATE TABLE `quality_controls` (
  `id` int(11) NOT NULL auto_increment,
  `sample_master_id` int(11) NOT NULL default '0', 
  `type` varchar(30) default NULL,
  `tool` varchar(30) default NULL,
  `run_id` varchar(30) default NULL,
  `date` date default NULL,
  `score` varchar(30) default NULL,  
  `unit` varchar(30) default NULL,  
  `conclusion` varchar(30) default NULL,   
  `notes` text,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `quality_controls` ADD INDEX ( `sample_master_id` );

ALTER TABLE `quality_controls`
ADD FOREIGN KEY (sample_master_id)
REFERENCES sample_masters (id)
;

-- 
-- Table - `qc_tested_aliquots`
-- 

-- Action: DROP
-- Comments: n/a



-- Action: CREATE
-- Comments: n/a

CREATE TABLE `qc_tested_aliquots` (
  `id` int(11) NOT NULL auto_increment,
  `quality_control_id` int(11) NOT NULL default '0',
  `aliquot_master_id` int(11) NOT NULL default '0',
  `aliquot_use_id` int(11) NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `qc_tested_aliquots` ADD INDEX ( `quality_control_id` );

ALTER TABLE `qc_tested_aliquots`
ADD FOREIGN KEY (quality_control_id)
REFERENCES quality_controls (id)
;

ALTER TABLE `qc_tested_aliquots` ADD INDEX ( `aliquot_master_id` );

ALTER TABLE `qc_tested_aliquots`
ADD FOREIGN KEY (aliquot_master_id)
REFERENCES aliquot_masters (id)
;

ALTER TABLE `qc_tested_aliquots` ADD INDEX ( `aliquot_use_id` );

ALTER TABLE `qc_tested_aliquots`
ADD FOREIGN KEY (aliquot_use_id)
REFERENCES aliquot_uses (id)
;

-- ---------------------------------------------------------------------
-- REALIQUOTING
-- ---------------------------------------------------------------------

CREATE TABLE `realiquotings` (
  `id` int(11) NOT NULL auto_increment,
  `parent_aliquot_master_id` int(11) NOT NULL default '0',
  `child_aliquot_master_id` int(11) NOT NULL default '0',
  `aliquot_use_id` int(11) NOT NULL default '0',
  `realiquoted_by` varchar(20) default NULL,
  `realiquoted_datetime` datetime default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL default '',
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,  
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=1 ;

ALTER TABLE `realiquotings` ADD INDEX ( `parent_aliquot_master_id` );

ALTER TABLE `realiquotings`
ADD FOREIGN KEY (parent_aliquot_master_id)
REFERENCES aliquot_masters (id)
;

ALTER TABLE `realiquotings` ADD INDEX ( `child_aliquot_master_id` );

ALTER TABLE `realiquotings`
ADD FOREIGN KEY (child_aliquot_master_id)
REFERENCES aliquot_masters (id)
;

ALTER TABLE `realiquotings` ADD INDEX ( `aliquot_use_id` );

ALTER TABLE `realiquotings`
ADD FOREIGN KEY (aliquot_use_id)
REFERENCES aliquot_uses (id)
;



