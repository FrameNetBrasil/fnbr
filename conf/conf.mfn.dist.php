<?php

return [
    'basePath' => dirname(__FILE__) . DIRECTORY_SEPARATOR . '..',
    'name' => 'Multilingual FrameNet Project',
    'import' => [
        'modules' => [
            'auth'
        ]
    ],
    'preload' => [
        'log'
    ],
    'options' => [
        'fetchStyle' => \FETCH_ASSOC,
        'language' => 'en',
        'painter' => 'EasyUI',
        'templateEngine' => 'latte',
        'defaultPassword' => 'default',
        'pageTitle' => 'MFN Project',
        'mainTitle' => 'MFN WebTool'
    ],
    'ui' => [
        'actions' => 'actions.mfn.php',
    ],
    'login' => [
        'handler' => 'auth0',
        'AUTH0_CLIENT_ID' => '',
        'AUTH0_DOMAIN' => 'framenetbr.auth0.com',
        'AUTH0_CLIENT_SECRET' => '',
        'AUTH0_CALLBACK_URL' => '',
        'logout' => 'https://framenetbr.auth0.com/v2/logout?returnTo=',
    ],
    'theme' => [
        'name' => 'mfn',
        'template' => 'index'
    ],
    'mailer' => [
        'smtpServer' => 'smtp.gmail.com',
        'smtpFrom' => 'x@gmail.com',
        'smtpFromName' => 'Project Name',
        'smtpTo' => '',
        'smtpAuth' => true,
        'smtpPass' => '',
        'smtpPort' => 587,
    ],
    'mad' => [
        'namespace' => "fnbr\\auth",
        'module' => "auth",
        'access' => "Access",
        'group' => "Group",
        'log' => "Log",
        'session' => "Session",
        'transaction' => "Transaction",
        'user' => "User"
    ],
    'logs' => [
        'level' => 0,
        'handler' => "socket",
        'peer' => '127.0.0.1',
        'port' => 0
    ],
    'filters' => [
        'db' => 'mfn',
        'session' => 'session',
    ],
    'fnbr' => [
        'db' => 'mfn',
        'color' => [
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
        ],
        'beginnerLayers' => [
            '1'
        ]
    ],
    'db' => [
        'fnbr' => [
            'driver' => 'pdo_mysql',
            'host' => 'localhost',
            'dbname' => 'fnbr_db',
            'user' => '',
            'password' => '',
            'formatDate' => '%e/%m/%Y',
            'formatDateWhere' => '%Y/%m/%e',
            'formatTime' => '%T',
            'charset' => 'utf8mb4',
            'sequence' => [
                'table' => 'Sequence',
                'name' => 'Name',
                'value' => 'Value'
            ],
            'configurationClass' => 'Doctrine\DBAL\Configuration',
        ],
        'mfn' => [
            'driver' => 'pdo_mysql',
            'host' => 'localhost',
            'dbname' => 'mfn_db',
            'user' => '',
            'password' => '',
            'formatDate' => '%e/%m/%Y',
            'formatDateWhere' => '%Y/%m/%e',
            'formatTime' => '%T',
            'charset' => 'utf8mb4',
            'sequence' => [
                'table' => 'Sequence',
                'name' => 'Name',
                'value' => 'Value'
            ],
            'configurationClass' => 'Doctrine\DBAL\Configuration',
        ],
    ],
];
