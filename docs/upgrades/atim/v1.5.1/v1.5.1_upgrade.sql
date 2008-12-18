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

SELECT `id` FROM `global_lookups` WHERE `alias` = 'phone_type' AND `value` = 'pager';


/* Drop Brachytherapy related treatment tables  */

DROP TABLE  IF EXISTS `txe_brachytherapies`;
DROP TABLE  IF EXISTS `txd_brachytherapies`;


/* Drop depricated fields from Lifestyle base form  */

ALTER TABLE `ed_all_lifestyle_base`
  DROP `prior_cancer_dx`,
  DROP `prior_cancer_dx_year`,
  DROP `prior_cancer_tx`;