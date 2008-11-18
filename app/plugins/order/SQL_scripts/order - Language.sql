-- Language Lookups

-- Menus
INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('order_orders', 'global', 'Orders', ''),
('order_order management', 'global', 'Order Management', ''),
('order_order detail', 'global', 'Order Detail', ''),
('order_order lines', 'global', 'Order Lines', ''),
('order_order line detail', 'global', 'Line Detail', ''),
('order_shipments', 'global', 'Shipments', ''),
('order_order items', 'global', 'Order Items', ''),
('order_order item detail', 'global', 'Item Detail', ''),
('order_shipment detail', 'global', 'Shipment Detail', ''),
('order_shipment items', 'global', 'Shipment Items', '');

-- Orders
INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('order_order number', 'global', 'Order Number', ''),
('order_study', 'global', 'Study', ''),
('order_short title', 'global', 'Short Title', ''),
('order_date order placed', 'global', 'Date Placed', ''),
('order_date order completed', 'global', 'Date Completed', ''),
('order_processing status', 'global', 'Processing Status', ''),
('order_description', 'global', 'Description', ''),
('order_comments', 'global', 'Comments', '');

-- Order Lines
INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('order_cancer_type', 'global', 'Cancer Type', ''),
('order_product_code', 'global', 'Product Code', ''),
('order_quantity_ordered', 'global', 'Quantity Ordered', ''),
('order_quantity_UM', 'global', 'Quantity UM', ''),
('order_base_price', 'global', 'Base Price', ''),
('order_date_required', 'global', 'Date Required', ''),
('order_quantity_shipped', 'global', 'Quantity Shipped', ''),
('order_status', 'global', 'Status', ''),
('order_discount code', 'global', 'Discount Code', ''),
('order_min qty ordered', 'global', 'Minimum Quantity Ordered', ''),
('order_min qty UM', 'global', 'Minimum Quantity UM', '');

-- Order Items
INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('order_barcode', 'global', 'Barcode', ''),
('order_date_added', 'global', 'Date Added', ''),
('order_added_by', 'global', 'Added By', ''),
('order_datetime_scanned_out', 'global', 'Scanned Out At', ''),
('order_status', 'global', 'Status', ''),
('order_shipment', 'global', 'Shipment', '');

-- Shipments
INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('order_shipment code', 'global', 'Shipment Code', ''),
('order_delivery_street_address', 'global', 'Street Address', ''),
('order_delivery_province', 'global', 'Province', ''),
('order_delivery_city', 'global', 'City', ''),
('order_delivery_postal_code', 'global', 'Postal Code', ''),
('order_delivery_country', 'global', 'Delivery Country', ''),
('order_shipping_country', 'global', 'Shipping Country', ''),
('order_shipping_account_nbr', 'global', 'Shipping Account Number', ''),
('order_datetime_shipped', 'global', 'Datetime Shipped', ''),
('order_datetime_received', 'global', 'Datetime Received', ''),
('order_shipped_by', 'global', 'Shipped By', '');

INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` ) VALUES
('at least 2 aliquots have this defined barcode', 'global', 'At least 2 aliquots have this defined barcode! Please contact your system administrator!', 'Au moins deux aliquots ont le m&ecirc;me barcode! Veuillez contacter l''administrateur du syst&grave;me!');