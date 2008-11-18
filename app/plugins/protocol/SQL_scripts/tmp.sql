DELETE FROM `sidebars`
WHERE `alias` Like 'protocol_%';

INSERT INTO `sidebars` (`id`, `alias`, `language_title`, `language_body`, `created`, `created_by`, `modified`, `modified_by`)
VALUES
(NULL, 'protocol_protocol_masters_listall', 'protocol_tool_title', 'protocol_tool_description', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `i18n`
WHERE `id` IN ('protocol_tool_description', 'protocol_tool_title');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('protocol_tool_description', 'global', 'To describe...', '&Agrave; d&eacute;crire...'),
('protocol_tool_title', 'global', 'Tool Description', 'Description de l''outils');

DELETE FROM `menus`
WHERE `use_link` LIKE '/protocol/%';

INSERT INTO `menus` (`id`, `parent_id`, `display_order`, `language_title`, `language_description`, `use_link`, `use_param`, `active`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('proto_CAN_37', 'core_CAN_33', 4, 'protocols', 'protocols', '/protocol/protocol_masters/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
-- ('tool_CAN_81', 'tool_CAN_37', 3, 'protocols', 'protocols', '/protocol/protocol_masters/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('proto_CAN_82', 'proto_CAN_37', 1, 'protocol detail', 'protocol detail', '/protocol/protocol_masters/detail/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('proto_CAN_83', 'proto_CAN_37', 2, 'protocol extend', 'protocol extend', '/protocol/protocol_extends/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `i18n`
WHERE `id` IN ('protocol detail', 'protocol extend');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('protocol detail', 'global', 'Details', 'D&eacute;tail'),
('protocol extend', 'global', 'Drug List', 'Liste des principes actifs');
