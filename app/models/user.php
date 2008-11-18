<?php 

class User extends AppModel {

	var $name = 'User';
	var $belongsTo = 'Group';
	
	function beforeSave() {
		
		// AFTER password validates in plain text version, MD5 encrypt it for saving...
		if ( isset($this->data['User']['passwd']) ) {
			$this->data['User']['passwd'] = md5($this->data['User']['passwd']);
		}
		
		return true;
	}
	
}

?>