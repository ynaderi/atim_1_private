<?php 
	
	class SummariesHelper extends Helper
	{
	
		var $name = 'Summaries';
		var $helpers = array( 'Html', 'Translations', 'othAuth', 'Forms' );
		
		function build( $ctrapp_summary=array(), $lang=array() ) {
			
			// display if array not blank
			if ( !empty($ctrapp_summary) ) {
					
						$form_type = 'summary';
						$form_model = $ctrapp_summary['text']['data'];
						$form_field = $ctrapp_summary['text']['form'];
						$form_link = array();
						$form_lang = $lang;
						
					$display_summary_text = $this->Forms->build( $form_type, $form_model, $form_field, $form_link, $form_lang, NULL, NULL, ' ' );
					
						$form_type = 'summary';
						$form_model = $ctrapp_summary['desc']['data'];
						$form_field = $ctrapp_summary['desc']['form'];
						$form_link = array();
						$form_lang = $lang;
						
					$display_summary_desc = $this->Forms->build( $form_type, $form_model, $form_field, $form_link, $form_lang, NULL, NULL, ', ' );
					
					echo '
						<h2>
							'.$this->Html->link( $this->Translations->t( 'core_menu_tools', $lang ), '/menus/tools/', array( 'id'=>'h2_tools_menu' ), NULL, false ).'
							'.$this->Html->link( $this->Translations->t( 'core_administrate', $lang ), '/administrate/banks/index/', array( 'id'=>'h2_administrate_groups_index' ), NULL, false ).'
							
							<div id="h2_summary">
								'.$this->Html->link( $this->Translations->t( 'core_appname', $lang ), '/administrate/banks/index/', NULL, NULL, false ).'
							</div>
						</h2>
					
						<!-- <br class="clear" /> -->
					';
				
			} // END if count
			
		} // end TABS function
		
	}
		
?>
