DELETE FROM `i18n`
WHERE `id` IN (
'on loan',
'b cell',
'cell gel matrix',
'cell tube',
'cell core',
'cell count',
'10e6',
'10e7',
'10e8',
'source gel matrix',
'parent aliquots',
'sample quality controls',
'sample reviews',
'path collection review',
'blood cell review',
'in progress',
'blood cell mmt review',	
'blood cell fish review',	
'blood cell zap70 review', 	
'blood cell nq01 review',	
'blood cell cd38 review',
'specimen',

'qc run id is required',

'+/+',
'+/-',
'-/-',
'studied sample',
'No aliquot has been defined as sample source aliquot.',
'Your aliquots have been defined as sample source aliquot.',
'Your aliquot has been deleted from the list of Source Aliquot.',
'No posiiton has to be defined.',
'28/18',
'create derivative',
'reserved to',

'see sample parent',

'shipped', 
'reserved for study', 
'reserved for order',

'realiquoted parent',
'realiquoting date',
'realiquoted by',
'select realiquoted parent',
'Your aliquot has been defined as realiquoted parent aliquot.',
'No new sample aliquot could be actually defined as realiquoted parent',
'Your aliquot has been deleted from the list of realiquoted parent.',
'realiquoted parent selection is required',

'aliquot shipment', 
'realiquoted to',

'sample details',
'sample derivatives',
'derivative details',
'derivative aliquots',
'collection samples',
'derivative reviews',
'derivative quality controls',
'sample review',
'sample reviews',
'aliquot details',
'sample aliquots',

'collection sample tree view',

'parent',
'realiquoting',
'parent/child',
'child',

'no aliquot use data', 
'no aliquot use data exists for the specified id', 
'aliquot use creation - update error', 
'an error arrived during the creation or the update the aliquot use', 

'internal use',
'no volume has to be recorded for this aliquot type',

'qc_tested_aliquots',
'qc_details',
'No new sample aliquot could be actually defined as tested aliquot',
'No aliquot has been defined as sample tested aliquot.',
'sample quality control',
'Your aliquot has been deleted from the list of Tested Aliquot.',
'Your aliquots have been defined as tested aliquot.'

);

-- Action: INSERT
-- Comments:

INSERT INTO `i18n` ( `id` , `page_id` , `en` , `fr` )
VALUES
('on loan', 'global', 'On Loan', 'Pr&eacirc;t&eacute;'),
('b cell', 'global', 'B Cells', 'Cellules B'),
('cell gel matrix', 'global', 'Gel Matrix', 'Matrice'),
('cell tube', 'global', 'Tube', 'Tube'),
('blood cell review', 'global', 'Blood Cell Review', 'R&eacute;vision des cellules sanguines'),
('cell core', 'global', 'Core', 'Core'),
('cell count', 'global', 'Cells Count', 'Nombre de cellules'),
('studied sample', 'global', 'Studied Sample', '&Eacute;chantillon &eacute;tudi&eacute;'),
('10e6', 'global', '10e6', '10e6'),
('10e7', 'global', '10e7', '10e7'),
('10e8', 'global', '10e8', '10e8'),
('+/+', 'global', '+/+', '+/+'),
('+/-', 'global', '+/-', '+/-'),
('-/-', 'global', '-/-', '-/-'),
('create derivative', 'global', 'Create Derivative', 'C&eacute;er un deriv&eacute;'),
('28/18', 'global', '28/18', '28/18'),
('blood cell mmt review', 'global', 'MMT', 'MMT'),	
('blood cell fish review', 'global', 'Fish', 'Fish'),	
('blood cell zap70 review', 'global', 'ZAP70', 'ZAP70'),	
('blood cell nq01 review', 'global', 'NQ01', 'NQ01'),	
('blood cell cd38 review', 'global', 'CD38', 'CD38'),
('in progress', 'global', 'In progress', 'En cours'),
('sample reviews', 'global', 'Reviews', 'R&eacute;visions'),
('path collection review', 'global', 'Reviews', 'R&eacute;visions'),
('parent aliquots', 'global', 'Parent Aliquots', 'Aliquots \'Parents\''),
('sample quality controls', 'global', 'Quality Controls', 'Contr&ocirc;les de Qualit&eacute;'),
('reserved to', 'global', 'Reserved To', 'R&eacute;serv&eacute; pour'),

('collection sample tree view', 'global', 'List', 'Liste'),

('specimen', 'global', 'Sample', '&Eacute;chantillon'),
('collection samples', 'global', 'Samples', '&Eacute;chantillons'),

('reserved for study', 'global', 'Reserved For Study', 'R&eacute;serv&eacute; pour une &eacute;tude'),
('reserved for order', 'global', 'Reserved For Order', 'R&eacute;serv&eacute; pour une commande'),
('shipped', 'global', 'Shipped', 'Envoy&eacute;'),

('see sample parent', 'global', 'Parent Sample', '&Eacute;chantillon ''Parent'''),
('sample aliquots', 'global', 'Aliquots', 'Aliquots'),

('sample details', 'global', 'Details', 'D&eacute;tail'),
('sample derivatives', 'global', 'Derivatives', 'D&eacute;riv&eacute;s'),
('derivative details', 'global', 'Details', 'D&eacute;tail'),
('aliquot details', 'global', 'Details', 'D&eacute;tail'),
('derivative aliquots', 'global', 'Aliquots', 'Aliquots'),
('derivative reviews', 'global', 'Reviews', 'R&eacute;vision'),
('derivative quality controls', 'global', 'Quality Controls', 'Contr&ocirc;les de qualit&eacute;'),
('sample review', 'global', 'Reviews', 'R&eacute;visions'),
  	
('No aliquot has been defined as sample source aliquot.', 'global', 'No aliquot has been defined as sample source aliquot.', 'Aucun aliquot n''a &eacute;t&eacute; d&eacute;fini comme aliquot ''source''.'),
('Your aliquots have been defined as sample source aliquot.', 'global', 'Your aliquots have been defined as sample source aliquot.', 'Vos aliquots ont &eacute;t&eacute; d&eacute;finis comme aliquots ''source''.'),
('Your aliquot has been deleted from the list of Source Aliquot.', 'global', 'Your aliquot has been deleted from the list of Source Aliquot. Please update the current status of your source aliquot if required.', 'Votre aliquot a &eacute;t&eacute; supprim&eacute; de la liste des aliquots ''source''. Veuillez mettre &agrave; jour le status courrant de l''aliquot au besoin!'),
('No posiiton has to be defined.', 'global', 'No position has to be defined!', 'Aucune position ne doit &ecirc;tre d&eacute;finie!'),
('source gel matrix', 'global', 'Source Gel Matrix', 'Matrice \'Source\''),

('no aliquot use data exists for the specified id', 'global', 'The aliquot use data has not been found!<br>Please try again or contact your system administrator.', 'Les donn&eacute;es de l''utilisation de l''aliquot n''ont pas &eacute;t&eacute trouv&eacute;es!<br>Essayez de nouveau ou contactez votre administrateur du syst&egrave;me.'),
('aliquot use creation - update error', 'global', 'Aliquot Use Creation/Update Error', 'Erreur durant la cr&eacute;ation/mise &agrave; jour de l''utilisation de l''aliquot'),
('an error arrived during the creation or the update the aliquot use', 'global', 'An error has been detected during the aliquot use creation/update!<br>Please try again or contact your system administrator.', 'Une erreur a &eacute;t&eacute; d&eacute;tect&eacute;e durant la cr&eacute;ation/mise &agrave; jour de l''utilisation de l''aliquot!<br>Essayez de nouveau ou contactez votre administrateur du syst&egrave;me.'),
('no aliquot use data', 'global', 'Missing Aliquot Use Data', 'Donn&eacute;es de l''utilisation de l''aliquot manquantes'),
('internal use', 'global', 'Internal Use', 'Utilisation interne!'),
('no volume has to be recorded for this aliquot type', 'global', 'No volume has to be recorded!', 'Aucun volume ne doit &ecirc;tre d&eacute;fini!'),

('realiquoted parent', 'global', 'Realiquoted Parent', 'Parent r&eacute;-aliquot&eacute;'),
('realiquoting date', 'global', 'Realiquoting Date', 'Date'),
('realiquoted by', 'global', 'Realiquoted By', 'R&eacute;-aliquot&eacute; Par'),
('select realiquoted parent', 'global', 'Select Realiquoted Parent', 'Selection du parent r&eacute;-aliquot&eacute;'),
('Your aliquot has been defined as realiquoted parent aliquot.', 'global', 'Your aliquot has been defined as realiquoted parent aliquot.', 'Votre aliquot a &eacute;t&eacute; d&eacute;fini comme aliquot r&eacute;-aliquot&eacute;.'),
('No new sample aliquot could be actually defined as realiquoted parent', 'global', 'No new sample aliquot could be actually defined as realiquoted parent.', 'Auncun nouvel aliquot de l''&eacute;chantillon ne peut actuellement &ecirc;tre d&eacute;fini comme aliquot r&eacute;-aliquot&eacute;!'),
('Your aliquot has been deleted from the list of realiquoted parent.', 'global', 'Your aliquot has been deleted from the list of realiquoted parent. Please update the current status of your parent aliquot if required.', 'Votre aliquot a &eacute;t&eacute; supprim&eacute; de la liste des aliquots r&eacute;-aliquot&eacute;. Veuillez mettre &agrave; jour le status courrant de l''aliquot r&eacute;-aliquot&eacute; au besoin!'),
('realiquoted parent selection is required', 'global', 'Realiquoted parent selection is required!', 'La s&eacute;lection d''un parent r&eacute;-aliquot&eacute; est requise!'),

('qc run id is required', 'global', 'Quality Control Run ID is required!', 'L''identifiant du contr&ocirc;le de qualit&eacute; est requis!'),

('parent', 'global', 'Parent', 'Parent'),
('realiquoting', 'global', 'Realiquoting', 'Re-aliquotage'),
('parent/child', 'global', 'Parent/Child', 'Parent/Enfant'),
('child', 'global', 'Child', 'Enfant'),

('qc_tested_aliquots', 'global', 'Tested Aliquots', 'Aliquots test&eacute;s'),
('qc_details', 'global',  'Details', 'D&eacute;tail'), 
('No new sample aliquot could be actually defined as tested aliquot', 'global', 'No new sample aliquot could be actually defined as tested aliquot!', 'Auncun nouvel aliquot ne peut actuellement &ecirc;tre d&eacute;fini comme aliquot ''test&eacute;''!'),
('No aliquot has been defined as sample tested aliquot.', 'global', 'No aliquot has been defined as sample tested aliquot.', 'Aucun aliquot n''a &eacute;t&eacute; d&eacute;fini comme aliquot ''test&eacute;''.'),
('sample quality control', 'global', 'Quality Control', 'Contr&ocirc;le de Qualit&eacute;'),
('Your aliquot has been deleted from the list of Tested Aliquot.', 'global', 'Your aliquot has been deleted from the list of Tested Aliquot. Please update the current status of your aliquot if required.', 'Votre aliquot a &eacute;t&eacute; supprim&eacute; de la liste des aliquots ''test&eacute;s''. Veuillez mettre &agrave; jour le status courrant de l''aliquot au besoin!'),
('Your aliquots have been defined as tested aliquot.', 'global', 'Your aliquots have been defined as sample tested aliquot.', 'Vos aliquots ont &eacute;t&eacute; d&eacute;finis comme aliquots ''test&eacute;s''.'),

('aliquot shipment', 'global', 'Aliquot Shipment nbr:', 'Envoi d''aliquot nbr:'),
('realiquoted to', 'global', 'Realiquoted To', 'R&eacute;-aliquot&eacute; en');


