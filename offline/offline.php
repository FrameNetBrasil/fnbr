<?php

// Diretorio do script corrente
$dir = dirname(__FILE__);

// Path do Maestro
$dir = strstr($dir, "maestro", true) . "maestro";
require_once($dir . '/vendor/autoload.php');


// Configuração para tratamento de erros
ini_set("error_reporting", E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT);
ini_set("log_errors", "on");
ini_set("error_log", $dir . "var/log/php_error.log");


// Inclusão do framework
$conf = $dir . '/conf/conf.php';
require_once($dir . '/Maestro/Manager.php');

\Maestro\Manager::init($conf, $dir);

