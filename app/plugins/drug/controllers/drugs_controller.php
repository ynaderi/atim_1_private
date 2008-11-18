<?php

class DrugsController extends DrugAppController {

  var $name = 'Drugs';
  var $uses = array('Drug', 'ProtocolExtend', 'TreatmentExtend');

  var $components = array('Summaries');
  var $helpers = array('Summaries');

  function beforeFilter() {

    // $auth_conf array hardcoded in oth_auth component, due to plugins compatibility

    $this->othAuth->controller = &$this;
    $this->othAuth->init();
    $this->othAuth->check();


    // CakePHP function to re-combine dat/time select fields
    $this->cleanUpFields();

  }

  function listall( ) {

		// set MENU varible for echo on VIEW
		$this->set( 'ctrapp_menu', array() );

		// set FORM variable, for HELPER call on VIEW
		$this->set( 'ctrapp_form', $this->Forms->getFormArray('drugs') );

		// set SUMMARY variable from plugin's COMPONENTS
		$this->set( 'ctrapp_summary', $this->Summaries->build( ) );

		// set SIDEBAR variable, for HELPER call on VIEW
		// use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
		$this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.$this->params['controller'].'_'.$this->params['action'] ) );

		// set FORM variable, for HELPER call on VIEW

		$criteria = array();
		$criteria = array_filter($criteria);

		list( $order, $limit, $page ) = $this->Pagination->init( $criteria );
		$this->set( 'drugs', $this->Drug->findAll( $criteria, NULL, $order, $limit, $page ) );

	}

  function add() {

    // setup MODEL(s) validation array(s) for displayed FORM
    foreach ( $this->Forms->getValidateArray('drugs') as $validate_model=>$validate_rules ) {
      $this->{ $validate_model }->validate = $validate_rules;
    }

    // set MENU varible for echo on VIEW
    $this->set( 'ctrapp_menu', array() );

    // set FORM variable, for HELPER call on VIEW
    $this->set( 'ctrapp_form', $this->Forms->getFormArray('drugs') );

    // set SUMMARY varible from plugin's COMPONENTS
    $this->set( 'ctrapp_summary', $this->Summaries->build() );

    // set SIDEBAR variable, for HELPER call on VIEW
    // use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
    $this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.
								 $this->params['controller'].'_'.
								 $this->params['action'] ) );


   // look for CUSTOM HOOKS, "format"
	$custom_ctrapp_controller_hook 
		= APP . 'plugins' . DS . $this->params['plugin'] . DS . 
		'controllers' . DS . 'hooks' . DS . 
		$this->params['controller'].'_'.$this->params['action'].'_format.php';
	
	if (file_exists($custom_ctrapp_controller_hook)) {
		require($custom_ctrapp_controller_hook);
	}
		
	if ( !empty($this->data) ) {

      if ( $this->Drug->save( $this->data ) ) {
	$this->flash( 'Your data has been saved.','/drugs/detail/'.$this->Drug->getLastInsertId() );
      }else{
	print_r($this->params['data']);
      }
    }
  }

  function edit( $drug_id=null ) {

    // setup MODEL(s) validation array(s) for displayed FORM
	foreach ( $this->Forms->getValidateArray('drugs') as $validate_model=>$validate_rules ) {
      $this->{ $validate_model }->validate = $validate_rules;
    }

    // set MENU varible for echo on VIEW
	$ctrapp_menu[] = $this->Menus->tabs( 'drug_CAN_96', 'drug_CAN_97', $drug_id );
    $this->set( 'ctrapp_menu', array() );

    // set FORM variable, for HELPER call on VIEW
    $this->set( 'ctrapp_form', $this->Forms->getFormArray('drugs') );

    // set SUMMARY varible from plugin's COMPONENTS
    $this->set( 'ctrapp_summary', $this->Summaries->build($drug_id) );

    // set SIDEBAR variable, for HELPER call on VIEW
    // use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
    $this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.
								 $this->params['controller'].'_'.
								 $this->params['action'] ) );

   // look for CUSTOM HOOKS, "format"
	$custom_ctrapp_controller_hook 
		= APP . 'plugins' . DS . $this->params['plugin'] . DS . 
		'controllers' . DS . 'hooks' . DS . 
		$this->params['controller'].'_'.$this->params['action'].'_format.php';
	
	if (file_exists($custom_ctrapp_controller_hook)) {
		require($custom_ctrapp_controller_hook);
	}
		
	 if ( empty($this->data) ) {

      $this->Drug->id = $drug_id;
      $this->data = $this->Drug->read();
      $this->set( 'data', $this->data );

    } else {

      $this->Drug->id = $drug_id;
      if ( $this->Drug->save( $this->data['Drug'] ) ) {
	$this->flash( 'Your data has been updated.','/drugs/detail/'.$drug_id );
      }else{
	print_r($this->params['data']);
      }

    }
  }

  function detail( $drug_id=null ) {

	// set MENU varible for echo on VIEW
	$ctrapp_menu[] = $this->Menus->tabs( 'drug_CAN_96', 'drug_CAN_97', $drug_id );
	$this->set( 'ctrapp_menu', array() );

	// set FORM variable, for HELPER call on VIEW
	$this->set( 'ctrapp_form', $this->Forms->getFormArray('drugs') );

	// set SUMMARY variable from plugin's COMPONENTS
	$this->set( 'ctrapp_summary', $this->Summaries->build($drug_id ) );

	// set SIDEBAR variable, for HELPER call on VIEW
	// use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
	$this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.$this->params['controller'].'_'.$this->params['action'] ) );

	// set FORM variable, for HELPER call on VIEW
	$this->set( 'drug_id', $drug_id );

	$this->Drug->id = $drug_id;
	$this->set( 'data', $this->Drug->read() );
	}

  function delete( $drug_id=null ) {

	if(!$this->allowDrugDeletion($drug_id)) {
		$this->flash( 'Your are not allowed to delete this data.','/drugs/detail/'.$drug_id );
		exit;
	}
		
	// look for CUSTOM HOOKS, "format"
	$custom_ctrapp_controller_hook 
		= APP . 'plugins' . DS . $this->params['plugin'] . DS . 
		'controllers' . DS . 'hooks' . DS . 
		$this->params['controller'].'_'.$this->params['action'].'_format.php';
	
	if (file_exists($custom_ctrapp_controller_hook)) {
		require($custom_ctrapp_controller_hook);
	}
		
	$this->Drug->del( $drug_id );
	$this->flash( 'Your data has been deleted.', '/drugs/listall/' );

  }
	
	function allowDrugDeletion($drug_id){
		
		$studied_treatment_extend_list = array('txe_chemos');
		
		if(!empty($studied_treatment_extend_list)) {
			foreach($studied_treatment_extend_list as $id => $extend_tablename) {
				
				$this->TreatmentExtend = new TreatmentExtend( false, $extend_tablename );
				
				$criteria = 'TreatmentExtend.drug_id ="' .$drug_id.'"';			 
				$record_nbr = $this->TreatmentExtend->findCount($criteria);
				
				if($record_nbr > 0){
					return FALSE;
				}
				
			}
		}
		
		$studied_protocol_extend_list = array('pe_chemos');
			
		if(!empty($studied_protocol_extend_list)) {
			foreach($studied_protocol_extend_list as $id => $extend_tablename) {
				
				$this->ProtocolExtend = new ProtocolExtend( false, $extend_tablename );
				
				$criteria = 'ProtocolExtend.drug_id ="' .$drug_id.'"';			 
				$record_nbr = $this->ProtocolExtend->findCount($criteria);
				
				if($record_nbr > 0){
					return FALSE;
				}
				
			}
		}		
		
		// Etc
		
		return TRUE;
		
	}

}

?>