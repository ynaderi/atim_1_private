<?php

class FormFieldsController extends AppController {
	
	var $name = 'FormFields';
	var $uses = array('Form', 'FormField');
	
	var $components = array('Summaries');
	var $helpers = array('Summaries');
	
	function listall( $form_id=0 ) {
		
		// set MENU varible for echo on VIEW 
		$ctrapp_menu[] = $this->Menus->tabs( 'core_CAN_41', 'core_CAN_72', '' );
		$ctrapp_menu[] = $this->Menus->tabs( 'core_CAN_72', 'core_CAN_76', $form_id );
		$this->set( 'ctrapp_menu', $ctrapp_menu );
		
		// set FORM variable, for HELPER call on VIEW 
		$this->set( 'ctrapp_form', $this->Forms->getFormArray('fields') );
		
		// set SUMMARY varible from plugin's COMPONENTS 
		$this->set( 'ctrapp_summary', $this->Summaries->build( $this->othAuth->user('id') ) );
		
		// set SIDEBAR variable, for HELPER call on VIEW 
		// use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
		$this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.$this->params['controller'].'_'.$this->params['action'] ) );
		
		// set FORM variable, for HELPER call on VIEW 
		$this->set( 'form_id', $form_id );
		
			// restrict BATCHes criteria to GROUPs
			$restrict_criteria = array();
			$restrict_result = $this->FormField->query('SELECT field_id FROM forms_form_fields WHERE form_id="'.$form_id.'"');
			foreach ( $restrict_result as $key=>$val ) {
				$restrict_criteria[] = '"'.$val['forms_form_fields']['field_id'].'"';
			}
			
			$criteria = array();
			$criteria[] = 'FormField.id IN ('.implode(',',$restrict_criteria).')';
			
		list( $order, $limit, $page ) = $this->Pagination->init( $criteria );
		$this->set( 'fields_data', $this->FormField->findAll( $criteria, NULL, $order, $limit, $page ) );
		
	}
	
	function detail( $form_id=0, $field_id=0 ) {
		
		// set MENU varible for echo on VIEW 
		$ctrapp_menu[] = $this->Menus->tabs( 'core_CAN_41', 'core_CAN_72', '' );
		$ctrapp_menu[] = $this->Menus->tabs( 'core_CAN_72', 'core_CAN_76', $form_id );
		$this->set( 'ctrapp_menu', $ctrapp_menu );
		
		// set FORM variable, for HELPER call on VIEW 
		// $this->set( 'ctrapp_form', $this->Forms->getFormArray('participants') );
		$this->set( 'ctrapp_form', $this->Forms->getFormArray('fields') );
		
		// set SUMMARY varible from plugin's COMPONENTS 
		$this->set( 'ctrapp_summary', $this->Summaries->build( $this->othAuth->user('id') ) );
		
		// set SIDEBAR variable, for HELPER call on VIEW 
		// use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
		$this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.$this->params['controller'].'_'.$this->params['action'] ) );
		
		// set FORM variable, for HELPER call on VIEW 
		$this->set( 'form_id', $form_id );
		$this->set( 'field_id', $field_id );
		
		$this->FormField->id = $field_id;
		$this->set( 'data', $this->FormField->read() );
	}
	
	function add( $form_id=0 ) {
		
		// setup MODEL(s) validation array(s) for displayed FORM 
		foreach ( $this->Forms->getValidateArray('fields') as $validate_model=>$validate_rules ) {
			$this->{ $validate_model }->validate = $validate_rules;
		}
		
		// set MENU varible for echo on VIEW 
		$ctrapp_menu[] = $this->Menus->tabs( 'core_CAN_41', 'core_CAN_72', '' );
		$ctrapp_menu[] = $this->Menus->tabs( 'core_CAN_72', 'core_CAN_76', $form_id );
		$this->set( 'ctrapp_menu', $ctrapp_menu );
		
		// set FORM variable, for HELPER call on VIEW 
		$this->set( 'ctrapp_form', $this->Forms->getFormArray('fields') );
		
		// set SUMMARY varible from plugin's COMPONENTS 
		$this->set( 'ctrapp_summary', $this->Summaries->build( $this->othAuth->user('id') ) );
		
		// set SIDEBAR variable, for HELPER call on VIEW 
		// use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
		$this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.$this->params['controller'].'_'.$this->params['action'] ) );
		
		// set FORM variable, for HELPER call on VIEW 
		$this->set( 'form_id', $form_id );
		
		if ( !empty($this->data) ) {
			
			if ( $this->FormField->save( $this->data ) ) {
				$this->flash( 'Your data has been saved.', '/form_fields/index/'.$form_id );
			}
			
		}
		
	}
	
	function edit( $form_id=0, $field_id=0 ) {
		
		// setup MODEL(s) validation array(s) for displayed FORM 
		foreach ( $this->Forms->getValidateArray('fields') as $validate_model=>$validate_rules ) {
			$this->{ $validate_model }->validate = $validate_rules;
		}
		
		// set MENU varible for echo on VIEW 
		$ctrapp_menu[] = $this->Menus->tabs( 'core_CAN_41', 'core_CAN_72', '' );
		$ctrapp_menu[] = $this->Menus->tabs( 'core_CAN_72', 'core_CAN_76', $form_id );
		$this->set( 'ctrapp_menu', $ctrapp_menu );
		
		// set FORM variable, for HELPER call on VIEW 
		$this->set( 'ctrapp_form', $this->Forms->getFormArray('fields') );
		
		// set SUMMARY varible from plugin's COMPONENTS 
		$this->set( 'ctrapp_summary', $this->Summaries->build( $this->othAuth->user('id') ) );
		
		// set SIDEBAR variable, for HELPER call on VIEW 
		// use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
		$this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.$this->params['controller'].'_'.$this->params['action'] ) );
		
		// set FORM variable, for HELPER call on VIEW 
		$this->set( 'form_id', $form_id );
		$this->set( 'field_id', $field_id );
		
		if ( empty($this->data) ) {
			
			$this->FormField->id = $field_id;
			$this->data = $this->FormField->read();
			$this->set( 'data', $this->data );
			
		} else {
			
			if ( $this->FormField->save( $this->data['FormField'] ) ) {
				$this->flash( 'Your data has been updated.','/form_fields/detail/'.$form_id.'/'.$field_id );
			}
			
		}
	}

}

?>