<?php

class SidebarsComponent extends Object {
	
	var $controller = true;
	var $components = array('othAuth');
		
	function startup(&$controller) {
        // This method takes a reference to the controller which is loading it.
        // Perform controller initialization here.
	}
	
	// Build COLs with SIDEBAR info, if any... 
	function getColsArray( $alias=NULL ) {
		
		// get MODEL object for SIDEBARS and get content based on alias
		$this->Sidebar_Model_for_Cols =& new Sidebar;
		$return_string = $this->Sidebar_Model_for_Cols->findAll( 'alias="'.$alias.'"' );
		
		// return content for SIDEBAR helper 
		return $return_string;
		
	}
	
	// Build COLs with SIDEBAR info, if any... 
	function getAnnouncementsArray() {
		
		// get MODEL object for ANNOUNCEMENTS and get array
		$this->Announcement_Model_for_Cols =& new Announcement;
		
		$findAll_conditions[] = 'date_start<=NOW()';
		$findAll_conditions[] = 'date_end>=NOW()';
		$findAll_conditions[] = '(group_id="0" OR group_id="'.$this->othAuth->user('group_id').'")';
		
		$return_string = $this->Announcement_Model_for_Cols->findAll( $findAll_conditions, NULL, 'date DESC' );
		
		// return content for SIDEBAR helper 
		return $return_string;
		
	}
	
}

?>