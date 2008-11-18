<?php

class EventMaster extends ClinicalAnnotationAppModel
{
    var $name = 'EventMaster';
	var $useTable = 'event_masters';
	
    var $belongsTo = array('Diagnosis' =>
                           array('className'  => 'Diagnosis',
                                 'conditions' => '',
                                 'order'      => '',
                                 'foreignKey' => 'diagnosis_id'
                           )
                     );
	
	var $validate = array();
	
}

?>