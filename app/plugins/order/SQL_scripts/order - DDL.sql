-- 
-- Table structure for table `order_items`
-- 

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL auto_increment,
  `barcode` varchar(255) default NULL,
  `base_price` varchar(255) default NULL,
  `date_added` date default NULL,
  `added_by` varchar(255) default NULL,
  `datetime_scanned_out` datetime default NULL,
  `status` varchar(255) default NULL,
  `created` date default NULL,
  `created_by` varchar(50) default NULL,
  `modified` date default NULL,
  `modified_by` varchar(50) default NULL,
  `orderline_id` int(11) default NULL,
  `shipment_id` int(11) default NULL,
  `aliquot_master_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- 
-- Table structure for table `order_lines`
-- 

DROP TABLE IF EXISTS `order_lines`;
CREATE TABLE `order_lines` (
  `id` int(11) NOT NULL auto_increment,
  `cancer_type` varchar(255) default NULL,
  `quantity_ordered` int(255) default NULL,
  `quantity_UM` varchar(255) default NULL,
  `min_qty_ordered` int(11) default NULL,
  `min_qty_UM` varchar(50) default NULL,
  `base_price` varchar(255) default NULL,
  `date_required` date default NULL,
  `quantity_shipped` int(11) default NULL,
  `status` varchar(255) default NULL,
  `created` datetime default NULL,
  `created_by` varchar(50) default NULL,
  `modified` datetime default NULL,
  `modified_by` varchar(50) default NULL,
  `discount_id` int(11) default NULL,
  `product_id` int(11) default NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- 
-- Table structure for table `orders`
-- 

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL auto_increment,
  `order_number` varchar(50) NOT NULL,
  `short_title` varchar(45) default NULL,
  `description` varchar(255) default NULL,
  `date_order_placed` date default NULL,
  `date_order_completed` date default NULL,
  `processing_status` varchar(45) default NULL,
  `comments` varchar(255) default NULL,
  `created` datetime default NULL,
  `created_by` varchar(50) default NULL,
  `modified` datetime default NULL,
  `modified_by` varchar(45) default NULL,
  `study_summary_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Table structure for table `shipments`
-- 

DROP TABLE IF EXISTS `shipments`;
CREATE TABLE `shipments` (
  `id` int(11) NOT NULL auto_increment,
  `shipment_code` varchar(255) NOT NULL default 'No Code',
  `delivery_street_address` varchar(255) default NULL,
  `delivery_city` varchar(255) default NULL,
  `delivery_province` varchar(255) default NULL,
  `delivery_postal_code` varchar(255) default NULL,
  `delivery_country` varchar(255) default NULL,
  `shipping_company` varchar(255) default NULL,
  `shipping_account_nbr` varchar(255) default NULL,
  `datetime_shipped` datetime default NULL,
  `datetime_received` datetime default NULL,
  `shipped_by` varchar(255) default NULL,
  `created` datetime default NULL,
  `created_by` varchar(50) default NULL,
  `modified` datetime default NULL,
  `modified_by` varchar(45) default NULL,
  `order_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;
