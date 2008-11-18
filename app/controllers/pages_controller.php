<?php

class PagesController extends AppController {
	
	var $name = 'Pages';
	var $othAuthRestrictions = array();  // list of ACTIONS that require AUTHENTICATION; this overrides APP_CONTROLLER config settings

	function index() {
		// nothing...	
	}
	
	function display( $page_id ) {
		
		// set SIDEBAR variable, for HELPER call on VIEW 
		// use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
		$this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.$this->params['controller'].'_'.$this->params['action'] ) );
		
		$this->Page->id = $page_id;
		$result = $this->Page->read();
		$this->set( 'data', $result ); // save for display
		
		// set page title
		// $this->pageTitle = strtolower($result['Page']['language_title']);
		
	}

}

?>