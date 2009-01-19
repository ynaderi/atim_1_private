<?php

class FormsComponent extends Object {
	
	var $controller = true;
		
	//parse THIS->DATA and return CONDITIONS strong for FINDALL functions
	function getSearchConditions( $data=array(), $model=array(), $sql='' ) {
		
		// pr($model);
		// exit;
		
		// blank RETURN array
		$conditions = array();
		
		// format MODEL data (if any) into FORMFIELDS array for easy lookup
		$form_fields = array();
		if ( isset($model['FormFormat']) ) {
			foreach ( $model['FormFormat'] as $val ) {
				
				// for SELECT pulldowns, where an EXACT match is required...
				if ( $val['FormField']['type']=='select' ) {
					$form_fields[ $val['FormField']['model'].'.'.$val['FormField']['field'] ]['key'] = $val['FormField']['model'].'.'.$val['FormField']['field'];
					$form_fields[ $val['FormField']['model'].'.'.$val['FormField']['field'] ]['criteria'] = '@@SEARCHTERM@@';
				}
				
				// for RANGE values, which should be searched over with a RANGE...
				else if ( $val['FormField']['type']=='number' || $val['FormField']['type']=='date' || $val['FormField']['type']=='datetime' ) {
					$form_fields[ $val['FormField']['model'].'.'.$val['FormField']['field'].'_start' ]['key'] = NULL;
					$form_fields[ $val['FormField']['model'].'.'.$val['FormField']['field'].'_start' ]['criteria'] = '`'.$val['FormField']['model'].'`.`'.$val['FormField']['field'].'` >= "@@SEARCHTERM@@"';
					
					$form_fields[ $val['FormField']['model'].'.'.$val['FormField']['field'].'_end' ]['key'] = NULL;
					$form_fields[ $val['FormField']['model'].'.'.$val['FormField']['field'].'_end' ]['criteria'] = '`'.$val['FormField']['model'].'`.`'.$val['FormField']['field'].'` <= "@@SEARCHTERM@@"';
				}
				
				// all other types, a generic SQL fragment...
				else {
					$form_fields[ $val['FormField']['model'].'.'.$val['FormField']['field'] ]['key'] = $val['FormField']['model'].'.'.$val['FormField']['field'];
					$form_fields[ $val['FormField']['model'].'.'.$val['FormField']['field'] ]['criteria'] = 'LIKE %@@SEARCHTERM@@%';
				}
				
			}
		}
		
		// parse if data exists 
		if ( !empty( $data ) ) {
			
			// parse all FIELDS, to clean up DATE pulldowns, specifically for start-end ranges...
			foreach ( $data as $model=>$fields ) {
				foreach ( $fields as $key=>$value ) {
				
					$default_year_value = '2000';
					if ( strrpos( $key, '_start_' ) ) { $default_year_value = '0000'; }
					if ( strrpos( $key, '_end_' ) ) { $default_year_value = '9999'; }
				
					// if DATETIME form type 
					if ( substr($key,-5)=='_year' && isset( $data[$model][ substr($key,0,-5).'_month' ] ) && isset( $data[$model][ substr($key,0,-5).'_hour' ] ) ) {
						
						// get DATE field name WITHOUT _start or _end
						$substrOfDate = substr($key,0,-5);
						
						// format HOUR, based on 24 or 12 hour clock
						$hour = $data[$model][ $substrOfDate.'_hour'];
						if ($hour != 12 && (isset($data[$model][ $substrOfDate.'_meridian']) && 'pm' == $data[$model][ $substrOfDate.'_meridian'])) {
							$hour = $hour + 12;
						}
						
						// generate full date value for new DATE field
						$newDateField = ( $data[$model][ $substrOfDate.'_year' ] ? $data[$model][ $substrOfDate.'_year' ] : $default_year_value ).'-'.( $data[$model][ $substrOfDate.'_month' ] ? $data[$model][ $substrOfDate.'_month' ] : '00' ).'-'.( $data[$model][ $substrOfDate.'_day' ] ? $data[$model][ $substrOfDate.'_day' ] : '00' );
						$newDateField .= ' ';
						$newDateField .= ( $hour ? $hour : '00' ) . ':' . ( $data[$model][ $substrOfDate.'_min'] ? $data[$model][ $substrOfDate.'_min'] : '00' ) . ':00';
						$newDateField = $newDateField!='-- ::00' ? $newDateField : '';
						
						// unset individual field values
						unset($data[$model][ $substrOfDate.'_year']);
						unset($data[$model][ $substrOfDate.'_month']);
						unset($data[$model][ $substrOfDate.'_day']);
						unset($data[$model][ $substrOfDate.'_hour']);
						unset($data[$model][ $substrOfDate.'_min']);
						unset($data[$model][ $substrOfDate.'_meridian']);
						
						// save to MODEL
						$data[$model][$substrOfDate] = $newDateField;
						
					}
					
					// if DATE form type 
					else if ( substr($key,-5)=='_year' && isset( $data[$model][ substr($key,0,-5).'_month' ] ) ) {
						
						// get DATE field name WITHOUT _start or _end
						$substrOfDate = substr($key,0,-5);
						
						// generate full date value for new DATE field
						$newDateField = ( $data[$model][ $substrOfDate.'_year' ] ? $data[$model][ $substrOfDate.'_year' ] : $default_year_value ).'-'.( $data[$model][ $substrOfDate.'_month' ] ? $data[$model][ $substrOfDate.'_month' ] : '00' ).'-'.( $data[$model][ $substrOfDate.'_day' ] ? $data[$model][ $substrOfDate.'_day' ] : '00' );
						$newDateField = $newDateField!='--' ? $newDateField : '';
						
						// unset individual field values
						unset($data[$model][ $substrOfDate.'_year']);
						unset($data[$model][ $substrOfDate.'_month']);
						unset($data[$model][ $substrOfDate.'_day']);
						unset($data[$model][ $substrOfDate.'_hour']);
						unset($data[$model][ $substrOfDate.'_min']);
						unset($data[$model][ $substrOfDate.'_meridian']);
						
						// save to MODEL
						$data[$model][$substrOfDate] = $newDateField;
						
					}
					
					// if TIME form type 
					else if ( substr($key,-5)=='_hour' && isset( $data[$model][ substr($key,0,-5).'_min' ] ) ) {
						
						// get DATE field name WITHOUT _start or _end
						$substrOfDate = substr($key,0,-5);
						
						// format HOUR, based on 24 or 12 hour clock
						$hour = $data[$model][ $substrOfDate.'_hour'];
						if ($hour != 12 && (isset($data[$model][ $substrOfDate.'_meridian']) && 'pm' == $data[$model][ $substrOfDate.'_meridian'])) {
							$hour = $hour + 12;
						}
						
						// generate full date value for new DATE field
						$newDateField .= ( $hour ? $hour : '00' ) . ':' . ( $data[$model][ $substrOfDate.'_min'] ? $data[$model][ $substrOfDate.'_min'] : '00' ) . ':00';
						$newDateField = $newDateField!='::00' ? $newDateField : '';
						
						// unset individual field values
						unset($data[$model][ $substrOfDate.'_hour']);
						unset($data[$model][ $substrOfDate.'_min']);
						unset($data[$model][ $substrOfDate.'_meridian']);
						
						// save to MODEL
						$data[$model][$substrOfDate] = $newDateField;
						
					}
					
				}
				
			}
			
			// swap out SQL placeholders with SEARCH terms and BLANK values
			if ( $sql ) {
				
				$sql_with_search_terms = $sql;
				$sql_without_search_terms = $sql;
				
				foreach ( $data as $model=>$model_value ) {
					foreach ( $model_value as $field=>$field_value ) {
						$sql_with_search_terms = str_replace( '@@'.$model.'.'.$field.'@@', $field_value, $sql_with_search_terms );
						$sql_without_search_terms = str_replace( '@@'.$model.'.'.$field.'@@', '', $sql_without_search_terms );
					}
				}
				
				return array( $sql_with_search_terms, $sql_without_search_terms );
			}
			
			// now parse DATA to generate SQL conditions
			foreach ( $data as $model=>$fields ) {
				foreach ( $fields as $key=>$value ) {
					
					// format value, for CakePHP
					$value = trim($value);
					
					// blank out ZERO dates, just in case...
					$value = $value=='--::' ? '' : $value;
					$value = $value=='--' ? '' : $value;
					$value = $value=='::' ? '' : $value;
					
					// if MODEL data was passed to this function, use it to generate SQL criteria...
					if ( count($form_fields) ) {
					
						// add search element to CONDITIONS array if not blank & MODEL data included Model/Field info...
						if ( $value && isset($form_fields[$model.'.'.$key]) ) {
							
							// if KEY is provided, save criteria in array with that...
							if ( $form_fields[$model.'.'.$key]['key'] ) {
								$conditions[ $form_fields[$model.'.'.$key]['key'] ] = str_replace( '@@SEARCHTERM@@', $value, $form_fields[$model.'.'.$key]['criteria'] );
							} 
							
							// if KEY is NULL, just tack onto end of array...
							else {
								$conditions[] = str_replace( '@@SEARCHTERM@@', $value, $form_fields[$model.'.'.$key]['criteria'] );
							}
							
						}
					
					}
					
					// otherwise, do it blindly
					else {
					
						// add search element to CONDITIONS array if not blank
						if ( $value!==false && $value!=='' ) {
							$conditions[ $model.'.'.$key ] = 'LIKE %'.$value.'%';
						}
						
					}
					
				}
			}
			
		}
		
		// parse for FINDALL function 
		//$conditions = implode( ' AND ', $conditions );
		//$conditions = $conditions ? $conditions : NULL;
		
		return $conditions;
		
	}
	
	// controllers requestAction this Component/Function to get a Validate array 
	function getValidateArray( $alias=null ) {
		
		// start blank Validate array
		$new_validate_array = array();
		
		// return blank array if no table prob=vided
		if ( isset($alias) ) {
			
			// set model findAll variables 
			$conditions = 'Form.alias="'.$alias.'"';
			$fields = '';
			$order = '';
			$limit = '';
			
			// model findAll, all field validation rules for specified table 
			$this->Form_Model_for_getValidateArray =& new Form;
			$new_result = $this->Form_Model_for_getValidateArray->findAll( $conditions, $fields, $order, $limit, NULL, 3 );
			
			if ($new_result) {
				foreach ( $new_result[0]['FormFormat'] as $field ) {
						
						foreach ( $field['FormField']['FormValidation'] as $validation ) {
							
							// create new Validate array 
							$new_validate_array[ $field['FormField']['model'] ][ $field['FormField']['field'] ][] = array(
								'expression'=>$validation['expression'],
								'message'=>$validation['message']
							);
							
						}
				}
			}
			
		}
		
		// return new Validate Array to Controller
		return $new_validate_array;
		
	}
	
	// controllers requestAction this Component/Function to get a Validate array 
	function getFormArray( $alias=null ) {
		
		// start blank Form array
		$new_form_array = array();
		
		// return blank array if no table prob=vided
		if ( isset($alias) ) {
			
			// set model findAll variables 
			$conditions = 'Form.alias="'.$alias.'"';
			$fields = '*';
			$order = '';
			$limit = '';
			
			// model findAll, all field validation rules for specified table ...
			$this->Form_Model_for_getFormArray =& new Form;
			
			// findall FORM info, recursive 
			$new_result = $this->Form_Model_for_getFormArray->findAll( $conditions, $fields, $order, $limit, NULL, 3 );
			
			// set first FORM in result array as array to pass back 
			$new_form_array = isset( $new_result[0] ) ? $new_result[0] : array();
			
		}
		
		// return new Form Array to Controller
		return $new_form_array;
		
	}
	
}

?>