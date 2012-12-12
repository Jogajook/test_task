<?php

class Application_Form_UserForm extends Zend_Form {

    protected $_dbUserRow;
    protected $_config;


    public function init() {
        $this->setDecorators(array(
            'FormElements',
            array('HtmlTag', array('tag' => 'table')),
            'Form'
        ));
    }
}

?>
