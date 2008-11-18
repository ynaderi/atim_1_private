<?php

class MenusComponent extends Object {
	
	var $controller = true;
	var $components = array('othAuth');
		
	function startup(&$controller) {
        // This method takes a reference to the controller which is loading it.
        // Perform controller initialization here.
	}
	
	// Build Tab Levels
	// function tabs( $parent = 0, $at = NULL, $params = NULL ) {
	function tabs( $levels=array(), $old_at_variable=NULL, $old_params_variable=NULL ) {
	
		// support ORIGINAL function variables
		if ( !is_array($levels) ) {
			$levels = array(
				array( $levels, $old_at_variable, $old_params_variable )
			);
		}
		
		// set display vars 
		$display_menu = array();
		
		// get MODEL object for this...
		$this->Menu_Model_for_Tabs =& new Menu;
		
		// each LEVEL provided to FUNCTION
		foreach ( $levels as $level ) {
			
			// set vars for each LEVEL
			$parent		= $level[0];
			$at 			= $level[1];
			$params		= $level[2];
			
			// get all links for PARENT
			foreach ( $this->Menu_Model_for_Tabs->findAll( 'parent_id="'.$parent.'" AND (active="yes" OR active="y" OR active="1")', NULL, 'display_order ASC', NULL ) as $tab_value ) {
				
				// set as CHILD of existing MENU level, else set as ROOT menu level
				if ( isset($display_menu[ $tab_value['Menu']['parent_id'] ]) ) {
					$tab_array = 'display_menu_'.$tab_value['Menu']['parent_id'];
				} else {
					$tab_array = 'display_menu';
				}
				
				$tab_key = $tab_value['Menu']['id'];
				
				// set VALUES for Menu HELPER to use to render LI tags
				${$tab_array}[ $tab_key ][ 'id' ] 				=	$tab_value['Menu']['id'];
				${$tab_array}[ $tab_key ][ 'parent' ] 			=	$parent;
				${$tab_array}[ $tab_key ][ 'at' ] 				=	$tab_value['Menu']['id']==$at && $at!==NULL ? true : false;
				${$tab_array}[ $tab_key ][ 'text' ] 			=	isset($tab_value['Menu']['language_title']) ? trim($tab_value['Menu']['language_title']) : ''; // if field "lanuage_title" exists in datatable, use that as HTML clickable link
				${$tab_array}[ $tab_key ][ 'description' ] 	=	isset($tab_value['Menu']['language_description']) ? trim($tab_value['Menu']['language_description']) : ''; // if field "lanuage_description" exists in datatable, use that as HTML tool tip
				${$tab_array}[ $tab_key ][ 'link' ] 			=	$tab_value['Menu']['use_link'].( $tab_value['Menu']['use_param'] && $params ? $params : '' );
				${$tab_array}[ $tab_key ][ 'children' ] 		=	array();
				
				// set REF to children array, for subsequent MENU levels
				$tab_array_children = 'display_menu_'.$tab_value['Menu']['id'];
				${$tab_array_children} = &${$tab_array}[ $tab_key ][ 'children' ];
				
				// check CONFIG, if User is permitted to SEE url
				${$tab_array}[ $tab_key ][ 'display' ] =  true; // in development...
	
				// if not permitted to SEE url, than AUTOMATICALLY not permitted ACCESS to url, despite PERMISSIONS
				if ( ${$tab_array}[ $tab_key ][ 'display' ] ) {
					
					// check SECURITY, if User is permitted to ACCESS url
					${$tab_array}[ $tab_key ][ 'allowed' ] =  $this->othAuth->checkMenuPermission( ${$tab_array}[ $tab_key ][ 'link' ] ) ? true : false;
					
				} else {
					unset( ${$tab_array}[ $tab_key ] ); // remove from ARRAY, so menu tab does not render
				}
				
			} // end PARENT links
			
		} // end each LEVEL
		
		// pass vars for CONTROLLERS 
		return $display_menu;
		
	}
	
}

?>