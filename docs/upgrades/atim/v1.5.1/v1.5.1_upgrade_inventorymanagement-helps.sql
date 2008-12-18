-- ----------------------------------------------------------------------------
-- COLLECTION
-- ----------------------------------------------------------------------------

/* Collection.acquisition_label */

UPDATE `form_fields` 
SET `language_help` = 'inv_acquisition_label_defintion' 
WHERE `form_fields`.`id` IN ('CAN-999-999-000-999-1000',
'CAN-999-999-000-999-105', 'CAN-999-999-000-999-1218');

DELETE FROM `i18n` WHERE `id` = 'inv_acquisition_label_defintion';
INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('inv_acquisition_label_defintion', 
'global', 
'Label attached to a collection that will help user to recognize his collection in ATiM.', 
'Valeur aidant l''utilisateur &agrave; reconna&icirc;tre sa collection dans ATiM.');


/* Collection.bank */

UPDATE `form_fields` 
SET `language_help` = 'inv_collection_bank_defintion' 
WHERE `form_fields`.`id` IN ('CAN-999-999-000-999-1002',
'CAN-999-999-000-999-1001', 'CAN-999-999-000-999-1223');

DELETE FROM `i18n` WHERE `id` = 'inv_collection_bank_defintion';
INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('inv_collection_bank_defintion', 
'global', 
'Bank being owner of the collection.', 
'Banque propri&eacute;taire de la collection.');


/* Collection.collection_datetime */

UPDATE `form_fields` 
SET `language_help` = 'inv_collection_datetime_defintion' 
WHERE `form_fields`.`id` IN ('CAN-999-999-000-999-1004',
'CAN-999-999-000-999-107');

DELETE FROM `i18n` WHERE `id` = 'inv_collection_datetime_defintion';
INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('inv_collection_datetime_defintion', 
'global', 
'Date of the samples collection (ex: surgery date, biopsy date, blood collection date, etc).', 
'Date du pr&eacute;l&egrave;vement des &eacute;chantillons de la collection (ex: date de la chirurgie, date de la biopsie, etc).');


/* Collection.reception_datetime */

UPDATE `form_fields` 
SET `language_help` = 'inv_reception_datetime_defintion' 
WHERE `form_fields`.`id` IN ('CAN-999-999-000-999-1006');

DELETE FROM `i18n` WHERE `id` = 'inv_reception_datetime_defintion';
INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('inv_reception_datetime_defintion', 
'global', 
'Date of the samples reception into the bank.', 
'Date de la r&eacute;ception des &eacute;chantillons dans la banque.');


/* Collection.collection_type */

UPDATE `form_fields` 
SET `language_help` = 'inv_collection_type_defintion' 
WHERE `form_fields`.`id` IN ('CAN-999-999-000-999-1013',
'CAN-999-999-000-999-1014', 'CAN-999-999-000-999-1015');

DELETE FROM `i18n` WHERE `id` = 'inv_collection_type_defintion';
INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('inv_collection_type_defintion', 
'global', 
'Allow to define a collection either as a bank participant collection (''Participant Collection'') or as a collection that will never be attached to a participant (''Independent Collection'').<br>In the second case, the collection will never be displayed in the the clinical annotation module form used to link a participant to an available collection.', 
'Permet de d&eacute;finir une collection comme une collection d''un participant d''une banque (''Collection de participant'') ou comme une collection qui ne sera jamais li&eacute;e &agrave; un participant (''Collection ind&eacute;pendante'').<br>Dans ce second cas, la collection ne sera jamais affich&eacute;e dans la page du module d''annotation clinique permettant de lier une collection au participant.');



-- ----------------------------------------------------------------------------
-- SAMPLE MASTER
-- ----------------------------------------------------------------------------

/* SampleMaster.is_problematic */

UPDATE `form_fields` 
SET `language_help` = 'inv_is_problematic_sample_defintion' 
WHERE `form_fields`.`id` IN ('CAN-999-999-000-999-1029');

DELETE FROM `i18n` WHERE `id` = 'inv_is_problematic_sample_defintion';
INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('inv_is_problematic_sample_defintion', 
'global', 
'Allow to flag a sample or a derivative as problematic. This flag could be used as a warning for sample user.', 
'Permet de d&eacute;finir un &eacute;chantillon ou un d&eacute;riv&eacute; comme probl&eacute;matique et permet d''avertir les utilisateurs de ce dernier.');


/* SampleMaster.sample_category */

UPDATE `form_fields` 
SET `language_help` = 'inv_sample_category_defintion' 
WHERE `form_fields`.`id` IN ('CAN-999-999-000-999-1027');

DELETE FROM `i18n` WHERE `id` = 'inv_sample_category_defintion';
INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('inv_sample_category_defintion', 
'global', 
'Allow to define if the studied product is a ''Sample'' meaning the product has been directly collected from human body (blood, tissue, urine, etc) or a ''Derivative'' meaning the product has been created from another product being either a sample or a derivative (DNA extraction, plasma, cells culture, etc).', 
'Permet de d&eacute;finir si le produit &eacute;tudi&eacute; est un ''&Eacute;chantillon'' signifiant que ce dernier a &eacute;t&eacute; directement extrait du corps humain (sang, urine, tissu, etc) ou un ''D&eacute;riv&eacute;'' signifiant que le produit a &eacute;t&eacute; cr&eacute;&eacute; &agrave partir d''un autre produit &eacute;tant lui m&ecirc;me un &eacute;chantillon ou un d&eacute;riv&eacute; (extraction d''ADN, plasma, etc).');


/* SampleMaster.parent_id */

UPDATE `form_fields` 
SET `language_help` = 'inv_sample_parent_id_defintion' 
WHERE `form_fields`.`id` IN ('CAN-999-999-000-999-1023', 
'CAN-999-999-000-999-1024');

DELETE FROM `i18n` WHERE `id` = 'inv_sample_parent_id_defintion';
INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('inv_sample_parent_id_defintion', 
'global', 
'Parent sample or derivative used to create the studied derivative.', 
'&Eacute;chantillon ou d&eacute;riv&eacute; utilis&eacute; pour cr&eacute;&eacute; le d&eacute;riv&eacute; &eacute;tudi&eacute;.');

	
	
-- ----------------------------------------------------------------------------
-- ALIQUOT MASTER
-- ----------------------------------------------------------------------------

/* Generated.realiquoting_data */

UPDATE `form_fields` 
SET `language_help` = 'inv_realiquoting_defintion' 
WHERE `form_fields`.`id` IN ('CAN-999-999-000-999-1268');

DELETE FROM `i18n` WHERE `id` = 'inv_realiquoting_defintion';
INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('inv_realiquoting_defintion', 
'global', 
'Allow to define if the studied aliquot has been realiquoted to another aliquot (Parent) or is the an aliquot created from a realiquoted aliquot (children).',
'Permet de d&eacute;finir si l''aliquot &eacute;tudi&eacute; a &eacute;t&eacute; r&eacute;aliquot&eacute; en un autre aliquot (parent) ou est un aliquot cr&eacute;&eacute; &agrave; partir d''un autre aliquot (enfant).');

	

