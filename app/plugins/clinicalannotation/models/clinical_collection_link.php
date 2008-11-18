<?php

class ClinicalCollectionLink extends ClinicalAnnotationAppModel
{
    var $name = 'ClinicalCollectionLink';
	
	var $useTable = 'clinical_collection_links';
	
    var $belongsTo = array(
						'Diagnosis' =>
                           array('className'  => 'Diagnosis',
                                 'conditions' => '',
                                 'order'      => '',
                                 'foreignKey' => 'diagnosis_id'),
						'Consent' =>
                           array('className'  => 'Consent',
                                 'conditions' => '',
                                 'order'      => '',
                                 'foreignKey' => 'consent_id'),
						'Collection' =>
                           array('className'  => 'Collection',
                                 'conditions' => '',
                                 'order'      => '',
                                 'foreignKey' => 'collection_id'));
	
	var $validate = array();
	
}

?>