-- Forms

INSERT INTO `forms` (`id`, `alias`, `model`, `language_title`, `language_help`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-52', 'study_summaries', 'StudySummary', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-53', 'study_contacts', 'StudyContact', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-54', 'study_investigators', 'StudyInvestigator', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-55', 'study_related', 'StudyRelated', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-56', 'study_reviews', 'StudyReview', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-57', 'study_ethicsboards', 'StudyEthicsBoard', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-58', 'study_fundings', 'StudyFunding', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-59', 'study_results', 'StudyResult', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


-- Menus

INSERT INTO `menus` (`id`, `parent`, `display_order`, `language_title`, `use_link`, `use_param`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('tool_CAN_100', 'core_CAN_33', 8, 'tool_study', '/study/study_summaries/listall/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_103', 'tool_CAN_100', 1, 'tool_study', '/study/study_summaries/listall/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_104', 'tool_CAN_103', 1, 'tool_summary', '/study/study_summaries/detail/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_105', 'tool_CAN_103', 2, 'tool_contact', '/study/study_contacts/listall/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_106', 'tool_CAN_103', 3, 'tool_investigator', '/study/study_investigators/listall/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_107', 'tool_CAN_103', 4, 'tool_reviews', '/study/study_reviews/listall/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_108', 'tool_CAN_103', 5, 'tool_ethics', '/study/study_ethicsboards/listall/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_109', 'tool_CAN_103', 6, 'tool_funding', '/study/study_fundings/listall/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_110', 'tool_CAN_103', 7, 'tool_result', '/study/study_results/listall/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('tool_CAN_112', 'tool_CAN_103', 9, 'tool_related studies', '/study/study_related/listall/', 1, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');


- Form_form_fields

INSERT INTO `forms_form_fields` (`form_id`, `field_id`) VALUES 
('CAN-999-999-000-999-52', 'CAN-999-999-000-999-364'),
('CAN-999-999-000-999-52', 'CAN-999-999-000-999-365'),
('CAN-999-999-000-999-52', 'CAN-999-999-000-999-366'),
('CAN-999-999-000-999-52', 'CAN-999-999-000-999-367'),
('CAN-999-999-000-999-52', 'CAN-999-999-000-999-368'),
('CAN-999-999-000-999-52', 'CAN-999-999-000-999-369'),
('CAN-999-999-000-999-52', 'CAN-999-999-000-999-370'),
('CAN-999-999-000-999-52', 'CAN-999-999-000-999-371'),
('CAN-999-999-000-999-52', 'CAN-999-999-000-999-372'),
('CAN-999-999-000-999-52', 'CAN-999-999-000-999-373'),
('CAN-999-999-000-999-52', 'CAN-999-999-000-999-374'),
('CAN-999-999-000-999-52', 'CAN-999-999-000-999-375');

INSERT INTO `forms_form_fields` (`form_id`, `field_id`) VALUES 
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-384'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-385'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-386'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-387'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-388'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-389'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-390'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-391'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-392'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-393'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-394'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-395'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-396'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-397'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-398'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-399'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-400'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-401'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-402'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-403'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-404'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-405'),
('CAN-999-999-000-999-53', 'CAN-999-999-000-999-406');

INSERT INTO `forms_form_fields` (`form_id`, `field_id`) VALUES 
('CAN-999-999-000-999-54', 'CAN-999-999-000-999-417'),
('CAN-999-999-000-999-54', 'CAN-999-999-000-999-416'),
('CAN-999-999-000-999-54', 'CAN-999-999-000-999-415'),
('CAN-999-999-000-999-54', 'CAN-999-999-000-999-414'),
('CAN-999-999-000-999-54', 'CAN-999-999-000-999-413'),
('CAN-999-999-000-999-54', 'CAN-999-999-000-999-412'),
('CAN-999-999-000-999-54', 'CAN-999-999-000-999-411'),
('CAN-999-999-000-999-54', 'CAN-999-999-000-999-409'),
('CAN-999-999-000-999-54', 'CAN-999-999-000-999-408'),
('CAN-999-999-000-999-54', 'CAN-999-999-000-999-407'),
('CAN-999-999-000-999-54', 'CAN-999-999-000-999-418'),
('CAN-999-999-000-999-54', 'CAN-999-999-000-999-410');

INSERT INTO `forms_form_fields` (`form_id`, `field_id`) VALUES 
('CAN-999-999-000-999-55', 'CAN-999-999-000-999-421'),
('CAN-999-999-000-999-55', 'CAN-999-999-000-999-422'),
('CAN-999-999-000-999-55', 'CAN-999-999-000-999-423'),
('CAN-999-999-000-999-55', 'CAN-999-999-000-999-424'),
('CAN-999-999-000-999-55', 'CAN-999-999-000-999-425'),
('CAN-999-999-000-999-55', 'CAN-999-999-000-999-426'),
('CAN-999-999-000-999-55', 'CAN-999-999-000-999-427'),
('CAN-999-999-000-999-55', 'CAN-999-999-000-999-428');

INSERT INTO `forms_form_fields` (`form_id`, `field_id`) VALUES 
('CAN-999-999-000-999-56', 'CAN-999-999-000-999-430'),
('CAN-999-999-000-999-56', 'CAN-999-999-000-999-431'),
('CAN-999-999-000-999-56', 'CAN-999-999-000-999-432'),
('CAN-999-999-000-999-56', 'CAN-999-999-000-999-433'),
('CAN-999-999-000-999-56', 'CAN-999-999-000-999-434'),
('CAN-999-999-000-999-56', 'CAN-999-999-000-999-435'),
('CAN-999-999-000-999-56', 'CAN-999-999-000-999-436'),
('CAN-999-999-000-999-56', 'CAN-999-999-000-999-437'),
('CAN-999-999-000-999-56', 'CAN-999-999-000-999-438'),
('CAN-999-999-000-999-56', 'CAN-999-999-000-999-439'),
('CAN-999-999-000-999-56', 'CAN-999-999-000-999-440'),
('CAN-999-999-000-999-56', 'CAN-999-999-000-999-429');

INSERT INTO `forms_form_fields` (`form_id`, `field_id`) VALUES 
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-441'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-442'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-443'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-444'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-445'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-446'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-447'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-448'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-449'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-450'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-451'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-452'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-453'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-454'),
('CAN-999-999-000-999-57', 'CAN-999-999-000-999-455');

INSERT INTO `forms_form_fields` (`form_id`, `field_id`) VALUES 
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-456'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-457'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-458'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-459'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-460'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-461'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-462'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-463'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-464'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-465'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-466'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-467'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-468'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-469'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-470'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-471'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-472'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-473'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-474'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-475'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-476'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-477'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-478'),
('CAN-999-999-000-999-58', 'CAN-999-999-000-999-479');

INSERT INTO `forms_form_fields` (`form_id`, `field_id`) VALUES 
('CAN-999-999-000-999-59', 'CAN-999-999-000-999-480'),
('CAN-999-999-000-999-59', 'CAN-999-999-000-999-481'),
('CAN-999-999-000-999-59', 'CAN-999-999-000-999-482'),
('CAN-999-999-000-999-59', 'CAN-999-999-000-999-483'),
('CAN-999-999-000-999-59', 'CAN-999-999-000-999-484'),
('CAN-999-999-000-999-59', 'CAN-999-999-000-999-485');


-- Form_fields

INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-364', 'StudySummary', 'disease_site', 1, 2, 'study_disease site', '', 'select', '', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-365', 'StudySummary', 'study_type', 1, 3, 'study_type', '', 'select', '', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-366', 'StudySummary', 'study_science', 1, 4, 'study_science', '', 'select', '', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-367', 'StudySummary', 'study_use', 1, 5, 'study_use', '', 'select', '', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-368', 'StudySummary', 'title', 1, 1, 'study_title', '', 'input', 'size=50', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-369', 'StudySummary', 'summary', 2, 1, 'study_summary', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-370', 'StudySummary', 'abstract', 2, 2, 'study_abstract', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-371', 'StudySummary', 'hypothesis', 2, 3, 'study_hypothesis', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-372', 'StudySummary', 'approach', 2, 4, 'study_approach', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-373', 'StudySummary', 'analysis', 2, 5, 'study_analysis', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-374', 'StudySummary', 'significance', 2, 6, 'study_significance', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-375', 'StudySummary', 'additional_clinical', 3, 1, 'study_additional clinical', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-384', 'StudyContact', 'first_name', 1, 1, 'study_name', 'study_first', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-385', 'StudyContact', 'middle_name', 1, 2, '', 'study_middle', 'input', 'size=10', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-386', 'StudyContact', 'last_name', 1, 3, '', 'study_last', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-387', 'StudyContact', 'accreditation', 1, 4, 'study_accreditation', '', 'input', 'size=15', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-388', 'StudyContact', 'occupation', 1, 5, 'study_occupation', '', 'input', 'size=30', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-389', 'StudyContact', 'department', 1, 6, 'study_department', '', 'input', 'size=30', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-390', 'StudyContact', 'organization', 1, 7, 'study_organization', '', 'input', 'size=30', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-391', 'StudyContact', 'address_street', 2, 1, 'study_address', 'street', 'input', 'size=30', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-392', 'StudyContact', 'address_city', 2, 2, '', 'study_city', 'input', 'size=15', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-393', 'StudyContact', 'address_province', 2, 3, 'study_province', '', 'input', 'size=15', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-394', 'StudyContact', 'address_country', 2, 4, 'study_country', '', 'input', 'size=15', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-395', 'StudyContact', 'address_postal', 2, 5, 'study_postal code', '', 'input', 'size=8', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-396', 'StudyContact', 'phone1_area', 2, 6, 'study_primary phone', 'study_area', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-397', 'StudyContact', 'phone1_number', 2, 7, '', 'study_number', 'input', 'size=8', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-398', 'StudyContact', 'phone1_extension', 2, 8, '', 'study_ext', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-399', 'StudyContact', 'phone2_area', 3, 1, 'study_secondary phone', 'area', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-400', 'StudyContact', 'phone2_number', 3, 2, '', 'study_number', 'input', 'size=7', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-401', 'StudyContact', 'phone2_extension', 3, 3, '', 'study_ext', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-402', 'StudyContact', 'fax_area', 4, 1, 'study_fax', 'study_area', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-403', 'StudyContact', 'fax_number', 4, 2, '', 'study_number', 'input', 'size=7', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-404', 'StudyContact', 'fax_extension', 4, 3, '', 'study_ext', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-405', 'StudyContact', 'email', 4, 4, 'study_email', '', 'input', 'size=20', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-406', 'StudyContact', 'website', 4, 5, 'study_website', '', 'input', 'size=20', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-407', 'StudyInvestigator', 'first_name', 1, 0, 'study_name', 'study_first', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-408', 'StudyInvestigator', 'middle_name', 1, 1, '', 'study_middle', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-409', 'StudyInvestigator', 'last_name', 1, 2, '', 'study_last', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-410', 'StudyInvestigator', 'occupation', 1, 3, 'study_occupation', '', 'input', 'size=15', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-411', 'StudyInvestigator', 'department', 1, 4, 'study_department', '', 'input', 'size=15', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-412', 'StudyInvestigator', 'organization', 1, 5, 'study_organization', '', 'input', 'size=15', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-413', 'StudyInvestigator', 'address_city', 2, 0, 'study_address', 'study_city', 'input', 'size=15', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-414', 'StudyInvestigator', 'address_province', 2, 1, '', 'study_province', 'input', 'size=15', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-415', 'StudyInvestigator', 'address_country', 2, 2, '', 'study_country', 'input', 'size=15', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-416', 'StudyInvestigator', 'email', 2, 3, 'study_email', '', 'input', 'size=25', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-417', 'StudyInvestigator', 'role', 2, 4, 'study_role', '', 'select', '', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-418', 'StudyInvestigator', 'brief', 2, 5, 'study_brief', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-421', 'StudyRelated', 'title', 1, 0, 'study_title', '', 'input', 'size=25', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-422', 'StudyRelated', 'principal_investigator', 1, 1, 'study_principal investigator', '', 'input', 'size=25', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-423', 'StudyRelated', 'journal', 1, 2, 'study_journal', '', 'input', 'size=25', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-424', 'StudyRelated', 'issue', 1, 3, '', 'study_issue', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-425', 'StudyRelated', 'url', 1, 4, 'study_url', '', 'input', 'size=35', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-426', 'StudyRelated', 'abstract', 1, 5, 'study_abstract', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-427', 'StudyRelated', 'relevance', 1, 6, 'study_relevance', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-428', 'StudyRelated', 'date_posted', 1, 7, 'study_date posted', '', 'date', '', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-429', 'StudyReview', 'first_name', 1, 0, 'study_name', 'study_first', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-430', 'StudyReview', 'middle_name', 1, 1, '', 'study_middle', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-431', 'StudyReview', 'last', 1, 2, '', 'study_last', 'input', 'size=10', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-432', 'StudyReview', 'accreditation', 1, 3, 'study_accreditation', '', 'input', 'size=10', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-433', 'StudyReview', 'committee', 1, 4, 'study_committee', '', 'input', 'size=20', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-434', 'StudyReview', 'institution', 1, 5, '', 'study_institution', 'input', 'size=20', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-435', 'StudyReview', 'phone_country', 1, 6, 'study_country code', '', 'input', 'size=1', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-436', 'StudyReview', 'phone_area', 1, 7, '', 'study_area', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-437', 'StudyReview', 'phone_number', 1, 8, '', 'study_number', 'input', 'size=8', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-438', 'StudyReview', 'phone_extension', 1, 9, '', 'study_ext', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-439', 'StudyReview', 'status', 2, 1, 'study_status', '', 'select', '', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-440', 'StudyReview', 'date', 2, 2, 'study_date', '', 'date', '', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-441', 'StudyEthicsBoard', 'ethics_board', 1, 0, 'study_ethics board', '', 'input', 'size=40', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-442', 'StudyEthicsBoard', 'restrictions', 1, 1, 'study_restrictions', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-443', 'StudyEthicsBoard', 'approval_number', 1, 2, 'study_approval number', '', 'input', 'size=20', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-444', 'StudyEthicsBoard', 'status', 1, 3, 'study_status', '', 'select', '', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-445', 'StudyEthicsBoard', 'date', 1, 4, 'study_date', '', 'date', '', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-446', 'StudyEthicsBoard', 'contact', 1, 5, 'study_contact', '', 'input', 'size=20', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-447', 'StudyEthicsBoard', 'phone_country', 1, 6, 'study_country code', '', 'input', 'size=1', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-448', 'StudyEthicsBoard', 'phone_area', 1, 7, '', 'study_area', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-449', 'StudyEthicsBoard', 'phone_number', 1, 8, '', 'study_number', 'input', 'size=8', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-450', 'StudyEthicsBoard', 'phone_extension', 1, 9, '', 'study_ext', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-451', 'StudyEthicsBoard', 'fax_country', 2, 0, 'study_country code', '', 'input', 'size=1', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-452', 'StudyEthicsBoard', 'fax_area', 2, 1, '', 'study_area', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-453', 'StudyEthicsBoard', 'fax_number', 2, 2, '', 'study_number', 'input', 'size=8', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-454', 'StudyEthicsBoard', 'fax_extension', 2, 3, '', 'study_ext', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-455', 'StudyEthicsBoard', 'email', 2, 4, 'study_email', '', 'input', 'size=25', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-456', 'StudyFunding', 'sponsor', 1, 0, 'study_sponsor', '', 'input', 'size=30', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-457', 'StudyFunding', 'restrictions', 1, 1, 'study_restrictions', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-458', 'StudyFunding', 'amount_year1', 1, 2, 'study_funding', '$', 'input', 'size=10', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-459', 'StudyFunding', 'year1', 1, 3, '', 'study_year', 'input', 'size=4', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-460', 'StudyFunding', 'amount_year2', 1, 4, 'study_$', '', 'input', 'size=10', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-461', 'StudyFunding', 'year2', 1, 5, '', 'study_year', 'input', 'size=4', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-462', 'StudyFunding', 'amount_year3', 1, 6, 'study_$', '', 'input', 'size=10', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-463', 'StudyFunding', 'year3', 1, 7, '', 'study_year', 'input', 'size=4', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-464', 'StudyFunding', 'amount_year4', 1, 8, 'study_$', '', 'input', 'size=10', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-465', 'StudyFunding', 'year4', 1, 9, '', 'study_year', 'input', 'size=4', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-466', 'StudyFunding', 'amount_year5', 2, 0, 'study_$', '', 'input', 'size=10', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-467', 'StudyFunding', 'year5', 2, 1, '', 'study_year', 'input', 'size=4', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-468', 'StudyFunding', 'status', 2, 2, 'study_status', '', 'select', '', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-469', 'StudyFunding', 'date', 2, 3, '', 'study_date', 'date', '', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-470', 'StudyFunding', 'contact', 2, 4, 'study_contact', '', 'input', 'size=30', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-471', 'StudyFunding', 'phone_country', 3, 0, 'study_country code', '', 'input', 'size=1', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-472', 'StudyFunding', 'phone_area', 3, 1, '', 'study_area', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-473', 'StudyFunding', 'phone_number', 3, 2, '', 'study_number', 'input', 'size=8', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-474', 'StudyFunding', 'phone_extension', 3, 3, '', 'study_ext', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-475', 'StudyFunding', 'fax_country', 4, 0, 'study_country code', '', 'input', 'size=1', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-476', 'StudyFunding', 'fax_area', 4, 1, '', 'study_area', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-477', 'StudyFunding', 'fax_number', 4, 2, '', 'study_number', 'input', 'size=8', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-478', 'StudyFunding', 'fax_ext', 4, 3, '', 'study_ext', 'input', 'size=3', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-479', 'StudyFunding', 'email', 4, 4, 'study_email', '', 'input', 'size=30', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

INSERT INTO `form_fields` (`id`, `model`, `field`, `display_column`, `display_order`, `language_label`, `language_tag`, `type`, `setting`, `default`, `language_help`, `flag_add`, `flag_edit`, `flag_search`, `flag_index`, `flag_detail`, `flag_foreign_add`, `flag_foreign_edit`, `flag_foreign_search`, `flag_foreign_index`, `flag_foreign_detail`, `created`, `created_by`, `modified`, `modified_by`) VALUES 
('CAN-999-999-000-999-480', 'StudyResult', 'abstract', 1, 0, 'study_abstract', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-481', 'StudyResult', 'hypothesis', 1, 1, 'study_hypothesis', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-482', 'StudyResult', 'conclusion', 1, 2, 'study_conclusion', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-483', 'StudyResult', 'comparison', 1, 3, 'study_comparison', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-484', 'StudyResult', 'future', 1, 4, 'study_future', '', 'textarea', 'cols=60,rows=6', '', '', 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
('CAN-999-999-000-999-485', 'StudyResult', 'result_date', 1, 5, 'study_result date', '', 'date', '', '', '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');
