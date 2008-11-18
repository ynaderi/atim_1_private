-- 
-- Table structure for table `study_contacts`
-- 

DROP TABLE IF EXISTS `study_contacts`;
CREATE TABLE `study_contacts` (
  `id` int(11) NOT NULL auto_increment,
  `sort` int(11) default NULL,
  `prefix` int(11) default NULL,
  `first_name` varchar(255) default NULL,
  `middle_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `accreditation` varchar(255) default NULL,
  `occupation` varchar(255) default NULL,
  `department` varchar(255) default NULL,
  `organization` varchar(255) default NULL,
  `organization_type` varchar(255) default NULL,
  `gender` varchar(255) default NULL,
  `address_street` varchar(255) default NULL,
  `address_city` varchar(255) default NULL,
  `address_province` varchar(255) default NULL,
  `address_country` varchar(255) default NULL,
  `address_postal` varchar(255) default NULL,
  `phone_country` varchar(255) default NULL,
  `phone_area` varchar(255) default NULL,
  `phone_number` varchar(255) default NULL,
  `phone_extension` varchar(255) default NULL,
  `phone2_counrty` varchar(255) default NULL,
  `phone2_area` varchar(255) default NULL,
  `phone2_number` varchar(255) default NULL,
  `phone2_extension` varchar(255) default NULL,
  `fax_country` varchar(255) default NULL,
  `fax_area` varchar(255) default NULL,
  `fax_number` varchar(255) default NULL,
  `fax_extension` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `website` varchar(255) default NULL,
  `created` date default NULL,
  `created_by` varchar(50) default NULL,
  `modified` date default NULL,
  `modified_by` varchar(50) default NULL,
  `study_summary_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- 
-- Table structure for table `study_ethicsboards`
-- 

DROP TABLE IF EXISTS `study_ethicsboards`;
CREATE TABLE `study_ethicsboards` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `name_short` varchar(255) default NULL,
  `department` varchar(255) default NULL,
  `organization` varchar(255) default NULL,
  `address_street` varchar(255) default NULL,
  `address_city` varchar(255) default NULL,
  `address_province` varchar(255) default NULL,
  `address_country` varchar(255) default NULL,
  `address_postal` varchar(255) default NULL,
  `phone_country` varchar(255) default NULL,
  `phone_area` varchar(255) default NULL,
  `phone_number` varchar(255) default NULL,
  `phone_extension` varchar(255) default NULL,
  `fax_country` varchar(255) default NULL,
  `fax_area` varchar(255) default NULL,
  `fax_number` varchar(255) default NULL,
  `fax_extension` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `website` varchar(255) default NULL,
  `compliance` varchar(255) default NULL,
  `accrediation` varchar(255) default NULL,
  `ohrp_registration_number` varchar(255) default NULL,
  `ohrp_fwa_number` varchar(255) default NULL,
  `created` date default NULL,
  `created_by` varchar(50) default NULL,
  `modified` date default NULL,
  `modified_by` varchar(50) default NULL,
  `study_summary_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- 
-- Table structure for table `study_fundings`
-- 

DROP TABLE IF EXISTS `study_fundings`;
CREATE TABLE `study_fundings` (
  `id` int(11) NOT NULL auto_increment,
  `study_sponsor_id` int(11) default NULL,
  `restrictions` text,
  `year_1` int(11) default NULL,
  `amount_year_1` int(11) default NULL,
  `year_2` int(11) default NULL,
  `amount_year_2` int(11) default NULL,
  `year_3` int(11) default NULL,
  `amount_year_3` int(11) default NULL,
  `year_4` int(11) default NULL,
  `amount_year_4` int(11) default NULL,
  `year_5` int(11) default NULL,
  `amount_year_5` int(11) default NULL,
  `contact` varchar(255) default NULL,
  `phone_country` varchar(255) default NULL,
  `phone_area` varchar(255) default NULL,
  `phone_number` varchar(255) default NULL,
  `phone_extension` varchar(255) default NULL,
  `fax_country` varchar(255) default NULL,
  `fax_area` varchar(255) default NULL,
  `fax_number` varchar(255) default NULL,
  `fax_extension` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `created` date default NULL,
  `created_by` varchar(50) default NULL,
  `modified` date default NULL,
  `modified_by` varchar(50) default NULL,
  `rtbform_id` int(11) default NULL,
  `study_summary_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- 
-- Table structure for table `study_investigators`
-- 

DROP TABLE IF EXISTS `study_investigators`;
CREATE TABLE `study_investigators` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` varchar(255) default NULL,
  `middle_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `accrediation` varchar(255) default NULL,
  `occupation` varchar(255) default NULL,
  `department` varchar(255) default NULL,
  `organization` varchar(255) default NULL,
  `address_city` varchar(255) default NULL,
  `address_province` varchar(255) default NULL,
  `address_country` varchar(255) default NULL,
  `sort` int(11) default NULL,
  `role` int(11) default NULL,
  `brief` text,
  `created` date default NULL,
  `created_by` varchar(50) default NULL,
  `modified` date default NULL,
  `modified_by` varchar(50) default NULL,
  `rtbform_id` int(11) default NULL,
  `study_summary_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- 
-- Table structure for table `study_related`
-- 

DROP TABLE IF EXISTS `study_related`;
CREATE TABLE `study_related` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `pi` varchar(255) default NULL,
  `journal` varchar(255) default NULL,
  `issue` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `abstract` text,
  `relevance` text,
  `date_posted` date default NULL,
  `created` date default NULL,
  `created_by` varchar(50) default NULL,
  `modified` date default NULL,
  `modified_by` varchar(50) default NULL,
  `study_summary_id` int(11) NOT NULL,
  `rtbform_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- 
-- Table structure for table `study_results`
-- 

DROP TABLE IF EXISTS `study_results`;
CREATE TABLE `study_results` (
  `id` int(11) NOT NULL auto_increment,
  `abstract` text,
  `hypothesis` text,
  `conclusion` text,
  `comparison` text,
  `future` text,
  `created` date default NULL,
  `created_by` varchar(50) default NULL,
  `modified` date default NULL,
  `modified_by` varchar(50) default NULL,
  `rtbform_id` int(11) default NULL,
  `study_summary_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- 
-- Table structure for table `study_reviews`
-- 

DROP TABLE IF EXISTS `study_reviews`;
CREATE TABLE `study_reviews` (
  `id` int(11) NOT NULL auto_increment,
  `prefix` int(11) default NULL,
  `first_name` varchar(255) default NULL,
  `middle_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `accreditation` varchar(255) default NULL,
  `commitee` varchar(255) default NULL,
  `institution` varchar(255) default NULL,
  `phone_country` varchar(255) default NULL,
  `phone_area` varchar(255) default NULL,
  `phone_number` varchar(255) default NULL,
  `phone_extension` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `status` int(11) default NULL,
  `created` date default NULL,
  `created_by` varchar(50) default NULL,
  `modified` date default NULL,
  `modified_by` varchar(50) default NULL,
  `study_summary_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- 
-- Table structure for table `study_summaries`
-- 

DROP TABLE IF EXISTS `study_summaries`;
CREATE TABLE `study_summaries` (
  `id` int(11) NOT NULL auto_increment,
  `disease_site` varchar(50) default NULL,
  `study_type` varchar(50) default NULL,
  `study_science` varchar(50) default NULL,
  `study_use` varchar(50) default NULL,
  `title` varchar(45) default NULL,
  `summary` text,
  `abstract` text,
  `hypothesis` text,
  `approach` text,
  `analysis` text,
  `significance` text,
  `additional_clinical` text,
  `created` date default NULL,
  `created_by` varchar(50) default NULL,
  `modified` date default NULL,
  `modified_by` varchar(50) default NULL,
  `rtbform_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
