<?php 
	
class MenusHelper extends Helper {

	var $name = 'Menus';
	var $helpers = array( 'Html', 'Translations' );
	
	function tabs( $display_menu = array(), $lang=array(), $options=array() ) {
		
		$return_string = '';
		if ( !isset($options['extra_id_suffix']) ) { $options['extra_id_suffix']=''; } // Any extra text will  be appended to ID name of container DIV
		if ( !isset($options['no_extra_at_state']) ) { $options['no_extra_at_state']=false; } // TRUE will duplicate AT state as extra LI/A coombo at top of UL; FALSE will set existing LI/A at state
		
		// display menus if array not blank
		if ( count($display_menu) ) {
			
			foreach ( $display_menu as $count_menu=>$build_menu ) {
				
				$return_string .= $this->levels( count($display_menu), $count_menu, $build_menu, $lang, $options );
				
					/*
					$ul_id = '';
					$li_id = '';
					$option_list = '';
					
					$extra_at_state_start = '';
					$extra_at_state_end = '';
					
					foreach ( $build_menu as $tab_key=>$tab ) {
						
						// ID for UL
						$ul_id = str_replace( '/', ' ', $tab['parent'] );
						$ul_id = trim( $ul_id );
						$ul_id = strtolower($ul_id);
						$ul_id = str_replace( ' ', '_', $ul_id );
						
						// ID for the LI/A
						$li_id = str_replace( '/', ' ', $tab['link'] );
						$li_id = trim( $li_id );
						$li_id = strtolower($li_id);
						$li_id = str_replace( ' ', '_', $li_id );
						
						// CLASSes for LI/A
						$li_classes = array();
						$li_classes[] = 'tab_'.$tab_key;
						$li_classes[] =  $tab['at'] ? 'at' : '';
						$li_classes[] =  !$tab_key ? 'first' : '';
						$li_classes[] =  $tab_key==( count($build_menu)-1 ) ? 'last' : '';
								
						// if allowed by PERMISSIONS, render LI tag with valid LINK tag to URL
						if ( $tab['allowed'] ) {
							
							$li_classes = array_filter($li_classes);
							
							// add JS to HREF if MENU for TOOL header menu
							$attach_js_to_link = '';
							if ( $li_id=='menus_tools' ) {
								$attach_js_to_link = ' onclick="Effect.toggle( \'tabs_menu_core_can_33\', \'appear\', {duration:0.25} ); return false;"';
								// $attach_js_to_link = ' onclick="return: false;" onmouseover="document.getElementById(\'tabs_menu_core_can_33\').style.display=\'block\'" onmouseout="document.getElementById(\'tabs_menu_core_can_33\').style.display=\'none\'"';
							}
							
							// collect all LIs in one VARIABLE
							$option_list .= '
											<li id="'.$li_id.'" class="'.implode(' ',$li_classes).'">
												<a '.( $tab['description'] ? 'title="'.$this->Translations->t( $tab['description'], $lang ).'"' : '' ).' href="'.$this->Html->url( $tab['link'] ).'"'.$attach_js_to_link.'>
													'.$this->Translations->t( $tab['text'], $lang ).'
												</a>
											</li>
							';
							
							// if OPTIONS set, build wrapper UL for sub-tabs
							if ( $tab['at'] && !$options['no_extra_at_state'] ) {
								
								// add JS to HREF if MENU for SUBMENU header menu
								$attach_js_to_link = ' onclick="return: false;" onmouseover="document.getElementById(\''.$li_id.'_ul_'.$count_menu.'_to_toggle\').style.display=\'block\'" onmouseout="document.getElementById(\''.$li_id.'_ul_'.$count_menu.'_to_toggle\').style.display=\'none\'"';
								
								$extra_at_state_start = '
									<li id="'.$li_id.'_at" class="at '.implode(' ',$li_classes).'">
										<a '.( $tab['description'] ? 'title="'.$this->Translations->t( $tab['description'], $lang ).'"' : '' ).' href="'.$this->Html->url( $tab['link'] ).'" class="toggle" '.$attach_js_to_link.'>
											'.$this->Translations->t( $tab['text'], $lang ).'
										</a>
										
										<ul id="'.$li_id.'_ul_'.$count_menu.'_to_toggle" style="display:none;" '.$attach_js_to_link.'>
								';
								
								$extra_at_state_end = '
										</ul>
										
									</li>
								';
								
							}
						} 
						
						// if NOT allowed by PERMISSIONS, render placeholder A tag without the HREF attribute
						else {
							
							$li_classes[] = 'notallowed';
							$li_classes = array_filter($li_classes);
							
							$option_list .= '
											<li class="'.implode(' ',$li_classes).'">
												<a '.( $tab['description'] ? 'title="'.$this->Translations->t( $tab['description'], $lang ).'"' : '' ).'>
													'.$this->Translations->t( $tab['text'], $lang ).'
												</a>
											</li>
							';
						}
						
					} // END foreach LI
				
				// CLASSes for UL
				$ul_classes = array();
				$ul_classes[] = 'tabs_'.$count_menu;
				$ul_classes[] = $count_menu==intval(count($display_menu)-1) ? 'last' : '';
				$ul_classes = array_filter($ul_classes);
				
				// attach to RETURN STRING; include show/hide if MENU for TOOL header menu
				$return_string .= '
							<ul id="tabs_menu_'.$ul_id.'" class="'.implode(' ', $ul_classes).'" '.( 'tabs_menu_'.$ul_id=='tabs_menu_core_can_33' ? 'style="display:none;" onclick="return: false;"' : '' ).'>
							'.$extra_at_state_start.'
							'.$option_list.'
							'.$extra_at_state_end.'
							</ul>
				';
				*/
			
			} // END foreach UL
		
		} // END if count
		
		echo '
			<!-- START: Menus Helper -->
				<div id="tabs_menu_div'.( $options['extra_id_suffix'] ? '_'.$options['extra_id_suffix'] : '' ).'">
				'.$return_string.'
				</div>
			<!-- END: Menus Helper -->
		';
			
		
		// pr($display_menu);
		
	} // end TABS function
	
	function levels ( $total_menu=0, $count_menu=0, $build_menu=array(), $lang=array(), $options=array() ) {
		
		$return_string = '';
		
				$ul_id = '';
				$li_id = '';
				$option_list = '';
				
				$extra_at_state_start = '';
				$extra_at_state_end = '';
				
				foreach ( $build_menu as $tab_key=>$tab ) {
					
					// ID for UL
					$ul_id = str_replace( '/', ' ', $tab['parent'] );
					$ul_id = trim( $ul_id );
					$ul_id = strtolower($ul_id);
					$ul_id = str_replace( ' ', '_', $ul_id );
					
					// ID for the LI/A
					$li_id = str_replace( '/', ' ', $tab['link'] );
					$li_id = trim( $li_id );
					$li_id = strtolower($li_id);
					$li_id = str_replace( ' ', '_', $li_id );
					
					// CLASSes for LI/A
					$li_classes = array();
					$li_classes[] = 'tab_'.$tab_key;
					$li_classes[] =  $tab['at'] ? 'at' : '';
					$li_classes[] =  !$tab_key ? 'first' : '';
					$li_classes[] =  $tab_key==( count($build_menu)-1 ) ? 'last' : '';
							
					// if allowed by PERMISSIONS, render LI tag with valid LINK tag to URL
					if ( $tab['allowed'] ) {
						
						$li_classes = array_filter($li_classes);
						
						// add JS to HREF if MENU for TOOL header menu
						$attach_js_to_link = '';
						if ( $li_id=='menus_tools' ) {
							$attach_js_to_link = ' onclick="Effect.toggle( \'tabs_menu_core_can_33\', \'appear\', {duration:0.25} ); return false;"';
							// $attach_js_to_link = ' onclick="return: false;" onmouseover="document.getElementById(\'tabs_menu_core_can_33\').style.display=\'block\'" onmouseout="document.getElementById(\'tabs_menu_core_can_33\').style.display=\'none\'"';
						}
						
						// collect all LIs in one VARIABLE
						$option_list .= '
										<li id="'.$li_id.'" class="'.implode(' ',$li_classes).'">
											<a '.( $tab['description'] ? 'title="'.$this->Translations->t( $tab['description'], $lang ).'"' : '' ).' href="'.$this->Html->url( $tab['link'] ).'"'.$attach_js_to_link.'>
												'.$this->Translations->t( $tab['text'], $lang ).'
												'.( count($tab['children']) ? '&nbsp;<strong>&raquo;</strong>' : '' ).'
											</a>
											
						';
						
						if ( count($tab['children']) ) {
							$option_list .= $this->levels( $total_menu, $count_menu, $tab['children'], $lang, $options );
						}
						
						$option_list .= '
										</li>
						';
						
						// if OPTIONS set, build wrapper UL for sub-tabs
						if ( $tab['at'] && !$options['no_extra_at_state'] ) {
							
							// add JS to HREF if MENU for SUBMENU header menu
							$attach_js_to_link = ' onclick="return: false;" onmouseover="document.getElementById(\''.$li_id.'_ul_'.$count_menu.'_to_toggle\').style.display=\'block\'" onmouseout="document.getElementById(\''.$li_id.'_ul_'.$count_menu.'_to_toggle\').style.display=\'none\'"';
							
							$extra_at_state_start = '
								<li id="'.$li_id.'_at" class="at '.implode(' ',$li_classes).'">
									<a '.( $tab['description'] ? 'title="'.$this->Translations->t( $tab['description'], $lang ).'"' : '' ).' href="'.$this->Html->url( $tab['link'] ).'" class="toggle" '.$attach_js_to_link.'>
										'.$this->Translations->t( $tab['text'], $lang ).'
									</a>
									
									<ul id="'.$li_id.'_ul_'.$count_menu.'_to_toggle" style="display:none;" '.$attach_js_to_link.'>
							';
							
							$extra_at_state_end = '
									</ul>
									
								</li>
							';
							
						}
					} 
					
					// if NOT allowed by PERMISSIONS, render placeholder A tag without the HREF attribute
					else {
						
						$li_classes[] = 'notallowed';
						$li_classes = array_filter($li_classes);
						
						$option_list .= '
										<li class="'.implode(' ',$li_classes).'">
											<a '.( $tab['description'] ? 'title="'.$this->Translations->t( $tab['description'], $lang ).'"' : '' ).'>
												'.$this->Translations->t( $tab['text'], $lang ).'
												'.( count($tab['children']) ? '&nbsp;<strong>&raquo;</strong>' : '' ).'
											</a>
											
						';
						
						if ( count($tab['children']) ) {
							$return_string .= $this->levels( $total_menu, $count_menu, $tab['children'], $lang, $options );
						}
						
						$option_list .= '
										</li>
						';
					}
					
				} // END foreach LI
			
			// CLASSes for UL
			$ul_classes = array();
			$ul_classes[] = 'tabs_'.$count_menu;
			$ul_classes[] = $count_menu==intval($total_menu-1) ? 'last' : '';
			$ul_classes = array_filter($ul_classes);
			
			// attach to RETURN STRING; include show/hide if MENU for TOOL header menu
			$return_string .= '
						<ul id="tabs_menu_'.$ul_id.'" class="'.implode(' ', $ul_classes).'" '.( 'tabs_menu_'.$ul_id=='tabs_menu_core_can_33' ? 'style="display:none;" onclick="return: false;"' : '' ).'>
						'.$extra_at_state_start.'
						'.$option_list.'
						'.$extra_at_state_end.'
						</ul>
			';
		
		return $return_string;
		
	}
	
}
		
?>
