<?php

class UsersController extends AppController {
	
	var $name = 'Users';
	var $othAuthRestrictions = array();  // list of ACTIONS that require AUTHENTICATION; this overrides APP_CONTROLLER config settings

	function index() {
		
		// if LOGGED IN, redirect to main menu
		if ( $_SESSION['othAuth']['CTRAppHashKey']['User']['username'] ) {
			$this->redirect('/menus');
			exit;
		}
		
		$this->set('auth_msg', '' );
		
		// set FORM variable, for HELPER call on VIEW 
		$this->set( 'ctrapp_form', $this->Forms->getFormArray('login') );
		
		// set SIDEBAR variable, for HELPER call on VIEW 
		$this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray('login') );
		
		if(isset($this->params['data'])) {
		 
			$auth_num = $this->othAuth->login($this->params['data']['User']);
			$this->set('auth_msg', $this->othAuth->getMsg($auth_num));
		
		} 
		
	}
	
	function logout() {
		$this->othAuth->logout();
		$this->flash( 'You are now logged out!', '/users' );
	}

	function noaccess() {
		$this->flash( 'You don\'t have permission to access this page.', '/menus' );
	}

}

?>