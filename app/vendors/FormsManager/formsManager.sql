DROP TABLE   rtbforms;
CREATE TABLE rtbforms (

	id			smallint unsigned	NOT NULL 	AUTO_INCREMENT,
	frmTitle		varchar(200),
	frmFileLocation		blob,
	frmFileType		varchar(40),
	frmFileViewer		blob,
	frmVersion		float			NOT NULL	DEFAULT 0,
	frmStatus		varchar(30),
	frmCreated		date			NOT NULL	DEFAULT '0000-00-00',

	created			datetime,
	created_by		varchar(50),
	modified		datetime,
	modified_by		varchar(50),

       PRIMARY KEY ( id )
) TYPE = MYISAM;
