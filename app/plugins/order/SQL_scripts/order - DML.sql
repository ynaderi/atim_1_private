-- Menus

INSERT INTO `menus` (`id`, `parent`, `display_order`, `language_title`, `use_link`, `use_param`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('tool_CAN_102', 'tool_CAN_101', 1, 'order_orders', '/order/orders/listall/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_101', 'core_CAN_33', 9, 'order_order management', '/order/orders/index/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_113', 'tool_CAN_102', 1, 'order_order detail', '/order/orders/detail/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_114', 'tool_CAN_102', 2, 'order_order lines', '/order/order_lines/listall/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_115', 'tool_CAN_114', 1, 'order_order line detail', '/order/order_lines/detail/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_116', 'tool_CAN_102', 3, 'order_shipments', '/order/shipments/listall/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_117', 'tool_CAN_114', 2, 'order_order items', '/order/order_items/listall/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_118', 'tool_CAN_117', 1, 'order_order item detail', '/order/order_items/detail/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_119', 'tool_CAN_116', 1, 'order_shipment detail', '/order/shipments/detail/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_120', 'tool_CAN_116', 2, 'order_shipment items', '/order/order_items/shipment_items/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


-- Forms

INSERT INTO `forms` (`id`, `alias`, `model`, `language_title`, `language_help`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-51', 'orders', 'Order', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-60', 'orderlines', 'OrderLine', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-61', 'orderitems', 'OrderItem', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-62', 'shipments', 'Shipment', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


-- Form_form_fields

INSERT INTO `forms_form_fields` (`form_id`, `field_id`) VALUES 
('CAN-999-999-000-999-51', 'CAN-999-999-000-999-355'),
('CAN-999-999-000-999-51', 'CAN-999-999-000-999-356'),
('CAN-999-999-000-999-51', 'CAN-999-999-000-999-357'),
('CAN-999-999-000-999-51', 'CAN-999-999-000-999-358'),
('CAN-999-999-000-999-51', 'CAN-999-999-000-999-359'),
('CAN-999-999-000-999-51', 'CAN-999-999-000-999-360'),
('CAN-999-999-000-999-51', 'CAN-999-999-000-999-361'),
('CAN-999-999-000-999-51', 'CAN-999-999-000-999-362');

INSERT INTO `forms_form_fields` (`form_id`, `field_id`) VALUES
('CAN-999-999-000-999-60', 'CAN-999-999-000-999-487'),
('CAN-999-999-000-999-60', 'CAN-999-999-000-999-488'),
('CAN-999-999-000-999-60', 'CAN-999-999-000-999-489'),
('CAN-999-999-000-999-60', 'CAN-999-999-000-999-490'),
('CAN-999-999-000-999-60', 'CAN-999-999-000-999-491'),
('CAN-999-999-000-999-60', 'CAN-999-999-000-999-492'),
('CAN-999-999-000-999-60', 'CAN-999-999-000-999-493'),
('CAN-999-999-000-999-60', 'CAN-999-999-000-999-494'),
('CAN-999-999-000-999-60', 'CAN-999-999-000-999-495'),
('CAN-999-999-000-999-60', 'CAN-999-999-000-999-503'),
('CAN-999-999-000-999-60', 'CAN-999-999-000-999-502');

INSERT INTO `forms_form_fields` (`form_id`, `field_id`) VALUES 
('CAN-999-999-000-999-61', 'CAN-999-999-000-999-497'),
('CAN-999-999-000-999-61', 'CAN-999-999-000-999-498'),
('CAN-999-999-000-999-61', 'CAN-999-999-000-999-499'),
('CAN-999-999-000-999-61', 'CAN-999-999-000-999-500'),
('CAN-999-999-000-999-61', 'CAN-999-999-000-999-501'),
('CAN-999-999-000-999-61', 'CAN-999-999-000-999-504');

INSERT INTO `forms_form_fields` (`form_id`, `field_id`) VALUES
('CAN-999-999-000-999-62', 'CAN-999-999-000-999-496'),
('CAN-999-999-000-999-62', 'CAN-999-999-000-999-505'),
('CAN-999-999-000-999-62', 'CAN-999-999-000-999-506'),
('CAN-999-999-000-999-62', 'CAN-999-999-000-999-507'),
('CAN-999-999-000-999-62', 'CAN-999-999-000-999-508'),
('CAN-999-999-000-999-62', 'CAN-999-999-000-999-509'),
('CAN-999-999-000-999-62', 'CAN-999-999-000-999-510'),
('CAN-999-999-000-999-62', 'CAN-999-999-000-999-511'),
('CAN-999-999-000-999-62', 'CAN-999-999-000-999-512'),
('CAN-999-999-000-999-62', 'CAN-999-999-000-999-513'),
('CAN-999-999-000-999-62', 'CAN-999-999-000-999-514');


-- Form_fields

INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-355', 'Order', 'order_number', 1, 1, 'order_order number', '', 'input', 'size=20', '', '', 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-356', 'Order', 'study_summary_id', 1, 4, 'order_study', '', 'select', '', '', '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-357', 'Order', 'short_title', 1, 2, 'order_short title', '', 'input', 'size=20', '', '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-358', 'Order', 'description', 1, 10, 'order_description', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-359', 'Order', 'date_order_placed', 1, 6, 'order_date order placed', '', 'date', '', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-360', 'Order', 'date_order_completed', 1, 7, 'order_date order completed', '', 'date', '', 'NULL', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-361', 'Order', 'processing_status', 1, 5, 'order_processing status', '', 'select', '', '', '', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-362', 'Order', 'comments', 1, 10, 'order_comments', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-487', 'OrderLine', 'cancer_type', 1, 1, 'order_cancer_type', '', 'select', '', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-488', 'OrderLine', 'product_id', 1, 2, 'order_product_code', '', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-489', 'OrderLine', 'quantity_ordered', 1, 4, 'order_quantity_ordered', '', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-490', 'OrderLine', 'quantity_UM', 1, 5, 'order_quantity_UM', '', 'input', 'size=10', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-491', 'OrderLine', 'base_price', 1, 8, 'order_base_price', '', 'input', 'size=10', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-492', 'OrderLine', 'date_required', 1, 3, 'order_date_required', '', 'date', '', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-493', 'OrderLine', 'quantity_shipped', 1, 10, 'order_quantity_shipped', '', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-494', 'OrderLine', 'status', 11, 8, 'order_status', '', 'input', 'size=20', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-495', 'OrderLine', 'discount_id', 1, 9, 'order_discount code', '', 'input', 'size=20', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-502', 'OrderLine', 'min_qty_ordered', 1, 6, 'order_min qty ordered', '', 'input', 'size=10', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-503', 'OrderLine', 'min_qty_UM', 1, 7, 'order_min qty UM', '', 'input', 'size=10', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-497', 'OrderItem', 'barcode', 1, 1, 'order_barcode', '', 'input', 'size=20', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-498', 'OrderItem', 'date_added', 1, 2, 'order_date_added', '', 'datetime', '', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-499', 'OrderItem', 'added_by', 1, 3, 'order_added_by', '', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-500', 'OrderItem', 'datetime_scanned_out', 1, 4, 'order_datetime_scanned_out', '', 'datetime', '', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-501', 'OrderItem', 'status', 1, 5, 'order_status', '', 'input', 'size=15', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-504', 'OrderItem', 'shipment_id', 1, 6, 'order_shipment', '', 'select', '', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-496', 'Shipment', 'shipment_code', 1, 0, 'order_shipment code', '', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-505', 'Shipment', 'delivery_street_address', 1, 0, 'order_delivery_street_address', '', 'input', 'size=25', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-506', 'Shipment', 'delivery_province', 1, 2, 'order_delivery_province', '', 'input', 'size=25', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-507', 'Shipment', 'delivery_city', 1, 1, 'order_delivery_city', '', 'input', 'size=20', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-508', 'Shipment', 'delivery_postal_code', 1, 3, 'order_delivery_postal_code', '', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-509', 'Shipment', 'delivery_country', 1, 4, 'order_delivery_country', '', 'input', 'size=20', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-510', 'Shipment', 'shipping_country', 1, 5, 'order_shipping_country', '', 'input', 'size=20', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-511', 'Shipment', 'shipping_account_nbr', 1, 6, 'order_shipping_account_nbr', '', 'input', 'size=10', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-512', 'Shipment', 'datetime_shipped', 1, 7, 'order_datetime_shipped', '', 'datetime', '', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-513', 'Shipment', 'datetime_received', 1, 8, 'order_datetime_received', '', 'datetime', '', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-514', 'Shipment', 'shipped_by', 1, 8, 'order_shipped_by', '', 'input', 'size=20', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');
