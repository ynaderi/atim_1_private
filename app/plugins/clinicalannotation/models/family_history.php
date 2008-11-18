<?php

class FamilyHistory extends ClinicalAnnotationAppModel
{
    var $name = 'FamilyHistory';
	var $useTable = 'family_histories';
	
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