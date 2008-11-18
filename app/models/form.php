<?php

class Form extends AppModel {

	var $name = 'Form';
	var $useTable = 'forms';
	
	/*
	var $hasAndBelongsToMany = array(
		'FormField' =>
			array(
				'className'  => 'FormField',
				'joinTable'  => 'forms_form_fields',
				'foreignKey' => 'form_id',
				'associationForeignKey'=> 'field_id',
				'conditions' => '',
				'order'      => 'model ASC, display_column ASC, display_order ASC, id DESC',
				'limit'      => '',
				'unique'       => FALSE,
				'finderQuery'  => '',
				'deleteQuery'=> ''
		 	)
	);
	*/
	
	var $hasMany = array(
		'FormFormat' => array(
				'className'  => 'FormFormat',
				'conditions' => '',
				'order'      => '',
				'foreignKey' => 'form_id'
		)
	);
	
	var $validate = array();
	
}

?>