<?php

return array(
    'fnbr' => array('mainPanel', 'main/main', 'fnbrIconForm', '', A_ACCESS, array(
            'admin' => array('Admin', 'admin/main', 'fa fa-cogs fa16px', 'ADMIN', A_ACCESS, array(
                    'annostatus' => array('Anno Status', 'admin/annostatus/main', 'fa fa-cog fa16px', 'ADMIN', A_ACCESS, array()),
                    'domain' => array('Domain', 'admin/domain/main', 'fa fa-cog fa16px', 'ADMIN', A_ACCESS, array()),
                    'relationgroup' => array('Relation Group', 'admin/relationgroup/main', 'fa fa-cog fa16px', 'ADMIN', A_ACCESS, array()),
                    'type' => array('Type', 'admin/type/main', 'fa fa-cog fa16px', 'ADMIN', A_ACCESS, array()),
                    'genre' => array('Genre', 'admin/genre/main', 'fa fa-cog fa16px', 'ADMIN', A_ACCESS, array()),
                    'wflex' => array('Wf-Lexeme', 'admin/wflex/main', 'fa fa-cog fa16px', 'ADMIN', A_ACCESS, array()),
                )),
            'auth' => array('Auth', 'main/auth', 'fa fa-key fa16px', 'ADMIN', A_ACCESS, array(
                    'persons' => array('Persons', 'auth/person/main', 'fa fa-child fa16px', 'ADMIN', A_ACCESS, array()),
                    'users' => array('Users', 'auth/user/main', 'fa fa-user fa16px', 'ADMIN', A_ACCESS, array()),
                )),
            'structure' => array('Structure', 'main/structure', 'fa fa-database fa16px', '', A_ACCESS, array(
                    'framestructure' => array('Frame', 'structure/frame/main', 'fa fa-list-alt fa16px', '', A_ACCESS, array()),
                    'corpusstructure' => array('Corpus', 'structure/corpus/main', 'fa fa-th-large fa16px', 'MASTER', A_ACCESS, array()),
                    'cxnstructure' => array('Construction', 'structure/cxn/main', 'fa fa-th fa16px', 'MASTER', A_ACCESS, array()),
                    'templatestructure' => array('Template', 'structure/template/main', 'fa fa-files-o fa16px', 'MASTER', A_ACCESS, array()),
                    'semantictypestructure' => array('Semantic Type', 'structure/semantictype/main', 'fa fa-life-ring fa16px', 'MASTER', A_ACCESS, array()),
                    'relationgroupstructure' => array('Relation Group', 'structure/relationgroup/main', 'fa fa-sitemap fa16px', 'MASTER', A_ACCESS, array()),
                    'relationtypestructure' => array('Relation Type', 'structure/relationtype/main', 'fa fa-crosshairs fa16px', 'MASTER', A_ACCESS, array()),
                    'layergroupstructure' => array('Layer Group', 'structure/layergroup/main', 'fa fa-sitemap fa16px', 'MASTER', A_ACCESS, array()),
                    'layertypestructure' => array('Layer Type', 'structure/layertype/main', 'fa fa-crosshairs fa16px', 'MASTER', A_ACCESS, array()),
                )),
            'annotation' => array('Annotation', 'annotation/main', 'fa fa-align-justify fa16px', '', A_ACCESS, array(
                    //'lexicalAnnotation' => array('Frame Mode', 'annotation/main/formLexicalAnnotation', 'fa fa-file-text-o fa16px', '', A_ACCESS, array()),
                    //'cnxAnnotation' => array('Construction Mode', 'annotation/main/formConstructionalAnnotation', 'fa fa-th fa16px', '', A_ACCESS, array()),
                    'corpusAnnotation' => array('Corpus Mode', 'annotation/main/formCorpusAnnotation', 'fa fa-file-text fa16px', '', A_ACCESS, array()),
                    'layers' => array('Manage Layers', '^annotation/layer/formManager', 'fa fa-list fa16px', 'JUNIOR', A_ACCESS, array()),
                )),
            'reports' => array('Reports', 'main/reports', 'fa fa-newspaper-o fa16px', '', A_ACCESS, array(
                   'framereport' => array('Frames', 'report/frame/main', 'fa fa-list-alt fa16px', '', A_ACCESS, array()),
                   //'cxnreport' => array('Constructions', 'report/cxn/main', 'fa fa-th fa16px', '', A_ACCESS, array()),
                )),
            'grapher' => array('Grapher', 'main/grapher', 'fa fa-share-alt fa16px', '', A_ACCESS, array(
                    'fullgrapher' => array('Frames & CxN', 'grapher/grapher/main', 'fa fa-link fa16px', '', A_ACCESS, array()),
                    //'domaingrapher' => array('Frames by Domain', 'grapher/domain/main', 'fa fa-link fa16px', '', A_ACCESS, array()),
                )),
            'editor' => array('Editor', 'main/visualeditor', 'fa fa-arrows fa16px', 'ADMIN', A_ACCESS, array(
                    'frameeditor' => array('Frame Relation', 'visualeditor/frame/main', 'fa fa-list-alt fa16px', 'MASTER', A_ACCESS, array()),
                    'corenesseditor' => array('Coreness', 'visualeditor/frame/coreness', 'fa fa-th-list fa16px', 'MASTER', A_ACCESS, array()),
                    'cxneditor' => array('CxN Relation', 'visualeditor/cxn/main', 'fa fa-list-alt fa16px', 'MASTER', A_ACCESS, array()),
                    'cxnframeeditor' => array('CxN-Frame Relation', 'visualeditor/cxnframe/main', 'fa fa-list-alt fa16px', 'MASTER', A_ACCESS, array()),
                )),
            'utils' => array('Utils', 'main/utils/', 'fa fa-briefcase fa16px', 'MASTER', A_ACCESS, array(
                    'importWSDoc' => array('Import WS/Documen', 'utils/import/formImportWSDoc', 'fa fa-upload fa16px', 'ADMIN', A_ACCESS, array()),
                    'exportDocWf' => array('Export Doc-Wf', 'utils/export/formExportDocWf', 'fa fa-download fa16px', 'ADMIN', A_ACCESS, array()),
                    'importLexWf' => array('Import Wf-Lexeme', 'utils/import/formImportLexWf', 'fa fa-upload fa16px', 'MASTER', A_ACCESS, array()),
                    'importMWE' => array('Import MWE', 'utils/import/formImportMWE', 'fa fa-upload fa16px', 'MASTER', A_ACCESS, array()),
                    'importFullText' => array('Import FullText', 'utils/import/formImportFullText', 'fa fa-upload fa16px', 'ADMIN', A_ACCESS, array()),
                    'exportFrames' => array('Export Frames', 'utils/export/formExportFrames', 'fa fa-download fa16px', 'ADMIN', A_ACCESS, array()),
                    'importFrames' => array('Import Frames', 'utils/import/formImportFrames', 'fa fa-upload fa16px', 'ADMIN', A_ACCESS, array()),
                    'exportCxnFS' => array('Export Cxn as FS', 'utils/export/formExportCxnFS', 'fa fa-download fa16px', 'ADMIN', A_ACCESS, array()),
                )),
            'messages' => array('Messages', 'auth/message/main', 'fa fa-envelope-o fa16px', '', A_ACCESS, array(
                    'mailmsg' => array('Mail Message', 'auth/message/formMail', 'fa fa-envelope-o fa16px', '', A_ACCESS, array()),
                )),
            'language' => array('Language', 'main/language', 'fa fa-flag-checkered fa16px', '', A_ACCESS, array(
                    'sq' => array('Albanian', 'main/changeLanguage/sq', 'fnbrFlagSq', '', A_ACCESS, array()),
                    'ar' => array('Arabic', 'main/changeLanguage/ar', 'fnbrFlagAr', '', A_ACCESS, array()),
                    'zh' => array('Chinese', 'main/changeLanguage/zh', 'fnbrFlagZh', '', A_ACCESS, array()),
                    'en' => array('English', 'main/changeLanguage/en', 'fnbrFlagEn', '', A_ACCESS, array()),
                    'fi' => array('Finnish', 'main/changeLanguage/fi', 'fnbrFlagFi', '', A_ACCESS, array()),
                    'fr' => array('French', 'main/changeLanguage/fr', 'fnbrFlagFr', '', A_ACCESS, array()),
                    'de' => array('German', 'main/changeLanguage/de', 'fnbrFlagDe', '', A_ACCESS, array()),
                    'iw' => array('Hebrew', 'main/changeLanguage/iw', 'fnbrFlagIw', '', A_ACCESS, array()),
                    'it' => array('Italian', 'main/changeLanguage/it', 'fnbrFlagIt', '', A_ACCESS, array()),
                    'jp' => array('Japanese', 'main/changeLanguage/jp', 'fnbrFlagJp', '', A_ACCESS, array()),
                    'ko' => array('Korean', 'main/changeLanguage/ko', 'fnbrFlagKo', '', A_ACCESS, array()),
                    'lt' => array('Lituan', 'main/changeLanguage/lt', 'fnbrFlagLt', '', A_ACCESS, array()),
                    'pt' => array('Portuguese', 'main/changeLanguage/pt', 'fnbrFlagPt', '', A_ACCESS, array()),
                    'es' => array('Spanish', 'main/changeLanguage/es', 'fnbrFlagEs', '', A_ACCESS, array()),
                    'se' => array('Swedish', 'main/changeLanguage/se', 'fnbrFlagSe', '', A_ACCESS, array()),
                    'ru' => array('Russian', 'main/changeLanguage/ru', 'fnbrFlagRu', '', A_ACCESS, array()),
                )),
            'profile' => array('Profile', 'main/profile', 'fa fa-info fa16px', '', A_ACCESS, array(
                    'myprofile' => array('My Profile', 'profile/formMyProfile', 'fa fa-credit-card fa16px', '', A_ACCESS, array()),
                    'changePass' => array('Change Password', 'profile/formChangePassword', 'fa fa-lock fa16px', '', A_ACCESS, array()),
                    'logout' => array('Logout', 'auth/login/logout', 'fa fa-sign-out fa16px', '', A_ACCESS, array()),
                )),
        ))
);
