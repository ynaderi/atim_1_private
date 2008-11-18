-- SOP Upgrade script

-- Menus

INSERT INTO `menus` ( `id` , `parent_id` , `display_order` , `language_title` , `language_description` , `use_link` , `use_param` , `active` , `created` , `created_by` , `modified` , `modified_by` ) VALUES
('sop_CAN_01', 'core_CAN_33', '1', 'sop_standard operating procedures', '', '/sop/sop_masters/listall/', '1', 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('sop_CAN_02', 'sop_CAN_01', 3, 'sop_standard operating procedures', '', '/sop/sop_masters/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('sop_CAN_03', 'sop_CAN_02', 1, 'sop_detail', '', '/sop/sop_masters/detail/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('sop_CAN_04', 'sop_CAN_02', 2, 'sop_extend', '', '/sop/sop_extends/listall/', 1, 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


-- Permissions

INSERT INTO `permissions` ( `id` , `name` , `created` , `created_by` , `modified_by` , `modified` ) VALUES
(43 , 'sop', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00');

INSERT INTO `groups_permissions` ( `group_id` , `permission_id` ) VALUES
('1', '43');


-- Sidebars

INSERT INTO `sidebars` ( `id` , `alias` , `language_title` , `language_body` , `created` , `created_by` , `modified` , `modified_by` ) VALUES
(NULL , 'sop_sop_masters_listall', 'sop_standard operating procedures', 'sop_sidebar_sop listall', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(NULL , 'sop_sop_masters_add', 'sop_standard operating procedures', 'sop_sidebar_sop add', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(NULL , 'sop_sop_masters_detail', 'sop_standard operating procedures', 'sop_sidebar_sop detail', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(NULL , 'sop_sop_masters_edit', 'sop_standard operating procedures', 'sop_sidebar_sop edit', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(NULL , 'sop_sop_extends_listall', 'sop_standard operating procedures', 'sop_sidebar_sope listall', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(NULL , 'sop_sop_extends_add', 'sop_standard operating procedures', 'sop_sidebar_sope add', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(NULL , 'sop_sop_extends_detail', 'sop_standard operating procedures', 'sop_sidebar_sope detail', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(NULL , 'sop_sop_extends_edit', 'sop_standard operating procedures', 'sop_sidebar_sope edit', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


-- Forms

INSERT INTO `forms` (`id`, `alias`, `model`, `language_title`, `language_help`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-66', 'sop_masters', 'SopControl,SopMaster,SopDetail', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-67', 'sopd_inventory_tissue', 'SopControl,SopMaster,SopDetail', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-68', 'sope_inventory_tissue', 'SopControl,SopMaster,SopDetail,SopExtend', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


-- Link forms --> form fields

INSERT INTO `forms_form_fields` ( `form_id` , `field_id` ) VALUES
('CAN-999-999-000-999-66', 'CAN-999-999-000-999-531'),
('CAN-999-999-000-999-66', 'CAN-999-999-000-999-532'),
('CAN-999-999-000-999-66', 'CAN-999-999-000-999-533'),
('CAN-999-999-000-999-66', 'CAN-999-999-000-999-534'),
('CAN-999-999-000-999-66', 'CAN-999-999-000-999-535'),
('CAN-999-999-000-999-67', 'CAN-999-999-000-999-536'),
('CAN-999-999-000-999-67', 'CAN-999-999-000-999-531'),
('CAN-999-999-000-999-67', 'CAN-999-999-000-999-532'),
('CAN-999-999-000-999-67', 'CAN-999-999-000-999-533'),
('CAN-999-999-000-999-67', 'CAN-999-999-000-999-534'),
('CAN-999-999-000-999-67', 'CAN-999-999-000-999-535'),
('CAN-999-999-000-999-68', 'CAN-999-999-000-999-537'),
('CAN-999-999-000-999-68', 'CAN-999-999-000-999-538'),
('CAN-999-999-000-999-66', 'CAN-999-999-000-999-539'),
('CAN-999-999-000-999-66', 'CAN-999-999-000-999-540'),
('CAN-999-999-000-999-67', 'CAN-999-999-000-999-539'),
('CAN-999-999-000-999-67', 'CAN-999-999-000-999-540');


-- Form Fields

INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_heading`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_datagrid`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_datagrid`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-531', 'SopMaster', 'title', 1, 1, '', 'sop_title', '', 'input', 'size=30', '', '', 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-532', 'SopMaster', 'notes', 1, 99, '', 'sop_notes', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-533', 'SopMaster', 'code', 1, 2, '', 'sop_code', '', 'input', 'size=20', '', '', 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-534', 'SopMaster', 'sop_group', 1, 5, '', 'sop_sop group', '', 'select', '', '', '', 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-535', 'SopMaster', 'type', 1, 6, '', 'sop_type', '', 'input', 'size=30', '', '', 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-536', 'SopDetail', 'detail_field', '1', '10', '', 'sop_detail field', '', 'input', 'size=40', '', '', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-537', 'SopExtend', 'site_specific', '1', '13', '', 'sop_site specific', '', 'input', 'size=40', '', 'sop_help_site specific', '1', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-538', 'SopExtend', 'material_id', '1', '12', '', 'sop_material', '', 'select', '', '', '', '1', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-539', 'SopMaster', 'scope', '1', '3', '', 'sop_scope', '', 'textarea', 'cols=60,rows=6', '', 'sop_help_scope', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-540', 'SopMaster', 'purpose', '1', '4', '', 'sop_purpose', '', 'textarea', 'cols=60,rows=6', '', 'sop_help_purpose', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


-- Languages

INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('sop_standard operating procedures', 'global', 'Standard Operating Procedures', ''),
('sop_title', 'global', 'Title', ''),
('sop_code', 'global', 'Code', ''),
('sop_sop group', 'global', 'SOP Group', ''),
('sop_type', 'global', 'Type', ''),
('sop_detail field', 'global', 'Detail Field', ''),
('sop_notes', 'global', 'Notes', ''),
('sop_detail', 'global', 'Summary', ''),
('sop_extend', 'global', 'Details', ''),
('sop_material', 'global', 'Material', ''),
('sop_extend field', 'global', 'Extend Field', ''),
('sop_scope', 'global', 'Scope', ''),
('sop_purpose', 'global', 'Purpose', '');