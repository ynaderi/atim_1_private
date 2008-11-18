<?php

class SummariesComponent extends Object {
	
	var $controller = true;
	var $components = array('Forms');
		
	function startup(&$controller) {
        // This method takes a reference to the controller which is loading it.
        // Perform controller initialization here.
	}
	
	// Build Tab Levels
	function build( $drug_id=NULL ) {
		
		// set display vars 
		$display_summary = array();
		
		if ( $drug_id ) {
			
			// set FORM arrays 
			$form = $this->Forms->getFormArray('drugs');
			
			// get Drug MODEL, and read RECORD 
			$this->Drug_for_Summary =& new Drug;
			$this->Drug_for_Summary->id = $drug_id;
			$text_data = $this->Drug_for_Summary->read( 'Drug.generic_name' );
			$desc_data = $this->Drug_for_Summary->read( 'Drug.type' );
			
				$display_summary = array(
					'text'=>array(
						'id'=>$drug_id,
						'form'=>$form,
						'data'=>array( $text_data )
					),
					'desc'=>array(
						'id'=>$drug_id,
						'form'=>$form,
						'data'=>array( $desc_data )
					)
				);
			
		}
		
		// pass vars for CONTROLLERS 
		return $display_summary;
		
	}
	
}

?>