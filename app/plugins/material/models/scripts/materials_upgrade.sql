-- Materials DML


-- Permissions

INSERT INTO `permissions` ( `id` , `name` , `created` , `created_by` , `modified_by` , `modified` ) VALUES
(44 , 'material', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00');

INSERT INTO `groups_permissions` ( `group_id` , `permission_id` ) VALUES
('1', '44');


-- Menus

INSERT INTO `menus` ( `id` , `parent_id` , `display_order` , `language_title` , `language_description` , `use_link` , `use_param` , `active` , `created` , `created_by` , `modified` , `modified_by` ) VALUES
('mat_CAN_01', 'core_CAN_33', '2', 'sop_materials and equipment', '', '/material/materials/index/', '1', 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('mat_CAN_2', 'mat_CAN_1', '1', 'mat_material', '', '/material/materials/detail/', '1', 'yes', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

-- Forms

INSERT INTO `forms` (`id`, `alias`, `model`, `language_title`, `language_help`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-69', 'materials', 'Material', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


-- Link forms --> form fields

INSERT INTO `forms_form_fields` ( `form_id` , `field_id` ) VALUES
('CAN-999-999-000-999-69', 'AAA-000-000-000-000-69'),
('CAN-999-999-000-999-69', 'AAA-000-000-000-000-70'),
('CAN-999-999-000-999-69', 'AAA-000-000-000-000-71');


-- Form Fields

INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_heading`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_datagrid`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_datagrid`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('AAA-000-000-000-000-69', 'Material', 'item_name', 1, 1, '', 'mat_item name', '', 'input', 'size=30', '', '', 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('AAA-000-000-000-000-70', 'Material', 'item_type', 1, 2, '', 'mat_item type', '', 'select', '', '', '', 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('AAA-000-000-000-000-71', 'Material', 'description', 1, 3, '', 'mat_description', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


-- Sidebars

INSERT INTO `sidebars` ( `id` , `alias` , `language_title` , `language_body` , `created` , `created_by` , `modified` , `modified_by` ) VALUES
(NULL , 'material_materials_index', 'mat_materials', 'mat_sidebar_material index', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(NULL , 'material_materials_detail', 'mat_materials', 'mat_sidebar_material detail', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(NULL , 'material_materials_search', 'mat_materials', 'mat_sidebar_material search', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(NULL , 'material_materials_add', 'mat_materials', 'mat_sidebar_material add', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(NULL , 'material_materials_edit', 'mat_materials', 'mat_sidebar_material add', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


-- Languages

INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('sop_materials and equipment', 'global', 'Materials and Equipment', ''),
('mat_item name', 'global', 'Item Name', ''),
('mat_item type', 'global', 'Item Type', ''),
('mat_materials', 'global', 'Materials', ''),
('mat_description', 'global', 'Description', ''),
('mat_material', 'global', 'Material', '');