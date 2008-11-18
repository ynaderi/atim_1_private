DELETE FROM `sidebars`
WHERE `alias` Like 'rtbform_%';

INSERT INTO `sidebars` (`id`, `alias`, `language_title`, `language_body`, `created`, `created_by`, `modified`, `modified_by`)
VALUES
(NULL, 'rtbform_rtbforms_index', 'rtbform_tool_title', 'rtbform_tool_description', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `i18n`
WHERE `id` IN ('rtbform_tool_description', 'rtbform_tool_title');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('rtbform_tool_description', 'global', 'To describe...', '&Agrave; d&eacute;crire...'),
('rtbform_tool_title', 'global', 'Tool Description', 'Description de l''outils');

DELETE FROM `menus`
WHERE `use_link` LIKE '/rtbform/%';

INSERT INTO `menus` 
(`id`, `parent_id`, `display_order`, `language_title`, `language_description`, `use_link`, `use_param`, `active`, `created`, `created_by`, `modified`, `modified_by`) 
VALUES 
('rtbf_CAN_01', 'core_CAN_33', 2, 'forms_menu', 'forms', '/rtbform/rtbforms/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('rtbf_CAN_02', 'rtbf_CAN_01', 1, 'rtbform_detail', '', '/rtbform/rtbforms/profile/', 1, '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `i18n`
WHERE `id` IN ('forms_menu','rtbform_detail');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('rtbform_detail', 'global', 'Details', 'D&eacute;tail'),
('forms_menu', 'global', 'Forms', 'Formulaire');
