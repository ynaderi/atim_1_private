<?php
	
	class TranslationsHelper extends Helper
	{
		
		// nice check against Translation2 array info
		function t($msg, $lang, $span = true)
		{
			
			// correct ZERO problem
			if ( $msg===0 || $msg==='0' ) { return '0'; }
			
			//return either translation *OR* formatted untranslated text (rather than PHP missing index warning)
			if ( $span === true ) {
				$val = isset( $lang[$msg] ) && $lang[$msg] ? $lang[$msg] : '<span class="error untranslated" title="Untranslated ('.$msg.')">'.$msg.'</span>';
			} else {
				$val = isset( $lang[$msg] ) && $lang[$msg] ? $lang[$msg] : 'Untranslated ('.$msg.')';
			}
			
			return $val;
		}
		
	}
	
?>