<?php

function t($text, $parameters = null) {
    $lang = empty($_COOKIE['lang']) ? 'ru' : $_COOKIE['lang'];
    $result = !array_key_exists($text, Application_Model_Translate::$lang_package) || ($lang == 'ru') ? $text :
        Application_Model_Translate::$lang_package[$text][(int) ($lang == 'en')];
    if (isset($parameters)) {
        if (!is_array($parameters))
            $parameters = array($parameters);
        foreach ($parameters as &$param)
            $param = addslashes($param);
        eval('$result = sprintf($result, "'. implode('","', $parameters) . '");');
    }
    return $result;
}

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {

    public function _initRouter() {
        $front = Zend_Controller_Front::getInstance();
        $router = $front->getRouter();
        $route = new Zend_Controller_Router_Route(
            'test/:id',
            array(
                'controller' => 'index',
                'action'     => 'addnumb'
            )
        );
        $router->addRoute('user', $route);
        return $router;
    }
}

?>