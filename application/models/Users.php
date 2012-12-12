<?php

class Application_Model_Users extends Zend_Db_Table_Abstract {
    protected $_name = 'users';

    public function save($data, $userId) {
        unset($data['submit']);
        return $this->update($data, "id=" . (int)$userId);
    }

    public function getJsonUserFieldsConfig($configs) {
        $config = null;
        if($configs['userProfileForm'])
            $config = new Zend_Config_Json($configs['userProfileForm']);
        return $config;
    }
}

?>