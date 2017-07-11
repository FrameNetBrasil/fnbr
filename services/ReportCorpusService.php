<?php

class ReportCorpusService extends MService
{

    public function getDataReportCorpus()
    {
        $idCorpus = $this->data->id;
        $corpus = new fnbr\models\Corpus($idCorpus);
        $query = $corpus->listAnnotationReport($this->data->sort, $this->data->order);
        $result = $query->getResult();
        return $result;
    }

    public function getDataReportDocument()
    {
        $idDocument = $this->data->id;
        $document = new fnbr\models\Document($idDocument);
        $options = [
            'fe' => $this->data->fe,
            'gf' => $this->data->gf,
            'pt' => $this->data->pt,
            'ni' => $this->data->ni,
        ];
        $query = $document->listAnnotationReport($options, $this->data->sort, $this->data->order);
        $result = $query->getResult();
        return $result;
    }


}
