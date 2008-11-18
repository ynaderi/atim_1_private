DELETE FROM `sidebars`
WHERE `alias` Like 'drug_%';

INSERT INTO `sidebars` (`id`, `alias`, `language_title`, `language_body`, `created`, `created_by`, `modified`, `modified_by`)
VALUES
(NULL, 'drug_drugs_listall', 'drug_tool_title', 'drug_tool_description', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `i18n`
WHERE `id` IN ('drug_tool_title', 'drug_tool_description');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('drug_tool_description', 'global', 'To describe...', '&Agrave; d&eacute;crire...'),
('drug_tool_title', 'global', 'Tool Description', 'Description de l''outils');

DELETE FROM `menus`
WHERE `use_link` LIKE '/drug/%';

INSERT INTO `menus` (`id`, `parent_id`, `display_order`, `language_title`, `language_description`, `use_link`, `use_param`, `active`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('drug_CAN_96', 'core_CAN_33', 1, 'drug administration', 'drug administration', '/drug/drugs/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('drug_CAN_97', 'drug_CAN_96', 1, 'details', 'details', '/drug/drugs/detail/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


