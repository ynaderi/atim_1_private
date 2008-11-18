<?php
/* SVN FILE: $Id: app_controller.php,v 1.3 2007/01/25 20:36:57 walambre Exp $ */
/**
 * Short description for file.
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
 *
 * PHP versions 4 and 5
 *
 * CakePHP :  Rapid Development Framework <http://www.cakephp.org/>
 * Copyright (c)	2006, Cake Software Foundation, Inc.
 *								1785 E. Sahara Avenue, Suite 490-204
 *								Las Vegas, Nevada 89104
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @filesource
 * @copyright		Copyright (c) 2006, Cake Software Foundation, Inc.
 * @link				http://www.cakefoundation.org/projects/info/cakephp CakePHP Project
 * @package			cake
 * @subpackage		cake.cake
 * @since			CakePHP v 0.2.9
 * @version			$Revision: 1.3 $
 * @modifiedby		$LastChangedBy: phpnut $
 * @lastmodified	$Date: 2007/01/25 20:36:57 $
 * @license			http://www.opensource.org/licenses/mit-license.php The MIT License
 */
/**
 * This is a placeholder class.
 * Create the same file in app/app_controller.php
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @package		cake
 * @subpackage	cake.cake
 */

class AppController extends Controller {
		
	var $components  = array( 'othAuth', 'Pagination', 'Forms', 'Menus', 'Sidebars' );
	var $helpers = array( 'Html', 'Javascript', 'Ajax', 'Session', 'Translations', 'othAuth', 'Pagination', 'Forms', 'Menus', 'Sidebars' );
	
	var $translation;
	var $othAuthRestrictions = "*"; // USER/PERMISSIONS enforced 
	// var $othAuthRestrictions = array(); // USER/PERMISSIONS ignored, for testing purposes 
	
	function beforeFilter() {
	
		/*
		$auth_conf = array(
			'mode'  => 'oth',
			'login_page'  => '/',
			'logout_page' => '/users/logout',
			'access_page' => '/menus',
			'hashkey'     => 'CTRAppHash',
			'noaccess_page' => '/users/noaccess',
			'strict_gid_check' => false
		);
        */
        
        $this->othAuth->controller = &$this;
        $this->othAuth->init();
        $this->othAuth->check();
	}
	
	//http://wiki.cakephp.org/tutorials:i18n_v2?s=multilingual
	function beforeRender() {
		
		global $ctrapp_main_menu;
		
		// get USER language or app DEFAULT language 
		$user_language = $this->othAuth->user('lang');
		$default_language = $user_language ? $user_language : LANGUAGE;
		
		$this->I18n = new I18n();
		$i18n_results = $this->I18n->findAll();
		
		$lang = array();
		foreach ( $i18n_results as $i18n ) {
			$lang[ $i18n['I18n']['id'] ] = $i18n['I18n'][ $default_language ];
		}
		
		// save LANG array for all VIEWS 
		$this->set( 'lang', $lang );
					
		// set CTRAPP CUSTOM hook for views;
		if ( count($this->params) ) {
			$this->set( 'custom_ctrapp_view_hook', APP . 'plugins' . DS . $this->params['plugin'] . DS . 'views' . DS . $this->params['controller'] . DS . 'hooks' . DS . $this->params['action'].'_format.php' );
		} else {
			$this->set( 'custom_ctrapp_view_hook', '' );
		}
		
		// set MAIN MENUS for header
		$ctrapp_main_menu = array();
		$ctrapp_main_menu[] = $this->Menus->tabs( '0', 'MAIN_MENU_1' );
		$ctrapp_main_menu[] = $this->Menus->tabs( 'MAIN_MENU_1', 'core_CAN_33' );
			
			// for HEADER submenu to sort to the RIGHT correctly, must reverse MENU order
			$temp_main_menu = $this->Menus->tabs( 'core_CAN_33' );
			krsort($temp_main_menu);
			
		$ctrapp_main_menu[] = $temp_main_menu;
		
	}
	
	function param_convert( $paramlist, $label, $default = NULL ) {
		
		foreach($paramlist as $param) {
			if(strpos($param, ':')) {
				list($name, $value) = split(':', $param);
				if($name == $label) {
					// if we found the value then return it
					return $value;
				}
			}
		}
		
		return $default;
		
	}
	
	// error handling...
/*	function appError( $method, $params ) {
		$source_path = $_SERVER['PHP_SELF'];
		$source_path = str_replace('app/webroot/index.php','',$source_path);
		$this->redirect( $source_path . 'pages/error');
		exit();
	}*/

}

// CONFIGURATIONS

define('FORM_DATE_FORMAT', 'MDY'); // valid formats are DMY, MDY, YMD
define('FORM_TIME_FORMAT', '24'); // valid formats are 12, 24




?>
