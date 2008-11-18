DELETE FROM `sidebars`
WHERE `alias` Like 'material_%';

INSERT INTO `sidebars` (`id`, `alias`, `language_title`, `language_body`, `created`, `created_by`, `modified`, `modified_by`)
VALUES
(NULL, 'material_materials_index', 'material_tool_title', 'material_tool_description', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `i18n`
WHERE `id` IN ('material_tool_description', 'material_tool_title');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('material_tool_description', 'global', 'To describe...', '&Agrave; d&eacute;crire...'),
('material_tool_title', 'global', 'Tool Description', 'Description de l''outils');

DELETE FROM `menus`
WHERE `use_link` LIKE '/material/%';

INSERT INTO `menus` (`id`, `parent_id`, `display_order`, `language_title`, `language_description`, `use_link`, `use_param`, `active`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('mat_CAN_01', 'core_CAN_33', 1, 'sop_materials and equipment', 'sop_materials and equipment', '/material/materials/index/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('mat_CAN_02', 'mat_CAN_01', 1, 'detail', 'detail', '/material/materials/detail/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `i18n`
WHERE `id` IN ('protocol detail', 'protocol extend');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('protocol detail', 'global', 'Details', 'D&eacute;tail'),
('protocol extend', 'global', 'Drug List', 'Liste des principes actifs');

