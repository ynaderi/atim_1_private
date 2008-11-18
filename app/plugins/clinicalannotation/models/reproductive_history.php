<?php

class ReproductiveHistory extends ClinicalAnnotationAppModel
{
    var $name = 'ReproductiveHistory';
	var $useTable = 'reproductive_histories';
	
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