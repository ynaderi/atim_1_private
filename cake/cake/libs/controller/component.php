<?php
/* SVN FILE: $Id: component.php,v 1.2 2006/11/07 20:19:51 walambre Exp $ */
/**
 *
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
 * @subpackage		cake.cake.libs.controller
 * @since			CakePHP v TBD
 * @version			$Revision: 1.2 $
 * @modifiedby		$LastChangedBy: phpnut $
 * @lastmodified	$Date: 2006/11/07 20:19:51 $
 * @license			http://www.opensource.org/licenses/mit-license.php The MIT License
 */
/**
 *
 *
 * @package		cake
 * @subpackage	cake.cake.libs.controller
 */
class Component extends Object {
/**
 * Enter description here...
 *
 * @var unknown_type
 */
	var $components = array();
/**
 * Enter description here...
 *
 * @var unknown_type
 */
	var $controller = null;

/**
 * Constructor
 *
 * @return Component
 */
	function __construct() {
	}
/**
 * Used to initialize the components for current controller
 *
 * @param object $controller
 */
	function init(&$controller) {
		$this->controller =& $controller;
		if ($this->controller->components !== false) {
			$loaded = array();
			$loaded = $this->_loadComponents($loaded, $this->controller->components);

			foreach(array_keys($loaded)as $component) {
				$tempComponent =& $loaded[$component];
				if (isset($tempComponent->components) && is_array($tempComponent->components)) {
					foreach($tempComponent->components as $subComponent) {
						$this->controller->{$component}->{$subComponent} =& $loaded[$subComponent];
					}
				}
			}
		}

	}

/**
 * Enter description here...
 *
 * @param unknown_type $loaded
 * @param unknown_type $components
 * @return unknown
 */
	function &_loadComponents(&$loaded, $components) {
		foreach($components as $component) {
			$pos = strpos($component, '/');
			if ($pos === false) {
				$plugin = $this->controller->plugin;
			} else {
				$parts = explode('/', $component);
				$plugin = Inflector::underscore($parts['0']);
				$component = $parts['1'];
			}

			$componentCn = $component . 'Component';

			if (in_array($component, array_keys($loaded)) !== true) {
				if (!class_exists($componentCn)) {
					if (is_null($plugin) || !loadPluginComponent($plugin, $component)) {
						if (!loadComponent($component)) {
							return $this->cakeError('missingComponentFile', array(array(
								'className' => $this->controller->name,
								'component' => $component,
								'file' => Inflector::underscore($component) . '.php',
								'base' => $this->controller->base
							)));
						}
					}

					if (!class_exists($componentCn)) {
						return $this->cakeError('missingComponentClass', array(array(
							'className' => $this->controller->name,
							'component' => $component,
							'file' => Inflector::underscore($component) . '.php',
							'base' => $this->controller->base
						)));
					}
				}

				if ($componentCn == 'SessionComponent') {
					$param = strip_plugin($this->controller->base, $this->controller->plugin) . '/';
				} else {
					$param = null;
				}
				$this->controller->{$component} =& new $componentCn($param);
				$loaded[$component] =& $this->controller->{$component};
				if (isset($this->controller->{$component}->components) && is_array($this->controller->{$component}->components)) {
					$loaded =& $this->_loadComponents($loaded, $this->controller->{$component}->components);
				}
			}
		}
		return $loaded;
	}
}

?>