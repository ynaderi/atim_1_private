<?php
	/**
	* Autocomplete Helper
	*
	* @author  Nik Chankov
	* @website http://nik.chankov.net
	* @version 1.0.0
	*/
	
	uses('view/helpers/Form');
	class DatePickerHelper extends Helper {
		 
		 var $helpers = array( 'Html', 'Javascript', 'Ajax', 'Translations', 'othAuth', 'Pagination', 'Time', 'DatePicker' );
		
		var $format = '%Y-%m-%d';
			
			function picker($fieldName, $options = array()) {
				$this->Html->setFormTag($fieldName);
				
				$htmlAttributes = array(
					'class'	=>'date',
					'type'	=>'text',
					'size'	=> '10', 
					'id'		=>( isset($options['id']) ? $options['id'] : $fieldName )
				); 
				
				if(isset($options['value'])){ 
					$htmlAttributes['value'] = $options['value'];
				}
				
				$output = $this->Html->input($fieldName, $htmlAttributes);
				
				$output .= $this->Html->link($this->Html->image('../js/jscalendar/img.gif'), '#', array('class'=>'calendar', 'onClick'=>"return showCalendar('".$htmlAttributes['id']."', '".((isset($options['format'])?$options['format']:$this->format))."'); return false;"), null, false);
				
				// return $output;
			}
			
	}
?>