-- ----------------------------------------------------------------------------
-- STORAGE MASTER
-- ----------------------------------------------------------------------------

/* StorageMaster.short_label */

UPDATE `form_fields` 
SET `language_help` = 'stor_short_label_defintion' 
WHERE `form_fields`.`id` IN ('CAN-999-999-000-999-1197');

DELETE FROM `i18n` WHERE `id` = 'stor_short_label_defintion';
INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('stor_short_label_defintion', 
'global', 
'Short label written on the storage to identify this one.', 
'Lib&eacute;l&eacute; court &eacute;crit sur l''entreposage pour identifier ce dernier.');


/* StorageMaster.selection_label */

UPDATE `form_fields` 
SET `language_help` = 'stor_selection_label_defintion' 
WHERE `form_fields`.`id` IN ('CAN-999-999-000-999-1217',
'CAN-999-999-000-999-1184');

DELETE FROM `i18n` WHERE `id` = 'stor_selection_label_defintion';
INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('stor_selection_label_defintion', 
'global', 
'Label built by the system joining all short labels of the storage parents and the studied parent starting from the root (ex: freezer, fridge, room) to the studied storage and separating all short labels by ''-''.', 
'Lib&eacute;l&eacute; construit par le syst&ecirc;me en concatenant tous les identifiants courts des entreposages ''parents'' ainsi que celui de l''entreposage &eacute;tudi&eacute; &agrave; partir du parent initial (ex: frigidaire, etc) jusqu''&agrave; l''entreposage &eacute;tudi&eacute;. Les identifiants courts &eacute;tant s&eacute;par&eacute;s par ''-''.');


/* StorageMaster.short_label */

UPDATE `form_fields` 
SET `language_help` = 'stor_parent_id_defintion' 
WHERE `form_fields`.`id` IN ('CAN-999-999-000-999-1185');

DELETE FROM `i18n` WHERE `id` = 'stor_short_label_defintion';
INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('stor_parent_id_defintion', 
'global', 
'Parent storage in which the studied storage is stored.', 
'Entreposage parent dans lequel l''entreposage &eacute;tudi&eacute; est entrepos&eacute;.');


