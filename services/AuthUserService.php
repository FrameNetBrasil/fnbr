<?php

use fnbr\auth\models\Person,
    fnbr\auth\models\User;

class AuthUserService extends MService
{
    public function auth0Login($userInfo) {
        $userData = new PlainObject([
            'auth0IdUser' => $userInfo['user_id'],
            'email' => $userInfo['email'],
            'auth0CreatedAt' => $userInfo['created_at'],
            'name' => $userInfo['name'],
            'nick' => $userInfo['nickname']
        ]);
        mdump($userData);
        $person = new Person();
        $result = $person->listByFilter($userData)->asQuery()->getResult();
        if (count($result) == 0) {
            $user = new User();
            $user->createPersonUser($userData);
            return 'new';
        } else {
            $user = new User();
            $user->getByIdPerson($result[0]['idPerson']);
            if ($user->getStatus() == '0') {
                return 'pending';
            } else {
                $user->registerLogin();
                $login = new MLogin($user);
                $auth = new MAuth();
                $auth->setLogin($login);
                $auth->setLoginLogUserId($user->getId());
                $auth->setLoginLog($login->getLogin());
                Manager::logMessage("[LOGIN] Authenticated {$user->getLogin()}");
                return 'logged';
            }
        }
    }

}
