<?php
/* SVN FILE: $Id: acoaction.php,v 1.2 2006/11/07 20:20:12 walambre Exp $ */

/**
 * Short description for file.
 *
 * Long description for file
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
 * @subpackage		cake.cake.libs.controller.components.dbacl.models
 * @since			CakePHP v 0.10.0.1232
 * @version			$Revision: 1.2 $
 * @modifiedby		$LastChangedBy: phpnut $
 * @lastmodified	$Date: 2006/11/07 20:20:12 $
 * @license			http://www.opensource.org/licenses/mit-license.php The MIT License
 */

/**
 * Short description.
 */
if (!class_exists('AppModel')) {
	 require (CAKE . 'app_model.php');
}
/**
 * Short description for file.
 *
 * Long description for file
 *
 * @package		cake
 * @subpackage	cake.cake.libs.controller.components.dbacl.models
 *
 */
class AcoAction extends AppModel {
/**
 * Enter description here...
 *
 * @var unknown_type
 */
	 var $belongsTo = 'Aco';
}
?>