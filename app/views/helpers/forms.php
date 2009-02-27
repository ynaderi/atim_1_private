<?php
	
class FormsHelper extends Helper {
		
	var $name = 'Forms';
	var $helpers = array( 'Html', 'Javascript', 'Ajax', 'Translations', 'othAuth', 'Pagination', 'Time', 'DatePicker' );
	
	// FUNCTION to build a form 
	function build( $type=null, $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array() ) {
		
		$display_form = ''; // string variable to save generated form.
		$form_settings = array(); // various settings for BUILDING form.
		
		// make sure variables passed in are in format we are expecting... 
			
			// if TYPE is an array
				if ( is_array($type) ) {  
					$form_settings = $type; // save array to SETTINGS
					$type = array_shift($form_settings); // set first array value to form TYPE, and level the rest as the FORM SETTINGS 
				}
				
				$type = trim(strtolower($type));
			
			// allow for better terminology
				if ( $type=='table' ) { 
					$type='index'; 
					if ( isset($links['index']) ) { 
						$links['table']=$links['index']; 
						unset($links['index']); 
					}
				}
				
				if ( $type=='datagrid' ) { 
					$type='editgrid'; 
					if ( isset($links['datagrid']) ) { 
						$links['editgrid']=$links['datagrid']; 
						unset($links['datagrid']); 
					}
				}
				
				if ( $type=='check' ) { $type='checklist'; }
				if ( $type=='radio' ) { $type='radiolist'; }
				if ( $type=='summary' ) { 
					$form_settings[]='allfields'; 
					$form_settings[]='return'; 
				}
			
			// TYPE is type of form to display: edit, add, index...
				if ( $type!='index' && $type!='detail' && $type!='checklist' && $type!='radiolist' && $type!='summary' && $type!='edit' && $type!='add' && $type!='search' && $type!='editgrid' && $type!='addgrid' && $type!='tree' && $type!='csv' ) {
					
					echo '
						<div class="error" style="margin: 1em 0;">
							<b>Forms Helper Error</b>
							
							<p><em>function build ( <b>$type</b>, $model, $form, $links, $lang, $paging, $override, $extras ) </em></p>
							
							<br />
							
							<p>Build function\'s <b>first variable</b> is expected to
							be a <b>string</b>, with a valid form <b>type</b>. This error is
							caused by the provded variable <B>being blank</b> or by <b>not being
							one of the following values:</b></p>
							
							<ul>
								<li>index</li>
								<li>detail</li>
								<li>add</li>
								<li>edit</li>
								<li>search</li>
								<li>summary</li>
								<li>checklist</li>
								<li>radiolist</li>
								<li>editgrid</li>
								<li>tree</li>
							</ul>
							
							<p>Please check your VIEW.</p>
						</div>
					';
					
					return NULL;
				
				}
			
			// MODEL is the data to use to prepopulate the form...
				if ( !is_array($model) ) {
					
					echo('
						<div class="error" style="margin: 1em 0;">
							<b>Forms Helper Error</b>
							
							<p><em>function build ( $type, <b>$model</b>, $form, $links, $lang, $paging, $override, $extras ) </em></p>
							
							<br />
							
							<p>Build function\'s <b>second variable</b> is expected to
							be a valid DATA <b>array</b>, built from your MODEL\'s datatable(s). 
							This error is caused by that variable <B>not being an array</b>. 
							Please check your VIEW and your CONTROLLER.</p>
						</div>
					');
					
					return NULL;
					
				} 
				
				// otherwise, if NO DATA/ROWS, prime empty set for parsing...
				else if ( !count($model) ) {
					$model[0] = array();
				}
			
			// FORM is the form/field/validation/lookup info, from the FORM component 
				// if ( !is_array($form) || !count($form) || !isset($form['FormFormat']) || !is_array($form['FormFormat']) || !isset($form['FormFormat'][0]['FormField']) || !is_array($form['FormFormat'][0]['FormField']) || !count($form['FormFormat'][0]['FormField']) ) {
				if ( !is_array($form) || !count($form) || !isset($form['FormFormat']) || !is_array($form['FormFormat']) ) {
					
					echo('
						<div class="error" style="margin: 1em 0;">
							<b>Forms Helper Error</b>
							
							<p><em>function build ( $type, $model, <b>$form</b>, $links, $lang, $paging, $override, $extras ) </em></p>
							
							<br />
							
							<p>Build function\'s <b>third variable</b> is expected to
							be a valid FORM <b>array</b>, built from the FORMS and FORM_FIELDS datatables. 
							This error is caused by that variable <B>not being an array</b>, by being a 
							<b>blank array</b>, or by being a <b>misformatted array</b>. Please check the
							related data in the FORMS and FORM_FIELDS datatables, as well as your VIEW 
							and your CONTROLLER.</p>
						</div>
					');
					
					return NULL;
					
				}  
				
		// Sort the data with ORDER descending, FIELD ascending 
			
			// Add $form['FormField'] as the last parameter, to sort by the common key 
				foreach ( $form['FormFormat'] as $key=>$row ) {
					$sort_order_0[$key] = $row['display_column'];
					$sort_order_1[$key] = $row['display_order'];
					$sort_order_2[$key] = $row['FormField']['model'];
				}
			
			// multisort, PHP array 
				array_multisort( $sort_order_0, SORT_ASC, $sort_order_1, SORT_ASC, $sort_order_2, SORT_ASC, $form['FormFormat'] );
			
			// LINK is array of HREFs to atrtach to form, at end or for each table row 
				if ( !is_array($links) ) { $links = array( 'details'=>$links ); } // if LINKS is not an array, make it one 
			
			// LANG array, for TRANSLATION helper 
				if ( !is_array($lang) ) { $lang = array(); } // if LANG is not an array, make it one 
			
			// PAGING array, for table views; uses separate helper
				if ( !is_array($paging) ) { $paging = array(); } // if LANG is not an array, make it one 
			
			// OVERRIDE array, model/field keys with values to override default set input/select field values 
				if ( !is_array($override) ) { $override = array(); } // if OVERRIDE is not an array, make it one 
			
			// EXTRAS array, blindly add what should be more form elements to START/END of form 
				if ( is_string($extras) ) { $extras = array( 'end'=>$extras ); } // if EXTRAS is a string, make it an ARRAy with END key as default 
				if ( !isset($extras['end']) ) { $extras['end']=''; }
				if ( !isset($extras['start']) ) { $extras['start']=''; }
			
		// START generating FORM...
			
			// title and description of form (rarely used)
				if ( $type!='summary' && $type!='csv' ) {
					$display_form .= $this->show_title_and_summary( $form, $extras, $lang );
				}
			
			// pagination, used for multi-row TABLE forms
				if ( count($paging) ) {
					$this->Pagination->setPaging( $paging );
				}
				
			// if any VALIDATION ERROR MESSAGES, display 
				
				$messages = array();
				
				if ( isset( $this->validationErrors ) && $type!='summary' && $type!='csv' ) {
				
					foreach( $this->validationErrors as $table ) {
						
						foreach($table as $field => $message) {
							// $messages[] = empty( $message ) ? $this->Translations->t( 'core_error in form input: '.$field, $lang) : $this->Translations->t( $message, $lang);
							$messages[] = trim($message) ? $this->Translations->t( $message, $lang) : '';
						}
						
					}
					
						// VAR for IMPLODE
						$implode_separator = '
								</li>
								<li>
						';
						
					$display_form .= '
						<ul class="error validation">
							<li>
							'.implode( $implode_separator, $messages ).'
							</li>
						</ul>
					';
				}
				
			$function_name = '';
			$function_name = 'build_'.$type.'_form_type';
			$display_form .= $this->$function_name( $form_settings, $model, $form, $links, $lang, $paging, $override, $extras );
			
		// generate LINKS after form, using a model ID if necessary
			if ( $type!='summary' &&  $type!='csv' &&  $type!='tree' ) {
				$get_model_for_id = array_keys($model[0]); // Find out what FIRST model in CAKEPHP data stack is...
				$get_id_for_links = isset( $get_model_for_id[0] ) && isset($model[0][ $get_model_for_id[0] ]['id']) ? $model[0][ $get_model_for_id[0] ]['id'] : ''; // Find out what the ID is for the found model...
				
				if ( $type=='index' || $type=='editgrid' ) {
					$display_form .= $this->generate_links_list( $model, $links, $lang, array( 'add', 'checklist', 'radiolist' ), array(), $get_id_for_links ) ; // Finally, use that ID to generate LINKS.
				} else if ( $type!='checklist' && $type!='radiolist' ) {
					$display_form .= $this->generate_links_list( $model, $links, $lang, array(), array( $type ), $get_id_for_links ) ; // Finally, use that ID to generate LINKS.
				}
			}
			
		// if SETTINGS require it, RETURN value, else ECHO it...
			
			$display_form = trim($display_form);
			
			if ( in_array( 'return', $form_settings ) ) {
				return $display_form;
			} else {
				echo $display_form;
			}
			
				
	} // end FUNCTION build()


/********************************************************************************************************************************************************************************/


	// FUNCTION 
	function build_summary_form_type( $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array() ) {
		
		$return_string = '';
		
		$table_index = $this->build_form_stack( 'summary', $form_settings, $model[0], $form, $links, $lang, $override, $extras );
		
		$summary_array = array();
		foreach ( $table_index as $table_column ) {
			foreach ( $table_column as $table_row ) {
				if ( isset($model[0][$table_row['model']][$table_row['field']]) ) {
					$summary_array[] = $table_row['content'];
				}
			}
		}
		
		// format with EXTRAS value 
		// cheating, using EXTRAS to pass a string to use as a divider between SUMMARY info (usually a comma) 
		$return_string = implode( $extras['end'], $summary_array );
			
		return $return_string;
		
	}


/********************************************************************************************************************************************************************************/


	// FUNCTION 
	function build_csv_form_type( $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array() ) {
		
		$return_array = array(); // to collect all CSV lines, then collapse into STRING before returning
		
		$header_row_array = array();
		$table_index = $this->build_form_stack( 'csv', $form_settings, $model, $form, $links, $lang, $override, $extras );
		
		// each column in table 
		foreach ( $table_index as $table_column ) {
			// each row in column 
			foreach ( $table_column as $table_row ) {
				if (  $table_row['type']!='hidden' ) {
					if ( $table_row['label'] ) {
						$header_row_array[] = '"'.trim(html_entity_decode(strip_tags( $table_row['label'] ))).'"';
					}
				} // end NOT HIDDEN
			} // end FOREACH
		} // end FOREACH
		
		$header_row_array = implode(CSV_SEPARATOR, $header_row_array);
		$return_array[] = trim($header_row_array);
			
			if ( count($model[0]) ) {
				
				// each column in table 
				foreach ( $model as $model_key=>$model_value ) {
					
					$data_row_array = array();
					$table_index = $this->build_form_stack( 'index', $form_settings, $model_value, $form, $links, $lang, $override, $extras );
					
					// each column in table 
					foreach ( $table_index as $table_column ) {
						// each row in column 
						foreach ( $table_column as $table_row ) {
							$data_row_array[] = '"'.trim(html_entity_decode(strip_tags( $table_row['content'] ))).'"';
						}
					}
					
					$data_row_array = implode(',', $data_row_array);
					$return_array[] = trim($data_row_array);
					
				} // end FOREACH
			
			}
			
		// implode into CSV string to return
		$return_string = implode( "\r", $return_array )."\r";
		
		return $return_string;
		
	}


/********************************************************************************************************************************************************************************/


	// FUNCTION 
	function build_tree_form_type( $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array() ) {
		
		$return_string = '';
		
		// list($modelName, $fieldName) = explode('/', $name); 
		$modelName = 'SampleMaster';
		$fieldName = 'sample_label';
		
		$return_string = $this->build_tree_form_type_element( $form_settings, $model[0], $form, $links, $lang, $paging, $override, $extras, 0 ); 
		$return_string .= '<br class="clear" />';
		return $return_string;
		
	}
	
	function build_tree_form_type_element( $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array(), $level=0, $unique_value_for_tag_ids='0' ) { 
		
		// pr($model);
		// exit;
		
		$li_count = 0;
		$return_string = '';
		
		if ( !$level ) {
			$return_string .= '
				<div class="tree_view">
			';
		}
		
		$return_string .= '
			<ul id="tree_'.$unique_value_for_tag_ids.'" class="tree_view level_'.$level.'"'.( $level ? ' style="display:none;"' : '' ).'>
		'; 
		
		foreach ( $model as $model_key=>$model_value ) { 
			
			$table_index = $this->build_form_stack( 'index', $form_settings, $model_value, $form, $links, $lang, $override, $extras );
			
			$return_string .= '
				<li'.( !($li_count%2) ? ' class="alt"' : '' ).'>
			'; 
				
				$get_model_for_id = array_keys($model[$model_key]); // Find out what FIRST model in CAKEPHP data stack is...
				$get_id_for_links = isset($model[$model_key][ $get_model_for_id[0] ]['id']) ? $model[$model_key][ $get_model_for_id[0] ]['id'] : ''; // Find out what the ID is for the found model...
				
				// reveal sub ULs if sub ULs exist
				if (isset($model_value['children'][0])) {
					$return_string .= '<a class="form list" href="#" onclick="Effect.toggle(\'tree_'.$get_id_for_links.'\',\'slide\',{duration:0.25}); return false;">+</a>';
				} else {
					$return_string .= '<a style="opacity: 0.5; filter: alpha(opacity=50);" class="form list" href="#" onclick="return false;">+</a>';
				}
				
				$return_string .= $this->generate_links_list( $model[$model_key], $links, $lang, array(), array( 'add', 'checklist', 'radiolist' ), $get_id_for_links, NULL, 1 ) ; // Finally, use that ID to generate LINKS.
				
				$array_for_return_string = array();
				
				// each column in table 
				$span_count = 0;
				foreach ( $table_index as $table_column ) {
					
					// each row in column 
					
					foreach ( $table_column as $table_row ) {
						$array_for_return_string[] = ( !$span_count ? '<strong>' : '<span>' ).$table_row['content'].( !$span_count ? '</strong>' : '</span>' );
						$span_count++;
					}
					
				}
				
				$return_string .= implode(' ', $array_for_return_string).'<br class="clear" />';
				
			if(isset($model_value['children'][0])) { 
				$return_string .= $this->build_tree_form_type_element( $form_settings, $model_value['children'], $form, $links, $lang, $paging, $override, $extras, $level+1, $get_id_for_links ); 
			}
			
			$return_string .= '
				</li>
			'; 
			
			$li_count++;
		}
		
		if ( !$level && !count($model) ) {
			$return_string .= '
				<li class="no_data_available">
					'.$this->Translations->t( 'core_no_data_available', $lang ).'
				</li>
			';
		}
		
		$return_string .= '
			</ul>
		'; 
		
		if ( !$level ) {
			$return_string .= '
				</div>
			';
		}
		
		return $return_string; 
	}


/********************************************************************************************************************************************************************************/


	// FUNCTION 
	function build_index_form_type( $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array() ) {
		
		$return_string = '';
		
		$table_index = $this->build_form_stack( 'index', $form_settings, $model, $form, $links, $lang, $override, $extras );
		
		// SPAN of ID cell(s)
			$td_id_count = 0;
			$td_id_count = count($links); 
			if ( isset( $links['add'] ) ) { $td_id_count--; }
			if ( isset( $links['checklist'] ) ) { $td_id_count--; }
			if ( isset( $links['radiolist'] ) ) { $td_id_count--; }
			if ( $td_id_count<=1 ) { $td_id_count = 1; }
		
		// SPAN of all OTHER cells
			$td_content_count = 0;
			$td_content_count = count(current($table_index)); // whatever the first item in array is, not always key "0"
		
			// start table...
			$return_string .= '
				<div class="form_helper_table index">
				
				<table class="index" cellspacing="0">
				<tbody>
			';
			
			// header row
			$return_string .= $this->display_table_header( $table_index, $td_id_count );
			
			if ( count($model[0]) ) {
			
				// each column in table 
				foreach ( $model as $model_key=>$model_value ) {
					
					$table_index = $this->build_form_stack( 'index', $form_settings, $model_value, $form, $links, $lang, $override, $extras );
					
					$return_string .= '
						<tr>
					';
					
					if ( $td_id_count ) {
						
						$return_string .= '
								<td class="id size'.$td_id_count.'">
						';
						
							$get_model_for_id = array_keys($model[$model_key]); // Find out what FIRST model in CAKEPHP data stack is...
							$get_id_for_links = isset($model[$model_key][ $get_model_for_id[0] ]['id']) ? $model[$model_key][ $get_model_for_id[0] ]['id'] : ''; // Find out what the ID is for the found model...
							$return_string .= $this->generate_links_list( $model[$model_key], $links, $lang, array(), array( 'add', 'checklist', 'radiolist' ), $get_id_for_links, NULL, 1 ) ; // Finally, use that ID to generate LINKS.
						
						$return_string .= '
								</td>
						';
					}
					
					// each column in table 
					foreach ( $table_index as $table_column ) {
						
						// each row in column 
						foreach ( $table_column as $table_row ) {
							
							$return_string .= '
								<td>
									'.$table_row['content'].'
								</td>
							';
							
						}
						
					}
					
					$return_string .= '
						</tr>
					';
					
				} // end FOREACH
				
			
				// display tabel row of TH pagination information (see helper) 
				$return_string .= $this->Pagination->renderPaginationElement( $paging, intval( $td_id_count+$td_content_count ), $lang, 1 );
			
			}
			
			// display something nice for NO ROWS msg...
			else {
				
				$return_string .= '
						<tr>
								<td class="no_data_available" colspan="'.intval( $td_id_count+$td_content_count ).'">'.$this->Translations->t( 'core_no_data_available', $lang ).'</td>
						</tr>
				';
				
			}
			
			$return_string .= '
				</tbody>
				</table>
				
				</div>
			';
			
		return $return_string;
		
	}


/********************************************************************************************************************************************************************************/


	// FUNCTION 
	function build_checklist_form_type( $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array() ) {
		
		$return_string = '';
		
		$table_index = $this->build_form_stack( 'index', $form_settings, $model[0], $form, $links, $lang, $override, $extras );
		
		// SPAN of ID cell(s)
			$td_id_count = 0;
			$td_id_count = count($links); 
			if ( isset( $links['add'] ) ) { $td_id_count--; }
			if ( isset( $links['checklist'] ) ) { $td_id_count--; }
			if ( isset( $links['radiolist'] ) ) { $td_id_count--; }
			if ( $td_id_count<=1 ) { $td_id_count = 1; }
		
		// SPAN of all OTHER cells
			$td_content_count = 0;
			$td_content_count = count( $table_index[0] );
		
			// start table...
			$return_string .= '
				<div id="form_helper_checklist" class="form_helper_table checklist">
				
				<table class="checklist" cellspacing="0">
				<tbody>
			';
			
			// header row
			$return_string .= $this->display_table_header( $table_index, $td_id_count );
			
			if ( count($model[0]) ) {
			
				// each column in table 
				foreach ( $model as $model_key=>$model_value ) {
					
					$table_index = $this->build_form_stack( 'index', $form_settings, $model_value, $form, $links, $lang, $override, $extras );
					
					$return_string .= '
						<tr>
					';
					
					if ( $td_id_count ) {
						/*
						$return_string .= '
							<td class="id size'.$td_id_count.'" colspan="'.$td_id_count.'">
						';
						*/
						
						$return_string .= '
							<td class="id size'.$td_id_count.'">
						';
						
							$get_model_for_id = array_keys($model[$model_key]); // Find out what FIRST model in CAKEPHP data stack is...
							$get_id_for_links = isset($model[$model_key][ $get_model_for_id[0] ]['id']) ? $model[$model_key][ $get_model_for_id[0] ]['id'] : ''; // Find out what the ID is for the found model...
						
								if ( isset( $links['checklist'] ) ) {
									$html_element_name = $links['checklist'];
								} else {
									$html_element_name = 'data['.$get_model_for_id[0].'][id][]';
								}
											
								// mark inputs CHECKED based on OVERRIDE data
								$display_checked='';
								if ( isset($override[$get_model_for_id[0].'/id']) ) {
									// match array
									if ( is_array($override[$get_model_for_id[0].'/id']) ) {
										if ( in_array( $get_id_for_links, $override[$get_model_for_id[0].'/id'] ) ) {
											$display_checked='checked="checked"';
										}
									} 
									
									// match string
									else if ( $override[$get_model_for_id[0].'/id'] == $get_id_for_links ) {
										$display_checked='checked="checked"';
									}
								}
								
								$return_string .= '
									<input style="float: left;" type="checkbox" class="checkbox" name="'.$html_element_name.'" value="'.$get_id_for_links.'" '.$display_checked.' />
								';
										
							$return_string .= $this->generate_links_list( $model[$model_key], $links, $lang, array(), array( 'add', 'checklist', 'radiolist' ), $get_id_for_links, NULL, 1 ) ; // Finally, use that ID to generate LINKS.
						
						$return_string .= '
							</td>
						';
					}
					
					// each column in table 
					foreach ( $table_index as $table_column ) {
						
						// each row in column 
						foreach ( $table_column as $table_row ) {
							
							$return_string .= '
								<td>
									'.$table_row['content'].'
								</td>
							';
							
						}
						
					}
					
					$return_string .= '
						</tr>
					';
					
				} // end FOREACH
				
				// display tabel row of TH pagination information (see helper) 
				// $return_string .= $this->Pagination->renderPaginationElement( $paging, intval( $td_id_count+$td_content_count ), $lang, 1 );
			
			}
			
			// display something nice for NO ROWS msg...
			else {
				
				$return_string .= '
						<tr>
								<td class="no_data_available" colspan="'.intval( $td_id_count+$td_content_count ).'">'.$this->Translations->t( 'core_no_data_available', $lang ).'</td>
						</tr>
				';
				
			}
			
			$return_string .= '
				</tbody>
				</table>
				
				</div>
			';
			
		return $return_string;
		
	}


/********************************************************************************************************************************************************************************/


	// FUNCTION 
	function build_radiolist_form_type( $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array() ) {
		
		$return_string = '';
		
		$table_index = $this->build_form_stack( 'index', $form_settings, $model[0], $form, $links, $lang, $override, $extras );
		
		// SPAN of ID cell(s)
			$td_id_count = 0;
			$td_id_count = count($links); 
			if ( isset( $links['add'] ) ) { $td_id_count--; }
			if ( isset( $links['checklist'] ) ) { $td_id_count--; }
			if ( isset( $links['radiolist'] ) ) { $td_id_count--; }
			if ( $td_id_count<=1 ) { $td_id_count = 1; }
		
		// SPAN of all OTHER cells
			$td_content_count = 0;
			$td_content_count = count( $table_index[0] );
		
			// start table...
			$return_string .= '
				<div class="form_helper_table checklist">
				
				<table class="checklist" cellspacing="0">
				<tbody>
			';
			
			// header row
			$return_string .= $this->display_table_header( $table_index, $td_id_count );
			
			if ( count($model[0]) ) {
			
				// each column in table 
				foreach ( $model as $model_key=>$model_value ) {
					
					$table_index = $this->build_form_stack( 'index', $form_settings, $model_value, $form, $links, $lang, $override, $extras );
					
					$return_string .= '
						<tr>
					';
					
					if ( $td_id_count ) {
						/*
						$return_string .= '
							<td class="id size'.$td_id_count.'" colspan="'.$td_id_count.'">
						';
						*/
						
						$return_string .= '
							<td class="id size'.$td_id_count.'">
						';
						
							$get_model_for_id = array_keys($model[$model_key]); // Find out what FIRST model in CAKEPHP data stack is...
							$get_id_for_links = isset($model[$model_key][ $get_model_for_id[0] ]['id']) ? $model[$model_key][ $get_model_for_id[0] ]['id'] : ''; // Find out what the ID is for the found model...
						
								if ( isset( $links['radiolist'] ) ) {
									$html_element_name = $links['radiolist'];
								} else {
									$html_element_name = 'data['.$get_model_for_id[0].'][id]';
								}
											
								// mark inputs CHECKED based on OVERRIDE data
								$display_checked='';
								if ( isset($override[$get_model_for_id[0].'/id']) ) {
									// match array
									if ( is_array($override[$get_model_for_id[0].'/id']) ) {
										if ( in_array( $get_id_for_links, $override[$get_model_for_id[0].'/id'] ) ) {
											$display_checked='checked="checked"';
										}
									} 
									
									// match string
									else if ( $override[$get_model_for_id[0].'/id'] == $get_id_for_links ) {
										$display_checked='checked="checked"';
									}
								}
								
									$radio_options_array = array();
									$radio_options_array[$get_id_for_links] = '';
									
									$radio_attributes_array = array();
									$radio_attributes_array['style'] = 'float: left;';
									
								
								$return_string .= $this->Html->radio( $html_element_name, $radio_options_array, NULL, $radio_attributes_array );

								
								/*
								$return_string .= '
									<input style="float: left;" type="radio" class="radio" name="'.$html_element_name.'" value="'.$get_id_for_links.'" '.$display_checked.' />
								';
								*/
								
							$return_string .= $this->generate_links_list( $model[$model_key], $links, $lang, array(), array( 'add', 'checklist', 'radiolist' ), $get_id_for_links, NULL, 1 ) ; // Finally, use that ID to generate LINKS.
						
						$return_string .= '
							</td>
						';
					}
					
					// each column in table 
					foreach ( $table_index as $table_column ) {
						
						// each row in column 
						foreach ( $table_column as $table_row ) {
							
							$return_string .= '
								<td>
									'.$table_row['content'].'
								</td>
							';
							
						}
						
					}
					
					$return_string .= '
						</tr>
					';
					
				} // end FOREACH
				
				// display tabel row of TH pagination information (see helper) 
				// $return_string .= $this->Pagination->renderPaginationElement( $paging, intval( $td_id_count+$td_content_count ), $lang, 1 );
			
			}
			
			// display something nice for NO ROWS msg...
			else {
				
				$return_string .= '
						<tr>
								<td class="no_data_available" colspan="'.intval( $td_id_count+$td_content_count ).'">'.$this->Translations->t( 'core_no_data_available', $lang ).'</td>
						</tr>
				';
				
			}
			
			$return_string .= '
				</tbody>
				</table>
				
				</div>
			';
			
		return $return_string;
		
	}


/********************************************************************************************************************************************************************************/


	// FUNCTION 
	function build_addgrid_form_type( $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array() ) {
		
		$return_string = '';
		
		$table_index = $this->build_form_stack( 'datagrid', $form_settings, $model[0], $form, $links, $lang, $override, $extras );
		
		// ACTION attribute value for FORM tag 
		$submit_form_link = isset( $links['addgrid'] ) ? $links['addgrid'] : '#';
		
		// SPAN of ID cell(s)
			$td_id_count = 0;
			$td_id_count = count($links); 
			if ( isset( $links['add'] ) ) { $td_id_count--; }
			if ( isset( $links['checklist'] ) ) { $td_id_count--; }
			if ( isset( $links['radiolist'] ) ) { $td_id_count--; }
			if ( $td_id_count<=1 ) { $td_id_count = 1; }
		
		// SPAN of all OTHER cells
			$td_content_count = 0;
			$td_content_count = count( $table_index[0] );
		
			// start table...
			$return_string .= '
				<div class="form_helper_table index">
				
				<form action="'.$this->Html->url( $submit_form_link.( isset( $this->params['pass'] ) && !empty( $this->params['pass'] ) ? $this->params['pass'][ count($this->params['pass'])-1 ] : '' ) ).'" method="post" enctype="multipart/form-data">
			
				<fieldset class="form">
							
							<table class="addgrid" cellspacing="0">
							<tbody>
			';
			
			// header row
			$return_string .= $this->display_table_header( $table_index, $td_id_count );
			
			if ( count($model[0]) ) {
			
				// I don't know why I have to go one level deeper in editgrids than I need to in Indexes, they should be the same. - Wil, Aug 21, 2007
				
				// each column in table 
				foreach ( $model[0] as $model_key=>$model_value ) {
				
					// echo '<h3>$model_key = '.$model_key.'</h3>';
					// pr($model_value);
					
					$this->params['data'] = $model_value;
					$this->params['form']['data'] = $model_value;
					
					// send each individual KEY=>VAL for models, which will be separated again at the STACK function...
					$table_index = $this->build_form_stack( 'addgrid', $form_settings, array( $model_key, $model_value), $form, $links, $lang, $override, $extras );
					
					// collect all HIDDEN fields in one stack for placement
					$stack_of_hidden_fields = '';
					
					$return_string .= '
						<tr>
					';
					
					if ( $td_id_count ) {
						/*
						$return_string .= '
							<td class="id size'.$td_id_count.'" colspan="'.$td_id_count.'">
						';
						*/
						
						$return_string .= '
							<td class="id size'.$td_id_count.'">
						';
						
							$get_model_for_id = array_keys($model[0][$model_key]); // Find out what FIRST model in CAKEPHP data stack is...
							$get_id_for_links = isset($model[0][$model_key][ $get_model_for_id[0] ]['id']) ? $model[0][$model_key][ $get_model_for_id[0] ]['id'] : ''; // Find out what the ID is for the found model...
							$return_string .= $this->generate_links_list( $model[0][$model_key], $links, $lang, array(), array( 'add', 'checklist', 'radiolist', 'addgrid' ), $get_id_for_links, NULL, 1 ) ; // Finally, use that ID to generate LINKS.
						
						$return_string .= '
							</td>
						';
					}
					
					// each column in table 
					foreach ( $table_index as $table_column ) {
						
						// each row in column 
						foreach ( $table_column as $table_row ) {
							
							if ( $table_row['type']!='hidden' ) {
								$return_string .= '
									<td nowrap="nowrap">
										'.$table_row['input'].'
									</td>
								';
							} else {
								$stack_of_hidden_fields .= $table_row['input'];
							}
							
						}
						
					}
					
					$return_string .= '
						</tr>
					';
					
					// attach HIDDEN fields to row...
					$return_string .= $stack_of_hidden_fields;
					
						$model_names_for_hidden_fields = array_keys($model[0][$model_key]); // Find out what FIRST model in CAKEPHP data stack is...
						foreach ( $model_names_for_hidden_fields as $name_value ) {
						
							$html_element_array = array();
							$html_element_array['class'] = null;
							
							if ( isset($html_element_array['value']) ) {
								unset($html_element_array['value']);
							}
								
							// IDvalues for multi-edits, or blanks/zeros for multi-adds
							$html_element_array['class'] = 'hidden';
								if ( isset( $override[ $model_key.']['.$name_value.'/id'] ) ) { $html_element_array['value'] = $override[ $model_key.']['.$name_value.'/id']; } 
								else if  ( isset( $model_value[$name_value]['id'] ) ) { $html_element_array['value'] = $model_value[$name_value]['id']; }
								else { $html_element_array['value'] = '0'; }
							$return_string .= $this->Html->hidden( $model_key.']['.$name_value.'/id', $html_element_array )."\n" ; 
							
							$html_element_array['class'] = 'hidden';
							$html_element_array['value'] = $this->othAuth->user('id');
							if ( isset( $override[ $model_key.']['.$name_value.'/modified_by'] ) ) { $html_element_array['value'] = $override[ $model_key.']['.$name_value.'/modified_by']; }
							$return_string .= $this->Html->hidden( $model_key.']['.$name_value.'/modified_by', $html_element_array )."\n" ; 
							
											
						}
					
				} // end FOREACH
				
				// display tabel row of TH pagination information (see helper) 
				// $return_string .= $this->Pagination->renderPaginationElement( $paging, intval( $td_id_count+$td_content_count ), $lang, 1 );
			
			}
			
			// display something nice for NO ROWS msg...
			else {
				
				$return_string .= '
						<tr>
						<td class="no_data_available" colspan="'.intval( $td_id_count+$td_content_count ).'">'.$this->Translations->t( 'core_no_data_available', $lang ).'</td>
						</tr>
				';
				
			}
			
			$return_string .= '
							</tbody>
							</table>
							
				</fieldset>
				
				<fieldset class="button">
					'.$this->Html->submit( 'Submit', array( 'class'=>'submit', 'tabindex'=>'32760' ) ).'
				</fieldset>
				
				</form>
				
				</div>
			';
			
		return $return_string;
		
	}


/********************************************************************************************************************************************************************************/


	// FUNCTION 
	function build_editgrid_form_type( $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array() ) {
		
		$return_string = '';
		
		$table_index = $this->build_form_stack( 'datagrid', $form_settings, $model[0], $form, $links, $lang, $override, $extras );
		
		// ACTION attribute value for FORM tag 
		$submit_form_link = isset( $links['editgrid'] ) ? $links['editgrid'] : '#';
		
		// SPAN of ID cell(s)
			$td_id_count = 0;
			$td_id_count = count($links); 
			if ( isset( $links['add'] ) ) { $td_id_count--; }
			if ( isset( $links['checklist'] ) ) { $td_id_count--; }
			if ( isset( $links['radiolist'] ) ) { $td_id_count--; }
			if ( $td_id_count<=1 ) { $td_id_count = 1; }
		
		// SPAN of all OTHER cells
			$td_content_count = 0;
			$td_content_count = count( $table_index[0] );
		
			// start table...
			$return_string .= '
				<div class="form_helper_table index">
				
				<form action="'.$this->Html->url( $submit_form_link.( isset( $this->params['pass'] ) && !empty( $this->params['pass'] ) ? $this->params['pass'][ count($this->params['pass'])-1 ] : '' ) ).'" method="post" enctype="multipart/form-data">
				
				<fieldset class="form">
							
							<table class="editgrid" cellspacing="0">
							<tbody>
			';
			
			// header row
			$return_string .= $this->display_table_header( $table_index, $td_id_count );
			
			if ( count($model[0]) ) {
			
				// I don't know why I have to go one level deeper in editgrids than I need to in Indexes, they should be the same. - Wil, Aug 21, 2007
				
				// each column in table 
				foreach ( $model[0] as $model_key=>$model_value ) {
				
					// echo '<h3>$model_key = '.$model_key.'</h3>';
					// pr($model_value);
					
					$this->params['data'] = $model_value;
					$this->params['form']['data'] = $model_value;
					
					// send each individual KEY=>VAL for models, which will be separated again at the STACK function...
					$table_index = $this->build_form_stack( 'editgrid', $form_settings, array( $model_key, $model_value), $form, $links, $lang, $override, $extras );
					
					// collect all HIDDEN fields in one stack for placement
					$stack_of_hidden_fields = '';
					
					$return_string .= '
						<tr>
					';
					
					if ( $td_id_count ) {
						/*
						$return_string .= '
							<td class="id size'.$td_id_count.'" colspan="'.$td_id_count.'">
						';
						*/
						
						$return_string .= '
							<td class="id size'.$td_id_count.'">
						';
						
							$get_model_for_id = array_keys($model[0][$model_key]); // Find out what FIRST model in CAKEPHP data stack is...
							$get_id_for_links = isset($model[0][$model_key][ $get_model_for_id[0] ]['id']) ? $model[0][$model_key][ $get_model_for_id[0] ]['id'] : ''; // Find out what the ID is for the found model...
							$return_string .= $this->generate_links_list( $model[0][$model_key], $links, $lang, array(), array( 'add', 'checklist', 'radiolist', 'editgrid' ), $get_id_for_links, NULL, 1 ) ; // Finally, use that ID to generate LINKS.
						
						$return_string .= '
							</td>
						';
					}
					
					// each column in table 
					foreach ( $table_index as $table_column ) {
						
						// each row in column 
						foreach ( $table_column as $table_row ) {
							
							if ( $table_row['type']!='hidden' ) {
								$return_string .= '
									<td nowrap="nowrap">
										'.$table_row['input'].'
									</td>
								';
							} else {
								$stack_of_hidden_fields .= $table_row['input'];
							}
							
						}
						
					}
					
					$return_string .= '
						</tr>
					';
					
					// attach HIDDEN fields to row...
					$return_string .= $stack_of_hidden_fields;
					
					///*
						$model_names_for_hidden_fields = array_keys($model[0][$model_key]); // Find out what FIRST model in CAKEPHP data stack is...
						foreach ( $model_names_for_hidden_fields as $name_value ) {
						
							$html_element_array = array();
							$html_element_array['class'] = null;
							
							if ( isset($html_element_array['value']) ) {
								unset($html_element_array['value']);
							}
								
							// IDvalues for multi-edits, or blanks/zeros for multi-adds
							$html_element_array['class'] = 'hidden';
								if ( isset( $override[ $model_key.']['.$name_value.'/id'] ) ) { $html_element_array['value'] = $override[ $model_key.']['.$name_value.'/id']; } 
								else if  ( isset( $model_value[$name_value]['id'] ) ) { $html_element_array['value'] = $model_value[$name_value]['id']; }
								else { $html_element_array['value'] = '0'; }
							$return_string .= $this->Html->hidden( $model_key.']['.$name_value.'/id', $html_element_array )."\n" ; 
							
							$html_element_array['class'] = 'hidden';
							$html_element_array['value'] = $this->othAuth->user('id');
							if ( isset( $override[ $model_key.']['.$name_value.'/modified_by'] ) ) { $html_element_array['value'] = $override[ $model_key.']['.$name_value.'/modified_by']; }
							$return_string .= $this->Html->hidden( $model_key.']['.$name_value.'/modified_by', $html_element_array )."\n" ; 
							
											
						}
					//*/
					
				} // end FOREACH
				
				// display tabel row of TH pagination information (see helper) 
				// $return_string .= $this->Pagination->renderPaginationElement( $paging, intval( $td_id_count+$td_content_count ), $lang, 1 );
			
			}
			
			// display something nice for NO ROWS msg...
			else {
				
				$return_string .= '
						<tr>
						<td class="no_data_available" colspan="'.intval( $td_id_count+$td_content_count ).'">'.$this->Translations->t( 'core_no_data_available', $lang ).'</td>
						</tr>
				';
				
			}
			
			$return_string .= '
							</tbody>
							</table>
							
				</fieldset>
				
				<fieldset class="button">
					'.$this->Html->submit( 'Submit', array( 'class'=>'submit', 'tabindex'=>'32760' ) ).'
				</fieldset>
				
				</form>
				
				</div>
			';
			
		return $return_string;
		
	}


/********************************************************************************************************************************************************************************/


	// FUNCTION 
	function build_detail_form_type( $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array() ) {
		
		$return_string = '';
			
		$table_index = $this->build_form_stack( 'detail', $form_settings, $model[0], $form, $links, $lang, $override, $extras );				
		
			// display table...
			$return_string .= '
				<table class="columns" cellspacing="0">
				<tbody>
					
					<tr>
						<th colspan="'.count($table_index).'">&nbsp;</th>
					</tr>
				
					<tr>
			';
				
				// tack on EXTRAS end, if any
				$return_string .= $this->display_extras( 'edit', $extras, 'start', count($table_index) );
				
				// each column in table 
				$count_columns = 0;
				foreach ( $table_index as $table_column_key=>$table_column ) {
					
					$count_columns++;
					
					$return_string .= '
						<td class="this_column_'.$count_columns.' total_columns_'.count($table_index).'"> 
						
							<table class="detail" cellspacing="0">
							<tbody>
					';
					
					// each row in column 
					$table_row_count = 0;
					foreach ( $table_column as $table_row_key=>$table_row ) {
						
						// display heading row, if any...
						if ( $table_row['heading'] ) {
							$return_string .= '
								<tr>
									<td class="heading no_border" colspan="'.( $this->othAuth->user('help_visible')=='yes' ? '3' : '2' ).'">
										<h4>'.$table_row['heading'].'</h4>
									</td>
								</tr>
							';
						}
						
						$return_string .= '
								<tr>
									<td class="label'.( !$table_row_count && !$table_row['heading'] ? ' no_border' : '' ).'">
										'.$table_row['label'].'
									</td>
									<td class="content'.( $table_row['empty'] ? ' empty' : '' ).( !$table_row_count && !$table_row['heading'] ? ' no_border' : '' ).'">
										'.$table_row['content'].'
									</td>
						';
						
						if 	( $this->othAuth->user('help_visible')=='yes' ) {
							$return_string .= '
									<td class="help'.( !$table_row_count && !$table_row['heading'] ? ' no_border' : '' ).'">
										'.$table_row['help'].'
									</td>
							';
						}
						
						$return_string .= '
								</tr>
						';
						
						
						$table_row_count++;
						
					} // end ROW 
					
					$return_string .= '
							</tbody>
							</table>
							
						</td>
					';
					
				} // end COLUMN 
				
				// tack on EXTRAS end, if any
				$return_string .= $this->display_extras( 'edit', $extras, 'end', count($table_index) );
				
			$return_string .= '
					</tr>
					
					<tr>
						<th colspan="'.count($table_index).'">&nbsp;</th>
					</tr>
					
				</tbody>
				</table>
			';
			
		return $return_string;
		
	}


/********************************************************************************************************************************************************************************/


	// FUNCTION 
	function build_search_form_type( $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array() ) {
		
		$return_string = '';
		
		$table_index = $this->build_form_stack( 'search', $form_settings, $model[0], $form, $links, $lang, $override, $extras );				
		
		// ACTION attribute value for FORM tag 
		$submit_form_link = isset( $links['search'] ) ? $links['search'] : '#';
		
		// replace %%MODEL.FIELDNAME%% 
		$submit_form_link = $this->str_replace_link( $submit_form_link, $model );
		
		$return_string .= '
			<form action="'.$this->Html->url( $submit_form_link.( isset( $this->params['pass'] ) && !empty( $this->params['pass'] ) ? $this->params['pass'][ count($this->params['pass'])-1 ] : '' ) ).'" method="post" enctype="multipart/form-data">
			
			<fieldset class="form">
			
				<table class="columns" cellspacing="0">
				<tbody>
					
					<tr>
						<th colspan="'.count($table_index).'">&nbsp;</th>
					</tr>
				
					<tr>
		';
		
		// tack on EXTRAS end, if any
		$return_string .= $this->display_extras( 'search', $extras, 'start', count($table_index) );
		
		// each column in table 
		$count_columns = 0;
		foreach ( $table_index as $table_column_key=>$table_column ) {
			
			$count_columns++;
			
			$return_string .= '
					<td class="this_column_'.$table_column_key.' total_columns_'.count($table_index).'">
					
						<table class="search" cellspacing="0">
						<tbody>
			';
			
			// each row in column 
			$table_row_count = 0;
			foreach ( $table_column as $table_row_key=>$table_row ) {
				
				$return_string .= '
							<tr>
								<td class="label'.( !$table_row_count && !$table_row['heading'] ? ' no_border' : '' ).'">
									'.$table_row['label'].'
								</td>
								<td class="content'.( $table_row['empty'] ? ' empty' : '' ).( !$table_row_count && !$table_row['heading'] ? ' no_border' : '' ).'">
									'.$table_row['input'].'
								</td>
				';
				
				if 	( $this->othAuth->user('help_visible')=='yes' ) {
					$return_string .= '
								<td class="help'.( !$table_row_count && !$table_row['heading'] ? ' no_border' : '' ).'">
									'.$table_row['help'].'
								</td>
					';
				}
				
				$return_string .= '
							</tr>
				';
				
				$table_row_count++;
				
			} // end ROW 
			
			$return_string .= '
						</tbody>
						</table>
						
					</td>
			';
			
		} // end COLUMN 
		
		// tack on EXTRAS end, if any
		$return_string .= $this->display_extras( 'search', $extras, 'end', count($table_index) );
		
		$return_string .= '
					</tr>
					
					<tr>
						<td class="button" colspan="'.count($table_index).'">
							'.$this->Html->submit( 'Submit', array( 'class'=>'submit', 'tabindex'=>'32760' ) ).'
						</td>
					</tr>
					
					<tr>
						<th colspan="'.count($table_index).'">&nbsp;</th>
					</tr>
					
				</tbody>
				</table>
			
			</fieldset>
			
			</form>
		';
		
		
		return $return_string;
		
	}


/********************************************************************************************************************************************************************************/


	// FUNCTION 
	function build_add_form_type( $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array() ) {
		
		$return_string = '';
		
		$table_index = $this->build_form_stack( 'add', $form_settings, $model[0], $form, $links, $lang, $override, $extras );				
		
		// ACTION attribute value for FORM tag 
		$submit_form_link = isset( $links['add'] ) ? $links['add'] : '#';
		
		// replace %%MODEL.FIELDNAME%% 
		$submit_form_link = $this->str_replace_link( $submit_form_link, $model );
		
		$return_string .= '
			<form action="'.$this->Html->url( $submit_form_link.( isset( $this->params['pass'] ) && !empty( $this->params['pass'] ) ? $this->params['pass'][ count($this->params['pass'])-1 ] : '' ) ).'" method="post" enctype="multipart/form-data">
		
			<fieldset class="form">
			
				<table class="columns" cellspacing="0">
				<tbody>
					
					<tr>
						<th colspan="'.count($table_index).'">&nbsp;</th>
					</tr>
					
		';
		
		// tack on EXTRAS end, if any
		$return_string .= $this->display_extras( 'add', $extras, 'start', count($table_index) );
		
		$return_string .= '
					<tr>
		';
		
		// each column in table 
		$count_columns = 0;
		foreach ( $table_index as $table_column_key=>$table_column ) {
			
			$count_columns++;
			
			$return_string .= '
					<td class="this_column_'.$table_column_key.' total_columns_'.count($table_index).'">
					
						<table class="add" cellspacing="0">
						<tbody>
			';
			
			// each row in column 
			$table_row_count = 0;
			foreach ( $table_column as $table_row_key=>$table_row ) {
				
				// display heading row, if any...
				if ( $table_row['heading'] ) {
					$return_string .= '
							<tr>
								<td class="heading no_border" colspan="'.( $this->othAuth->user('help_visible')=='yes' ? '3' : '2' ).'">
									<h4>'.$table_row['heading'].'</h4>
								</td>
							</tr>
					';
				}
				
				$return_string .= '
							<tr>
								<td class="label'.( !$table_row_count && !$table_row['heading'] ? ' no_border' : '' ).'">
									'.$table_row['label'].'
								</td>
								<td class="content'.( $table_row['empty'] ? ' empty' : '' ).( !$table_row_count && !$table_row['heading'] ? ' no_border' : '' ).'">
									'.$table_row['input'].'
								</td>
				';
				
				if 	( $this->othAuth->user('help_visible')=='yes' ) {
					$return_string .= '
								<td class="help'.( !$table_row_count && !$table_row['heading'] ? ' no_border' : '' ).'">
									'.$table_row['help'].'
								</td>
					';
				}
				
				$return_string .= '
							</tr>
				';
				
				$table_row_count++;
				
			} // end ROW 
			
			$return_string .= '
						</tbody>
						</table>
						
					</td>
			';
			
		} // end COLUMN 
		
		$return_string .= '
				</tr>
		';
		
		// tack on EXTRAS end, if any
		$return_string .= $this->display_extras( 'add', $extras, 'end', count($table_index) );
		
		$return_string .= '
				
					<tr>
						<td class="button" colspan="'.count($table_index).'">
							'.$this->Html->submit( 'Submit', array( 'class'=>'submit', 'tabindex'=>'32760' ) ).'
						</td>
					</tr>
					
					<tr>
						<th colspan="'.count($table_index).'">&nbsp;</th>
					</tr>
					
				</tbody>
				</table>
			
			</fieldset>
			
			<fieldset class="hidden">
		';
			
			// get all MODEL names in this FORM
			
			$model_names_for_auditing = array();
			foreach ( $form['FormFormat'] as $fkey=>$fval ) {
				if ( !in_array( $fval['FormField']['model'], $model_names_for_auditing ) ) {
					$model_names_for_auditing[] = $fval['FormField']['model'];
				}
			}
			
			// add data for RECORD's AUDITING data
			
			$html_element_array = array();
			$html_element_array['class'] = 'hidden';
			$html_element_array['value'] = $this->othAuth->user('id');
			
			foreach ( $model_names_for_auditing as $name_value ) {
				$return_string .= $this->Html->hidden( $name_value.'/created_by', $html_element_array )."\n" ; 
				$return_string .= $this->Html->hidden( $name_value.'/modified_by', $html_element_array )."\n" ; 
			}
			
			$html_element_array = array();
			$html_element_array['class'] = 'hidden';
			$html_element_array['value'] = date('Y-m-d H:i:s');
			
			foreach ( $model_names_for_auditing as $name_value ) {
				$return_string .= $this->Html->hidden( $name_value.'/created', $html_element_array )."\n" ; 
				$return_string .= $this->Html->hidden( $name_value.'/modified', $html_element_array )."\n" ; 
			}
			
				
		$return_string .= '
		
			</fieldset>
			
			</form>
		';
		
		
		return $return_string;
		
	}


/********************************************************************************************************************************************************************************/


	// FUNCTION 
	function build_edit_form_type( $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $paging=array(), $override=array(), $extras=array() ) {
		
		$return_string = '';
		
		$table_index = $this->build_form_stack( 'edit', $form_settings, $model[0], $form, $links, $lang, $override, $extras );				
		
		// ACTION attribute value for FORM tag 
		$submit_form_link = isset( $links['edit'] ) ? $links['edit'] : '#';
		
		// replace %%MODEL.FIELDNAME%% 
		$submit_form_link = $this->str_replace_link( $submit_form_link, $model );
		
		$return_string .= '
			<form action="'.$this->Html->url( $submit_form_link.( isset( $this->params['pass'] ) && !empty( $this->params['pass'] ) ? $this->params['pass'][ count($this->params['pass'])-1 ] : '' ) ).'" method="post" enctype="multipart/form-data">
			
			<fieldset class="form">
			
				<table class="columns" cellspacing="0">
				<tbody>
					
					<tr>
						<th colspan="'.count($table_index).'">&nbsp;</th>
					</tr>
					
		';
		
		// tack on EXTRAS end, if any
		$return_string .= $this->display_extras( 'edit', $extras, 'start', count($table_index) );
		
		$return_string .= '
				<tr>
		';
		
		// each column in table 
		$count_columns = 0;
		foreach ( $table_index as $table_column_key=>$table_column ) {
			
			$count_columns++;
			
			$return_string .= '
					<td class="this_column_'.$table_column_key.' total_columns_'.count($table_index).'">
					
						<table class="edit" cellspacing="0">
						<tbody>
			';
			
			// each row in column 
			$table_row_count = 0;
			foreach ( $table_column as $table_row_key=>$table_row ) {
				
				// display heading row, if any...
				if ( $table_row['heading'] ) {
					$return_string .= '
							<tr>
								<td class="heading no_border" colspan="'.( $this->othAuth->user('help_visible')=='yes' ? '3' : '2' ).'">
									<h4>'.$table_row['heading'].'</h4>
								</td>
							</tr>
					';
				}
				
				$return_string .= '
							<tr>
								<td class="label'.( !$table_row_count && !$table_row['heading'] ? ' no_border' : '' ).'">
									'.$table_row['label'].'
								</td>
								<td class="content'.( $table_row['empty'] ? ' empty' : '' ).( !$table_row_count && !$table_row['heading'] ? ' no_border' : '' ).'">
									'.$table_row['input'].'
								</td>
				';
				
				if 	( $this->othAuth->user('help_visible')=='yes' ) {
					$return_string .= '
								<td class="help'.( !$table_row_count && !$table_row['heading'] ? ' no_border' : '' ).'">
									'.$table_row['help'].'
								</td>
					';
				}
				
				$return_string .= '
							</tr>
				';
				
				$table_row_count++;
				
			} // end ROW 
			
			$return_string .= '
						</tbody>
						</table>
						
					</td>
			';
			
		} // end COLUMN 
		
		$return_string .= '
					</tr>
		';
		
		// tack on EXTRAS end, if any
		$return_string .= $this->display_extras( 'edit', $extras, 'end', count($table_index) );
		
		$return_string .= '
				
					<tr>
						<td class="button" colspan="'.count($table_index).'">
							'.$this->Html->submit( 'Submit', array( 'class'=>'submit', 'tabindex'=>'32760' ) ).'
						</td>
					</tr>
					
					<tr>
						<th colspan="'.count($table_index).'">&nbsp;</th>
					</tr>
					
				</tbody>
				</table>
			
			</fieldset>
			
			<fieldset class="hidden">
		';
		
			// get all MODEL names in this FORM
			
			$model_names_for_auditing = array();
			foreach ( $form['FormFormat'] as $fkey=>$fval ) {
				if ( !in_array( $fval['FormField']['model'], $model_names_for_auditing ) ) {
					$model_names_for_auditing[] = $fval['FormField']['model'];
				}
			}
			
			// add data for RECORD's AUDITING data
			
			$html_element_array = array();
			$html_element_array['class'] = 'hidden';
			$html_element_array['value'] = $this->othAuth->user('id');
			
			foreach ( $model_names_for_auditing as $name_value ) {
				// $return_string .= $this->Html->hidden( $name_value.'/created_by', $html_element_array )."\n" ; 
				$return_string .= $this->Html->hidden( $name_value.'/modified_by', $html_element_array )."\n" ; 
			}
			
			$html_element_array = array();
			$html_element_array['class'] = 'hidden';
			$html_element_array['value'] = date('Y-m-d H:i:s');
			
			foreach ( $model_names_for_auditing as $name_value ) {
				// $return_string .= $this->Html->hidden( $name_value.'/created', $html_element_array )."\n" ; 
				$return_string .= $this->Html->hidden( $name_value.'/modified', $html_element_array )."\n" ; 
			}
			
			// get all MODEL names and ID VALUES in the DATA
			$model_names_and_id_values_for_saving = array();
			foreach ( $model[0] as $fkey=>$fval ) {
				if ( isset($fval['id']) ) {
					if ( $fval['id'] ) {
						$model_names_and_id_values_for_saving[ $fkey ] = '';
						$model_names_and_id_values_for_saving[ $fkey ] = $fval['id'];
					}
				}
			}
			
			// add data for RECORD's SAVING, ID values
			
			$html_element_array = array();
			$html_element_array['class'] = 'hidden';
			
			foreach ( $model_names_and_id_values_for_saving as $name_of_model=>$id_value_to_save ) {
				$html_element_array['value'] = $id_value_to_save;
				$return_string .= $this->Html->hidden( $name_of_model.'/id', $html_element_array )."\n" ; 
			}
			
				
		$return_string .= '
		
			</fieldset>
			
			</form>
		';
		
		
		return $return_string;
		
	}


/********************************************************************************************************************************************************************************/

	
	// FUNCTION 
	function display_table_header( $table_index=array(), $id_cell_span=0 ) {
		
		$return_string = '';
		
		// start header row...
		$return_string .= '
				<tr>
		';
		
		if ( $id_cell_span ) {
			/*
			$return_string .= '
					<th class="id" colspan="'.$id_cell_span.'">&nbsp;</th>
			';
			*/
			
			$return_string .= '
					<th class="id">&nbsp;</th>
			';
		}
		
		// each column in table 
		foreach ( $table_index as $table_column ) {
			
			// each row in column 
			foreach ( $table_column as $table_row ) {
			
				if (  $table_row['type']!='hidden' ) {
					
					$return_string .= '
						<th class="header '.$table_row['field'].'">
							<strong>
					';
					
					// label and help/info marker, if available...
					if ( $table_row['label'] ) {
						
						if ( $this->othAuth->user('help_visible')=='yes' ) {
							$return_string .= $table_row['help'];
						}
						
						$sorting_link = $_SERVER['REQUEST_URI'];
						$sorting_link = explode('?', $sorting_link);
						$sorting_link = $sorting_link[0];
						
							$default_sorting_direction = isset($_REQUEST['direction']) ? $_REQUEST['direction'] : 'asc';
							$default_sorting_direction = strtolower($default_sorting_direction);
						
						$sorting_link .= '?sortBy='.$table_row['field'];
						$sorting_link .= '&amp;direction='.( $default_sorting_direction=='asc' ? 'desc' : 'asc' );
						$sorting_link .= isset($_REQUEST['page']) ? '&amp;page='.$_REQUEST['page'] : '';
						
						// $return_string .= '<a href="'.$sorting_link.'">';
						$return_string .= $table_row['label'];
						// $return_string .= '</a>';
						
					}
					
					
					$return_string .= '
							</strong>
						</th>
					';
					
				} // end NOT HIDDEN
				
			} // end FOREACH
			
		} // end FOREACH
		
		// end header row...
		$return_string .= '
				</tr>
		';
		
		return $return_string;
		
	}



/********************************************************************************************************************************************************************************/

	
	// FUNCTION 
	function display_extras( $type='', $extras=array(), $key='end', $colspan=1 ) {
		
		$return_string = '';
		
		if ( $extras[ $key ] ) {
			
			$return_string .= '
				<tr>
						<td'.( $colspan>1 ? ' colspan="'.$colspan.'"' : '' ).'>
					
						<table class="'.$type.'" cellspacing="0">
						<tbody>
							
							'.$extras[ $key ].'
							
						</tbody>
						</table>
						
					</td>
				</tr>
			';
			
		}
		
		return $return_string;
		
	}
	

/********************************************************************************************************************************************************************************/


	// FUNCTION 
	function build_form_stack( $type='', $form_settings=array(), $model=array(), $form=array(), $links=array(), $lang=array(), $override=array(), $extras=array() ) {
		
		/*
		echo '<h1>'.$type.'</h1>';
		pr($model);
		// exit();
		*/
		
		// for hidden fields, at end of form...
		$model_names_for_hidden_fields = array();
		
		// table array for field display
		$table_index = array();
		
		// intialize variables...
		$row_count = 0;
		$field_count = 1;
		
		$model_key = 0;
		$model_suffix = '';
		
		if ( $type=='addgrid' || $type=='editgrid' ) {
			$model_key = $model[0]; 
			$model = $model[1];
			$model_suffix = $model_key.'][';
		}
		
		foreach ( $form['FormFormat'] as $field ) {
			
			// $field = $field['FormField'];
			if ( !isset($form['Form']['flag_'.$type.'_columns']) ) {
				$form['Form']['flag_'.$type.'_columns'] = 0;
			}
			
			if ( $type=='addgrid' || $type=='editgrid' || $type=='datagrid' ) {
				if ( !isset($field['flag_datagrid_readonly']) ) {
					$field['flag_'.$type.'_readonly'] = 0;
				} else {
					$field['flag_'.$type.'_readonly'] = $field['flag_datagrid_readonly'];
				}
			} 			
			if ( !isset($field['flag_'.$type.'_readonly']) ) {
				$field['flag_'.$type.'_readonly'] = 0;
			}
			
			// support OLD Forms/Formats/Fields datatables that do not have all the FLAG fields
			
				if ( $type=='addgrid' || $type=='editgrid' || $type=='datagrid' ) {
					if ( !isset($field['flag_'.$type]) ) {
						
						// Older FORM_FIELDS datatable do not have editgrid flags, so use other FLAGS instead - Wil, Aug 21, 2007 
						$use_field = 'index';
						if ( isset($field['flag_datagrid']) ) {
							$use_field = 'datagrid';
						}
						
						$field['flag_'.$type] = $field['flag_'.$use_field];
					}
				}
				
				if ( $type=='csv' ) {
					if ( !isset($field['flag_'.$type]) ) {
						
						// Older FORM_FIELDS datatable do not have editgrid flags, so use other FLAGS instead - Wil, Aug 21, 2007 
						$use_field = 'index';
						
						/*
						if ( isset($field['flag_datagrid']) ) {
							$use_field = 'datagrid';
						}
						*/
						
						$field['flag_'.$type] = $field['flag_'.$use_field];
					}
				}

		
			// unless TYPE is DETAIL, force single column in FORM table layouts
			// once FORM->FIELD table and lookup is overhauled, this will be disabled, and left to the developers to set
			if ( !$form['Form']['flag_'.$type.'_columns'] ) {
				$field['display_column'] = 0;
			}
			
			// if table column doesn't already exist, create it 
			if ( !isset( $table_index[ $field['display_column'] ] ) ) {
				$table_index[ $field['display_column'] ] = array();
			}
			
			/*
			// if MODEL in form MODEL, use FLAG, else use FOREIGN FLAG 
			$foreign = '';
			if ( !in_array( $field['model'], $form['Form']['model'] ) ) {
				$foreign = 'foreign_';
			}
			*/
			
			// display only if flagged for this type of form in the FORMS datatable...
			if ( in_array( 'allfields', $form_settings ) || $field[ 'flag_'.$type ] ) {
			
				// label and help/info marker, if available...
				if ( ( ($field['flag_override_label'] && $field['language_label']) || ($field['FormField']['language_label']) ) || ( $field['flag_override_type']=='hidden' || $field['FormField']['type']=='hidden' ) ) {
					
					// increment row_count, next row of information
					$row_count++;
					$table_index[ $field['display_column'] ][ $row_count ] = array();
					
					// intialize variables...
					$table_index[ $field['display_column'] ][ $row_count ]['id'] = '';
					$table_index[ $field['display_column'] ][ $row_count ]['model'] = '';
					$table_index[ $field['display_column'] ][ $row_count ]['field'] = '';
					$table_index[ $field['display_column'] ][ $row_count ]['empty'] = 0;
					
					$table_index[ $field['display_column'] ][ $row_count ]['type'] = '';
					$table_index[ $field['display_column'] ][ $row_count ]['heading'] = '';
					$table_index[ $field['display_column'] ][ $row_count ]['label'] = '';
					$table_index[ $field['display_column'] ][ $row_count ]['content'] = '';
					$table_index[ $field['display_column'] ][ $row_count ]['input'] = '';
					$table_index[ $field['display_column'] ][ $row_count ]['help'] = '';
					
					// place BASIC form info into stack
					$table_index[ $field['display_column'] ][ $row_count ]['model'] = $field['FormField']['model'];
					$table_index[ $field['display_column'] ][ $row_count ]['field'] = $field['FormField']['field'];
					$table_index[ $field['display_column'] ][ $row_count ]['type'] = $field['FormField']['type'];
					
					// place translated HEADING in label column of new row 
					if ( isset($field['language_heading']) && $field['language_heading'] ) {
						$table_index[ $field['display_column'] ][ $row_count ]['heading'] = $this->Translations->t( $field['language_heading'], $lang );
					}
					
					// place translated LABEL in label column of new row 
					// use FIELD's LABEL, or use FORMAT's LABEL if override FLAG is set
					if ( isset($field['flag_override_label']) && $field['flag_override_label'] ) {
						if ( isset($field['language_label']) && $field['language_label'] ) {
							$table_index[ $field['display_column'] ][ $row_count ]['label'] = $this->Translations->t( $field['language_label'], $lang );
						}
					} else if ( isset($field['FormField']['language_label']) && $field['FormField']['language_label'] ) {
						$table_index[ $field['display_column'] ][ $row_count ]['label'] = $this->Translations->t( $field['FormField']['language_label'], $lang );
					}
					
					// add CHECK/UNCHECK links to appropriate FORM/FIELD types
					if ( ($type=='add' || $type=='edit' || $type=='search') && ($field['FormField']['type']=='checklist') ) {
						$table_index[ $field['display_column'] ][ $row_count ]['label'] .= '
							<a href="#" onclick="checkAll(\'form_helper_checklist\'); return false;">'.$this->Translations->t( 'core_check', $lang ).'</a>/<a href="#" onclick="uncheckAll(\'form_helper_checklist\'); return false;">'.$this->Translations->t( 'core_uncheck', $lang ).'</a>
						';
					}
				}
				
				// display TAG, sub label 
					$display_tag = '';
					// use FIELD's TAG, or use FORMAT's TAG if override FLAG is set
					if ( isset($field['flag_override_tag']) && $field['flag_override_tag'] ) {
						if ( isset($field['language_tag']) && $field['language_tag'] ) {
							$display_tag = '<span class="tag">'.$this->Translations->t( $field['language_tag'], $lang ).'</span> ';
						}
					} else if ( $field['FormField']['language_tag'] ) {
						$display_tag = '<span class="tag">'.$this->Translations->t( $field['FormField']['language_tag'], $lang ).'</span> ';
					}
					
				// LABEL and HELP marker, if available...
					if ( ($field['flag_override_label'] && $field['language_label']) || ($field['FormField']['language_label']) ) {
						
						// link classes, for jTip AJAX...
						$html_link_attributes = array(
							'class'=>'jTip',
							'id'=>'jTip_'.$field['FormField']['field'],
							'name'=>$this->Translations->t( $field['FormField']['language_label'], $lang, false )
						);
						
						// include jTip link or no-help type indicator
						if ( (!$field['flag_override_help'] && $field['FormField']['language_help']) || ($field['flag_override_help'] && $field['language_help']) ) {
							$table_index[ $field['display_column'] ][ $row_count ]['help'] = $this->Html->link( '?', '/forms/displayhelp/'.$field['id'].'?width=400', $html_link_attributes );
						} else {
							$table_index[ $field['display_column'] ][ $row_count ]['help'] = '<span class="error help">?</span>';
						}
						
					}
					
					// if FORMAT overrides FIELD type/setting/default, then set that now...
					if ( $field['flag_override_type'] ) { $field['FormField']['type'] = $field['type']; }
					if ( $field['flag_override_setting'] ) { $field['FormField']['setting'] = $field['setting']; }
					if ( $field['flag_override_default'] ) { $field['FormField']['default'] = $field['default']; }
				
				// get CONTENT to DISPLAY
				
					$display_value = '';
					
					// set display VALUE, or NO VALUE indicator 
						
						if ( isset( $model[ $field['FormField']['model'] ][ $field['FormField']['field'] ] ) ) {
							$display_value = $model[ $field['FormField']['model'] ][ $field['FormField']['field'] ];
						}
								
							// swap out VALUE for OVERRIDE choice for SELECTS, NO TRANSLATION 
							if ( isset( $override[ $field['FormField']['model'].'/'.$field['FormField']['field'] ] ) ) {
								
								// from ARRAY item...
								if ( is_array($override[ $field['FormField']['model'].'/'.$field['FormField']['field'] ]) ) {
									foreach ( $override[ $field['FormField']['model'].'/'.$field['FormField']['field'] ] as $key=>$value ) {
										
										if ( $key == $display_value ) {
											$display_value = $value;
										}
										
									}
								} 
								
								// for STRING items...
								else {
									$display_value = $override[ $field['FormField']['model'].'/'.$field['FormField']['field'] ];
								}
								
							// swap out VALUE for LANG LOOKUP choice for SELECTS 
							// } else if ( $field['type']=='select' ) {
							} else if ( count($field['FormField']['GlobalLookup']) ) {
								
								foreach ( $field['FormField']['GlobalLookup'] as $lookup ) {
									
									if ( $lookup['value'] == $display_value && $lookup['language_choice'] ) {
										$display_value = $this->Translations->t( $lookup['language_choice'], $lang );
									}
									
								}
								
							}
							
							// format date values a bit...
							if ( $display_value=='0000-00-00' || $display_value=='0000-00-00 00:00:00' || $display_value=='' ) {
								
								// set ZERO date fields to blank
								$display_value = '';
								
							} else if ( $field['FormField']['type']=='date' || $field['FormField']['type']=='datetime' ) {
								
								// get PHP's month name array
								// $cal_info = cal_info(0);
									
									// some older/different versions of PHP do not have cal_info() function, so manually build expected month array
									$cal_info = array();
									$cal_info['abbrevmonths'] = array(
										1 => 'Jan',
						            2 => 'Feb',
						            3 => 'Mar',
						            4 => 'Apr',
						            5 => 'May',
						            6 => 'Jun',
						            7 => 'Jul',
						            8 => 'Aug',
						            9 => 'Sep',
						            10 => 'Oct',
						            11 => 'Nov',
						            12 => 'Dec'
						         );
								
								// format date STRING manually, using PHP's month name array, becuase of UnixTimeStamp's 1970 - 2038 limitation
								
									$calc_date_string = explode( ' ', $display_value );
									
									if ( $field['FormField']['type']=='datetime' ) {
										$calc_time_string = $calc_date_string[1];
									}
									
									$calc_date_string = explode( '-', $calc_date_string[0] );
								
								// format month INTEGER into an abbreviated month name, lowercase, to use for translation alias
								
									$calc_date_string_month = intval($calc_date_string[1]);
									$calc_date_string_month = $cal_info['abbrevmonths'][ $calc_date_string_month ];
									$calc_date_string_month = strtolower( $calc_date_string_month );
								
								$display_value = $this->Translations->t( $calc_date_string_month, $lang, 1 ).( $type!='csv' ? '&nbsp;' : ' ' ).$calc_date_string[2].( $type!='csv' ? '&nbsp;' : ' ' ).$calc_date_string[0]; // date array to nice string, with month translated
								
								if ( $field['FormField']['type']=='datetime' ) {
									
									// attach TIME to display
									$display_value .= ' '.$calc_time_string;
									
								}
							}
							
					// put display_value into CONTENT array index, ELSE put span tag if value BLANK and INCREMENT empty index 
					
						if ( trim($display_value)!='' ) {
							$table_index[ $field['display_column'] ][ $row_count ]['content'] .= $display_tag.$display_value.' ';
						} else {
							$table_index[ $field['display_column'] ][ $row_count ]['content'] .= $display_tag.'<span class="error empty">-</span>';
							$table_index[ $field['display_column'] ][ $row_count ]['empty']++;
						}
					
				// get INPUT for FORM
					
					// var TOOLS/APPENDS, if any 
					$append_field_tool = '';
					$append_field_display = '';
					$append_field_display_value = '';
					
					// var for html helper array
					$html_element_array = array();
					$html_element_array['class'] = '';
					$html_element_array['tabindex'] = $field_count + ( ( $model_key+1 )*1000 );
					
					$field['FormField']['setting'] = trim($field['FormField']['setting']);
					if ( $field['FormField']['setting'] ) {	
						
						// parse through FORM_FIELDS setting value, and add to helper array 
						$field['FormField']['setting'] = explode( ',', $field['FormField']['setting'] );
						foreach ( $field['FormField']['setting'] as $setting ) {
							$setting = explode('=', $setting);
							
							// treat some settings different, ELSE use as HTML ATTRIBUTE 
							if ( $setting[0]=='tool' ) {
								$append_field_tool = $setting[1];
							} else if ( $setting[0]=='append' ) {
								$append_field_display = $setting[1];
							} else {
								$html_element_array[ $setting[0] ] = $setting[1];
							}
						}
						
					}
					
					// tack on APPEND tool value to display value (if any)...
					if ( $type=='detail' && $append_field_display && $display_value ) {
						$append_field_display_value = $this->requestAction( $append_field_display.$display_value );
						$table_index[ $field['display_column'] ][ $row_count ]['content'] .= $append_field_display_value;
					}
					
					// reset VALUE for form element
					$display_value = '';
							
						// display ID value of FORM/FIELD row at HTML comment
							$display_value .=  '
									<!-- '.$field['FormField']['type'].' '.$field['id'].' -->
									';
						
					// to avoid PHP ERRORS, set value to NULL if combo not in array...
					if ( !isset($model[$field['FormField']['model']][$field['FormField']['field']]) ) { $model[$field['FormField']['model']][$field['FormField']['field']] = ''; }
					
					// set error class, based on validators helper info 
					if ( isset($this->validationErrors[ $field['FormField']['model'] ][ $field['FormField']['field'] ]) ) {
						$html_element_array['class'] .= 'error ';
					}
					
					// autocomplete (treat as special INPUT) 
					if ( $field['FormField']['type']=='autocomplete' ) {
						
						if ( $field['flag_'.$type.'_readonly'] && $type!='search' ) {
							$html_element_array['class'] .= 'readonly';
							$html_element_array['readonly'] ='readonly';
						} else if ( count($field['FormField']['FormValidation']) ) {
							$html_element_array['class'] .= 'required';
						}
						
						
						if ( $type=='editgrid' ) { 
							$html_element_array['value'] = $model[$field['FormField']['model']][$field['FormField']['field']]; 
							$html_elemt_array['id'] = 'editgrid'.$model_key.$field['FormField']['model'].$field['FormField']['field'].'_autoComplete';
						}
						
						$autocomplete_url = $html_element_array['url'].$field['FormField']['model'].'/'.$field['FormField']['field'];
						$display_value .=  $this->Ajax->autoComplete( $model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], $autocomplete_url, $html_element_array );
						
					}
					
					// hidden 
					if ( $field['FormField']['type']=='hidden' ) {
						$html_element_array['class'] .= 'hidden'; // no need for REQUIRED class, as it's hidden and styles would not be seen anyway
						
						if ( $type=='add' && $field['FormField']['default'] ) { $html_element_array['value'] = $field['FormField']['default']; } // add default value, if any 
						if ( $type=='editgrid' ) { $html_element_array['value'] = $model[$field['FormField']['model']][$field['FormField']['field']]; }
						if ( isset( $override[$field['FormField']['model'].'/'.$field['FormField']['field']] ) ) { $html_element_array['value'] = $override[$field['FormField']['model'].'/'.$field['FormField']['field']]; }
						
						$display_value .=  $this->Html->hidden( $model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], $html_element_array);
					}
					
					// number 
					if ( $field['FormField']['type']=='number' ) {
						
						if ( $field['flag_'.$type.'_readonly'] && $type!='search' ) {
							$html_element_array['class'] .= 'readonly';
							$html_element_array['readonly'] ='readonly';
						} else if ( count($field['FormField']['FormValidation']) ) {
							$html_element_array['class'] .= 'required';
						}
						
						if ( $type=='add' && $field['FormField']['default'] ) { $html_element_array['value'] = $field['FormField']['default']; } // add default value, if any 
						if ( $type=='editgrid' ) { $html_element_array['value'] = $model[$field['FormField']['model']][$field['FormField']['field']]; }
						if ( isset( $override[$field['FormField']['model'].'/'.$field['FormField']['field']] ) ) { $html_element_array['value'] = $override[$field['FormField']['model'].'/'.$field['FormField']['field']]; }
						
						if ( $type=='search' ) {
							$html_element_array['value'] = '-9999';
							$display_value .=  $this->Html->input( $field['FormField']['model'].'/'.$field['FormField']['field'].'_start', $html_element_array );
							
							$html_element_array['value'] = '9999';
							$display_value .=  ' <span class="tag">'.$this->Translations->t( 'core_to', $lang).'</span> ';
							$display_value .=  $this->Html->input( $field['FormField']['model'].'/'.$field['FormField']['field'].'_end', $html_element_array );
						} else {
							$display_value .=  $this->Html->input( $model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], $html_element_array );
						}
						
					}
					
					// input 
					if ( $field['FormField']['type']=='input' ) {
						
						if ( $field['flag_'.$type.'_readonly'] && $type!='search' ) {
							$html_element_array['class'] .= 'readonly';
							$html_element_array['readonly'] ='readonly';
						} else if ( count($field['FormField']['FormValidation']) ) {
							$html_element_array['class'] .= 'required';
						}
						
						if ( $type=='add' && $field['FormField']['default'] ) { $html_element_array['value'] = $field['FormField']['default']; } // add default value, if any 
						if ( $type=='editgrid' ) { $html_element_array['value'] = $model[$field['FormField']['model']][$field['FormField']['field']]; }
						if ( isset( $override[$field['FormField']['model'].'/'.$field['FormField']['field']] ) ) { $html_element_array['value'] = $override[$field['FormField']['model'].'/'.$field['FormField']['field']]; }
						
						$display_value .=  $this->Html->input( $model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], $html_element_array );
					}
					
					// password 
					if ( $field['FormField']['type']=='password' ) {
						
						if ( $field['flag_'.$type.'_readonly'] && $type!='search' ) {
							$html_element_array['class'] .= 'readonly';
							$html_element_array['readonly'] ='readonly';
						} else if ( count($field['FormField']['FormValidation']) ) {
							$html_element_array['class'] .= 'required';
						}
						
						if ( $type=='add' && $field['FormField']['default'] ) { $html_element_array['value'] = $field['FormField']['default']; } // add default value, if any 
						if ( $type=='editgrid' ) { $html_element_array['value'] = $model[$field['FormField']['model']][$field['FormField']['field']]; }
						if ( isset( $override[$field['FormField']['model'].'/'.$field['FormField']['field']] ) ) { $html_element_array['value'] = $override[$field['FormField']['model'].'/'.$field['FormField']['field']]; }
						
						$display_value .=  $this->Html->password( $model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], $html_element_array );
					}
					
					// textarea 
					if ( $field['FormField']['type']=='textarea' ) {
						
						if ( $field['flag_'.$type.'_readonly'] && $type!='search' ) {
							$html_element_array['class'] .= 'readonly';
							$html_element_array['readonly'] ='readonly';
						} else if ( count($field['FormField']['FormValidation']) ) {
							$html_element_array['class'] .= 'required';
						}
						
						if ( $type=='add' && $field['FormField']['default'] ) { $html_element_array['value'] = $field['FormField']['default']; } // add default value, if any 
						if ( $type=='editgrid' ) { $html_element_array['value'] = $model[$field['FormField']['model']][$field['FormField']['field']]; }
						if ( isset( $override[$field['FormField']['model'].'/'.$field['FormField']['field']] ) ) { $html_element_array['value'] = $override[$field['FormField']['model'].'/'.$field['FormField']['field']]; }
						
						$display_value .=  $this->Html->textarea( $model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], $html_element_array );
					}
					
					// select 
					if ( $field['FormField']['type']=='select' ) {
						
						$showEmpty = true; // variable if pulldown can have BLANK/EMPTY fields at top...
						
						if ( $field['flag_'.$type.'_readonly'] && $type!='search' ) {
							$html_element_array['class'] .= 'readonly';
							$html_element_array['readonly'] ='readonly';
						} else if ( count($field['FormField']['FormValidation']) && $type!='search' ) {
							$html_element_array['class'] .= 'required';
							$showEmpty = false;
						}
						
						$field['FormField']['options_list'] = array(); // start blank option list array 
						
						// use OVERRIDE passed function variable, which should be proper array
						if ( isset( $override[$field['FormField']['model'].'/'.$field['FormField']['field']] ) ) {
							$field['FormField']['options_list'] = $override[$field['FormField']['model'].'/'.$field['FormField']['field']];
							
						// else use standard GLOBALLOOKUP array 
						} else {
							foreach ( $field['FormField']['GlobalLookup'] as $lookup ) {
								if ( strtolower($lookup['active'])=='yes' || $model[$field['FormField']['model']][$field['FormField']['field']]==$lookup['value'] ) {
									$field['FormField']['options_list'][ $lookup['value'] ] = $this->Translations->t( $lookup['language_choice'], $lang, 0 );
								}
							}
						}
						
						// if no select options, but datatable has a VALUE, set option list to that VALUE 
						if ( !count($field['FormField']['options_list']) && isset($model[$field['FormField']['model']][$field['FormField']['field']]) ) {
							$field['FormField']['options_list'][ $model[$field['FormField']['model']][$field['FormField']['field']] ] = $this->Translations->t( $model[$field['FormField']['model']][$field['FormField']['field']], $lang, 0 );
						}
						
						if ( $field['flag_'.$type.'_readonly'] && $type!='search' ) {
							
							if ( count( $field['FormField']['options_list'] )==1 ) {
								$array_values = array_values($field['FormField']['options_list']);
								$html_element_array['value'] = $array_values[0];
							} else {
								$html_element_array['value'] = isset($field['FormField']['options_list'][ $model[$field['FormField']['model']][$field['FormField']['field']] ]) ? $field['FormField']['options_list'][ $model[$field['FormField']['model']][$field['FormField']['field']] ] : '';
								$html_element_array['size'] = strlen($html_element_array['value']);
							}
							
							$display_value .= $this->Html->input( $model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], $html_element_array );
							
							$hidden_html_element_array = array();
							$hidden_html_element_array['class'] = 'hidden';
							
							if ( count( $field['FormField']['options_list'] )==1 ) {
								$array_values = array_keys($field['FormField']['options_list']);
								$hidden_html_element_array['value'] = $array_values[0];
							} else {
								$hidden_html_element_array['value'] = $model[$field['FormField']['model']][$field['FormField']['field']];
							}
							
							$display_value .=  $this->Html->hidden( $model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], $hidden_html_element_array);
							
						} else {
						
						
							if ( $type=='add' && $field['FormField']['default'] ) { 
								$display_value .=  $this->Html->selectTag( $field['FormField']['model'].'/'.$field['FormField']['field'], $field['FormField']['options_list'], $field['FormField']['default'], $html_element_array, NULL, $showEmpty, NULL ); // add default value, if any 
							} else if ( $type=='editgrid' ) {
								$display_value .=  $this->Html->selectTag( $model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], $field['FormField']['options_list'], $model[$field['FormField']['model']][$field['FormField']['field']], $html_element_array, NULL, $showEmpty, NULL  );
							} else {
								$display_value .=  $this->Html->selectTag( $field['FormField']['model'].'/'.$field['FormField']['field'], $field['FormField']['options_list'], NULL, $html_element_array, NULL, $showEmpty, NULL  );
							}
							
						}
						
					}
					
					// radiolist
					if ( $field['FormField']['type']=='radiolist' ) {
						
						$showEmpty = true; // variable if pulldown can have BLANK/EMPTY fields at top...
						
						if ( $field['flag_'.$type.'_readonly'] && $type!='search' ) {
							$html_element_array['class'] .= 'readonly';
							$html_element_array['disabled'] ='disabled';
						} else if ( count($field['FormField']['FormValidation']) ) {
							$html_element_array['class'] .= 'required';
							$showEmpty = false;
						}
						
						$provided_element = false; // ELEMENT might be passed in as a COMPLETE table/element; this is flag to indicate if found
						$field['FormField']['options_list'] = array(); // start blank option list array 
						
						// use OVERRIDE passed function variable, which should be proper array
						if ( isset( $override[$field['FormField']['model'].'/'.$field['FormField']['field']] ) ) {
							
							// if OVERRIDE is array, assume it is list of KEY=>VALUES to parse through
							if ( is_array($override[$field['FormField']['model'].'/'.$field['FormField']['field']]) ) {
								$field['FormField']['options_list'] = $override[$field['FormField']['model'].'/'.$field['FormField']['field']];
							
							// if is STRING, assume it's a TABLE/ELEMENT that completely overrides FORM HELPER build (like a provided CHECKLIST FORM )...
							} else if ( trim($override[$field['FormField']['model'].'/'.$field['FormField']['field']]) ) {
								$display_value .=  $override[$field['FormField']['model'].'/'.$field['FormField']['field']];
								$provided_element = true; // set flag to skip render below...
							}
							
						// else use standard GLOBALLOOKUP array 
						} else {
							foreach ( $field['FormField']['GlobalLookup'] as $lookup ) {
								$field['FormField']['options_list'][ $lookup['value'] ] = $this->Translations->t( $lookup['language_choice'], $lang, 0 );
							}
						}
						
						// skip if ELEMENT provided above in OVERRIDE
						if ( !$provided_element ) {
							
							if ( $showEmpty && !isset($field['FormField']['options_list'][0]) ) {
								$display_default = false;
								if ( $type=='add' && !$field['FormField']['default'] ) { $display_default = true; }
								else if ( !isset($this->data[$field['FormField']['model']][$field['FormField']['field']]) || !$this->data[$field['FormField']['model']][$field['FormField']['field']] ) { $display_default = true; }
								$display_value .=  '<input style="float: left;" type="radio" class="radio" name="data['.$model_suffix.$field['FormField']['model'].']['.$field['FormField']['field'].']" value="" '.( $display_default ? 'checked="checked"' : '' ).' />'.$this->Translations->t( 'core_n-a', $lang, 0 ).'<br />';
								// $field['FormField']['options_list'][0] = $this->Translations->t( 'none', $lang, 0 );
							}
							
							foreach ( $field['FormField']['options_list'] as $element_key=>$element_value ) {
								$display_default = false;
								if ( $type=='add' && $field['FormField']['default']==$element_key ) { $display_default = true; }
								else if ( isset($this->data[$field['FormField']['model']][$field['FormField']['field']]) && $this->data[$field['FormField']['model']][$field['FormField']['field']]==$element_key ) { $display_default = true; }
								$display_value .=  '<input style="float: left;" type="radio" class="radio" name="data['.$model_suffix.$field['FormField']['model'].']['.$field['FormField']['field'].']" value="'.$element_key.'" '.( $display_default ? 'checked="checked"' : '' ).' />'.$element_value.'<br />';
							}
							
						}
					}
					
					// checklist 
					if ( $field['FormField']['type']=='checklist' ) {
						
						if ( $field['flag_'.$type.'_readonly'] && $type!='search' ) {
							$html_element_array['class'] .= 'readonly';
							$html_element_array['disabled'] ='disabled';
						} else if ( count($field['FormField']['FormValidation']) ) {
							$html_element_array['class'] .= 'required';
						}
						
						$provided_element = false; // ELEMENT might be passed in as a COMPLETE table/element; this is flag to indicate if found
						$field['FormField']['options_list'] = array(); // start blank option list array 
						
						// use OVERRIDE passed function variable, which should be proper array
						if ( isset( $override[$field['FormField']['model'].'/'.$field['FormField']['field']] ) ) {
							
							// if OVERRIDE is array, assume it is list of KEY=>VALUES to parse through
							if ( is_array($override[$field['FormField']['model'].'/'.$field['FormField']['field']]) ) {
								$field['FormField']['options_list'] = $override[$field['FormField']['model'].'/'.$field['FormField']['field']];
							
							// if is STRING, assume it's a TABLE/ELEMENT that completely overrides FORM HELPER build (like a provided CHECKLIST FORM )...
							} else if ( trim($override[$field['FormField']['model'].'/'.$field['FormField']['field']]) ) {
								$display_value .=  $override[$field['FormField']['model'].'/'.$field['FormField']['field']];
								$provided_element = true; // set flag to skip render below...
							}
						
						} 
							
						// else use standard GLOBALLOOKUP array 
						else if ( count($field['FormField']['GlobalLookup']) ) {
							foreach ( $field['FormField']['GlobalLookup'] as $lookup ) {
								$field['FormField']['options_list'][ $lookup['value'] ] = $this->Translations->t( $lookup['language_choice'], $lang, 0 );
							}
						}
						
						// else, if a default value, use THAT as single checkbox
						else if ( $field['FormField']['default'] ) {
							$field['FormField']['options_list'][ $field['FormField']['default'] ] = '';
						}
						
						// skip if ELEMENT provided above in OVERRIDE
						if ( !$provided_element ) {
							
							// if only ONE global element, then single CHECKBOX instead using HTML HELPER
							if ( count($field['FormField']['options_list'])==1 ) {
								foreach ( $field['FormField']['options_list'] as $element_key=>$element_value ) {
									$html_element_array['value'] = $element_key;
									$html_element_array['class'] = 'checkbox';
									$display_value .=  '<span class="checkbox">'.$this->Html->checkbox( $model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], $element_value, $html_element_array, NULL ).'</span>'; 
								}
							
							// otherwise, display CHECKLIST, with names as an ARRAY element
							} else {
								foreach ( $field['FormField']['options_list'] as $element_key=>$element_value ) {
									$display_value .=  '<input style="float: left;" type="checkbox" class="checkbox" name="data['.$model_suffix.$field['FormField']['model'].']['.$field['FormField']['field'].'][]" value="'.$element_key.'" '.( ($type=='add' && $field['FormField']['default']==$element_key) || ( in_array($element_key, $this->data[$model_suffix.$field['FormField']['model']][$model_suffix.$field['FormField']['field']]) ) ? 'checked="checked"' : '' ).' />'.$element_value.'<br />';
								}
							}
						}
					}
					
					// datetime 
					if ( $field['FormField']['type']=='datetime' ) {
						
						$dateFormat = FORM_DATE_FORMAT;
						$timeFormat = FORM_TIME_FORMAT;
						$selected = NULL;
						
						if ( $field['flag_'.$type.'_readonly'] && $type!='search' ) {
							$html_element_array['class'] .= 'readonly';
							$html_element_array['disabled'] ='disabled';
						}
						
						if ( !$model[$field['FormField']['model']][$field['FormField']['field']] ) {
							if ( $type=='add' && $field['FormField']['default'] ) { $selected = $field['FormField']['default']; }
							else if ( $type=='add' ) { $selected = date('Y-m-d H:i:s'); }
						}
						
						if ( $type=='editgrid' ) { $selected = $model[$field['FormField']['model']][$field['FormField']['field']]; }
						if ( isset( $override[$field['FormField']['model'].'/'.$field['FormField']['field']] ) ) { $selected = $override[$field['FormField']['model'].'/'.$field['FormField']['field']]; }
						
						if ( $type=='search' ) {
							$display_value .=  $this->Html->dateTimeOptionTag( $field['FormField']['model'].'/'.$field['FormField']['field'].'_start', $dateFormat, $timeFormat, NULL, $html_element_array );
							$display_value .=  ' <span class="tag">'.$this->Translations->t( 'core_to', $lang).'</span> ';
							$display_value .=  $this->Html->dateTimeOptionTag( $field['FormField']['model'].'/'.$field['FormField']['field'].'_end', $dateFormat, $timeFormat, NULL, $html_element_array );
						} else {
							$display_value .=  $this->Html->dateTimeOptionTag( $model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], $dateFormat, $timeFormat, $selected, $html_element_array );
							$display_value .=  $this->DatePicker->picker($model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], array('format'=>'%Y-%m-%d %H:%M'), 'yes');
						}
						
					}
					
					// date 
					if ( $field['FormField']['type']=='date' ) {
					
						$dateFormat = FORM_DATE_FORMAT;
						$timeFormat = 'NONE';
						$selected = NULL;
						
						if ( $field['flag_'.$type.'_readonly'] && $type!='search' ) {
							$html_element_array['class'] .= 'readonly';
							$html_element_array['disabled'] ='disabled';
						}
						
						if ( !$model[$field['FormField']['model']][$field['FormField']['field']] ) {
							if ( $type=='add' && $field['FormField']['default'] ) { $selected = $field['FormField']['default']; }
							else if ( $type=='add' ) { $selected = date('Y-m-d H:i:s'); }
						}
						
						if ( $type=='editgrid' ) { $selected = $model[$field['FormField']['model']][$field['FormField']['field']]; }
						if ( isset( $override[$field['FormField']['model'].'/'.$field['FormField']['field']] ) ) { $selected = $override[$field['FormField']['model'].'/'.$field['FormField']['field']]; }
						
						if ( $type=='search' ) {
							$display_value .=  $this->Html->dateTimeOptionTag( $field['FormField']['model'].'/'.$field['FormField']['field'].'_start', $dateFormat, $timeFormat, NULL, $html_element_array );
							$display_value .=  ' <span class="tag">'.$this->Translations->t( 'core_to', $lang).'</span> ';
							$display_value .=  $this->Html->dateTimeOptionTag( $field['FormField']['model'].'/'.$field['FormField']['field'].'_end', $dateFormat, $timeFormat, NULL, $html_element_array );
						} else {
							$display_value .=  $this->Html->dateTimeOptionTag( $model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], $dateFormat, $timeFormat, $selected, $html_element_array );
							$display_value .=  $this->DatePicker->picker($model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], array('format'=>'%Y-%m-%d'), 'yes');
						}
						
					}
					
					// time 
					if ( $field['FormField']['type']=='time' ) {
						
						$dateFormat = 'NONE';
						$timeFormat = FORM_TIME_FORMAT;
						$selected = NULL;
						
						if ( $field['flag_'.$type.'_readonly'] && $type!='search' ) {
							$html_element_array['class'] .= 'readonly';
							$html_element_array['disabled'] ='disabled';
						}
						
						if ( !$model[$field['FormField']['model']][$field['FormField']['field']] ) {
							if ( $type=='add' && $field['FormField']['default'] ) { $selected = $field['FormField']['default']; }
							else if ( $type=='add' ) { $selected = date('Y-m-d H:i:s'); }
						}
						
						if ( $type=='editgrid' ) { $selected = $model[$field['FormField']['model']][$field['FormField']['field']]; }
						if ( isset( $override[$field['FormField']['model'].'/'.$field['FormField']['field']] ) ) { $selected = $override[$field['FormField']['model'].'/'.$field['FormField']['field']]; }
						
						if ( $type=='search' ) {
							$display_value .=  $this->Html->dateTimeOptionTag( $field['FormField']['model'].'/'.$field['FormField']['field'].'_start', $dateFormat, $timeFormat, NULL, $html_element_array );
							$display_value .=  ' <span class="tag">'.$this->Translations->t( 'core_to', $lang).'</span> ';
							$display_value .=  $this->Html->dateTimeOptionTag( $field['FormField']['model'].'/'.$field['FormField']['field'].'_end', $dateFormat, $timeFormat, NULL, $html_element_array );
						} else {
							$display_value .=  $this->Html->dateTimeOptionTag( $model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field'], $dateFormat, $timeFormat, $selected, $html_element_array );
						}
						
					}
					
					// if there is a TOOL for this field, APPEND! 
					if ( $append_field_tool && $type!='editgrid' ) {
						
						// multiple INPUT entries, using uploaded CSV file
						if ( $append_field_tool=='csv' ) {
							
							// replace NAME of input with ARRAY format name
							// $display_value = preg_replace('/name\=\"data\[([A-Za-z0-9]+)\]\[([A-Za-z0-9]+)\]\"/i','name="data[$1][$2][]"',$display_value);
							$display_value = str_replace(']"','][]"',$display_value);
							
							// wrap FIELD in DIV/P and add JS links to clone/remove P tags
							$display_value = '
								<div id="'.strtolower($field['FormField']['model'].'_'.$field['FormField']['field']).'_with_file_upload">
									'.$display_value.'
									<input class="file" type="file" name="data['.$field['FormField']['model'].']['.$field['FormField']['field'].'_with_file_upload]" />
								</div>
							';
							
						}
						
						// multiple INPUT entries, with JS add/remove links
						else if ( $append_field_tool=='multiple' ) {
							
							// replace NAME of input with ARRAY format name
							// $display_value = preg_replace('/name\=\"data\[([A-Za-z0-9]+)\]\[([A-Za-z0-9]+)\]\"/i','name="data[$1][$2][]"',$display_value);
							$display_value = str_replace(']"','][]"',$display_value);
							
							// wrap FIELD in DIV/P and add JS links to clone/remove P tags
							$display_value = '
								<div id="'.strtolower($field['FormField']['model'].'_'.$field['FormField']['field']).'_with_clone_fields_js">
									<p class="clone">
										'.$display_value.'
										<a href="#" class="ajax_tool clone_remove" onclick="remove_fields(this); return false;">Remove</a>
									</p>
								</div>
								
								<a href="#" class="ajax_tool clone_add" onclick="clone_fields(\''.strtolower($field['FormField']['model'].'_'.$field['FormField']['field']).'_with_clone_fields_js\'); return false;">Add Another</a>
							';
							
						}
						
						// any other TOOL
						else {
							$append_field_tool_id = '';
							$append_field_tool_id = str_replace( '/', ' ', $append_field_tool );
							$append_field_tool_id = trim($append_field_tool_id);
							$append_field_tool_id = str_replace( ' ', '_', $append_field_tool_id );
							
							$javascript_inline = '';
							$javascript_inline .= "new Ajax.Updater( '".$append_field_tool_id."', '".$this->Html->url( $append_field_tool )."', {asynchronous:false, evalScripts:true} );";
							$javascript_inline .= "Effect.toggle('".$append_field_tool_id."','appear',{duration:0.25});";
							
							$display_value .= '
								<a class="tools" onclick="'.$javascript_inline.'">'.$this->Translations->t( 'core_tools', $lang).'</a>
								
								<div class="ajax_tool" id="'.$append_field_tool_id.'" style="display: none;">
								</div>
								
							';
							
						}
						
					}
					
					// add EXTRA, if key exists for this form MODEL/FIELD
					if ( isset( $extras[$model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field']] ) ) {
						$display_value .= '
							<br /><br />
							'.$extras[$model_suffix.$field['FormField']['model'].'/'.$field['FormField']['field']].'
						';
					}
					
					// put display_value into CONTENT array index, ELSE put span tag if value BLANK and INCREMENT empty index 
						if ( trim($display_value)!='' ) {
							$table_index[ $field['display_column'] ][ $row_count ]['input'] .= $display_tag.$display_value.' ';
						} else {
							$table_index[ $field['display_column'] ][ $row_count ]['input'] .= $display_tag.'<span class="error empty">-</span> ';
							$table_index[ $field['display_column'] ][ $row_count ]['empty']++;
						}
				
			} // end IF FIELD[DETAIL]
			
			$field_count++;
			
		} // end FOREACH 
		
		ksort($table_index);
		
		return $table_index;
		
	} // end FUNCTION build_form_stack()
	

/********************************************************************************************************************************************************************************/
	
	
	// FUNCTION to move ONE-TO-ONE associated MODELs up a level so FORMS helper can access them
	// accepts a MODEL array of ONE-TO-ONE model associations, and returns it
	function pull_one_to_one_models_up( &$model_row, $model_fields ) {
	
		// for each field in the model
		foreach ( $model_fields as $field_name=>$field_value ) {
			
			// if the "field" is an array, it is actually an ASSOCIATED model...
			if ( is_array($field_value) ) {
				
				// if the array is EMPTY or has an ID key, assume it's a ONE-TO-ONE model...
				if ( !count( $field_value ) || isset( $field_value['id'] ) ) {
					
					// if the SOURCE does not ALREADY have that associated model...
					if ( !isset( $model_row[$field_name] ) ) {
						// tack onto SOURCE array as ONE-TO-ONE model
						$model_row[$field_name] = $field_value;
					}
					
				}
				
				// repeat FUNCTION call for any possible more ONE-TO-ONE associations within CURRENT association!
				$this->pull_one_to_one_models_up( $model_row, $field_value );
				
			}
			
		}
		
	} // end FUNCTION pull_one_to_one_models_up()


/********************************************************************************************************************************************************************************/

	
	// FUNCTION to build one OR more links...
	// MODEL data, LINKS array, LANG array, ADD array list to INCLUDE, SKIP list to NOT include, and ID value to attach, if any 
	function generate_links_list( $model=array(), $links=array(), $lang=array(), $add=array(), $skip=array(), $id=NULL, $title='', $in_table=0 ) {
			
		$return_string = '';
		
		// set VARS as ARRAYS if not passed as such
		if ( !is_array($model) ) { $model = array(); }
		if ( !is_array($lang) ) { $lang = array(); }
		if ( !is_array($add) ) { $add = array(); }
		if ( !is_array($skip) ) { $skip = array(); }
		
		// remove link array KEYS that not in lists 
		if ( !empty($skip) || !empty($add) ) {
			foreach ( $links as $link_name=>$link_value ) {
				if ( (!in_array( $link_name, $add ) && empty($skip)) || (in_array( $link_name, $skip ) && empty($add)) ) {
					unset( $links[ $link_name ] );
				}
			}
		}
		
		$links = array_reverse($links);
		
		// parse through $LINKS array passed to function, make link for each 
		foreach ( $links as $link_name => $link_location ) {
				
			// check on EDIT only 
			if ( $this->othAuth->checkMenuPermission( $link_location.( $id ? $id : '' ) ) ) {
			
				// replace %%MODEL.FIELDNAME%% 
				$link_location = $this->str_replace_link( $link_location, $model );
				
				// determine TYPE of link, for styling and icon
					$display_class_name = '';
					$display_class_array = array();
					
					$display_class_array = str_replace('_', ' ', $link_name);
					$display_class_array = str_replace('-', ' ', $display_class_array);
					$display_class_array = str_replace('  ', ' ', $display_class_array);
					$display_class_array = explode( ' ', trim($display_class_array) );
					$display_class_array[0] = strtolower($display_class_array[0]);
					
						if ( isset($display_class_array[1]) ) { $display_class_array[1] = strtolower($display_class_array[1]); }
						else { $display_class_array[1] = 'core'; }
						
					/* 
						ICONS allowed by FORMS helper, including PLUGINS
						
						- 16x16 icon for main column in tables
						* 24x24 icon for actions bar
						
						- tree 				- data relationship // NEVER in the action bar
						- * detail				- view data; also, the default icon when no other ICON label fits
						* list				- go to a list or table of data
						* add					- create new data
						* edit				- edit or update existing data
						* delete				- delete existing data
						* cancel				- cancel filling out a form or completing a process
						
						* search				- go to a form to do a search
						duplicate			- copy existing data, either to the database directly, or to populate an add form
						* redo					- do an action again; or change complete to different but related data
						* order					- add to ORDER process, or jump to ORDER plugin
						thumbsup				- add to favourites, or in some way MARK data
						thumbsupfaded		- removed from favourites, or in some way UNMARK data
						
						clinicalannotation
						inventorymanagement
						querytools
						toolsmenu
						drugadministration
						formsmanagement
						storagelayout
						ordermanagement
						protocolmanagement
						studymanagement
						administration
						customize
					*/
					
					
					$display_class_name = ( $display_class_array[0]=='list' || $display_class_array[0]=='listall' || $display_class_array[0]=='table' || $display_class_array[0]=='editgrid' || $display_class_array[0]=='grid' || $display_class_array[0]=='index' ? 'list' : $display_class_name );
					$display_class_name = ( $display_class_array[0]=='search' || $display_class_array[0]=='look' ? 'search' : $display_class_name );
					$display_class_name = ( $display_class_array[0]=='add' || $display_class_array[0]=='new' || $display_class_array[0]=='create' ? 'add' : $display_class_name );
					$display_class_name = ( $display_class_array[0]=='edit' || $display_class_array[0]=='change' || $display_class_array[0]=='update' ? 'edit' : $display_class_name );
					$display_class_name = ( $display_class_array[0]=='detail' || $display_class_array[0]=='view' || $display_class_array[0]=='profile' || $display_class_array[0]=='see' ? 'detail' : $display_class_name );
					$display_class_name = ( $display_class_array[0]=='delete' || $display_class_array[0]=='remove' ? 'delete' : $display_class_name );
					$display_class_name = ( $display_class_array[0]=='cancel' || $display_class_array[0]=='back' || $display_class_array[0]=='return' ? 'cancel' : $display_class_name );
					$display_class_name = ( $display_class_array[0]=='duplicate' || $display_class_array[0]=='copy' ? 'duplicate' : $display_class_name );
					$display_class_name = ( $display_class_array[0]=='undo' || $display_class_array[0]=='redo' || $display_class_array[0]=='switch' || $display_class_array[0]=='change' ? 'redo' : $display_class_name );
					$display_class_name = ( $display_class_array[0]=='order' || $display_class_array[0]=='shop' || $display_class_array[0]=='ship' || $display_class_array[0]=='buy' || $display_class_array[0]=='cart' ? 'order' : $display_class_name );
					
					$display_class_name = ( $display_class_array[0]=='favourite' || $display_class_array[0]=='mark' || $display_class_array[0]=='label' || $display_class_array[0]=='thumbsup' || $display_class_array[0]=='thumbup' || $display_class_array[0]=='approve' ? 'thumbsup' : $display_class_name );
					$display_class_name = ( $display_class_array[0]=='unfavourite' || $display_class_array[0]=='unmark' || $display_class_array[0]=='unlabel' || $display_class_array[0]=='thumbsupfaded' || $display_class_array[0]=='thumbupfaded' || $display_class_array[0]=='unapprove' || $display_class_array[0]=='disapprove' ? 'thumbsupfaded' : $display_class_name );
					
					if ( $display_class_array[0]=='plugin' ) {
						$display_class_name = ( $display_class_array[1]=='clinicalannotation' ? 'clinicalannotation' : $display_class_name );
						$display_class_name = ( $display_class_array[1]=='inventorymanagement' ? 'inventorymanagement' : $display_class_name );
						$display_class_name = ( $display_class_array[1]=='querytools' ? 'querytools' : $display_class_name );
						$display_class_name = ( $display_class_array[1]=='toolsmenu' ? 'toolsmenu' : $display_class_name );
						
						$display_class_name = ( $display_class_array[1]=='drugadministration' ? 'drugadministration' : $display_class_name );
						$display_class_name = ( $display_class_array[1]=='formsmanagement' ? 'formsmanagement' : $display_class_name );
						$display_class_name = ( $display_class_array[1]=='storagelayout' ? 'storagelayout' : $display_class_name );
						$display_class_name = ( $display_class_array[1]=='ordermanagement' ? 'ordermanagement' : $display_class_name );
						$display_class_name = ( $display_class_array[1]=='protocolmanagement' ? 'protocolmanagement' : $display_class_name );
						$display_class_name = ( $display_class_array[1]=='studymanagement' ? 'studymanagement' : $display_class_name );
						
						$display_class_name = ( $display_class_array[1]=='administration' ? 'administration' : $display_class_name );
						$display_class_name = ( $display_class_array[1]=='customize' ? 'customize' : $display_class_name );
						
						$display_class_name = ( !$display_class_array[1] ? 'detail' : $display_class_name );
					}
					
					// default, if none
					$display_class_name = $display_class_name ? $display_class_name : 'detail';				
				
				$htmlAttributes = array(
					'class'	=>	'form '.$display_class_name,
					'title'	=>	strip_tags( $this->Translations->t($link_name, $lang) )
				);
				
				// set Javascript confirmation msg...
				if ( $display_class_name=='delete' ) {
					$confirmation_msg = $this->Translations->t( 'core_are you sure you want to delete this data?', $lang, 0 );
				} else {
					$confirmation_msg = NULL;
				}
				
				$return_string .= '
					<li>
						'.$this->Html->link( 
							$this->Translations->t($link_name, $lang), 
							$link_location.( $id ? $id : '' ),
							$htmlAttributes,
							$confirmation_msg,
							false
						).'
					</li>
				';
				
			} else {
			
				$return_string .= '
					<li>
						<a class="error notallowed">'.$this->Translations->t($link_name, $lang).'</a>
					</li>
				';
			
			} // end CHECKMENUPERMISSIONS 
			
		} // end FOREACH 
		
		// ADD title to links bar and wrap in H5
		if ( !empty($links) && !$in_table ) { 
			$return_string = '
				<div class="action_bar">
					'.( $title ? '<h5>'.$this->Translations->t( $title, $lang ).'</h5>' : '' ).'
					'.( $return_string ? '<ul>' : '' ).'
					'.$return_string.'
					'.( $return_string ? '</ul>' : '' ).'
				</div>
				<br class="clear" />
			';
		} else {
			$return_string = str_replace('<li>', '', $return_string);
			$return_string = str_replace('</li>', '', $return_string);
		}
		
		// return
		return $return_string;
		
	} // end FUNCTION generate_links_list()


/********************************************************************************************************************************************************************************/
	
	
	// FUNCTION to replace %%MODEL.FIELDNAME%% in link with MODEL.FIELDNAME value 
	function str_replace_link( $link='', $model=array() ) {
		
		$return_string = '';
		$return_string = $link;
		
		if ( isset($model[0]) ) {
			$model = $model[0];
		}
		
		if ( is_array($model) && count($model) ) {
			
			foreach ( $model as $find_model=>$find_row ) {
				
				if ( is_array($find_row) ) {
					foreach ( $find_row as $find_field=>$find_value ) {
						
						// avoid ONETOMANY or HASANDBELONGSOTMANY relationahips 
						if ( !is_array($find_value) ) {
							
							// find text in LINK href in format of %%MODEL.FIELD%% and replace with that MODEL.FIELD value...
							$return_string = str_replace( '%%'.$find_model.'.'.$find_field.'%%', $find_value, $return_string );
							$return_string = str_replace( '@@'.$find_model.'.'.$find_field.'@@', $find_value, $return_string );
	
						} // end !IS_ARRAY 
						
					}
				} // IS_ARRAY find_row
				
			} // end FOREACH
			
		} // end IF COUNT
		
		// return
		return $return_string;
		
	} // end FUNCTION str_replace_link()


/********************************************************************************************************************************************************************************/
		
	
	// FUNCTION to write out the TITLE and SUMMARY of the form, if provided 
	function show_title_and_summary( $form=array(), $extras=array(), $lang=array() ) {
		
		$return_string = '';
		
		// only if FORM array exists...
		if ( !empty($form) ) {
			
			// title of form 
			if ( isset($extras['language_title']) ) {
				$return_string .= '
					<h3>'.$extras['language_title'].'</h3>
				';
			} else if ( $form['Form']['language_title'] ) {
				$return_string .= '
					<h3>'. $this->Translations->t( $form['Form']['language_title'], $lang ).'</h3>
				';
			}
			
			// description of form 
			if ( isset($extras['language_help']) ) {
				$return_string .= '
					<p class="form description">
						'.$extras['language_help'].'
					</p>
				';
			} else if ( $form['Form']['language_help'] ) {
				$return_string .= '
					<p class="form description">
						'. $this->Translations->t( $form['Form']['language_help'], $lang ).'
					</p>
				';
			}
			
		}
		
		// wrap summary in STYLABLE div 
		if ( $return_string ) {
			$return_string = '
				<div class="form summary">
					'.$return_string.'
				</div>
			';
		}
		
		// return
		return $return_string;
		
	} // end FUNCTION show_title_and_summary()
		

}
	
?>