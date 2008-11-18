DELETE FROM `sidebars`
WHERE `alias` Like 'clinicalannotation_%';

INSERT INTO `sidebars` (`id`, `alias`, `language_title`, `language_body`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
(NULL, 'clinicalannotation_participants_index', 'clinicalannotation_module_title', 'clinicalannotation_module_description', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `i18n`
WHERE `id` IN ('clinicalannotation_module_description', 'clinicalannotation_module_title');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('clinicalannotation_module_title', 'global', 'Module Description', 'Description du Module'),
('clinicalannotation_module_description', 'global', 'To describe...<br><br><br><font color="#ff0000">Please note:\r\nThis application contains sample data for demonstration purposes only. Any similarity to people or persons living or dead is entirely coincidental.</font><br>', '&Agrave; d&eacute;crire...<br><br><br><font color="#ff0000">Note:\r\nCette application contient des données fictives. Toutes similarit&eacute;s avec des personnes existantes ou mortes est une coincidence.</font><br>');

DELETE FROM `menus`
WHERE `use_link` LIKE '/clinicalannotation/%';

INSERT INTO `menus` (`id`, `parent_id`, `display_order`, `language_title`, `language_description`, `use_link`, `use_param`, `active`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
-- ('clin_CAN_2', 'clin_CAN_1', 0, 'participant', 'participant', '/clinicalannotation/participants/profile/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),

('clin_CAN_1', 'MAIN_MENU_1', 1, 'clinical annotation', 'clinical annotation', '/clinicalannotation/participants/index/', 0, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),

('clin_CAN_6', 'clin_CAN_1', 1, 'details', 'details', '/clinicalannotation/participants/profile/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('clin_CAN_9', 'clin_CAN_1', 2, 'consent', 'consent', '/clinicalannotation/consents/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('clin_CAN_5', 'clin_CAN_1', 3, 'diagnosis', 'diagnosis', '/clinicalannotation/diagnoses/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('clin_CAN_10', 'clin_CAN_1', 4, 'family history', 'family history', '/clinicalannotation/family_histories/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('clin_CAN_68', 'clin_CAN_1', 5, 'reproductive history', 'reproductive history', '/clinicalannotation/reproductive_histories/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('clin_CAN_75', 'clin_CAN_1', 10, 'treatment', 'treatment', '/clinicalannotation/treatment_masters/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
	('clin_CAN_79', 'clin_CAN_75', 1, 'treatment detail', 'treatment detail', '/clinicalannotation/treatment_masters/detail/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
	('clin_CAN_80', 'clin_CAN_75', 2, 'treatment extend', 'treatment extend', '/clinicalannotation/treatment_extends/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('clin_CAN_4', 'clin_CAN_1', 11, 'annotation', 'annotation', '/clinicalannotation/event_masters/listall/clin_CAN_27/screening/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
	('clin_CAN_27', 'clin_CAN_4', 1, 'screening', 'screening', '/clinicalannotation/event_masters/listall/clin_CAN_27/screening/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
	('clin_CAN_28', 'clin_CAN_4', 2, 'lab', 'lab', '/clinicalannotation/event_masters/listall/clin_CAN_28/lab/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
	('clin_CAN_30', 'clin_CAN_4', 4, 'lifestyle', 'lifestyle', '/clinicalannotation/event_masters/listall/clin_CAN_30/lifestyle/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
	('clin_CAN_31', 'clin_CAN_4', 5, 'clinical', 'clinical', '/clinicalannotation/event_masters/listall/clin_CAN_31/clinical/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
	('clin_CAN_69', 'clin_CAN_4', 6, 'protocol', 'protocol', '/clinicalannotation/event_masters/listall/clin_CAN_69/protocol/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
	('clin_CAN_32', 'clin_CAN_4', 7, 'adverse events', 'adverse events', '/clinicalannotation/event_masters/listall/clin_CAN_32/adverse_events/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
	('clin_CAN_33', 'clin_CAN_4', 8, 'clin_study', 'clin_study', '/clinicalannotation/event_masters/listall/clin_CAN_33/study/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('clin_CAN_67', 'clin_CAN_1', 20, 'link to collection', 'link to collection', '/clinicalannotation/clinical_collection_links/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('clin_CAN_57', 'clin_CAN_1', 21, 'samples list', 'samples list', '/clinicalannotation/sample_masters/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('clin_CAN_26', 'clin_CAN_1', 30, 'contact', 'contact', '/clinicalannotation/participant_contacts/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('clin_CAN_25', 'clin_CAN_1', 31, 'message', 'message', '/clinicalannotation/participant_messages/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('clin_CAN_24', 'clin_CAN_1', 32, 'identification', 'identification', '/clinicalannotation/misc_identifiers/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `form_formats`
WHERE `id` IN ('CAN-999-999-000-999-27_CAN-999-999-000-999-1220', 
'CAN-999-999-000-999-27_CAN-999-999-000-999-1219',
'CAN-999-999-000-999-27_CAN-999-999-000-999-52',
'CAN-999-999-000-999-27_CAN-999-999-000-999-53');

INSERT INTO `form_formats` 
(`id`, `form_id`, `field_id`, `display_column`, `display_order`, `language_heading`, `flag_override_label`, `language_label`, `flag_override_tag`, `language_tag`, `flag_override_help`, `language_help`, `flag_override_type`, `type`, `flag_override_setting`, `setting`, `flag_override_default`, `default`, `flag_add`, `flag_add_readonly`, `flag_edit`, `flag_edit_readonly`, `flag_search`, `flag_search_readonly`, `flag_datagrid`, `flag_datagrid_readonly`, `flag_index`, `flag_detail`, `created`, `created_by`, `modified`, `modified_by`) 
VALUES 
('CAN-999-999-000-999-27_CAN-999-999-000-999-52', 'CAN-999-999-000-999-27', 'CAN-999-999-000-999-52', 2, 0, 'consent', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-27_CAN-999-999-000-999-53', 'CAN-999-999-000-999-27', 'CAN-999-999-000-999-53', 2, 1, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


