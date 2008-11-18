##
## Adds the form and field information for 'rtbforms'
##

INSERT INTO forms (alias,language_title,language_help,created_by,modified_by) 
	VALUES ('rtbforms','','','','');

SELECT @insert_first_id1 := LAST_INSERT_ID();
## for form ids


INSERT INTO form_fields 

(model,field,display_column,display_order,language_label,
type,size,form_fields.default,language_help,
flag_add,flag_edit,flag_search,flag_index,
created_by,modified_by
)

VALUES 
('Rtbform','frmTitle',1,1,'Form Title',
'input',40,'','',
1,1,1,1,
'',''),

('Rtbform','frmFileLocation',1,2,'File Location',
'input',60,'','',
1,1,0,0,
'',''),

('Rtbform','frmFileType',1,3,'File Type',
'select',0,'','',
1,1,0,0,
'',''),

('Rtbform','frmFileViewer',1,4,'File Viewer',
'input',60,'','',
1,1,0,0,
'',''),

('Rtbform','frmVersion',1,5,'Form Version',
'input',10,'','',
1,1,1,1,
'',''),

('Rtbform','frmStatus',1,6,'Form Status',
'select',0,'','',
1,1,0,0,
'',''),

('Rtbform','frmCreated',1,7,'Date Created',
'input',12,'','',
1,1,0,0,
'','')

;



SELECT @insert_first_id2 := LAST_INSERT_ID();
## for field ids


INSERT INTO forms_form_fields
(form_id,field_id)
VALUES
(@insert_first_id1,@insert_first_id2),
(@insert_first_id1,@insert_first_id2+1),
(@insert_first_id1,@insert_first_id2+2),
(@insert_first_id1,@insert_first_id2+3),
(@insert_first_id1,@insert_first_id2+4),
(@insert_first_id1,@insert_first_id2+5),
(@insert_first_id1,@insert_first_id2+6)

;

INSERT INTO global_lookups

(alias,value,language_choice,
display_order,active)
VALUES

('rtbform_status','n/a','N/A',
1,'yes'),

('rtbform_status','current','Current',
2,'yes'),

('rtbform_status','proposed','Proposed',
3,'yes'),

('rtbform_status','inactive','Inactive',
4,'yes'),

('form_file_type','n/a','N/A',
1,'yes'),

('form_file_type','doc','MS WORD Doc',
2,'yes'),

('form_file_type','xls','MS Excel xls',
3,'yes')

;


SELECT @insert_first_id3 := LAST_INSERT_ID();
## for lookup ids

INSERT INTO form_fields_global_lookups
(field_id, lookup_id)

VALUES

(@insert_first_id2+5,@insert_first_id3),
(@insert_first_id2+5,@insert_first_id3+1),
(@insert_first_id2+5,@insert_first_id3+2),
(@insert_first_id2+5,@insert_first_id3+3),
(@insert_first_id2+2,@insert_first_id3+4),
(@insert_first_id2+2,@insert_first_id3+5),
(@insert_first_id2+2,@insert_first_id3+6)

;
