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
