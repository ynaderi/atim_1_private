<?php

class FormField extends AppModel {
	
	var $name = 'FormField';
	var $useTable = 'form_fields';
	
    /*
	var $hasMany = array('FormValidation' =>
		                  array('className'   => 'FormValidation',
		                        'conditions'  => '',
		                        'order'       => '',
		                        'limit'       => '',
		                        'foreignKey'  => '',
		                        'dependent'   => true,
		                        'exclusive'   => true,
		                        'finderSql'   => ''
		                  )
                  );
	*/
				  
    var $hasAndBelongsToMany = array('GlobalLookup' =>
                         array('className'  => 'GlobalLookup',
                               'joinTable'  => 'form_fields_global_lookups',
                               'foreignKey' => 'field_id',
                               'associationForeignKey'=> 'lookup_id',
                               'conditions' => '',
                               'order'      => 'GlobalLookup.display_order ASC',
                               'limit'      => '',
                               'unique'       => FALSE,
                               'finderQuery'  => '',
                               'deleteQuery'=> '',
                         )
                  );
	
	
	
	var $hasMany = array(
		'FormValidation' => array(
				'className'  => 'FormValidation'
		)
	);
	
	var $validate = array();
	
}

?>