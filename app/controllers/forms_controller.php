<?php

class FormsController extends AppController {
	
	var $name = 'Forms';
	var $layout = 'popup';
	var $othAuthRestrictions = null;
	var $uses = array( 'Form', 'FormFormat' );
	
	function index() {
		// nothing
	}
	
	function displayhelp( $format_id=null ) {
		
		$this->layout = 'popup';
		
		$conditions = array();
		$conditions['FormFormat.id'] = $format_id;
		$conditions = array_filter($conditions);
		
		$result = $this->FormFormat->findAll( $conditions );
		
		$this->set( 'messages', $result );
		
	}

}

?>