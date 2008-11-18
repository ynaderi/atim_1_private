<?php 
	
	class SidebarsHelper extends Helper {
		
		var $name = 'Sidebars';
		var $helpers = array( 'Html', 'Session', 'Translations', 'othAuth', 'Menus' );
		
		function header( $lang ) {
			
			// make MAIN MENU available on ALL views
			global $ctrapp_main_menu;
			
			// othAuth data from controller, passed to view
			// $this->othAuth->init( $this->view->_viewVars['othAuth_data'] );
			
			echo '
				<!-- START: Sidebar Helper -->
				<div id="wrapper" class="plugin_'.( isset($this->view->params['plugin']) ? $this->view->params['plugin'] : 'none' ).' controller_'.$this->view->params['controller'].' action_'.$this->view->params['action'].'">
				
					<div id="header">
						<div id="toolbox">
                            
						<div id="tools">
			';

				// if LOGGED IN
				if ( $this->othAuth->user('id') ) {
					
					$this->Menus->tabs( $ctrapp_main_menu, $lang, array('no_extra_at_state'=>true, 'extra_id_suffix'=>'in_toolbox') );
					
					/*
					$api_text = $this->Translations->t( 'core_icon_main_menu', $lang, false ); // ALIAS to translate, language setting variable, boolean to display untranslated spantag 
					$api_image = $this->Html->imageTag ( 'icons/app_home_01.gif', $api_text ); // img path from webroot image folder, alt text 
					$api_link = $this->Html->link( $api_image, '/menus/', array( 'title'=>$api_text ), '', false ); // clickable element/text, href location, attributes and values as an array, javascript confirmation, boolean to escape clickable element/text
					echo( $api_link );
	
					$api_text = $this->Translations->t( 'core_icon_tools', $lang, false ); 
					$api_image = $this->Html->imageTag ( 'icons/tools.gif', $api_text ); 
					$api_link = $this->Html->link( $api_image, '/menus/tools/', array( 'title'=>$api_text ), '', false ); 
					echo( $api_link );
					
					// if allowed to CUSTOMIZE own profile
					if ( $this->othAuth->checkMenuPermission( '/customize/announcements/index/' ) ) {
						$api_text = $this->Translations->t( 'core_icon_profile', $lang, false ); 
						$api_image = $this->Html->imageTag ( 'icons/usr_profile.gif', $api_text ); 
						$api_link = $this->Html->link( $api_image, '/customize/announcements/index/', array( 'title'=>$api_text ), '', false ); 
						echo( $api_link );
					}
					
					// if allowed to ADMINISTRATE application
					if ( $this->othAuth->checkMenuPermission( '/administrate/banks/index/' ) ) {
						$api_text = $this->Translations->t( 'core_icon_admin', $lang, false ); 
						$api_image = $this->Html->imageTag ( 'icons/folder_wrench.png', $api_text );
						$api_link = $this->Html->link( $api_image, '/administrate/banks/index/', array( 'title'=>$api_text ), '', false ); 
						echo( $api_link );
					}
					*/
					
				}

				/*
				$api_text = $this->Translations->t( 'core_icon_application_help', $lang, false ); 
				$api_image = $this->Html->imageTag ( 'icons/icon_info.gif', $api_text );
				$api_link = $this->Html->link( $api_image, '/under_development/', array( 'title'=>$api_text ), '', false ); 
				echo( $api_link );
				*/
				
			
			echo '
						</div>
								
						<h1>'.$this->Translations->t('core_appname', $lang).'</h1>
			';			
				
				$display_language = $this->othAuth->user('lang') ? $this->othAuth->user('lang') : LANGUAGE;
				$logo_image = $this->Html->imageTag ( 'logo_'.$display_language.'.gif', NULL, array( 'id'=>'lang_logo' ) );
				// echo( $logo_image );
				
				/*
				// if logged in...
				if ( $this->othAuth->user('id') ) {
					
					echo('
							<p>
								<strong>'.$this->othAuth->user('first_name').' '.$this->othAuth->user('last_name').'</strong>
								::
								'.$this->Html->link( $this->Translations->t('logout', $lang), '/users/logout/', '', '', false ).'
								<br />
								<span class="todays_date">'.$this->Translations->t(strtolower(date('M')), $lang).' '.date('d, Y').'</span>
							</p>
					');
					
				} else {
					
					echo('
							<p>
								<strong>'.$this->Translations->t('you are not logged in', $lang).'</strong>
								::
								'.$this->Html->link( $this->Translations->t('login', $lang), '/users/', '', '', false ).'
								<br />
								<span class="todays_date">'.$this->Translations->t(strtolower(date('M')), $lang).' '.date('d, Y').'</span>
							</p>
					');
				
				}
				*/
			
			echo '
						</div> 
			      </div>
					
					<div id="views">
					
					<!-- END: Sidebar Helper -->
			';
			
		} // END HEADER 
		
		function cols( $sidebars=array(), $lang=array(), $extras=array() ) {
			
			// if EXTRAS not array, make it one...
			if ( !is_array($extras) ) { $extras['end'] = $extras; }
			
			if ( count( $sidebars ) ) {
				
				// display sidebar column for STUFF! 
				echo '
					<div id="col1">
				';
					
					// tack on extras at START, if any...
					if ( isset($extras['start']) ) { echo( $extras['start'] ); }
					
					foreach ( $sidebars as $sidebar ) {
						
						$display_title = $this->Translations->t( $sidebar['Sidebar']['language_title'], $lang );
						$display_title = nl2br( $display_title );
						
						// if TITLE EXTRA provided, assume it's something to PREPEND to summary title
						if ( isset($extras['title']) ) { 
							echo '
								'.$extras['title'].'
								'.( $display_title ? '<h2 class="with_extras">'.$display_title.'</h2>' : '' ).'
								<br class="clear" />
							';
						}
						
						// otherwise, display SUMMARY title as normal
						else {
							echo '
								'.( $display_title ? '<h2>'.$display_title.'</h2>' : '' ).'
							';
						}
						
						$display_body = $this->Translations->t( $sidebar['Sidebar']['language_body'], $lang );
						echo $display_body ? $display_body : '';
						
					}
					
					// tack on extras at END, if any...
					if ( isset($extras['end']) ) { echo( $extras['end'] ); }
					
				echo '
					</div>
					
					<div id="col2">
				';
				
			} else {
				
				// display single, wide column instead 
				echo '
					<div id="col0">
				 ';
				
			}
			
		} // END COLS 
		
		/*
		function announcements( $announcements=array(), $lang=array(), $extras=array() ) {
			
			$return_string = '';
			
			// if EXTRAS not array, make it one...
			if ( !is_array($extras) ) { $extras['end'] = $extras; }
			
			if ( count( $announcements ) ) {
				
				// tack on extras at START, if any...
				if ( isset($extras['start']) ) { $return_string .= $extras['start']; }
				
				$display_title = $this->Translations->t( 'core_announcements', $lang );
										
				// if TITLE EXTRA provided, assume it's something to PREPEND to summary title
				if ( isset($extras['title']) ) { 
					$return_string .= $extras['title'] ; 
					$return_string .= $display_title ? '<h3 class="with_extras">'.$display_title.'</h3>' : '';
					$return_string .= '<br class="clear" />';
				} else {
					$return_string .= $display_title ? '<h3>'.$display_title.'</h3>' : '';
				}
				
				$return_string .= '
					<table class="announcements">
					<tbody>
				';
					
				foreach ( $announcements as $announcement ) {
					
						// format date values a bit...
						if ( $announcement['Announcement']['date']=='0000-00-00' || $announcement['Announcement']['date']=='0000-00-00 00:00:00' || $announcement['Announcement']['date']=='' ) {
							
							// set ZERO date fields to blank
							$announcement['Announcement']['date'] = '';
							
						} else {
							
							// get PHP's month name array
							$cal_info = array();
							$cal_info['abbrevmonths'] = array('','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');
							
							// format date STRING manually, using PHP's month name array, becuase of UnixTimeStamp's 1970 - 2038 limitation
							
								$calc_date_string = explode( ' ', $announcement['Announcement']['date'] );
								// $calc_time_string = $calc_date_string[1];
								$calc_date_string = explode( '-', $calc_date_string[0] );
							
							// format month INTEGER into an abbreviated month name, lowercase, to use for translation alias
							
								$calc_date_string_month = intval($calc_date_string[1]);
								$calc_date_string_month = $cal_info['abbrevmonths'][ $calc_date_string_month ];
								$calc_date_string_month = strtolower( $calc_date_string_month );
							
							$announcement['Announcement']['date'] = $this->Translations->t( $calc_date_string_month, $lang, 1 ).'&nbsp;'.$calc_date_string[2].'&nbsp;'.$calc_date_string[0]; // date array to nice string, with month translated
							
						}
					
					$return_string .= '
						<tr>
							<td class="title">'.$this->Html->link( $announcement['Announcement']['title'], '/customize/announcements/detail/'.$announcement['Announcement']['id'] ).'</td>
							<td class="date">'.$announcement['Announcement']['date'].'</td>
						</tr>
					';
					
				}
				
				$return_string .= '
					</tbody>
					</table>
				';
				
				// tack on extras at END, if any...
				if ( isset($extras['end']) ) { $return_string .= $extras['end'] ; }
				
			}
			
			return $return_string;
			
		} // END ANNOUNCEMENTS
		*/
		
		function footer($lang) {
			
			echo '
			           </div>
					   <!-- end col2 -->
					   
					</div>
					<!-- end #views -->
					
					<br class="clear" />
					
					
					
				</div>
				<!-- end #wrapper -->
				
			<!-- start #footer -->
				<div id="footer">
					
					<p>
						<span>
							'.$this->Html->link( $this->Translations->t('core_footer_about', $lang), '/pages/about/', '', '', false ).'
							'.$this->Html->link( $this->Translations->t('core_footer_installation', $lang), '/pages/installation/', '', '', false ).'
							'.$this->Html->link( $this->Translations->t('core_footer_credits', $lang), '/pages/credits/', '', '', false ).'
						</span>
							'.$this->Translations->t('core_copyright', $lang).' &copy; '.date('Y').' '.$this->Html->link( $this->Translations->t('core_ctrnet', $lang), 'https://www.ctrnet.ca/', '', '', false ).'
					</p>
					
				</div>
				<!-- end #footer -->
			';
			
			// pr($this->view->params);
			
		} // END FOOTER 
		
	}
	
	
?>