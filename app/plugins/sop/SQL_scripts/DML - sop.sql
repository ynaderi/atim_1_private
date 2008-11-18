-- 
-- Dumping data for table `menus`
-- 

INSERT INTO `menus` (`id`, `parent_id`, `display_order`, `language_title`, `language_description`, `use_link`, `use_param`, `active`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('sop_CAN_01', 'core_CAN_33', 1, 'sop_standard operating procedures', '', '/sop/sop_masters/listall/', 1, '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('sop_CAN_02', 'sop_CAN_01', 3, 'sop_standard operating procedures', '', '/sop/sop_masters/listall/', 1, '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('sop_CAN_03', 'sop_CAN_02', 1, 'sop_detail', '', '/sop/sop_masters/detail/', 1, '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('sop_CAN_04', 'sop_CAN_02', 2, 'sop_extend', '', '/sop/sop_extends/listall/', 1, '1', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

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

-- 
-- Dumping data for table `forms`
-- 

INSERT INTO `forms` (`id`, `alias`, `language_title`, `language_help`, `flag_add_columns`, `flag_edit_columns`, `flag_search_columns`, `flag_index_columns`, `flag_datagrid_columns`, `flag_detail_columns`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-66', 'sop_masters', '', '', 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-67', 'sopd_general_all', '', '', 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-68', 'sope_general_all', '', '', 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

-- 
-- Dumping data for table `form_formats`
-- 

INSERT INTO `form_formats` (`id`, `form_id`, `field_id`, `display_column`, `display_order`, `language_heading`, `flag_override_label`, `language_label`, `flag_override_tag`, `language_tag`, `flag_override_help`, `language_help`, `flag_add`, `flag_add_readonly`, `flag_edit`, `flag_edit_readonly`, `flag_search`, `flag_search_readonly`, `flag_datagrid`, `flag_datagrid_readonly`, `flag_index`, `flag_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
(1536, 'CAN-999-999-000-999-66', 'CAN-999-999-000-999-531', 1, 1, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1537, 'CAN-999-999-000-999-66', 'CAN-999-999-000-999-532', 1, 99, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1538, 'CAN-999-999-000-999-66', 'CAN-999-999-000-999-533', 1, 2, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1539, 'CAN-999-999-000-999-66', 'CAN-999-999-000-999-534', 1, 4, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1540, 'CAN-999-999-000-999-66', 'CAN-999-999-000-999-535', 1, 5, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1562, 'CAN-999-999-000-999-66', 'CAN-999-999-000-999-539', 1, 9, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1563, 'CAN-999-999-000-999-66', 'CAN-999-999-000-999-540', 1, 10, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(2121, 'CAN-999-999-000-999-66', 'CAN-999-999-000-999-541', 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(2123, 'CAN-999-999-000-999-66', 'CAN-999-999-000-999-543', 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(2124, 'CAN-999-999-000-999-66', 'CAN-999-999-000-999-544', 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(2127, 'CAN-999-999-000-999-66', 'CAN-999-999-000-999-545', 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `form_formats` (`id`, `form_id`, `field_id`, `display_column`, `display_order`, `language_heading`, `flag_override_label`, `language_label`, `flag_override_tag`, `language_tag`, `flag_override_help`, `language_help`, `flag_add`, `flag_add_readonly`, `flag_edit`, `flag_edit_readonly`, `flag_search`, `flag_search_readonly`, `flag_datagrid`, `flag_datagrid_readonly`, `flag_index`, `flag_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
(1541, 'CAN-999-999-000-999-67', 'CAN-999-999-000-999-536', 1, 11, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1542, 'CAN-999-999-000-999-67', 'CAN-999-999-000-999-531', 1, 1, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1543, 'CAN-999-999-000-999-67', 'CAN-999-999-000-999-532', 1, 99, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1544, 'CAN-999-999-000-999-67', 'CAN-999-999-000-999-533', 1, 2, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1545, 'CAN-999-999-000-999-67', 'CAN-999-999-000-999-534', 1, 4, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1546, 'CAN-999-999-000-999-67', 'CAN-999-999-000-999-535', 1, 5, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1564, 'CAN-999-999-000-999-67', 'CAN-999-999-000-999-539', 1, 9, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1565, 'CAN-999-999-000-999-67', 'CAN-999-999-000-999-540', 1, 10, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(2122, 'CAN-999-999-000-999-67', 'CAN-999-999-000-999-541', 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(2125, 'CAN-999-999-000-999-67', 'CAN-999-999-000-999-543', 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(2126, 'CAN-999-999-000-999-67', 'CAN-999-999-000-999-544', 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(2128, 'CAN-999-999-000-999-67', 'CAN-999-999-000-999-545', 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `form_formats` (`id`, `form_id`, `field_id`, `display_column`, `display_order`, `language_heading`, `flag_override_label`, `language_label`, `flag_override_tag`, `language_tag`, `flag_override_help`, `language_help`, `flag_add`, `flag_add_readonly`, `flag_edit`, `flag_edit_readonly`, `flag_search`, `flag_search_readonly`, `flag_datagrid`, `flag_datagrid_readonly`, `flag_index`, `flag_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
(1547, 'CAN-999-999-000-999-68', 'CAN-999-999-000-999-537', 1, 2, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(1548, 'CAN-999-999-000-999-68', 'CAN-999-999-000-999-538', 1, 1, '', 0, '', 0, '', 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

-- 
-- Dumping data for table `form_fields`
-- 

INSERT INTO `form_fields` (`id`, `model`, `field`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-531', 'SopMaster', 'title', 'sop_title', '', 'input', 'size=30', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-532', 'SopMaster', 'notes', 'sop_notes', '', 'textarea', 'cols=60,rows=6', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-533', 'SopMaster', 'code', 'sop_code', '', 'input', 'size=20', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-534', 'SopMaster', 'sop_group', 'sop_sop group', '', 'select', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-535', 'SopMaster', 'type', 'sop_type', '', 'input', 'size=30', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-536', 'SopDetail', 'value', 'sop_detail field', '', 'input', 'size=40', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-537', 'SopExtend', 'site_specific', 'sop_site specific', '', 'input', 'size=40', '', 'sop_help_site specific', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-538', 'SopExtend', 'material_id', 'sop_material', '', 'select', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-539', 'SopMaster', 'scope', 'sop_scope', '', 'textarea', 'cols=60,rows=6', '', 'sop_help_scope', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-540', 'SopMaster', 'purpose', 'sop_purpose', '', 'textarea', 'cols=60,rows=6', '', 'sop_help_purpose', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-541', 'SopMaster', 'version', '', 'sop_version', 'input', 'size=10', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-543', 'SopMaster', 'expiry_date', 'sop_expiry date', '', 'date', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-544', 'SopMaster', 'activated_date', 'sop_date activated', '', 'date', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-545', 'SopMaster', 'status', 'sop_status', '', 'select', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');