-- ---------------------------------------------------------------------
-- CTRApp - inventory management - sample and collection review 
-- DB Script Type: DML
--
-- Author: Nicolas Luc
-- Creation Date: 2008-06-11
-- Version: 0.01
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
--
-- ERRORS
--
-- ---------------------------------------------------------------------

DELETE FROM `pages`
WHERE `id` LIKE 'err_rev_master_%' ;

INSERT INTO `pages` 
(`id`, `error_flag`, `language_title`, `language_body`, `created`, `created_by`, `modified`, `modified_by`) 
VALUES 
('err_rev_master_general_error', 1, 'review master general error', 'an error has been detected during the process execution on your reviews', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

-- ---------------------------------------------------------------------
--
-- FORMS
--
-- ---------------------------------------------------------------------

-- ------------------------------------------------------------------------
-- alias = review_masters
-- ------------------------------------------------------------------------

DELETE FROM `forms` WHERE `alias` = 'review_masters';
INSERT INTO `forms` (`id`, `alias`, `language_title`, `language_help`, `flag_add_columns`, `flag_edit_columns`, `flag_search_columns`, `flag_detail_columns`, `created`, `created_by`, `modified`, `modified_by`) VALUES ('CAN-999-999-000-999-1066', 'review_masters', '', '', '0', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `form_fields` WHERE `id` IN ('CAN-999-999-000-999-1244',
'CAN-999-999-000-999-1245', 'CAN-999-999-000-999-1246', 'CAN-999-999-000-999-1252',
'CAN-999-999-000-999-1253', 'CAN-999-999-000-999-1254');
INSERT INTO `form_fields` (`id`, `model`, `field`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `created`, `created_by`, `modified`, `modified_by`) 
VALUES 
('CAN-999-999-000-999-1244', 'ReviewMaster', 'review_type', 'type', '', 'select', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1245', 'ReviewMaster', 'review_date', 'review date', '', 'date', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1246', 'ReviewMaster', 'review_status', 'status', '', 'select', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1252', 'ReviewMaster', 'sample_master_id', 'studied sample', '', 'select', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1253', 'ReviewMaster', 'pathologist', 'pathologist', '', 'input', 'size=30', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1254', 'ReviewMaster', 'comments', 'notes', '', 'textarea', 'cols=30,rows=4', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `global_lookups` WHERE `alias` IN ('review_status');
INSERT INTO `global_lookups` (`id`, `alias`, `section`, `subsection`, `value`, `language_choice`, `display_order`, `active`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
(NULL, 'review_status', NULL, NULL, 'in progress', 'in progress', 1, 'yes', NULL, NULL, NULL, NULL),
(NULL, 'review_status', NULL, NULL, 'completed', 'completed', 2, 'yes', NULL, NULL, NULL, NULL),
(NULL, 'review_status', NULL, NULL, 'stopped', 'stopped', 3, 'yes', NULL, NULL, NULL, NULL);

DELETE FROM `form_fields_global_lookups` WHERE `field_id` IN ('CAN-999-999-000-999-1246');
INSERT INTO `form_fields_global_lookups` ( `field_id` , `lookup_id`)
VALUES 
('CAN-999-999-000-999-1246', (SELECT `id` FROM `global_lookups` WHERE `alias` LIKE 'review_status' AND `value` like 'in progress')), 
('CAN-999-999-000-999-1246', (SELECT `id` FROM `global_lookups` WHERE `alias` LIKE 'review_status' AND `value` like 'completed')), 
('CAN-999-999-000-999-1246', (SELECT `id` FROM `global_lookups` WHERE `alias` LIKE 'review_status' AND `value` like 'stopped'));

DELETE FROM `form_formats` WHERE `form_id` = 'CAN-999-999-000-999-1066';
INSERT INTO `form_formats` (`id`, `form_id`, `field_id`, `display_column`, `display_order`, `language_heading`, `flag_override_label`, `language_label`, `flag_override_tag`, `language_tag`, `flag_override_help`, `language_help`, `flag_override_type`, `type`, `flag_override_setting`, `setting`, `flag_override_default`, `default`, `flag_add`, `flag_add_readonly`, `flag_edit`, `flag_edit_readonly`, `flag_search`, `flag_search_readonly`, `flag_datagrid`, `flag_datagrid_readonly`, `flag_index`, `flag_detail`, `created`, `created_by`, `modified`, `modified_by`) 
VALUES 
('CAN-999-999-000-999-1066_CAN-999-999-000-999-1244', 'CAN-999-999-000-999-1066', 'CAN-999-999-000-999-1244', '0', '1', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1066_CAN-999-999-000-999-1245', 'CAN-999-999-000-999-1066', 'CAN-999-999-000-999-1245', '0', '2', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1066_CAN-999-999-000-999-1246', 'CAN-999-999-000-999-1066', 'CAN-999-999-000-999-1246', '0', '3', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1066_CAN-999-999-000-999-1252', 'CAN-999-999-000-999-1066', 'CAN-999-999-000-999-1252', '0', '4', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

-- ------------------------------------------------------------------------
-- alias = rd_blood_cells
-- ------------------------------------------------------------------------

DELETE FROM `forms` WHERE `alias` = 'rd_blood_cells';
INSERT INTO `forms` (`id`, `alias`, `language_title`, `language_help`, `flag_add_columns`, `flag_edit_columns`, `flag_search_columns`, `flag_detail_columns`, `created`, `created_by`, `modified`, `modified_by`) VALUES ('CAN-999-999-000-999-1067', 'rd_blood_cells', '', '', '0', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `form_fields` WHERE `id` IN ('CAN-999-999-000-999-1247', 'CAN-999-999-000-999-1248',
'CAN-999-999-000-999-1249', 'CAN-999-999-000-999-1250', 'CAN-999-999-000-999-1251');
INSERT INTO `form_fields` (`id`, `model`, `field`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `created`, `created_by`, `modified`, `modified_by`) 
VALUES 
('CAN-999-999-000-999-1247', 'ReviewDetail', 'mmt', 'blood cell mmt review', '', 'input', 'size=20', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1248', 'ReviewDetail', 'fish', 'blood cell fish review', '', 'input', 'size=10', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1249', 'ReviewDetail', 'zap70', 'blood cell zap70 review', '', 'input', 'size=10', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1250', 'ReviewDetail', 'nq01', 'blood cell nq01 review', '', 'select', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1251', 'ReviewDetail', 'cd38', 'blood cell cd38 review', '', 'input', 'size=10', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `global_lookups` WHERE `alias` IN ('nq01_values');
INSERT INTO `global_lookups` (`id`, `alias`, `section`, `subsection`, `value`, `language_choice`, `display_order`, `active`, `created`, `created_by`, `modified`, `modified_by`) 
VALUES 
(NULL, 'nq01_values', NULL, NULL, '+/+', '+/+', 1, 'yes', NULL, NULL, NULL, NULL),
(NULL, 'nq01_values', NULL, NULL, '+/-', '+/-', 2, 'yes', NULL, NULL, NULL, NULL),
(NULL, 'nq01_values', NULL, NULL, '-/-', '-/-', 3, 'yes', NULL, NULL, NULL, NULL);

DELETE FROM `form_fields_global_lookups` WHERE `field_id` IN ('CAN-999-999-000-999-1250');
INSERT INTO `form_fields_global_lookups` ( `field_id` , `lookup_id`)
VALUES 
('CAN-999-999-000-999-1250', (SELECT `id` FROM `global_lookups` WHERE `alias` LIKE 'nq01_values' AND `value` like '+/+')), 
('CAN-999-999-000-999-1250', (SELECT `id` FROM `global_lookups` WHERE `alias` LIKE 'nq01_values' AND `value` like '+/-')), 
('CAN-999-999-000-999-1250', (SELECT `id` FROM `global_lookups` WHERE `alias` LIKE 'nq01_values' AND `value` like '-/-'));

DELETE FROM `form_validations` WHERE `form_field_id` IN ('CAN-999-999-000-999-1248', 
'CAN-999-999-000-999-1249', 'CAN-999-999-000-999-1251');
INSERT INTO `form_validations` (`id`, `form_field_id`, `expression`, `message`, `created`, `created_by`, `modified`, `modifed_by`) 
VALUES 
(NULL, 'CAN-999-999-000-999-1248', '/^\\d*([\\.]\\d*)?$/', 'volume should be a positif decimal', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(NULL, 'CAN-999-999-000-999-1249', '/^\\d*([\\.]\\d*)?$/', 'volume should be a positif decimal', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(NULL, 'CAN-999-999-000-999-1251', '/^\\d*([\\.]\\d*)?$/', 'volume should be a positif decimal', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `form_formats` WHERE `form_id` = 'CAN-999-999-000-999-1067';
INSERT INTO `form_formats` (`id`, `form_id`, `field_id`, `display_column`, `display_order`, `language_heading`, `flag_override_label`, `language_label`, `flag_override_tag`, `language_tag`, `flag_override_help`, `language_help`, `flag_override_type`, `type`, `flag_override_setting`, `setting`, `flag_override_default`, `default`, `flag_add`, `flag_add_readonly`, `flag_edit`, `flag_edit_readonly`, `flag_search`, `flag_search_readonly`, `flag_datagrid`, `flag_datagrid_readonly`, `flag_index`, `flag_detail`, `created`, `created_by`, `modified`, `modified_by`) 
VALUES 
('CAN-999-999-000-999-1067_CAN-999-999-000-999-1244', 'CAN-999-999-000-999-1067', 'CAN-999-999-000-999-1244', '0', '1', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '1', '1', '1', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1067_CAN-999-999-000-999-1245', 'CAN-999-999-000-999-1067', 'CAN-999-999-000-999-1245', '0', '2', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1067_CAN-999-999-000-999-1246', 'CAN-999-999-000-999-1067', 'CAN-999-999-000-999-1246', '0', '3', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1067_CAN-999-999-000-999-1252', 'CAN-999-999-000-999-1067', 'CAN-999-999-000-999-1252', '0', '4', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1067_CAN-999-999-000-999-1253', 'CAN-999-999-000-999-1067', 'CAN-999-999-000-999-1253', '0', '5', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1067_CAN-999-999-000-999-1254', 'CAN-999-999-000-999-1067', 'CAN-999-999-000-999-1254', '0', '6', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),

('CAN-999-999-000-999-1067_CAN-999-999-000-999-1247', 'CAN-999-999-000-999-1067', 'CAN-999-999-000-999-1247', '1', '10', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1067_CAN-999-999-000-999-1248', 'CAN-999-999-000-999-1067', 'CAN-999-999-000-999-1248', '1', '11', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1067_CAN-999-999-000-999-1249', 'CAN-999-999-000-999-1067', 'CAN-999-999-000-999-1249', '1', '12', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1067_CAN-999-999-000-999-1250', 'CAN-999-999-000-999-1067', 'CAN-999-999-000-999-1250', '1', '13', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1067_CAN-999-999-000-999-1251', 'CAN-999-999-000-999-1067', 'CAN-999-999-000-999-1251', '1', '14', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

-- ------------------------------------------------------------------------
-- alias = rd_breastcancertypes
-- ------------------------------------------------------------------------

DELETE FROM `forms` WHERE `alias` = 'rd_breast_cancers' OR `id` = 'CAN-999-999-000-999-22';
INSERT INTO `forms` (`id`, `alias`, `language_title`, `language_help`, `flag_add_columns`, `flag_edit_columns`, `flag_search_columns`, `flag_detail_columns`, `created`, `created_by`, `modified`, `modified_by`) VALUES ('CAN-999-999-000-999-22', 'rd_breast_cancers', '', '', '0', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `form_fields` WHERE `id` IN ('CAN-999-999-000-999-206',
'CAN-999-999-000-999-207', 'CAN-999-999-000-999-208', 'CAN-999-999-000-999-209', 
'CAN-999-999-000-999-211', 'CAN-999-999-000-999-212', 'CAN-059-002-000-999-319', 
'CAN-059-002-000-999-320', 'CAN-999-999-000-999-1255');

INSERT INTO `form_fields` (`id`, `model`, `field`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `created`, `created_by`, `modified`, `modified_by`) 
VALUES 
('CAN-999-999-000-999-206', 'ReviewDetail', 'invasive_percentage', 'Invasive (%)', '', 'number', 'size=10', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-207', 'ReviewDetail', 'in_situ_percentage', 'In-situ (%)', '', 'number', 'size=10', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-208', 'ReviewDetail', 'normal_percentage', 'Normal (%)', '', 'number', 'size=10', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-209', 'ReviewDetail', 'stroma_percentage', 'Stroma (%)', '', 'input', 'size=10', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-211', 'ReviewDetail', 'inflammation', 'Inflammation (0-3)', '', 'number', 'size=10', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-212', 'ReviewDetail', 'quality_score', 'Quality Score (1-3)', '', 'number', 'size=10', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-059-002-000-999-319', 'ReviewDetail', 'necrosis_inv_percentage', 'Necrosis (%) INV', '', 'number', 'size=10', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-059-002-000-999-320', 'ReviewDetail', 'necrosis_is_percentage', 'Necrosis (%) IS', '', 'number', 'size=10', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1255', 'ReviewDetail', 'fat_percentage', 'fat (%)', '', 'input', 'size=10', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `form_formats` WHERE `form_id` = 'CAN-999-999-000-999-22';
INSERT INTO `form_formats` (`id`, `form_id`, `field_id`, `display_column`, `display_order`, `language_heading`, `flag_override_label`, `language_label`, `flag_override_tag`, `language_tag`, `flag_override_help`, `language_help`, `flag_override_type`, `type`, `flag_override_setting`, `setting`, `flag_override_default`, `default`, `flag_add`, `flag_add_readonly`, `flag_edit`, `flag_edit_readonly`, `flag_search`, `flag_search_readonly`, `flag_datagrid`, `flag_datagrid_readonly`, `flag_index`, `flag_detail`, `created`, `created_by`, `modified`, `modified_by`) 
VALUES 
('CAN-999-999-000-999-22_CAN-999-999-000-999-1244', 'CAN-999-999-000-999-22', 'CAN-999-999-000-999-1244', '0', '1', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '1', '1', '1', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-22_CAN-999-999-000-999-1245', 'CAN-999-999-000-999-22', 'CAN-999-999-000-999-1245', '0', '2', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-22_CAN-999-999-000-999-1246', 'CAN-999-999-000-999-22', 'CAN-999-999-000-999-1246', '0', '3', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-22_CAN-999-999-000-999-1252', 'CAN-999-999-000-999-22', 'CAN-999-999-000-999-1252', '0', '4', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-22_CAN-999-999-000-999-1253', 'CAN-999-999-000-999-22', 'CAN-999-999-000-999-1253', '0', '5', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-22_CAN-999-999-000-999-1254', 'CAN-999-999-000-999-22', 'CAN-999-999-000-999-1254', '0', '6', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),

('CAN-999-999-000-999-22_CAN-999-999-000-999-206', 'CAN-999-999-000-999-22', 'CAN-999-999-000-999-206', '1', '9', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-22_CAN-999-999-000-999-207', 'CAN-999-999-000-999-22', 'CAN-999-999-000-999-207', '1', '10', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-22_CAN-999-999-000-999-208', 'CAN-999-999-000-999-22', 'CAN-999-999-000-999-208', '1', '11', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-22_CAN-999-999-000-999-209', 'CAN-999-999-000-999-22', 'CAN-999-999-000-999-209', '1', '12', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-22_CAN-999-999-000-999-211', 'CAN-999-999-000-999-22', 'CAN-999-999-000-999-211', '1', '13', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-22_CAN-999-999-000-999-212', 'CAN-999-999-000-999-22', 'CAN-999-999-000-999-212', '1', '14', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-22_CAN-059-002-000-999-319', 'CAN-999-999-000-999-22', 'CAN-059-002-000-999-319', '1', '15', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '1', '0', '0', '0', '1', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-22_CAN-059-002-000-999-320', 'CAN-999-999-000-999-22', 'CAN-059-002-000-999-320', '1', '16', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-22_CAN-999-999-000-999-1255', 'CAN-999-999-000-999-22', 'CAN-999-999-000-999-1255', '1', '17', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

-- ---------------------------------------------------------------------
--
-- CONTROLS DATA
--
-- ---------------------------------------------------------------------

DELETE FROM `review_controls`;

INSERT INTO `review_controls` 
(`id`, `review_sample_group`, `review_type`, `status`, `form_alias`, `detail_tablename`) 
VALUES 
(1, 'tissue', 'breast cancer review', 'active', 'rd_breast_cancers', 'rd_breast_cancers'), 
(2, 'blood', 'blood cell review', 'active', 'rd_blood_cells', 'rd_blood_cells'); 

DELETE FROM `global_lookups` WHERE `alias` IN ('master_review_type');
INSERT INTO `global_lookups` (`id`, `alias`, `section`, `subsection`, `value`, `language_choice`, `display_order`, `active`, `created`, `created_by`, `modified`, `modified_by`) 
VALUES 
(NULL, 'master_review_type ', NULL, NULL, 'breast cancer review', 'breast cancer review', 1, 'yes', NULL, NULL, NULL, NULL),
(NULL, 'master_review_type', NULL, NULL, 'blood cell review', 'blood cell review', 2, 'yes', NULL, NULL, NULL, NULL);

DELETE FROM `form_fields_global_lookups` WHERE `field_id` IN ('CAN-999-999-000-999-1244');
INSERT INTO `form_fields_global_lookups` ( `field_id` , `lookup_id`)
VALUES 
('CAN-999-999-000-999-1244', (SELECT `id` FROM `global_lookups` WHERE `alias` LIKE 'master_review_type' AND `value` like 'breast cancer review')), 
('CAN-999-999-000-999-1244', (SELECT `id` FROM `global_lookups` WHERE `alias` LIKE 'master_review_type' AND `value` like 'blood cell review'));


