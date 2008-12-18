-- ----------------------------------------------------------------------------
-- INVENTORY MANAGEMENT
-- ----------------------------------------------------------------------------

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


