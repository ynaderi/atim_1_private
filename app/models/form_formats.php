<?php

class FormFormat extends AppModel {

	var $name = 'FormFormat';
	var $useTable = 'form_formats';
	
	var $belongsTo = array(
		'FormField' => array(
				'className'  => 'FormField',
				'conditions' => '',
				'order'      => '',
				'foreignKey' => 'field_id'
		)
	);
	
	var $validate = array();
	
}

?>