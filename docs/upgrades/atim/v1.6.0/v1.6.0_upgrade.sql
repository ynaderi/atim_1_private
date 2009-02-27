-- ----------------------------------------------------------------------------
-- PROTOCOL MANAGEMENT
-- ----------------------------------------------------------------------------

/* Added validation to protocol code. Field now required for entry. */

INSERT INTO `form_validations` ( `id` , `form_field_id` , `expression` , `message` , `created` , `created_by` , `modified` , `modifed_by` ) VALUES
(NULL , 'CAN-999-999-000-999-302', '/.+/', 'err_protocol code is required', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('err_protocol code is required', 'global', 'Protocol code is required!', '');

-- ----------------------------------------------------------------------------
-- CLINICAL ANNOTATION
-- ----------------------------------------------------------------------------

/* Set created and modifed fields to DATETIME for all treatment tables */

ALTER TABLE `tx_masters` CHANGE `created` `created` DATETIME NOT NULL DEFAULT '0000-00-00',
CHANGE `modified` `modified` DATETIME NOT NULL DEFAULT '0000-00-00';

ALTER TABLE `txd_chemos` CHANGE `created` `created` DATETIME NOT NULL DEFAULT '0000-00-00',
CHANGE `modified` `modified` DATETIME NOT NULL DEFAULT '0000-00-00';

ALTER TABLE `txe_chemos` CHANGE `created` `created` DATETIME NOT NULL DEFAULT '0000-00-00',
CHANGE `modified` `modified` DATETIME NOT NULL DEFAULT '0000-00-00';

ALTER TABLE `txe_radiations` CHANGE `created` `created` DATETIME NOT NULL DEFAULT '0000-00-00',
CHANGE `modified` `modified` DATETIME NOT NULL DEFAULT '0000-00-00';

ALTER TABLE `txe_surgeries` CHANGE `created` `created` DATETIME NOT NULL DEFAULT '0000-00-00',
CHANGE `modified` `modified` DATETIME NOT NULL DEFAULT '0000-00-00';


/* Add help text and related translations for diagnosis form */

UPDATE `form_fields` SET `language_help` = 'help_dx method', `install_location_id` = '' WHERE `id` = 'CAN-999-999-000-999-69' LIMIT 1 ;
INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('help_dx method', 'global', 'The most definitive diagnostic procedure before radiotherapy (to primary site) and/or chemotherapy is given, by which a malignancy is diagnosed within 3 months of the earliest known encounter with the health care system for (an investigation relating to) that tumour.', '');

UPDATE `form_fields` SET `language_help` = 'dx_laterality', `install_location_id` = '' WHERE `id` = 'CAN-999-999-000-002-11' LIMIT 1 ;
INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('dx_laterality', 'global', 'Side of the tumour in paired organs or skin sites.', '');

UPDATE `form_fields` SET `language_help` = 'help_dx origin', `install_location_id` = '' WHERE `id` = 'CAN-999-999-000-999-91' LIMIT 1 ;
INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('help_dx origin', 'global', 'A primary diagnosis indicates the start of a new patient disease. A secondary diagnosis indicates a progression or metastatic from the primary site.', '');

UPDATE `form_fields` SET `language_help` = 'help_dx nature', `install_location_id` = '' WHERE `id` = 'CAN-999-999-000-999-70' LIMIT 1 ;
INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('help_dx nature', 'global', 'Indicates the nature of the disease coded in the Registry abstract.', '');

UPDATE `form_fields` SET `language_help` = 'help_dx_case number', `install_location_id` = '' WHERE `id` = 'CAN-999-999-000-999-1221' LIMIT 1 ;
UPDATE `form_fields` SET `language_help` = 'help_dx_case number', `install_location_id` = '' WHERE `id` = 'CAN-999-999-000-999-76' LIMIT 1 ;
UPDATE `form_fields` SET `language_help` = 'help_dx_case number', `install_location_id` = '' WHERE `id` = 'CAN-999-999-000-999-76.2' LIMIT 1 ;
INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('help_dx_case number', 'global', 'A counter indicating the number of primary malignant tumors a patient has.', '');

-- ----------------------------------------------------------------------------
-- ALL PLUGINS
-- ----------------------------------------------------------------------------

/* Change db fields sizes */

ALTER TABLE `collections` 
CHANGE `reception_by` `reception_by` VARCHAR( 50 ) NULL DEFAULT NULL; 
ALTER TABLE `collections` 
CHANGE `collection_property` `collection_property` VARCHAR( 50 ) NULL DEFAULT NULL;
ALTER TABLE `derivative_details` 
CHANGE `creation_by` `creation_by` VARCHAR( 50 ) NULL DEFAULT NULL;
ALTER TABLE `diagnoses` 
CHANGE `dx_number` `dx_number` VARCHAR( 50 ) NULL DEFAULT NULL;
ALTER TABLE `orders` 
CHANGE `order_number` `order_number` VARCHAR( 255 ) NOT NULL;
ALTER TABLE `participant_messages` 
CHANGE `due_date` `due_date` DATETIME NULL DEFAULT NULL;
ALTER TABLE `protocol_masters` 
CHANGE `name` `name` VARCHAR( 255 ) NULL DEFAULT NULL;
ALTER TABLE `storage_masters` 
CHANGE `short_label` `short_label` VARCHAR( 10 ) NULL;

-- ----------------------------------------------------------------------------
-- QUERY TOOL
-- ----------------------------------------------------------------------------

/* Default warning message on export of data via CSV */

INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('export csv confirmation message', 'global', 'Respect and protect the privacy of others! The data you are exporting may contain personal identifiers. Always follow your institution''s confidential data handling policies. Do not share this information outside your Biobank without prior approval from your Biobank''s director.', '');

-- ----------------------------------------------------------------------------
-- ALL PLUGINS
-- ----------------------------------------------------------------------------

/* Drop db tables duplicated key */

ALTER TABLE collections DROP KEY sop_master_id_2;
ALTER TABLE derivative_details DROP KEY sample_master_id_2;
ALTER TABLE derived_sample_links DROP KEY source_sample_control_id_2;
ALTER TABLE derived_sample_links DROP KEY derived_sample_control_id_2;
ALTER TABLE sample_masters DROP KEY sample_control_id_2;
ALTER TABLE sample_masters DROP KEY initial_specimen_sample_id_2;
ALTER TABLE sample_masters DROP KEY parent_id_2;
ALTER TABLE sample_masters DROP KEY collection_id_2;
ALTER TABLE sample_masters DROP KEY sop_master_id_2;
ALTER TABLE sd_der_cell_cultures DROP KEY sample_master_id_2;
ALTER TABLE sd_der_plasmas DROP KEY sample_master_id_2;
ALTER TABLE sd_der_serums DROP KEY sample_master_id_2;
ALTER TABLE sd_spe_ascites DROP KEY sample_master_id_2;
ALTER TABLE sd_spe_bloods DROP KEY sample_master_id_2;
ALTER TABLE sd_spe_cystic_fluids DROP KEY sample_master_id_2;
ALTER TABLE sd_spe_other_fluids DROP KEY sample_master_id_2;
ALTER TABLE sd_spe_peritoneal_washes DROP KEY sample_master_id_2;
ALTER TABLE sd_spe_tissues DROP KEY sample_master_id_2;
ALTER TABLE sd_spe_urines DROP KEY sample_master_id_2;
ALTER TABLE specimen_details DROP KEY sample_master_id_2;

-- ----------------------------------------------------------------------------
-- ALL PLUGINS
-- ----------------------------------------------------------------------------

/* CHANGE TABLES TYPE TO INNODB AND  */

ALTER TABLE `ad_blocks`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `ad_cell_cores`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `ad_cell_slides`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `ad_cell_tubes`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `ad_gel_matrices`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `ad_tissue_cores`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `ad_tissue_slides`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `ad_tubes`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `ad_whatman_papers`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `aliquot_controls`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `aliquot_uses`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `collections`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `datamart_adhoc_favourites`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `datamart_adhoc_saved`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `derivative_details`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `derived_sample_links`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `ed_breast_lab_pathology`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `form_formats`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `orders`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `order_items`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `order_lines`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `participant_messages`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `qc_tested_aliquots`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `quality_controls`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `rd_blood_cells`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `rd_breast_cancers`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `realiquotings`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `reproductive_histories`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `review_controls`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `review_masters`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `sample_aliquot_control_links`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `sample_controls`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `sample_masters`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `sd_der_cell_cultures`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `sd_der_plasmas`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `sd_der_serums`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `sd_spe_ascites`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `sd_spe_bloods`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `sd_spe_cystic_fluids`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `sd_spe_other_fluids`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `sd_spe_peritoneal_washes`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `sd_spe_tissues`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `sd_spe_urines`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `shipments`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `source_aliquots`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `specimen_details`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `std_incubators`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `std_rooms`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `std_tma_blocks`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `storage_controls`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `storage_coordinates`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `storage_masters`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `tma_slides`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `txe_chemos`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `install_disease_sites`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `install_locations`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
ALTER TABLE `install_studies`  ENGINE = innodb DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;

-- ----------------------------------------------------------------------------
-- INVENTORY
-- ----------------------------------------------------------------------------

/* ADD FK CONSTRAINTS  */

SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE ad_blocks DROP CONSTRAINT ad_blocks_ibfk_1;
  ADD CONSTRAINT `ad_blocks_ibfk_1` FOREIGN KEY (`aliquot_master_id`) REFERENCES `aliquot_masters` (`id`);

ALTER TABLE `ad_cell_cores`
  ADD CONSTRAINT `ad_cell_cores_ibfk_1` FOREIGN KEY (`aliquot_master_id`) REFERENCES `aliquot_masters` (`id`),  
  ADD CONSTRAINT `ad_cell_cores_ibfk_2` FOREIGN KEY (`ad_gel_matrix_id`) REFERENCES `ad_gel_matrices` (`id`);

ALTER TABLE `ad_cell_slides`
  ADD CONSTRAINT `ad_cell_slides_ibfk_1` FOREIGN KEY (`aliquot_master_id`) REFERENCES `aliquot_masters` (`id`);

ALTER TABLE `ad_cell_tubes`
  ADD CONSTRAINT `ad_cell_tubes_ibfk_1` FOREIGN KEY (`aliquot_master_id`) REFERENCES `aliquot_masters` (`id`);

ALTER TABLE `ad_gel_matrices`
  ADD CONSTRAINT `ad_gel_matrices_ibfk_1` FOREIGN KEY (`aliquot_master_id`) REFERENCES `aliquot_masters` (`id`);

ALTER TABLE `ad_tissue_cores`
  ADD CONSTRAINT `ad_tissue_cores_ibfk_1` FOREIGN KEY (`aliquot_master_id`) REFERENCES `aliquot_masters` (`id`),  
  ADD CONSTRAINT `ad_tissue_cores_ibfk_2` FOREIGN KEY (`ad_block_id`) REFERENCES `ad_blocks` (`id`);

ALTER TABLE `ad_tissue_slides`
  ADD CONSTRAINT `ad_tissue_slides_ibfk_1` FOREIGN KEY (`aliquot_master_id`) REFERENCES `aliquot_masters` (`id`),  
  ADD CONSTRAINT `ad_tissue_slides_ibfk_2` FOREIGN KEY (`ad_block_id`) REFERENCES `ad_blocks` (`id`);

ALTER  TABLE `ad_tubes`
  ADD CONSTRAINT `ad_tubes_ibfk_1` FOREIGN KEY (`aliquot_master_id`) REFERENCES `aliquot_masters` (`id`);

ALTER TABLE `ad_whatman_papers`
  ADD CONSTRAINT `ad_whatman_papers_ibfk_1` FOREIGN KEY (`aliquot_master_id`) REFERENCES `aliquot_masters` (`id`);

ALTER TABLE `aliquot_masters`
  ADD CONSTRAINT `aliquot_masters_ibfk_1` FOREIGN KEY (`aliquot_control_id`) REFERENCES `aliquot_controls` (`id`),  
  ADD CONSTRAINT `aliquot_masters_ibfk_2` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`),  
  ADD CONSTRAINT `aliquot_masters_ibfk_3` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`),  
  ADD CONSTRAINT `aliquot_masters_ibfk_4` FOREIGN KEY (`sop_master_id`) REFERENCES `sop_masters` (`id`),  
  ADD CONSTRAINT `aliquot_masters_ibfk_5` FOREIGN KEY (`study_summary_id`) REFERENCES `study_summaries` (`id`),  
  ADD CONSTRAINT `aliquot_masters_ibfk_6` FOREIGN KEY (`storage_master_id`) REFERENCES `storage_masters` (`id`);

ALTER TABLE `aliquot_uses`
  ADD CONSTRAINT `aliquot_uses_ibfk_1` FOREIGN KEY (`aliquot_master_id`) REFERENCES `aliquot_masters` (`id`),  
  ADD CONSTRAINT `aliquot_uses_ibfk_2` FOREIGN KEY (`study_summary_id`) REFERENCES `study_summaries` (`id`);

ALTER TABLE `collections`
  ADD CONSTRAINT `collections_ibfk_1` FOREIGN KEY (`sop_master_id`) REFERENCES `sop_masters` (`id`);

ALTER TABLE `derivative_details`
  ADD CONSTRAINT `derivative_details_ibfk_1` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `derived_sample_links`
  ADD CONSTRAINT `derived_sample_links_ibfk_1` FOREIGN KEY (`source_sample_control_id`) REFERENCES `sample_controls` (`id`),  
  ADD CONSTRAINT `derived_sample_links_ibfk_2` FOREIGN KEY (`derived_sample_control_id`) REFERENCES `sample_controls` (`id`);

ALTER TABLE `qc_tested_aliquots`
  ADD CONSTRAINT `qc_tested_aliquots_ibfk_1` FOREIGN KEY (`quality_control_id`) REFERENCES `quality_controls` (`id`),  ADD CONSTRAINT `qc_tested_aliquots_ibfk_2` FOREIGN KEY (`aliquot_master_id`) REFERENCES `aliquot_masters` (`id`),  ADD CONSTRAINT `qc_tested_aliquots_ibfk_3` FOREIGN KEY (`aliquot_use_id`) REFERENCES `aliquot_uses` (`id`);

ALTER TABLE `quality_controls`
  ADD CONSTRAINT `quality_controls_ibfk_1` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `realiquotings`
  ADD CONSTRAINT `realiquotings_ibfk_1` FOREIGN KEY (`parent_aliquot_master_id`) REFERENCES `aliquot_masters` (`id`),  ADD CONSTRAINT `realiquotings_ibfk_2` FOREIGN KEY (`child_aliquot_master_id`) REFERENCES `aliquot_masters` (`id`),  ADD CONSTRAINT `realiquotings_ibfk_3` FOREIGN KEY (`aliquot_use_id`) REFERENCES `aliquot_uses` (`id`);

ALTER TABLE `sample_aliquot_control_links`
  ADD CONSTRAINT `sample_aliquot_control_links_ibfk_1` FOREIGN KEY (`sample_control_id`) REFERENCES `sample_controls` (`id`),  ADD CONSTRAINT `sample_aliquot_control_links_ibfk_2` FOREIGN KEY (`aliquot_control_id`) REFERENCES `aliquot_controls` (`id`);

ALTER TABLE `sample_masters`
  ADD CONSTRAINT `sample_masters_ibfk_1` FOREIGN KEY (`sample_control_id`) REFERENCES `sample_controls` (`id`),  ADD CONSTRAINT `sample_masters_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `sample_masters` (`id`),  ADD CONSTRAINT `sample_masters_ibfk_3` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`),  ADD CONSTRAINT `sample_masters_ibfk_4` FOREIGN KEY (`sop_master_id`) REFERENCES `sop_masters` (`id`);

ALTER TABLE `sd_der_cell_cultures`
  ADD CONSTRAINT `sd_der_cell_cultures_ibfk_1` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `sd_der_plasmas`
  ADD CONSTRAINT `sd_der_plasmas_ibfk_1` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `sd_der_serums`
  ADD CONSTRAINT `sd_der_serums_ibfk_1` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `sd_spe_ascites`
  ADD CONSTRAINT `sd_spe_ascites_ibfk_1` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `sd_spe_bloods`
  ADD CONSTRAINT `sd_spe_bloods_ibfk_1` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `sd_spe_cystic_fluids`
  ADD CONSTRAINT `sd_spe_cystic_fluids_ibfk_1` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `sd_spe_other_fluids`
  ADD CONSTRAINT `sd_spe_other_fluids_ibfk_1` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `sd_spe_peritoneal_washes`
  ADD CONSTRAINT `sd_spe_peritoneal_washes_ibfk_1` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `sd_spe_tissues`
  ADD CONSTRAINT `sd_spe_tissues_ibfk_1` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `sd_spe_urines`
  ADD CONSTRAINT `sd_spe_urines_ibfk_1` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `source_aliquots`
  ADD CONSTRAINT `source_aliquots_ibfk_1` FOREIGN KEY (`aliquot_master_id`) REFERENCES `aliquot_masters` (`id`),  ADD CONSTRAINT `source_aliquots_ibfk_2` FOREIGN KEY (`aliquot_use_id`) REFERENCES `aliquot_uses` (`id`),  ADD CONSTRAINT `source_aliquots_ibfk_3` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `specimen_details`
  ADD CONSTRAINT `specimen_details_ibfk_1` FOREIGN KEY (`sample_master_id`) REFERENCES `sample_masters` (`id`);

ALTER TABLE `std_incubators`
  ADD CONSTRAINT `std_incubators_ibfk_1` FOREIGN KEY (`storage_master_id`) REFERENCES `storage_masters` (`id`);

ALTER TABLE `std_rooms`
  ADD CONSTRAINT `std_rooms_ibfk_1` FOREIGN KEY (`storage_master_id`) REFERENCES `storage_masters` (`id`);

ALTER TABLE `std_tma_blocks`
  ADD CONSTRAINT `std_tma_blocks_ibfk_1` FOREIGN KEY (`storage_master_id`) REFERENCES `storage_masters` (`id`),  ADD CONSTRAINT `std_tma_blocks_ibfk_2` FOREIGN KEY (`sop_master_id`) REFERENCES `sop_masters` (`id`);

ALTER TABLE `storage_coordinates`
  ADD CONSTRAINT `storage_coordinates_ibfk_1` FOREIGN KEY (`storage_master_id`) REFERENCES `storage_masters` (`id`);

ALTER TABLE `storage_masters`
  ADD CONSTRAINT `storage_masters_ibfk_1` FOREIGN KEY (`storage_control_id`) REFERENCES `storage_controls` (`id`),  ADD CONSTRAINT `storage_masters_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `storage_masters` (`id`);

ALTER TABLE `tma_slides`
  ADD CONSTRAINT `tma_slides_ibfk_1` FOREIGN KEY (`storage_master_id`) REFERENCES `storage_masters` (`id`),  ADD CONSTRAINT `tma_slides_ibfk_2` FOREIGN KEY (`sop_master_id`) REFERENCES `sop_masters` (`id`),  ADD CONSTRAINT `tma_slides_ibfk_3` FOREIGN KEY (`std_tma_block_id`) REFERENCES `std_tma_blocks` (`id`);

SET FOREIGN_KEY_CHECKS=1;

-- ----------------------------------------------------------------------------
-- INVENTORY
-- ----------------------------------------------------------------------------

/* Update aliquot_controls.aliquot_type to be consistant with the rest of the tables content. See issue 487 */

UPDATE aliquot_masters SET aliquot_type = 'core' 
WHERE aliquot_control_id IN (SELECT id FROM aliquot_controls WHERE aliquot_type = 'cell core');
UPDATE aliquot_controls SET aliquot_type = 'core' WHERE aliquot_type = 'cell core';

UPDATE aliquot_masters SET aliquot_type = 'core' 
WHERE aliquot_control_id IN (SELECT id FROM aliquot_controls WHERE aliquot_type = 'tissue core');
UPDATE aliquot_controls SET aliquot_type = 'core' WHERE aliquot_type = 'tissue core';

UPDATE aliquot_masters SET aliquot_type = 'slide' 
WHERE aliquot_control_id IN (SELECT id FROM aliquot_controls WHERE aliquot_type = 'tissue slide');
UPDATE aliquot_controls SET aliquot_type = 'slide' WHERE aliquot_type = 'tissue slide';

UPDATE aliquot_masters SET aliquot_type = 'slide' 
WHERE aliquot_control_id IN (SELECT id FROM aliquot_controls WHERE aliquot_type = 'cell slide');
UPDATE aliquot_controls SET aliquot_type = 'slide' WHERE aliquot_type = 'cell slide';

DELETE FROM form_fields_global_lookups 
WHERE lookup_id IN (SELECT id FROM `global_lookups` WHERE `alias` LIKE 'aliquot_type' AND `value` LIKE 'cell core');
DELETE FROM global_lookups WHERE `alias` LIKE 'aliquot_type' AND `value` LIKE 'cell core';

DELETE FROM form_fields_global_lookups 
WHERE lookup_id IN (SELECT id FROM `global_lookups` WHERE `alias` LIKE 'aliquot_type' AND `value` LIKE 'cell slide');
DELETE FROM global_lookups WHERE `alias` LIKE 'aliquot_type' AND `value` LIKE 'cell slide';

DELETE FROM form_fields_global_lookups 
WHERE lookup_id IN (SELECT id FROM `global_lookups` WHERE `alias` LIKE 'aliquot_type' AND `value` LIKE 'tissue slide');
DELETE FROM global_lookups WHERE `alias` LIKE 'aliquot_type' AND `value` LIKE 'tissue slide';

DELETE FROM form_fields_global_lookups 
WHERE lookup_id IN (SELECT id FROM `global_lookups` WHERE `alias` LIKE 'aliquot_type' AND `value` LIKE 'tissue core');
DELETE FROM global_lookups WHERE `alias` LIKE 'aliquot_type' AND `value` LIKE 'tissue core';

DELETE FROM form_fields_global_lookups 
WHERE lookup_id IN (SELECT id FROM `global_lookups` WHERE `alias` LIKE 'aliquot_type' AND `value` LIKE 'cell tube');
DELETE FROM global_lookups WHERE `alias` LIKE 'aliquot_type' AND `value` LIKE 'cell tube';

DELETE FROM i18n WHERE id IN ('tissue core', 'tissue slide', 'cell slide', 'cell core', 'cell tube');

INSERT INTO `global_lookups` 
(`id`, `alias`, `section`, `subsection`, `value`, `language_choice`, `display_order`, `active`, 
`created`, `created_by`, `modified`, `modified_by`) 
VALUES 
(NULL, 'aliquot_type', NULL, NULL, 'slide', 'slide', 3, 'yes', NULL, NULL, NULL, NULL),
(NULL, 'aliquot_type', NULL, NULL, 'core', 'core', 4, 'yes', NULL, NULL, NULL, NULL);

INSERT INTO `form_fields_global_lookups` (`field_id`, `lookup_id`) 
VALUES 
('CAN-999-999-000-999-1102', (SELECT id FROM `global_lookups` WHERE `alias` LIKE 'aliquot_type' AND `value` LIKE 'core')),
('CAN-999-999-000-999-1102', (SELECT id FROM `global_lookups` WHERE `alias` LIKE 'aliquot_type' AND `value` LIKE 'slide'));

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) 
VALUES 
('core', 'global', 'Core', 'Core');

ALTER TABLE `aliquot_controls` 
ADD `comment` VARCHAR( 255 ) NULL ;

UPDATE `aliquot_controls` SET `comment` = 'Specimen tube' WHERE `id` = 1;
UPDATE `aliquot_controls` SET `comment` = 'Specimen tube requiring volume in ml' WHERE `id` = 2;
UPDATE `aliquot_controls` SET `comment` = 'Specimen bag' WHERE `id` = 3;
UPDATE `aliquot_controls` SET `comment` = 'Tissue block' WHERE `id` = 4;
UPDATE `aliquot_controls` SET `comment` = 'Tissue slide' WHERE `id` = 5;
UPDATE `aliquot_controls` SET `comment` = 'Blood whatman paper' WHERE `id` = 6;
UPDATE `aliquot_controls` SET `comment` = 'Derivative tube' WHERE `id` = 7;
UPDATE `aliquot_controls` SET `comment` = 'Derivative tube requiring volume in ml' WHERE `id` = 8;
UPDATE `aliquot_controls` SET `comment` = 'Derivative tube requiring volume in ml and concentration' WHERE `id` = 9;
UPDATE `aliquot_controls` SET `comment` = 'Cells slide' WHERE `id` = 10;
UPDATE `aliquot_controls` SET `comment` = 'Derivative tube requiring volume in ul and concentration' WHERE `id` = 11;
UPDATE `aliquot_controls` SET `comment` = 'Tissue core' WHERE `id` = 12;
UPDATE `aliquot_controls` SET `comment` = 'Cells gel matrix' WHERE `id` = 13;
UPDATE `aliquot_controls` SET `comment` = 'Cells core' WHERE `id` = 14;
UPDATE `aliquot_controls` SET `comment` = 'Derivative tube requiring volume in ml specific for cells' WHERE `id` = 15;











