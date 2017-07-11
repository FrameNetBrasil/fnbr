<?php

class TypeInstanceController extends MController
{
    public function lookupCoreType()
    {
        $model = new fnbr\models\TypeInstance();
        $result = $model->listCoreType()->asQuery()->getResult(\FETCH_ASSOC);
        $this->renderJSON($model->gridDataAsJSON($result));
    }

    public function lookupStatusType()
    {
        $model = new fnbr\models\TypeInstance();
        $result = $model->listStatusType()->asQuery()->getResult(\FETCH_ASSOC);
        mdump($result);
        $this->renderJSON($model->gridDataAsJSON($result));
    }

    public function lookupBFF()
    {
        $model = new fnbr\models\TypeInstance();
        $result = $model->listBFF()->asQuery()->getResult(\FETCH_ASSOC);
        $this->renderJSON($model->gridDataAsJSON($result));
    }

}