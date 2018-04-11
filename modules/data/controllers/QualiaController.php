<?php

class QualiaController extends MController
{

    public function lookupData()
    {
        $type = $this->data->id;
        $idLanguage = Manager::getSession()->idLanguage;
        $model = new fnbr\models\Qualia();
        $criteria = $model->listForLookup($type, $idLanguage);
        $json = $model->gridDataAsJSON($criteria);
        $this->renderJSON($json);
    }


}