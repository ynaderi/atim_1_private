<?php

class TreatmentMaster extends ClinicalAnnotationAppModel
{
    var $name = 'TreatmentMaster';
	var $useTable = 'tx_masters';
	
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