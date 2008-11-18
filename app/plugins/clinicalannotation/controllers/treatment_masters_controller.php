<?php

class TreatmentMastersController extends ClinicalAnnotationAppController {

	var $name = 'TreatmentMasters';
	var $uses = array( 'TreatmentControl', 'TreatmentMaster', 'ProtocolMaster', 'Diagnosis', 'TreatmentExtend' );

	var $components = array('Summaries');
	var $helpers = array('Summaries', 'MoreForm');

	function beforeFilter() {

		// $auth_conf array hardcoded in oth_auth component, due to plugins compatibility
		$this->othAuth->controller = &$this;
		$this->othAuth->init();
		$this->othAuth->check();

		// CakePHP function to re-combine dat/time select fields
		$this->cleanUpFields();

	}

	function index() {
		// nothing...
	}

	function listall( $participant_id=null ) {
		// missing VARS, send to ERROR page
		if ( !$participant_id ) { $this->redirect( '/pages/err_clin-ann_no_part_id' ); exit; }
		
		// get all DX rows, for Tx FILTER pulldown && DX input
		$criteria = 'participant_id="'.$participant_id.'"';
		$order = 'case_number ASC, dx_date ASC';
		$this->set( 'dx_listall', $this->Diagnosis->findAll( $criteria, NULL, $order ) );

		// set SESSION var of Tx PRIMARY to blank or form value
		if ( isset($this->params['form']['tx_filter']) ) {
			$_SESSION['ctrapp_core']['clinical_annotation']['tx_filter'] = $this->params['form']['tx_filter'];
		} else if ( !isset( $_SESSION['ctrapp_core']['clinical_annotation']['tx_filter'] ) ) {
			$_SESSION['ctrapp_core']['clinical_annotation']['tx_filter'] = '';
		}

		// build Tx FILTER LIST
		$tx_filter_array = array();
		if ( $_SESSION['ctrapp_core']['clinical_annotation']['tx_filter']!=='' ) {

			if ( substr($_SESSION['ctrapp_core']['clinical_annotation']['tx_filter'],0,1)=='p' ) {
				// get ROWS of DXs with matching Tx PRIMARY
				$criteria = 'participant_id="'.$participant_id.'" AND case_number="'.substr($_SESSION['ctrapp_core']['clinical_annotation']['tx_filter'],1).'"';
				$tx_filter_result = $this->Diagnosis->findAll( $criteria );
			} else {
				// get ROWS of DXs with EXACT ID
				$criteria = 'participant_id="'.$participant_id.'" AND id="'.$_SESSION['ctrapp_core']['clinical_annotation']['tx_filter'].'"';
				$tx_filter_result = $this->Diagnosis->findAll( $criteria );
			}

			// add DX ids to CRITERIA array list
			foreach( $tx_filter_result as $dx ) {
				$tx_filter_array[] = $dx['Diagnosis']['id'];
			}

		}

		// set MENU varible for echo on VIEW
		$ctrapp_menu[] = $this->Menus->tabs( 'clin_CAN_1', 'clin_CAN_75', $participant_id );
		$this->set( 'ctrapp_menu', $ctrapp_menu );

		// set FORM variable, for HELPER call on VIEW
		$this->set( 'ctrapp_form', $this->Forms->getFormArray('tx_masters') );

		// set SUMMARY varible from plugin's COMPONENTS
		$this->set( 'ctrapp_summary', $this->Summaries->build( $participant_id ) );

		// set SIDEBAR variable, for HELPER call on VIEW
		// use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
		$this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.$this->params['controller'].'_'.$this->params['action'] ) );

		// set FORM variable, for HELPER call on VIEW
		$this->set( 'participant_id', $participant_id );

		// build criteria, append Tx_FILTER if any...
		$criteria = 'TreatmentMaster.participant_id="'.$participant_id.'"';
		if ( $_SESSION['ctrapp_core']['clinical_annotation']['tx_filter']!=='' ) {
			$criteria .= ' AND ( TreatmentMaster.diagnosis_id="'.implode( '" OR TreatmentMaster.diagnosis_id="', $tx_filter_array ).'" )';
		}

		list( $order, $limit, $page ) = $this->Pagination->init( $criteria );
		$tx_master_data = $this->TreatmentMaster->findAll( $criteria, NULL, $order, $limit, $page );
				
	 	$generateList_conditions = '';
		$this->set( 'all_protocols', $this->ProtocolMaster->generateList( $generateList_conditions, 'ProtocolMaster.code ASC', null, '{n}.ProtocolMaster.id', '{n}.ProtocolMaster.code' ) );
			
		$conditions = array();
		$conditions = array_filter($conditions);
		
		// findall TreatmentControls, for ADD form
		$this->set( 'tx_controls', $this->TreatmentControl->findAll( $conditions ) );
		
		$this->set( 'tx_masters', $tx_master_data );

		// look for CUSTOM HOOKS, "format"
		$custom_controller_hook = APP . 'plugins' . DS . $this->params['plugin'] . DS . 'controllers' . DS . 'hooks' . DS . $this->params['controller'].'_'.$this->params['action'].'_format.php';
		if ( file_exists($custom_controller_hook) ) { require($custom_controller_hook); }
	}

	function detail( $participant_id=null, $tx_master_id=null ) {
		// missing VARS, send to ERROR page
		if ( !$participant_id ) { $this->redirect( '/pages/err_clin-ann_no_part_id' ); exit; }
		
		// set SUMMARY varible from plugin's COMPONENTS
		$this->set( 'ctrapp_summary', $this->Summaries->build( $participant_id ) );

		// set SIDEBAR variable, for HELPER call on VIEW
		// use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
		$this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.$this->params['controller'].'_'.$this->params['action'] ) );

		// set FORM variable, for HELPER call on VIEW
		$this->set( 'participant_id', $participant_id );
		$this->set( 'tx_master_id', $tx_master_id );

		// Tx MASTER info defines TreatmentDetail info, including FORM alias

			// read TreatmentMaster info, which contains FORM alias and DETAIL tablename
			$this->TreatmentMaster->id = $tx_master_id;
			$tx_master_data = $this->TreatmentMaster->read();

				// read related DIAGNOSIS row (if any), whose ID should be same as TreatmentMaster's DIAGNOSIS_ID value
				$this->Diagnosis->id = $tx_master_data['TreatmentMaster']['diagnosis_id'];
				$this->set( 'dx_listall', $this->Diagnosis->read()  );

			// set MENU varible for echo on VIEW
			$ctrapp_menu[] = $this->Menus->tabs( 'clin_CAN_1', 'clin_CAN_75', $participant_id );
			$ctrapp_menu[] = $this->Menus->tabs( 'clin_CAN_75', 'clin_CAN_79', $participant_id.'/'.$tx_master_id ); // based on TxMaster values
			if ( empty($tx_master_data['TreatmentMaster']['extend_tablename']) ) {
				$ctrapp_menu['1']['clin_CAN_80']['allowed'] = false;
			}
			$this->set( 'ctrapp_menu', $ctrapp_menu );

			// FORM alias, from Tx MASTER field
			$this->set( 'ctrapp_form', $this->Forms->getFormArray( $tx_master_data['TreatmentMaster']['detail_form_alias'] ) );

			// start new instance of TreatmentDetail model, using TABLENAME from Tx MASTER
			$this->TreatmentDetail = new TreatmentDetail( false, $tx_master_data['TreatmentMaster']['detail_tablename'] );
			// read related TreatmentDetail row, whose ID should be same as TreatmentMaster ID
			$this->TreatmentDetail->id = $tx_master_id;
			$tx_specific_data = $this->TreatmentDetail->read();

			// merge both datasets into a SINGLE dataset, set for VIEW
			$this->data = array_merge( $tx_master_data, $tx_specific_data );
			$this->set( 'data', $this->data );

	 	$generateList_conditions = '';
		$this->set( 'all_protocols', $this->ProtocolMaster->generateList( $generateList_conditions, 'ProtocolMaster.code ASC', null, '{n}.ProtocolMaster.id', '{n}.ProtocolMaster.code' ) );

		// look for CUSTOM HOOKS, "format"
		$custom_controller_hook = APP . 'plugins' . DS . $this->params['plugin'] . DS . 'controllers' . DS . 'hooks' . DS . $this->params['controller'].'_'.$this->params['action'].'_format.php';
		if ( file_exists($custom_controller_hook) ) { require($custom_controller_hook); }
	}

	function add( $participant_id=null, $tx_control_id=null ) {
		// missing VARS, send to ERROR page
		if ( !$participant_id ) { $this->redirect( '/pages/err_clin-ann_no_part_id' ); exit; }
		
		if ( $tx_control_id!=null ) {

			// read TreatmentControl info, which contains FORM alias and DETAIL tablename
			$this->TreatmentControl->id = $tx_control_id;
			$tx_control_data = $this->TreatmentControl->read();
			$this->set( 'control_data', $tx_control_data  );

			// start new instance of TreatmentDetail model, using TABLENAME from Tx MASTER
			$this->TreatmentDetail = new TreatmentDetail( false, $tx_control_data['TreatmentControl']['detail_tablename'] );

		} else if ( isset($this->params['form']['tx_control_id']) ) {

			// get TreatmentControl ID from LISTALL add form submit
			$tx_control_id = $this->params['form']['tx_control_id'];

			// read TreatmentControl info, which contains FORM alias and DETAIL tablename
			$this->TreatmentControl->id = $tx_control_id;
			$tx_control_data = $this->TreatmentControl->read();
			$this->set( 'control_data', $tx_control_data  );

			// start new instance of TreatmentDetail model, using TABLENAME from Tx MASTER
			$this->TreatmentDetail = new TreatmentDetail( false, $tx_control_data['TreatmentControl']['detail_tablename'] );

		} else {

			// error
			die('missing tx control id');

		}

		// get all DX rows, for Tx FILTER pulldown && DX input
		$criteria = 'participant_id="'.$participant_id.'"';
		$order = 'case_number ASC, dx_date ASC';
		$this->set( 'dx_listall', $this->Diagnosis->findAll( $criteria, NULL, $order ) );
		
		
		// set MENU varible for echo on VIEW
		$ctrapp_menu[] = $this->Menus->tabs( 'clin_CAN_1', 'clin_CAN_75', $participant_id );
		$this->set( 'ctrapp_menu', $ctrapp_menu );

		// set FORM variable, for HELPER call on VIEW
		$this->set( 'ctrapp_form', $this->Forms->getFormArray( $tx_control_data['TreatmentControl']['detail_form_alias'] ) );

		// set FORM variable, for HELPER call on VIEW
		$this->set( 'ctrapp_dx_form', $this->Forms->getFormArray('diagnoses') );

		// set SUMMARY varible from plugin's COMPONENTS
		$this->set( 'ctrapp_summary', $this->Summaries->build( $participant_id ) );

		// set SIDEBAR variable, for HELPER call on VIEW
		// use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
		$this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.$this->params['controller'].'_'.$this->params['action'] ) );

		// set FORM variable, for HELPER call on VIEW
		$this->set( 'participant_id', $participant_id );
		$this->set( 'tx_control_id', $tx_control_id );

		// setup MODEL(s) validation array(s) for displayed FORM
		foreach ( $this->Forms->getValidateArray( $tx_control_data['TreatmentControl']['detail_form_alias'] ) as $validate_model=>$validate_rules ) {
			$this->{ $validate_model }->validate = $validate_rules;
		}
		
    	$generateList_conditions = $tx_control_data['TreatmentControl']['tx_group'] ? 'ProtocolMaster.type="'.strtolower($tx_control_data['TreatmentControl']['tx_group']).'"' : '';
		$this->set( 'all_protocols', $this->ProtocolMaster->generateList( $generateList_conditions, 'ProtocolMaster.code ASC', null, '{n}.ProtocolMaster.id', '{n}.ProtocolMaster.code' ) );

		// look for CUSTOM HOOKS, "format"
		$custom_ctrapp_controller_hook 
			= APP . 'plugins' . DS . $this->params['plugin'] . DS . 
			'controllers' . DS . 'hooks' . DS . 
			$this->params['controller'].'_'.$this->params['action'].'_format.php';
		
		if (file_exists($custom_ctrapp_controller_hook)) {
			require($custom_ctrapp_controller_hook);
		}

		if ( !empty($this->data) ) {

			// after DETAIL model is set and declared
			$this->cleanUpFields('TreatmentDetail');

			if ( !isset($this->data['TreatmentDetail']) ) { $this->data['TreatmentDetail'] = array(); } // if not DETAIL form elements used...

			if ( $this->TreatmentMaster->validates( $this->data['TreatmentMaster'] ) && $this->TreatmentDetail->validates( $this->data['TreatmentDetail'] ) ) {

				// save TreatmentMaster data
				$this->TreatmentMaster->save( $this->data['TreatmentMaster'] );

				// set ID fields based on TreatmentMaster
				$this->data['TreatmentDetail']['id'] = $this->TreatmentMaster->getLastInsertId();
				$this->data['TreatmentDetail']['tx_master_id'] = $this->TreatmentMaster->getLastInsertId();

				// save TreatmentDetail data
				$this->TreatmentDetail->save( $this->data['TreatmentDetail'] );

				// populate TxExtends with ProtocolExtends data, if any...
				if ( isset($this->data['TreatmentMaster']['protocol_id']) 
				&& (!empty($this->data['TreatmentMaster']['protocol_id'])) ) {

					$pMaster = $this->ProtocolMaster->read( NULL, $this->data['TreatmentMaster']['protocol_id'] );

					$pExtend = $this->TreatmentMaster->query(
						'
							SELECT *
							FROM '.$pMaster['ProtocolMaster']['extend_tablename'].'
							WHERE protocol_master_id="'.$this->data['TreatmentMaster']['protocol_id'].'"
						'
					);

					foreach ( $pExtend as $extend_data ) {

						$save_extend_data = $extend_data[ $pMaster['ProtocolMaster']['extend_tablename'] ];

						unset( $save_extend_data['id'] );
						unset( $save_extend_data['created'] );
						unset( $save_extend_data['created_by'] );
						unset( $save_extend_data['modified'] );
						unset( $save_extend_data['modified_by'] );

						$save_extend_data['tx_master_id'] = $this->TreatmentMaster->getLastInsertId();

						// save TreatmentExtend data
						$this->TreatmentExtend = new TreatmentExtend( false, $this->data['TreatmentMaster']['extend_tablename'] );
						$this->TreatmentExtend->save( $save_extend_data );
					}
				}
				$this->flash( 'Your data has been updated.','/treatment_masters/listall/'.$participant_id );
			}

		} else {
			$this->set( 'data', array() );
			$this->data = array();
		}

	}

	function edit( $participant_id=null, $tx_master_id=null ) {
		// missing VARS, send to ERROR page
		if ( !$participant_id ) { $this->redirect( '/pages/err_clin-ann_no_part_id' ); exit; }
		
		// get all DX rows, for Tx FILTER pulldown && DX input
		$criteria = 'participant_id="'.$participant_id.'"';
		$order = 'case_number ASC, dx_date ASC';
		$this->set( 'dx_listall', $this->Diagnosis->findAll( $criteria, NULL, $order ) );
		
		// set FORM variable, for HELPER call on VIEW
		//$this->set( 'ctrapp_form', $this->Forms->getFormArray('tx_masters') );

		// set FORM variable, for HELPER call on VIEW
		$this->set( 'ctrapp_dx_form', $this->Forms->getFormArray('diagnoses') );

		// set SUMMARY varible from plugin's COMPONENTS
		$this->set( 'ctrapp_summary', $this->Summaries->build( $participant_id ) );

		// set SIDEBAR variable, for HELPER call on VIEW
		// use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string that matches in the SIDEBARS datatable will do...
		$this->set( 'ctrapp_sidebar', $this->Sidebars->getColsArray( $this->params['plugin'].'_'.$this->params['controller'].'_'.$this->params['action'] ) );

		// set FORM variable, for HELPER call on VIEW
		$this->set( 'participant_id', $participant_id );
		$this->set( 'tx_master_id', $tx_master_id );

		// Tx MASTER info defines TreatmentDetail info, including FORM alias

			// read TreatmentMaster info, which contains FORM alias and DETAIL tablename
			$this->TreatmentMaster->id = $tx_master_id;
			$tx_master_data = $this->TreatmentMaster->read();

			// setup MODEL(s) validation array(s) for displayed FORM
				foreach ( $this->Forms->getValidateArray( $tx_master_data['TreatmentMaster']['detail_form_alias'] ) as $validate_model=>$validate_rules ) {
					$this->{ $validate_model }->validate = $validate_rules;
				}
				
			// set MENU varible for echo on VIEW
			$ctrapp_menu[] = $this->Menus->tabs( 'clin_CAN_1', 'clin_CAN_75', $participant_id );
			$ctrapp_menu[] = $this->Menus->tabs( 'clin_CAN_75', 'clin_CAN_79', $participant_id.'/'.$tx_master_id ); // based on TxMaster values
			if ( empty($tx_master_data['TreatmentMaster']['extend_tablename']) ) {
				$ctrapp_menu['1']['clin_CAN_80']['allowed'] = false;
			}
			$this->set( 'ctrapp_menu', $ctrapp_menu );

			// FORM alias, from Tx MASTER field
			$this->set( 'ctrapp_form', $this->Forms->getFormArray( $tx_master_data['TreatmentMaster']['detail_form_alias'] ) );

			// start new instance of TreatmentDetail model, using TABLENAME from Tx MASTER
			$this->TreatmentDetail = new TreatmentDetail( false, $tx_master_data['TreatmentMaster']['detail_tablename'] );
			// read related TreatmentDetail row, whose ID should be same as TreatmentMaster ID
			$this->TreatmentDetail->id = $tx_master_id;
			$tx_specific_data = $this->TreatmentDetail->read();

		
	 	$generateList_conditions = $this->data['TreatmentMaster']['group'] ? 'ProtocolMaster.type="'.strtolower($this->data['TreatmentMaster']['group']).'"' : '';
		$this->set( 'all_protocols', $this->ProtocolMaster->generateList( $generateList_conditions, 'ProtocolMaster.code ASC', null, '{n}.ProtocolMaster.id', '{n}.ProtocolMaster.code' ) );

		// look for CUSTOM HOOKS, "format"
		$custom_ctrapp_controller_hook 
			= APP . 'plugins' . DS . $this->params['plugin'] . DS . 
			'controllers' . DS . 'hooks' . DS . 
			$this->params['controller'].'_'.$this->params['action'].'_format.php';
		
		if (file_exists($custom_ctrapp_controller_hook)) {
			require($custom_ctrapp_controller_hook);
		}

		if ( empty($this->data) ) {
			// merge both datasets into a SINGLE dataset, set for VIEW
			$this->data = array_merge( $tx_master_data, $tx_specific_data );
			$this->set( 'data', $this->data  );

		} else {
			// after DETAIL model is set and declared
			$this->cleanUpFields('TreatmentDetail');

			if ( !isset($this->data['TreatmentDetail']) ) { $this->data['TreatmentDetail'] = array(); } // if not DETAIL form elements used...

			if ( $this->TreatmentMaster->validates( $this->data['TreatmentMaster'] ) && $this->TreatmentDetail->validates( $this->data['TreatmentDetail'] ) ) {
				
				// Check to see if diagnosis_id has been set
				if ( isset($this->data['TreatmentMaster']['diagnosis_id']) ) {
					// Check diagnosis_id is set and FALSE ('' or 0) 
					if ( !$this->data['TreatmentMaster']['diagnosis_id'] ) {
						// Set diagnosis_id to NULL. This ensures the diagnosis_id FK
						// constraint is satisfied. 
						$this->data['TreatmentMaster']['diagnosis_id']= NULL;
					}
				}
				
				$this->TreatmentMaster->save( $this->data['TreatmentMaster'] );
				$this->TreatmentDetail->save( $this->data['TreatmentDetail'] );

				$this->flash( 'Your data has been updated.','/treatment_masters/detail/'.$participant_id.'/'.$tx_master_id );
			}
		}

	}

	function delete( $participant_id=null, $tx_master_id=null ) {
		// missing VARS, send to ERROR page
		if ( !$participant_id ) { $this->redirect( '/pages/err_clin-ann_no_part_id' ); exit; }
		
		// read TreatmentMaster info, which contains FORM alias and DETAIL tablename
		$this->TreatmentMaster->id = $tx_master_id;
		$tx_master_data = $this->TreatmentMaster->read();

		// start new instance of TreatmentDetail model, using TABLENAME from Tx MASTER
		$this->TreatmentDetail = new TreatmentDetail( false, $tx_master_data['TreatmentMaster']['detail_tablename'] );

		if(!$this->allowTrtDeletion($tx_master_id)) {
			$this->flash( 'Your are not allowed to delete this data.','/treatment_masters/detail/'.$participant_id.'/'.$tx_master_id );
			exit;
		}
		
		// delete MASTER/DETAIL rows
		$this->TreatmentMaster->del( $tx_master_id );
		$this->TreatmentDetail->del( $tx_master_id );
		$this->TreatmentDetail->execute( 'DELETE FROM '.$tx_master_data['TreatmentMaster']['extend_tablename'].' WHERE tx_master_id="'.$tx_master_id.'"' );

		$this->flash( 'Your data has been deleted.', '/treatment_masters/listall/'.$participant_id );

	}
	
	function allowTrtDeletion($tx_master_id) {
		
		$criteria = array();
		$exten_tables_list = 
			$this->TreatmentControl->generateList(
				$criteria,
				null, 
				null,
				'{n}.TreatmentControl.id', 
				'{n}.TreatmentControl.extend_tablename');
			
		if(!empty($exten_tables_list)) {
			foreach($exten_tables_list as $id => $extend_tablename) {
				
				$this->TreatmentExtend = new TreatmentExtend( false, $extend_tablename );
				
				$criteria = 'TreatmentExtend.tx_master_id ="' .$tx_master_id.'"';			 
				$record_nbr = $this->TreatmentExtend->findCount($criteria);
				
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