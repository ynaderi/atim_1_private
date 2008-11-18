##
## activate the 'rtbtools' plugin
##

INSERT INTO permissions (name) 
values 
('rtbtools');

SELECT @insert_first_id1 := LAST_INSERT_ID();
## for permission id

INSERT INTO groups_permissions (group_id,permission_id) 
values 
(1,@insert_first_id1);
