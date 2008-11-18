-- Sidebars

DELETE FROM `sidebars`
WHERE `alias` Like 'study_%';

INSERT INTO `sidebars` (`id`, `alias`, `language_title`, `language_body`, `created`, `created_by`, `modified`, `modified_by`)
VALUES
(NULL, 'study_study_summaries_listall', 'study_tool_title', 'study_tool_description', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


-- Sidebars

DELETE FROM `i18n`
WHERE `id` IN ('study_tool_title', 'study_tool_description');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('study_tool_description', 'global', 'To describe...', '&Agrave; d&eacute;crire...'),
('study_tool_title', 'global', 'Tool Description', 'Description de l''outils');

