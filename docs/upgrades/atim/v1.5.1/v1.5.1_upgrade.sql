-- ----------------------------------------------------------------------------
-- CLINICAL ANNOTATION
-- ----------------------------------------------------------------------------

/* New lookup 'Pager' to ParticipantContact.phone_type and ParticipantContact.phone2_type */

DELETE FROM `global_lookups`
WHERE `alias` = 'phone_type'
AND `value` = 'pager';

INSERT INTO `global_lookups` (`id`, `alias`, `section`, `subsection`, `value`, `language_choice`, `display_order`, `active`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(NULL, 'phone_type', NULL, NULL, 'pager', 'pager', '6', 'yes', NULL, NULL, NULL, NULL);

DELETE FROM `form_fields_global_lookups` WHERE `field_id` = 'CAN-999-999-000-999-49'
AND `lookup_id` IN (SELECT `id` FROM `global_lookups` WHERE `alias` = 'phone_type' AND `value` = 'pager');

DELETE FROM `form_fields_global_lookups` WHERE `field_id` = 'CAN-999-999-000-999-50'
AND `lookup_id` IN (SELECT `id` FROM `global_lookups` WHERE `alias` = 'phone_type' AND `value` = 'pager');

INSERT INTO `form_fields_global_lookups` ( `field_id` , `lookup_id` ) VALUES
('CAN-999-999-000-999-49', (SELECT `id` FROM `global_lookups` WHERE `alias` = 'phone_type' AND `value` = 'pager') ),
('CAN-999-999-000-999-50', (SELECT `id` FROM `global_lookups` WHERE `alias` = 'phone_type' AND `value` = 'pager') );

DELETE FROM `i18n`
WHERE `id` = 'pager';

INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('pager', 'global', 'Pager', 'Paget');


/* Drop Brachytherapy related treatment tables  */

DROP TABLE IF EXISTS `txe_brachytherapies`;
DROP TABLE IF EXISTS `txd_brachytherapies`;


/* Drop depricated fields from Lifestyle base form  */

ALTER TABLE `ed_all_lifestyle_base`
  DROP `prior_cancer_dx`,
  DROP `prior_cancer_dx_year`,
  DROP `prior_cancer_tx`;


/* Drop depricated breast presentation form */

DELETE FROM `event_controls` WHERE `disease_site` = 'breast' AND `event_group` = 'clinical' AND `event_type` = 'presentation';

DROP TABLE IF EXISTS `ed_breast_clinical_presentation`;

DELETE FROM `forms` WHERE `id` = 'CAN-999-999-000-002-29' LIMIT 1;

DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-230' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-229' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-237' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-238' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-239' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-235' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-236' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-241' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-270' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-271' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-272' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-273' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-274' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-240' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-522' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-227' LIMIT 1;
DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-002-29_CAN-999-999-000-999-228' LIMIT 1;

DELETE FROM `form_fields` WHERE `id` = 'CAN-999-999-000-999-237' LIMIT 1;
DELETE FROM `form_fields` WHERE `id` = 'CAN-999-999-000-999-238' LIMIT 1;
DELETE FROM `form_fields` WHERE `id` = 'CAN-999-999-000-999-239' LIMIT 1;
DELETE FROM `form_fields` WHERE `id` = 'CAN-999-999-000-999-241' LIMIT 1;
DELETE FROM `form_fields` WHERE `id` = 'CAN-999-999-000-999-270' LIMIT 1;
DELETE FROM `form_fields` WHERE `id` = 'CAN-999-999-000-999-271' LIMIT 1;
DELETE FROM `form_fields` WHERE `id` = 'CAN-999-999-000-999-272' LIMIT 1;
DELETE FROM `form_fields` WHERE `id` = 'CAN-999-999-000-999-273' LIMIT 1;
DELETE FROM `form_fields` WHERE `id` = 'CAN-999-999-000-999-274' LIMIT 1;
DELETE FROM `form_fields` WHERE `id` = 'CAN-999-999-000-999-240' LIMIT 1;


/* Allow to create an order line without to select a sample type */

ALTER TABLE `order_lines`
CHANGE `sample_control_id` `sample_control_id` INT( 11 ) NULL DEFAULT NULL;

/* Added missing translations for check/uncheck options */

INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('core_check', 'global', 'Check', ''),
('core_uncheck', 'global', 'Uncheck', '');

-- ----------------------------------------------------------------------------
-- INVENTORY MANAGEMENT
-- ----------------------------------------------------------------------------

/* Fixed some english translations */

UPDATE `i18n` SET `en` = 'Cell Passage number should be a positive decimal!' WHERE `id` = 'cell passage number should be a positif decimal' LIMIT 1 ;
UPDATE `i18n` SET `en` = 'Concentration should be a positive decimal!' WHERE `id` = 'concentration should be a positif decimal' LIMIT 1 ;
UPDATE `i18n` SET `en` = 'Number should be a positive decimal!' WHERE `id` = 'number should be a positif decimal' LIMIT 1 ;
UPDATE `i18n` SET `en` = 'Used blood volume should be a positive decimal!' WHERE `id` = 'used volume should be a positif decimal' LIMIT 1 ;
UPDATE `i18n` SET `en` = 'Volume should be a positive decimal!' WHERE `id` = 'volume should be a positif decimal' LIMIT 1 ;

/* Add description for button allowing to access inventory object from another module */

DELETE FROM `i18n`
WHERE `id` IN (
'plugin inventorymanagement aliquot detail',
'plugin inventorymanagement collection detail',
'plugin inventorymanagement sample detail');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) 
VALUES 
('plugin inventorymanagement aliquot detail', 'global', 'Aliquot Details', 'Donn&eacute;es de l''aliquot'),
('plugin inventorymanagement collection detail', 'global', 'Collection Details', 'Donn&eacute;es de la collection'),
('plugin inventorymanagement sample detail', 'global', 'Sample Details', 'Donn&eacute;es de l''&eacute;chantillon');

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

DELETE FROM `i18n` WHERE `id` = 'stor_parent_id_defintion';
INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('stor_parent_id_defintion', 
'global', 
'Parent storage in which the studied storage is stored.', 
'Entreposage parent dans lequel l''entreposage &eacute;tudi&eacute; est entrepos&eacute;.');



