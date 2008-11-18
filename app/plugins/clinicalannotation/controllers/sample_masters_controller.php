<?php

class SampleMastersController extends ClinicalAnnotationAppController {

	var $name = 'SampleMasters';
	
	var $uses 
		= array('ClinicalCollectionLink', 
			'Collection',
			'Participant',
			'SampleMaster');

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

	function index() {
		// nothing...
	}

	/**
	 * Function used to display all collected participant samples
	 * sorted by a parameter selected by the user into a filter
	 * drop down list.
	 * 
	 * @param $participant_id ID of the studied participant.
	 * 
	 * @author Nicolas Luc
	 * @date 08-12-20
	 */
	function listall( $participant_id ) {

		// ** Parameters check: Verify parameters have been set **
		if(empty($participant_id)) {
			$this->redirect('/pages/err_clin_funct_param_missing'); 
			exit;
		}
		
		// Verify participant exists
		$criteria = 'Participant.id="'.$participant_id.'"';
		$participant_data = $this->Participant->find($criteria);
		
		if(empty($participant_data)) {
			$this->redirect('/pages/err_clin_no_part_data'); 
			exit;
		}

		// ** 1 - Manage main form variables **

		// set MENU variable for echo on VIEW
		$ctrapp_menu[] = $this->Menus->tabs( 'clin_CAN_1', 'clin_CAN_57', $participant_id );
		$this->set( 'ctrapp_menu', $ctrapp_menu );

		// set FORM variable, for HELPER call on VIEW
		$this->set( 'ctrapp_form', $this->Forms->getFormArray('participant_sample_list') );
		
		// set DATA to display on view or to create link
		$this->set( 'participant_id', $participant_id );
		
		// set SUMMARY varible from plugin's COMPONENTS
		$this->set( 'ctrapp_summary', $this->Summaries->build( $participant_id ) );

		// set SIDEBAR variable, for HELPER call on VIEW
		// use PLUGIN_CONTROLLER_ACTION by default, but any ALIAS string 
		// that matches in the SIDEBARS datatable will do...
		$this->set( 'ctrapp_sidebar', 
			$this->Sidebars->getColsArray( 
				$this->params['plugin'].'_'.
				$this->params['controller'].'_'.
				$this->params['action'] ) );
			
		// ** 2 - Manage samples filter **
		
		$sample_filter = '';
		if ( isset($this->params['form']['samples_filter']) ) {
			$sample_filter = $this->params['form']['samples_filter'];
			$_SESSION['ctrapp_core']['clinical_annotation']['samples_filter'] = $sample_filter;
		} else if ( isset( $_SESSION['ctrapp_core']['clinical_annotation']['samples_filter'] ) ) {
			$sample_filter = $_SESSION['ctrapp_core']['clinical_annotation']['samples_filter'];
		} else if ( !isset( $_SESSION['ctrapp_core']['clinical_annotation']['samples_filter'] ) ) {
			$_SESSION['ctrapp_core']['clinical_annotation']['samples_filter'] = $sample_filter;
		}

		// ** 3 - Manage User Data To Display **
		
		// a - Create partcipant collection ids list for queries 
		$criteria = array();
		$criteria['ClinicalCollectionLink.participant_id'] = $participant_id;
				
		$clinical_collection_link_data = 
			$this->ClinicalCollectionLink->generateList( 
				$criteria, 
				null, 
				null, 
				'{n}.ClinicalCollectionLink.collection_id', 
				'{n}.ClinicalCollectionLink.collection_id' );
				
		$participant_collection_ids = "('')";
		if(!empty($clinical_collection_link_data)){
			$participant_collection_ids = "('".implode('\',\'', array_keys($clinical_collection_link_data))."')";
		}		
		
		// b - Set array of participant samples data
		$criteria = array();
		$criteria[] = "SampleMaster.collection_id IN ".$participant_collection_ids;
		if(!empty($sample_filter)) {
			// Add criteria selected by the user
			$criteria[] = $sample_filter;
		}
		
		list( $order, $limit, $page ) = $this->Pagination->init( $criteria );
		$participant_sample_list = $this->SampleMaster->findAll( $criteria, NULL, $order, $limit, $page );

		foreach($participant_sample_list as $id => $participant_sample_data) {
			// Code line to be able to use SampleMaster fields
			// [Note we can use a SampleMaster model instead of SampleMaster because
			// we call function $this->Pagination->init that need to work on model 
			// having name similar than controller (I think :-) ].
			$participant_sample_list[$id]['SampleMaster'] = $participant_sample_data['SampleMaster'];
		}
		$this->set( 'participant_sample_list', $participant_sample_list );

		// c - Set array to build samples list filter
		$array_filter = array();
		
		// sample category filter
		$array_filter['category']['translation'] = '1';	
		$array_filter['category']['table_field'] = 'SampleMaster.sample_category';
		$array_filter['category']['values'] = array('specimen' => 'specimen', 'derivative' => 'derivative' );
			
		// sample type filter	
		$criteria = array();
		$criteria[] = "SampleMaster.collection_id IN ".$participant_collection_ids;
			
		$array_filter['sample type']['translation'] = '1';
		$array_filter['sample type']['table_field'] = 'SampleMaster.sample_type';
		$array_filter['sample type']['values'] 
			= $this->SampleMaster->generateList( 
				$criteria, 
				null, 
				null, 
				'{n}.SampleMaster.sample_type', 
				'{n}.SampleMaster.sample_type' );					
															
		// collection bank filter	
		$criteria = array();
		$criteria[] = "Collection.id IN ".$participant_collection_ids;
			
		$array_filter['collection bank']['translation'] = '1';
		$array_filter['collection bank']['table_field'] = 'Collection.bank';	
		$array_filter['collection bank']['values'] 
			= $this->Collection->generateList( 
				$criteria, 
				null, 
				null, 
				'{n}.Collection.bank', 
				'{n}.Collection.bank' );
											
		// collection label filter	
		$array_filter['acquisition_label']['translation'] = '0';
		$array_filter['acquisition_label']['table_field'] = 'Collection.acquisition_label';
		$array_filter['acquisition_label']['values'] 
			= $this->Collection->generateList( 
				$criteria, 
				null, 
				null, 
				'{n}.Collection.acquisition_label', 
				'{n}.Collection.acquisition_label' );
													
		$this->set( 'array_filter', $array_filter );
		
		// ** look for CUSTOM HOOKS, "format" **
		$custom_ctrapp_controller_hook 
			= APP . 'plugins' . DS . $this->params['plugin'] . DS . 
			'controllers' . DS . 'hooks' . DS . 
			$this->params['controller'].'_'.$this->params['action'].'_format.php';
			
		if (file_exists($custom_ctrapp_controller_hook)) {
			require($custom_ctrapp_controller_hook);
		}
				
	}
}

?>