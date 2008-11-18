<?php
/* SVN FILE: $Id: app_model.php,v 1.3 2007/03/15 18:46:45 walambre Exp $ */
/**
 * Application model for Cake.
 *
 * This file is application-wide model file. You can put all
 * application-wide model-related methods here.
 *
 * PHP versions 4 and 5
 *
 * CakePHP :  Rapid Development Framework <http://www.cakephp.org/>
 * Copyright (c)	2006, Cake Software Foundation, Inc.
 *								1785 E. Sahara Avenue, Suite 490-204
 *								Las Vegas, Nevada 89104
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @filesource
 * @copyright		Copyright (c) 2006, Cake Software Foundation, Inc.
 * @link				http://www.cakefoundation.org/projects/info/cakephp CakePHP Project
 * @package			cake
 * @subpackage		cake.cake
 * @since			CakePHP v 0.2.9
 * @version			$Revision: 1.3 $
 * @modifiedby		$LastChangedBy: phpnut $
 * @lastmodified	$Date: 2007/03/15 18:46:45 $
 * @license			http://www.opensource.org/licenses/mit-license.php The MIT License
 */
/**
 * Application model for Cake.
 *
 * This is a placeholder class.
 * Create the same file in app/app_model.php
 * Add your application-wide methods to the class, your models will inherit them.
 *
 * @package		cake
 * @subpackage	cake.cake
 */
class AppModel extends Model {

	function beforeSave() {
		// Set all empty strings to NULL
		$fields = $this->getColumnTypes();
		foreach ($fields as $k => $v) {
			if (isset($this->data[$this->name][$k]) and ($v == 'integer' or $v == 'float')
				 and $this->data[$this->name][$k] === '') {
				 $this->data[$this->name][$k] = NULL;    
			}
		}
		
		return parent::beforeSave();    
	}

	function unbindAll($params = array()) {
	
        foreach($this->__associations as $ass) {
        
            if(!empty($this->{$ass})) {
            
                $this->__backAssociation[$ass] = $this->{$ass};
                if(isset($params[$ass])) {
                
                    foreach($this->{$ass} as $model => $detail) {
                    
                        if(!in_array($model,$params[$ass])) {
                        
                             $this->__backAssociation = array_merge($this->__backAssociation, $this->{$ass});
                            unset($this->{$ass}[$model]);
                        }
                    }
                    
                } else {
                    $this->__backAssociation = array_merge($this->__backAssociation, $this->{$ass});
                    $this->{$ass} = array();
                }
                
            }
        }
        
        return true;
    } 
		
	// http://myles.eftos.id.au/blog/archives/30 && http://myles.eftos.id.au/blog/archives/51
	function invalidFields ( $data=array() ) {
	
		if (empty($data)) {
			$data = $this->data;
		}
		
		if (!$this->beforeValidate()) {
			return false;
		}
		
		if (!isset($this->validate)) {
			return true;
		}
		
		if (!empty($data)) {
			$data = $data;
		} elseif (isset($this->data)) {
			$data = $this->data;
		}
		
		if (isset($data[$this->name])) {
			$data = $data[$this->name];
		}
		
		$errors = array();
		foreach($this->validate as $field_name => $validators) {
			foreach($validators as $validator) {
				if (isset($data[$field_name]) && !preg_match($validator['expression'], $data[$field_name])) {
					$errors[$field_name] = $validator['message'];
				}
			}
		}
		
		if ( !isset($this->validationErrors) ) {
			$this->validationErrors=array();
		}
		
		$this->validationErrors = array_merge( $this->validationErrors, $errors );
		
		return $errors;
		
	}


}
?>