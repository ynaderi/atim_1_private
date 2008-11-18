DELETE FROM `i18n`
WHERE `id` IN ('storage_layout_tool_title', 'storage_layout_tool_description');

INSERT INTO `i18n` (`id`, `page_id`, `en`, `fr`) VALUES 
('storage_layout_tool_title', 'global', 'Tool Description', 'Description de l''outils'),
('storage_layout_tool_description', 'global', 'This module allows users to view or create the storage layout infrastructure.<br><br> The storage layout is defined by the creation of storage entities (as ''Box'', ''Room'', etc) and the definition of the storage entities positions into the parent storage entities.<br>', 'Ce module permet aux utilisateurs de visualiser ou cr&eacute;er l''infrastructure de l''entreposage. <br><br>L''infrastructure de l''entreposage est d&eacute;finie par la cr&eacute;ation d''entit&eacute;s d''entreposage (comme des ''pi&egrave;ces'', des ''Bo&icirc;tes'', etc) et la d&eacute;fintion des positions de ces entit&eacute;s dans des entit&eacute;s d''entreposage ''parents''. <br>');
