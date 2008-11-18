DELETE FROM `sidebars`
WHERE `alias` Like 'sop_%';

INSERT INTO `sidebars` (`id`, `alias`, `language_title`, `language_body`, `created`, `created_by`, `modified`, `modified_by`)
VALUES
(NULL, 'sop_sop_masters_listall', 'sop_tool_title', 'sop_tool_description', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `i18n`
WHERE `id` IN ('sop_tool_description', 'sop_tool_title');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('sop_tool_description', 'global', 'To describe...', '&Agrave; d&eacute;crire...'),
('sop_tool_title', 'global', 'Tool Description', 'Description de l''outils');

DELETE FROM `menus` 
WHERE `use_link` LIKE '/sop%';

INSERT INTO `menus` (`id`, `parent_id`, `display_order`, `language_title`, `language_description`, `use_link`, `use_param`, `active`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('sop_CAN_01', 'core_CAN_33', 1, 'sop_standard operating procedures', '', '/sop/sop_masters/listall/', 1, '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
-- ('sop_CAN_02', 'sop_CAN_01', 3, 'sop_standard operating procedures', '', '/sop/sop_masters/listall/', 1, '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('sop_CAN_03', 'sop_CAN_01', 1, 'sop_detail', '', '/sop/sop_masters/detail/', 1, '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('sop_CAN_04', 'sop_CAN_01', 2, 'sop_extend', '', '/sop/sop_extends/listall/', 1, '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');
