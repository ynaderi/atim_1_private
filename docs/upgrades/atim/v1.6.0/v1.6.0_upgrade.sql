-- ----------------------------------------------------------------------------
-- PROTOCOL MANAGEMENT
-- ----------------------------------------------------------------------------

/* Added validation to protocol code. Field now required for entry. */

INSERT INTO `form_validations` ( `id` , `form_field_id` , `expression` , `message` , `created` , `created_by` , `modified` , `modifed_by` ) VALUES
(NULL , 'CAN-999-999-000-999-302', '/.+/', 'err_protocol code is required', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('err_protocol code is required', 'global', 'Protocol code is required!', '');

-- ----------------------------------------------------------------------------
-- CLINICAL ANNOTATION
-- ----------------------------------------------------------------------------

/* Set created and modifed fields to DATETIME for all treatment tables */

ALTER TABLE `tx_masters` CHANGE `created` `created` DATETIME NOT NULL DEFAULT '0000-00-00',
CHANGE `modified` `modified` DATETIME NOT NULL DEFAULT '0000-00-00';

ALTER TABLE `txd_chemos` CHANGE `created` `created` DATETIME NOT NULL DEFAULT '0000-00-00',
CHANGE `modified` `modified` DATETIME NOT NULL DEFAULT '0000-00-00';

ALTER TABLE `txe_chemos` CHANGE `created` `created` DATETIME NOT NULL DEFAULT '0000-00-00',
CHANGE `modified` `modified` DATETIME NOT NULL DEFAULT '0000-00-00';

ALTER TABLE `txe_radiations` CHANGE `created` `created` DATETIME NOT NULL DEFAULT '0000-00-00',
CHANGE `modified` `modified` DATETIME NOT NULL DEFAULT '0000-00-00';

ALTER TABLE `txe_surgeries` CHANGE `created` `created` DATETIME NOT NULL DEFAULT '0000-00-00',
CHANGE `modified` `modified` DATETIME NOT NULL DEFAULT '0000-00-00';