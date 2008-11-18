-- ----------------------------------------------------------------------------------
-- DDL
-- ----------------------------------------------------------------------------------

ALTER TABLE `order_items` ADD `aliquot_use_id` INT( 11 ) NOT NULL DEFAULT '0' AFTER `aliquot_master_id` ;

ALTER TABLE `order_lines` ADD `sample_control_id` INT( 11 ) NOT NULL DEFAULT '0' AFTER `product_id` ;

ALTER TABLE `shipments` ADD `recipient` VARCHAR( 60 ) NULL AFTER `shipment_code` ;

ALTER TABLE `shipments` ADD `facility` VARCHAR( 60 ) NULL AFTER `recipient` ;

-- ----------------------------------------------------------------------------------
-- DML
-- ----------------------------------------------------------------------------------

-- Menu / Sidebar

DELETE FROM `sidebars`
WHERE `alias` LIKE 'order_%';

INSERT INTO `sidebars` (`id`, `alias`, `language_title`, `language_body`, `created`, `created_by`, `modified`, `modified_by`) 
VALUES 
(NULL, 'order_orders_index', 'order_tool_title', 'order_tool_description', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `i18n`
WHERE `id` IN ('order_tool_description', 'order_tool_title');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('order_tool_description', 'global', 'To describe...', '&Agrave; d&eacute;crire...'),
('order_tool_title', 'global', 'Tool Description', 'Description de l''outils');

DELETE FROM `menus`
WHERE `use_link` LIKE '/order/%';

INSERT INTO `menus` (`id`, `parent_id`, `display_order`, `language_title`, `language_description`, `use_link`, `use_param`, `active`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('ord_CAN_101', 'core_CAN_33', 3, 'order_order management', 'order_order management', '/order/orders/index/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
-- ('ord_CAN_102', 'ord_CAN_101', 1, 'order_orders', 'order_orders', '/order/orders/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('ord_CAN_113', 'ord_CAN_101', 1, 'details', 'order', '/order/orders/detail/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('ord_CAN_114', 'ord_CAN_101', 2, 'order_order lines', 'order_order lines', '/order/order_lines/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('ord_CAN_115', 'ord_CAN_114', 1, 'order_order line detail', 'order_order line detail', '/order/order_lines/detail/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('ord_CAN_116', 'ord_CAN_101', 3, 'order_shipments', 'order_shipments', '/order/shipments/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('ord_CAN_117', 'ord_CAN_114', 2, 'order_order items', 'order_order items', '/order/order_items/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('ord_CAN_118', 'ord_CAN_117', 1, 'order_order item detail', 'order_order item detail', '/order/order_items/detail/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('ord_CAN_119', 'ord_CAN_116', 1, 'order_shipment detail', 'order_shipment detail', '/order/shipments/detail/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('ord_CAN_120', 'ord_CAN_116', 2, 'order_shipment items', 'order_shipment items', '/order/order_items/shipment_items/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `i18n`
WHERE `id` IN ('order_order item detail', 'order_shipment detail', 'order_order line detail');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('order_order item detail', 'global', 'Details', 'D&eacute;tail'),
('order_shipment detail', 'global', 'Details', 'D&eacute;tail'),
('order_order line detail', 'global', 'Details', 'D&eacute;tail');

-- order

DELETE FROM `form_formats` WHERE `form_id` = 'CAN-999-999-000-999-51';

INSERT INTO `form_formats` (`id`, `form_id`, `field_id`, `display_column`, `display_order`, `language_heading`, `flag_override_label`, `language_label`, `flag_override_tag`, `language_tag`, `flag_override_help`, `language_help`, `flag_override_type`, `type`, `flag_override_setting`, `setting`, `flag_override_default`, `default`, `flag_add`, `flag_add_readonly`, `flag_edit`, `flag_edit_readonly`, `flag_search`, `flag_search_readonly`, `flag_datagrid`, `flag_datagrid_readonly`, `flag_index`, `flag_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
/* NBR */
('CAN-999-999-000-999-51_CAN-999-999-000-999-355', 'CAN-999-999-000-999-51', 'CAN-999-999-000-999-355', 1, 1, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* TITILE */
('CAN-999-999-000-999-51_CAN-999-999-000-999-357', 'CAN-999-999-000-999-51', 'CAN-999-999-000-999-357', 1, 2, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* STUDY */
('CAN-999-999-000-999-51_CAN-999-999-000-999-356', 'CAN-999-999-000-999-51', 'CAN-999-999-000-999-356', 1, 4, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* PROCESSING STATUS */
('CAN-999-999-000-999-51_CAN-999-999-000-999-361', 'CAN-999-999-000-999-51', 'CAN-999-999-000-999-361', 1, 5, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* DATE PLACED */
('CAN-999-999-000-999-51_CAN-999-999-000-999-359', 'CAN-999-999-000-999-51', 'CAN-999-999-000-999-359', 1, 6, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* DATE COMPLETED */
('CAN-999-999-000-999-51_CAN-999-999-000-999-360', 'CAN-999-999-000-999-51', 'CAN-999-999-000-999-360', 1, 7, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* DESCRIPTION */
('CAN-999-999-000-999-51_CAN-999-999-000-999-362', 'CAN-999-999-000-999-51', 'CAN-999-999-000-999-362', 1, 10, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* COMMENT */
('CAN-999-999-000-999-51_CAN-999-999-000-999-358', 'CAN-999-999-000-999-51', 'CAN-999-999-000-999-358', 1, 10, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

/* NBR */
DELETE FROM `form_validations` WHERE `form_field_id` = 'CAN-999-999-000-999-355';
INSERT INTO `form_validations` (`id`, `form_field_id`, `expression`, `message`, `created`, `created_by`, `modified`, `modifed_by`) VALUES (NULL, 'CAN-999-999-000-999-355', '/.+/', 'order number is required', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

/* status */
DELETE FROM `form_fields_global_lookups` WHERE `field_id` IN ('CAN-999-999-000-999-361');
INSERT INTO `form_fields_global_lookups` (`field_id`, `lookup_id`) 
VALUES 
('CAN-999-999-000-999-361', (SELECT `id` FROM `global_lookups` WHERE `id` < 2000 AND `alias` LIKE 'status' AND `value` LIKE 'completed')),
('CAN-999-999-000-999-361', (SELECT `id` FROM `global_lookups` WHERE `id` < 2000 AND `alias` LIKE 'status' AND `value` LIKE 'pending')),
('CAN-999-999-000-999-361', (SELECT `id` FROM `global_lookups` WHERE `id` < 2000 AND `alias` LIKE 'status' AND `value` LIKE 'planned'));

-- order line

DELETE FROM `form_fields` WHERE `id` = 'CAN-999-999-000-999-1264';
INSERT INTO `form_fields` (`id`, `model`, `field`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-1264', 'OrderLine', 'sample_control_id', 'sample type', '', 'select', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `form_formats` WHERE `id` = 'CAN-999-999-000-999-60_CAN-999-999-000-999-1264';
INSERT INTO `form_formats` (`id`, `form_id`, `field_id`, `display_column`, `display_order`, `language_heading`, `flag_override_label`, `language_label`, `flag_override_tag`, `language_tag`, `flag_override_help`, `language_help`, `flag_override_type`, `type`, `flag_override_setting`, `setting`, `flag_override_default`, `default`, `flag_add`, `flag_add_readonly`, `flag_edit`, `flag_edit_readonly`, `flag_search`, `flag_search_readonly`, `flag_datagrid`, `flag_datagrid_readonly`, `flag_index`, `flag_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-60_CAN-999-999-000-999-1264', 'CAN-999-999-000-999-60', 'CAN-999-999-000-999-1264', 1, 2, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

-- oder item

DELETE FROM `form_fields` WHERE `id` IN ('CAN-999-999-000-999-1261', 'CAN-999-999-000-999-1262', 
'CAN-999-999-000-999-1263');
INSERT INTO `form_fields` (`id`, `model`, `field`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-1261', 'OrderItem', 'status', 'order_status', '', 'select', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1262', 'FunctionManagement', 'generated_field_ship', 'ship', '', 'checklist', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1263', 'OrderItem', 'aliquot_master_id', '', '', 'hidden', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

  	  	  	   	
DELETE FROM `form_fields_global_lookups` WHERE `field_id` IN ('CAN-999-999-000-999-1262',
 'CAN-999-999-000-999-1261');
INSERT INTO `form_fields_global_lookups` (`field_id`, `lookup_id`) VALUES 
('CAN-999-999-000-999-1261', 5055),
('CAN-999-999-000-999-1261', 5054),

('CAN-999-999-000-999-1262', (SELECT id FROM global_lookups WHERE alias = 'yesno' and value = 'yes'));


DELETE FROM `form_formats` WHERE `form_id` = 'CAN-999-999-000-999-61';
INSERT INTO `form_formats` 
(`id`, `form_id`, `field_id`, `display_column`, `display_order`, 
`language_heading`, `flag_override_label`, `language_label`, `flag_override_tag`, `language_tag`, `flag_override_help`, `language_help`, `flag_override_type`, `type`, `flag_override_setting`, `setting`, `flag_override_default`, `default`, 
`flag_add`, `flag_add_readonly`, `flag_edit`, `flag_edit_readonly`, `flag_search`, `flag_search_readonly`, `flag_datagrid`, `flag_datagrid_readonly`, `flag_index`, `flag_detail`, 
`created`, `created_by`, `modified`, `modified_by`) 
VALUES 
/* barcode */
('CAN-999-999-000-999-61_CAN-999-999-000-999-497', 'CAN-999-999-000-999-61', 'CAN-999-999-000-999-497', 1, 1, 
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* Date Added */
('CAN-999-999-000-999-61_CAN-999-999-000-999-498', 'CAN-999-999-000-999-61', 'CAN-999-999-000-999-498', 1, 2, 
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* Added by */
('CAN-999-999-000-999-61_CAN-999-999-000-999-499', 'CAN-999-999-000-999-61', 'CAN-999-999-000-999-499', 1, 3, 
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* Scanned Out At  */
('CAN-999-999-000-999-61_CAN-999-999-000-999-500', 'CAN-999-999-000-999-61', 'CAN-999-999-000-999-500', 1, 4, 
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 'NULL', 
1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* Status */
('CAN-999-999-000-999-61_CAN-999-999-000-999-501', 'CAN-999-999-000-999-61', 'CAN-999-999-000-999-501', 1, 5,
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* status to manage not shipped items */
('CAN-999-999-000-999-61_CAN-999-999-000-999-1261', 'CAN-999-999-000-999-61', 'CAN-999-999-000-999-1261', 1, 5,
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* Shipment */
('CAN-999-999-000-999-61_CAN-999-999-000-999-504', 'CAN-999-999-000-999-61', 'CAN-999-999-000-999-504', 1, 6,
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

/* barcode */
DELETE FROM `form_validations` WHERE `form_field_id` = 'CAN-999-999-000-999-497';
INSERT INTO `form_validations` (`id`, `form_field_id`, `expression`, `message`, `created`, `created_by`, `modified`, `modifed_by`) VALUES (NULL, 'CAN-999-999-000-999-497', '/.+/', 'barcode is required and should exist', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

/* status */
DELETE FROM `form_validations` WHERE `form_field_id` = 'CAN-999-999-000-999-1261';
INSERT INTO `form_validations` (`id`, `form_field_id`, `expression`, `message`, `created`, `created_by`, `modified`, `modifed_by`) VALUES (NULL, 'CAN-999-999-000-999-1261', '/.+/', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

/* shipment */
DELETE FROM `form_validations` WHERE `form_field_id` = 'CAN-999-999-000-999-504';
INSERT INTO `form_validations` (`id`, `form_field_id`, `expression`, `message`, `created`, `created_by`, `modified`, `modifed_by`) VALUES (NULL, 'CAN-999-999-000-999-504', '/.+/', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `forms` WHERE `alias` = 'manage_shipments';
INSERT INTO `forms` (`id`, `alias`, `language_title`, `language_help`, `flag_add_columns`, `flag_edit_columns`, `flag_search_columns`, `flag_detail_columns`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-1068', 'manage_shipments', '', '', 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `form_formats` WHERE `form_id` = 'CAN-999-999-000-999-1068';
INSERT INTO `form_formats` 
(`id`, `form_id`, `field_id`, `display_column`, `display_order`, 
`language_heading`, `flag_override_label`, `language_label`, `flag_override_tag`, `language_tag`, `flag_override_help`, `language_help`, `flag_override_type`, `type`, `flag_override_setting`, `setting`, `flag_override_default`, `default`, 
`flag_add`, `flag_add_readonly`, `flag_edit`, `flag_edit_readonly`, `flag_search`, `flag_search_readonly`, `flag_datagrid`, `flag_datagrid_readonly`, `flag_index`, `flag_detail`, 
`created`, `created_by`, `modified`, `modified_by`) 
VALUES 
/* Function management */
('CAN-999-999-000-999-1068_CAN-999-999-000-999-1262', 'CAN-999-999-000-999-1068', 'CAN-999-999-000-999-1262', 1, 0, 
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* shipments list */
('CAN-999-999-000-999-1068_CAN-999-999-000-999-504', 'CAN-999-999-000-999-1068', 'CAN-999-999-000-999-504', 1, 0, 
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* barcode */
('CAN-999-999-000-999-1068_CAN-999-999-000-999-497', 'CAN-999-999-000-999-1068', 'CAN-999-999-000-999-497', 1, 1, 
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* Date Added */
('CAN-999-999-000-999-1068_CAN-999-999-000-999-498', 'CAN-999-999-000-999-1068', 'CAN-999-999-000-999-498', 1, 2, 
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* Added by */
('CAN-999-999-000-999-1068_CAN-999-999-000-999-499', 'CAN-999-999-000-999-1068', 'CAN-999-999-000-999-499', 1, 3, 
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* Scanned Out At  */
('CAN-999-999-000-999-1068_CAN-999-999-000-999-500', 'CAN-999-999-000-999-1068', 'CAN-999-999-000-999-500', 1, 4, 
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 'NULL', 
0, 0, 0, 0, 0, 0, 1, 1, 0, 0,  
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* Status */
('CAN-999-999-000-999-1068_CAN-999-999-000-999-501', 'CAN-999-999-000-999-1068', 'CAN-999-999-000-999-501', 1, 5,
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* aliquot master id */
('CAN-999-999-000-999-1068_CAN-999-999-000-999-1263', 'CAN-999-999-000-999-1068', 'CAN-999-999-000-999-1263', 1, 0, 
'', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
'0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

/* use_definition */
-- ('CAN-999-999-000-999-1068_CAN-999-999-000-999-1156', 'CAN-999-999-000-999-1068', 'CAN-999-999-000-999-1156', 1, 0, 
-- '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
-- 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
-- '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* use_details */
-- ('CAN-999-999-000-999-1068_CAN-999-999-000-999-1157', 'CAN-999-999-000-999-1068', 'CAN-999-999-000-999-1157', 1, 0, 
-- '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
-- 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
-- '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* use_recorded_into_table */
-- ('CAN-999-999-000-999-1068_CAN-999-999-000-999-1158', 'CAN-999-999-000-999-1068', 'CAN-999-999-000-999-1158', 1, 0, 
-- '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
-- 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
-- '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
/* use_datetime */
-- ('CAN-999-999-000-999-1068_CAN-999-999-000-999-1159', 'CAN-999-999-000-999-1068', 'CAN-999-999-000-999-1159', 1, 0, 
-- '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 
-- 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
-- '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

-- shipment

/* code */
DELETE FROM `form_validations` WHERE `form_field_id` = 'CAN-999-999-000-999-496';
INSERT INTO `form_validations` (`id`, `form_field_id`, `expression`, `message`, `created`, `created_by`, `modified`, `modifed_by`) VALUES (NULL, 'CAN-999-999-000-999-496', '/.+/', 'shipment code is required', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM `form_fields` WHERE `id` IN ('CAN-999-999-000-999-1269', 'CAN-999-999-000-999-1270');
INSERT INTO `form_fields` (`id`, `model`, `field`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-1269', 'Shipment', 'recipient', 'recipient', '', 'input', 'size=40', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-1270', 'Shipment', 'facility', 'facility', '', 'input', 'size=40', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

DELETE FROM  `form_formats` WHERE `id` IN ('CAN-999-999-000-999-62_CAN-999-999-000-999-1269',
'CAN-999-999-000-999-62_CAN-999-999-000-999-1270');
INSERT INTO `form_formats` (`id`, `form_id`, `field_id`, `display_column`, `display_order`, `language_heading`, `flag_override_label`, `language_label`, `flag_override_tag`, `language_tag`, `flag_override_help`, `language_help`, `flag_override_type`, `type`, `flag_override_setting`, `setting`, `flag_override_default`, `default`, `flag_add`, `flag_add_readonly`, `flag_edit`, `flag_edit_readonly`, `flag_search`, `flag_search_readonly`, `flag_datagrid`, `flag_datagrid_readonly`, `flag_index`, `flag_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-62_CAN-999-999-000-999-1269', 'CAN-999-999-000-999-62', 'CAN-999-999-000-999-1269', 1, -1, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-62_CAN-999-999-000-999-1270', 'CAN-999-999-000-999-62', 'CAN-999-999-000-999-1270', 1, -1, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

UPDATE `form_formats` SET `display_order` = '-2' WHERE `form_formats`.`id` = 'CAN-999-999-000-999-62_CAN-999-999-000-999-496';

-- ----------------------------------------------------------------------------------
-- i18n and pages
-- ----------------------------------------------------------------------------------

DELETE FROM `i18n` 
WHERE `id` IN (
'barcode is required and should exist',
'manage unshipped items',
'manage shipments',
'Your order item has been deleted.',
'ship',
'recipient',
'the aliquot has already been included into an order item',
'shipment code is required',
'the process has been done but a part of the aliquots have not been included');

INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` )
VALUES
('manage unshipped items', 'global', 'Manage Unshipped Items', 'Gestion des items en attente'),
('manage shipments', 'global', 'Manage Shipments', 'Gestion des envois'),
('ship', 'global', 'Ship', 'Envoyer'),
('recipient', 'global', 'Recipient', 'Destinataire'),
('barcode is required and should exist', 'global', 'Barcode is required and should be the barcode of an existing aliquot!', 'Le barcode est requis et doit &ecirc;tre le barcode d''un aliquot existant!'),
('Your order item has been deleted.', 'global', 'Your order item has been deleted from the order line. Please update the current status of your aliquot if required.', 'Votre item a &eacute;t&eacute; supprim&eacute; de la liste de commande. Veuillez mettre &agrave; jour le status courrant de l''aliquot au besoin!');

DELETE FROM `pages` WHERE `id` = 'err_order_system_error';
INSERT INTO `pages` (`id`, `error_flag`, `language_title`, `language_body`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('err_order_system_error', 1, 'system error', 'a system error has been detetced', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` )
VALUES
('the aliquot has already been included into an order item', 'global', 'The aliquot has already been defined as an order item!', 'L''aliquot &agrave; d&eacute;j&agrave; &eacute;t&eacute; inclus dans une commande!'),
('shipment code is required', 'global', 'Shipment code is required!', 'Le code est requis!'),
('the process has been done but a part of the aliquots have not been included', 'global', 'The process has been done but a part of the aliquots have not been included into the order: No aliquot already included into another order can be included to a new order!', 'Le processus a &eacute;t&eacute; ex&eacute;cut&eacute; correctement mais les aliquots d&eacute;j&agrave; inclus dans une autre commande ont &eacute;t&eacute; exclus du processus!');

