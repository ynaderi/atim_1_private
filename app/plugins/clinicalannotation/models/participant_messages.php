<?php

class ParticipantMessage extends ClinicalAnnotationAppModel
{
    var $name = 'ParticipantMessage';
	var $useTable = 'participant_messages';
	
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