<?php

class PermissionsController extends AppController {
	
	var $name = 'Permissions';
	var $uses = array('Group', 'Permission');
	
	var $components = array('Summaries');
	var $helpers = array('Summaries');
	
	function index() {
		// nothing...
	}
	
	function listall( $bank_id, $group_id ) {
		
		// set MENU varible for echo on VIEW 
		$ctrapp_menu[] = $this->Menus->tabs( 'core_CAN_41', 'core_CAN_73', '' );
		$ctrapp_menu[] = $this->Menus->tabs( 'core_CAN_73', 'core_CAN_86', $bank_id );
		$ctrapp_menu[] = $this->Menus->tabs( 'core_CAN_86', 'core_CAN_88', $bank_id.'/'.$group_id );
		$this->set( 'ctrapp_menu', $ctrapp_menu );
		
		// set FORM variable, for HELPER call on VIEW 
		$this->set( 'ctrapp_form', $this->Forms->getFormArray('permissions') );
		
		// set SUMMARY varible from plugin's COMPONENTS 
		$this->set( 'ctrapp_summary', $this->Summaries->build( $this->othAuth->user('id') ) );
		
		// set SIDEBAR variable, for HELPER call on VIEW 
		// use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
		$this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.$this->params['controller'].'_'.$this->params['action'] ) );
		
		// set FORM variable, for HELPER call on VIEW 
		$this->set( 'bank_id', $bank_id );
		$this->set( 'group_id', $group_id );
		
		// get ALL checkboxes
			$this->set( 'permissions', $this->Permission->findAll( NULL, NULL, 'Permission.name ASC', NULL, NULL ) );
		
		// get SELECTED checkboxes
		
			// get ALL associatations based on PARENT model
			$criteria = array();
			$criteria['Group.id'] = $group_id;
			$criteria = array_filter($criteria);
			$results = $this->Group->findAll( $criteria );
			
			// clear criteria
			$checked_permissions = array();
			
			// make NEW criteria of allowed ASSOCIATED ids
			foreach ( $results[0]['Permission'] as $permission_id ) {
				$checked_permissions[] = $permission_id['id'];
			}
			$checked_permissions = array_filter($checked_permissions);
		
		$this->set( 'checked_permissions', $checked_permissions );
		
	}
	
	function update( $bank_id, $group_id ) {
		
		// setup MODEL(s) validation array(s) for displayed FORM 
		foreach ( $this->Forms->getValidateArray('groups') as $validate_model=>$validate_rules ) {
			$this->{ $validate_model }->validate = $validate_rules;
		}
		
		if ( !empty($this->data) ) {
		
			// pr($this->data);
			// exit();
			
			$this->Group->query( 'DELETE FROM groups_permissions WHERE group_id="'.$this->data['Group']['id'].'"' );
			foreach ( $this->data['Permission']['Permission'] as $permission_id ) {
				$this->Group->query( 'INSERT INTO groups_permissions SET group_id="'.$this->data['Group']['id'].'", permission_id="'.$permission_id.'"' );
			}
			
			// if ( $this->Group->save( $this->data ) ) {
				$this->flash( 'Your data has been updated.','/permissions/listall/'.$bank_id.'/'.$group_id );
				exit();
			// }
			
		}
	}

}

?>