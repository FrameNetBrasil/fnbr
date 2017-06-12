<?php

return array(
    'basePath' => dirname(__FILE__) . DIRECTORY_SEPARATOR . '..',
    'name' => 'Multilingual Framenet',
    'import' => array(
        'modules' => array(
            'auth',
        )
    ),
    'preload' => array('log'),
    'options' => array(
        'fetchStyle' => \FETCH_ASSOC,
        'language' => 'en',
        'painter' => 'EasyUI',
        'templateEngine' => 'latte',
        'defaultPassword' => 'default',
        'pageTitle' => 'MFN Project',
        'mainTitle' => 'MFN WebTool 1.0'
    ),
    'theme' => array(
        'name' => 'fnbr',
        'template' => 'index'
    ),
    'ui' => array(
        'inlineFormAction' => true
    ),
    'login' => array(
        'module' => "auth",
        'auth' => "Maestro\\Security\\MAuthDbMD5",
        'perms' => "Maestro\\Security\\MPerms",
        'check' => true
    ),
    'mailer' => array(
        'smtpServer' => 'smtp.gmail.com',
        'smtpFrom' => 'x@gmail.com',
        'smtpFromName' => 'Project Name',
        'smtpTo' => '',
        'smtpAuth' => true,
        'smtpPass' => '',
        'smtpPort' => 587,
    ),
    'mad' => array(
        'module' => "auth",
        'access' => "access",
        'group' => "group",
        'log' => "log",
        'session' => "session",
        'transaction' => "transaction",
        'user' => "user"
    ),
    'logs' => array(
        'level' => 0,
        'handler' => "socket",
        'peer' => '127.0.0.1',
        'port' => 0
    ),
    'filters' => array(
        'db' => 'fnbr',
        'session' => 'session',
    ),
    'fnbr' => array(
        'db' => 'fnbr', // ou fncopa20
        'url' => array(
            'fnbrasil' => 'http://200.131.61.179:8080/farina-web/report',
            'fncopa' => 'http://200.131.61.179:8180/farina-web/report',
        ),
        'datasource' => array (
            'fnbr' => 'mfn',
        ),
        'color' => array (
            'rel_causative_of' => '#FFD700',
            'rel_inchoative_of' => '#DAA520',
            'rel_inheritance' => '#FF0000',
            'rel_perspective_on' => '#FFB6C1',
            'rel_precedes' => '#000000',
            'rel_see_also' => '#000000',
            'rel_subframe' => '#0000FF',
            'rel_using' => '#008000',
            'rel_coreset' => '#0000FF',
            'rel_excludes' => '#FF0000',
            'rel_requires' => '#008000',
            'rel_evokes' => '#0000FF',
            'rel_inheritance_cxn' => '#FF0000',
            'rel_elementof' => '#000000',
            'rel_elementof' => '#000000',
            'rel_hassemtype' => '#000000',
            'rel_formal_qualia' => '#FF0000',
            'rel_constitutive_qualia' => '#20B2AA',
            'rel_agentive_qualia' => '#FFD700',
            'rel_telic_qualia' => '#8B008B',
            'rel_constraint_frame' => '#F5DEB3',
        ),
        'beginnerLayers' => array(
            '1'
        )
    ),
    'db' => array(
        'fnbr' => array(
            'driver' => 'pdo_mysql',
            'host' => 'localhost',
            'dbname' => 'mfn_db',
            'user' => '',
            'password' => '',
            'formatDate' => '%e/%m/%Y',
            'formatDateWhere' => '%Y/%m/%e',
            'formatTime' => '%T',
            'charset' => 'utf8mb4',
            'sequence' => array(
                'table' => 'Sequence',
                'name' => 'Name',
                'value' => 'Value'
            ),
            'configurationClass' => 'Doctrine\DBAL\Configuration',
        ),
    ),
);
