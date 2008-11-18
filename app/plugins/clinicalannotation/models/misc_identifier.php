<?php

class MiscIdentifier extends ClinicalAnnotationAppModel
{
    var $name = 'MiscIdentifier';
	var $useTable = 'misc_identifiers';
	
    /*
	var $belongsTo = array('Participant' =>
                           array('className'  => 'Participant',
                                 'conditions' => '',
                                 'order'      => '',
                                 'foreignKey' => 'participant_id'
                           )
                     );
	*/
	
	var $validate = array();
	
}

?>