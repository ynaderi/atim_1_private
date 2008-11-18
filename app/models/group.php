<?php 

class Group extends AppModel {

	var $name = 'Group';
	var $belongsTo = 'Bank';
	var $hasMany = 'User';
	
	var $hasAndBelongsToMany = array(
		'Permission' => array(
			'className' => 'Permission',
			'joinTable' => 'groups_permissions'
		)
	);
	
}

?>