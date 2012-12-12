<?php

class IndexController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        $userId = 1; // here can must be method of getting id like $id = $this->_request->getParam('id') if user is admin
                     // or $id = Zend_Auth::getInstance()->getIdentity()->id  if user is "simple user" etc
        try {
            if(is_numeric($userId)) {
                $nameService = 'Пользователи';
                $this->view->nameService = $nameService;
                $this->view->headTitle($nameService);
                $dbUsers = new Application_Model_Users;
                $configs = $this->getInvokeArg('bootstrap')->getOption('configs'); // getting config section
                $config = $dbUsers->getJsonUserFieldsConfig($configs);  // getting JSON-object from file.
                   // fields of file may have different validators and filter and type according to their destination
                if ($config) {
                    $dbUsersRow = $dbUsers->fetchRow("id=" . (int)$userId)->toArray(); // getting db user data
                    if ($dbUsersRow) {
                        $form = new Application_Form_UserForm($config);
                        $form->populate($dbUsersRow); // populate form with data from db
                        $this->view->form = $form;
                        if ($this->_request->isPost()) {
                            $data = $this->_request->getPost();
                            if ($form->isValid($data)) {
                                $dbUsers->save($data, $userId); // saving new data
                                $this->view->message = "Данные успешно сохранены";
                            }
                        }
                    } else
                        throw new Zend_Controller_Action_Exception("Идентификатор пользователя не найден в БД");
                }  else
                    throw new Zend_Controller_Action_Exception('Файл конфигурации не найден или не соответствует формату');
            } else {
                throw new Zend_Controller_Action_Exception('Неправильный формат идентификатора пользователя');
            }
        } catch (Zend_Controller_Action_Exception $e) {
            $this->view->error = $e->getMessage(); // we can do different things with this error, for example
                                                   // write into file
        }
    }
}

?>