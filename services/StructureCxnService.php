<?php



class StructureCxnService extends MService
{

    public function listCxns($data, $idLanguage = '')
    {
        $cxn = new mfn\models\Construction();
        $filter = (object)['ce' => $data->ce, 'cxn' => $data->cxn, 'active' => $data->active, 'idLanguage' => $idLanguage];
        $cxns = $cxn->listByFilter($filter)->asQuery()->getResult(\FETCH_ASSOC);
        $result = array();
        foreach ($cxns as $row) {
            $node = array();
            $node['id'] = 'c' . $row['idConstruction'];
            $node['text'] = $row['name'];
            $node['state'] = 'closed';
            $node['entry'] = $row['entry'];
            $result[] = $node;
        }
        return $result;
    }

    public function listCEs($idCxn, $idLanguage)
    {
        $result = array();
        $cxn = new mfn\models\Construction($idCxn);
        $ces = $cxn->listCE()->asQuery()->getResult();
        foreach ($ces as $ce) {
            $node = array();
            $node['id'] = 'e' . $ce['idConstructionElement'];
            $style = 'background-color:#' . $ce['rgbBg'] . ';color:#' . $ce['rgbFg'] . ';';
            $node['text'] = "<span style='{$style}'>" . $ce['name'] . "</span>";
            $node['state'] = 'closed';//'open';
            $node['entry'] = $ce['entry'];
            //$node['iconCls'] = 'icon-blank fa-icon fa fa-circle';
            $result[] = $node;
        }
        return json_encode($result);
    }

    public function listCEsConstraintsCX($idCxn, $idLanguage)
    {
        $result = [];
        $ces = json_decode($this->listCEs($idCxn, $idLanguage));
        foreach ($ces as $ce) {
            $result[] = $ce;
        }
        $cxs = json_decode($this->listConstraintsCX($idCxn, $idLanguage));
        foreach ($cxs as $cx) {
            $result[] = $cx;
        }
        return json_encode($result);
    }

    public function listConstraintsCE($idConstructionElement, $idLanguage)
    {
        $service = MApp::getService('', '', 'structureconstraints');
        $result = $service->listConstraintsCE($idConstructionElement);
        return $result;
    }

    public function listConstraintsCN($idConstraint, $idLanguage)
    {
        $service = MApp::getService('', '', 'structureconstraints');
        $result = $service->listConstraintsCN($idConstraint);
        return $result;
    }

    public function listConstraintsCNCN($idConstraint, $idLanguage)
    {
        $service = MApp::getService('', '', 'structureconstraints');
        $result = $service->listConstraintsCNCN($idConstraint);
        return $result;
    }

    public function listConstraintsCX($idConstruction, $idLanguage)
    {
        $service = MApp::getService('', '', 'structureconstraints');
        $result = $service->listConstraintsCX($idConstruction);
        return $result;
    }

    public function listSubCorpus($idLU)
    {
        $sc = new mfn\models\ViewSubCorpusLU();
        $scs = $sc->listByLU($idLU)->asQuery()->getResult();
        foreach ($scs as $sc) {
            $node = array();
            $node['id'] = 's' . $sc['idSubCorpus'];
            $node['text'] = $sc['name'] . ' [' . $sc['quant'] . ']';
            $node['state'] = 'open';
            $result[] = $node;
        }
        $this->data->result = $result;
        return json_encode($result);
    }

    public function getSubCorpusTitle($idSubCorpus, $idLanguage, $isCxn)
    {
        $sc = $isCxn ? new mfn\models\ViewSubCorpusCxn() : new mfn\models\ViewSubCorpusLU();
        $title = $sc->getTitle($idSubCorpus, $idLanguage);
        return $title;
    }

    public function getDocumentTitle($idDocument, $idLanguage)
    {
        $doc = new mfn\models\Document();
        $filter = (object)['idDocument' => $idDocument];
        $result = $doc->listByFilter($filter)->asQuery()->getResult();
        return 'Document:' . $result[1];
    }

    public function decorateSentence($sentence, $labels)
    {
        $decorated = "";
        $ni = "";
        $i = 0;
        $sentence = utf8_decode($sentence);
        foreach ($labels as $label) {
            $style = 'background-color:#' . $label[3] . ';color:#' . $label[2] . ';';
            if ($label[0] >= 0) {
                $decorated .= substr($sentence, $i, $label[0] - $i);
                $decorated .= "<span style='{$style}'>" . substr($sentence, $label[0], $label[1] - $label[0] + 1) . "</span>";
                $i = $label[1] + 1;
            } else { // null instantiation
                $ni .= "<span style='{$style}'>" . $label[4] . "</span> " . $decorated;
            }
        }
        $decorated = utf8_encode($ni . $decorated . substr($sentence, $i));
        return $decorated;
    }

    public function listAnnotationSet($idSubCorpus)
    {
        $as = new mfn\models\ViewAnnotationSet();
        $sentences = $as->listBySubCorpus($idSubCorpus)->asQuery()->getResult();
        $annotation = $as->listFECEBySubCorpus($idSubCorpus);
        $result = array();
        foreach ($sentences as $sentence) {
            $node = array();
            $node['idAnnotationSet'] = $sentence[0];
            $node['idSentence'] = $sentence[1];
            if ($annotation[$sentence[1]]) {
                $node['text'] = $this->decorateSentence($sentence[2], $annotation[$sentence[1]]);
            } else {
                $node['text'] = $sentence[2];
            }
            $node['status'] = $sentence[3];
            $result[] = $node;
        }
        return json_encode($result);
    }

    public function getLayers($params, $idLanguage)
    {
        $idSentence = $params->idSentence;
        $idAnnotationSet = $params->idAnnotationSet;

        $layers = array(
            "words" => NULL,
            "frozenColumns" => NULL,
            "columns" => NULL,
            "labels" => NULL,
            "layers" => NULL,
            "labelTypes" => NULL,
            "nis" => NULL,
        );

        $as = new mfn\models\AnnotationSet($idAnnotationSet);

        // get words/chars
        $wordsChars = $as->getWordsChars($idSentence);
        $words = $wordsChars->words;
        $chars = $wordsChars->chars;

        $result = array();
        foreach ($words as $i => $word) {
//            $field = 'wf' . $word[0];
            $fieldData = $i; //$field . '_data';
            $result[$fieldData]->word = $word[1];
            $result[$fieldData]->startChar = $word[2];
            $result[$fieldData]->endChar = $word[3];
        }
        $layers['words'] = json_encode($result);

        $result = array();
        foreach ($chars as $i => $char) {
            $fieldData = 'wf' . $i; //$field . '_data';
            $result[$fieldData]->order = $char[0];
            $result[$fieldData]->char = $char[1];
            $result[$fieldData]->word = $char[2];
        }
        $layers['chars'] = json_encode($result);

        // get hiddenColumns/frozenColumns/Columns using $words
        $frozenColumns[] = array(
            "field" => "layer",
            "width" => '60',
            "title" => "S_" . $idSentence,
            "formatter" => "annotation.cellLayerFormatter",
            "styler" => "annotation.cellStyler"
        );
        $columns[] = array("field" => "idAnnotationSet", "hidden" => 'true', "formatter" => "", "styler" => "");
        $columns[] = array("field" => "idLayerType", "hidden" => 'true', "formatter" => "", "styler" => "");
        $columns[] = array("field" => "idLayer", "hidden" => 'true', "formatter" => "", "styler" => "");
        $columns[] = array(
            "hidden" => 'false',
            "field" => "ni",
            "width" => "90",
            "resizable" => "true",
            "title" => "NI",
            "formatter" => "annotation.cellNIFormatter",
            "styler" => ""
        );

        foreach ($chars as $i => $char) {
            $width = 15;
            $columns[] = array(
                "hidden" => 'false',
                "field" => 'wf' . $i,
                "width" => 13,
                "resizable" => "false",
                "title" => $char[1],
                "formatter" => "annotation.cellFormatter",
                "styler" => "annotation.cellStyler"
            );
        }
        $layers['columns'] = $columns;
        $layers['frozenColumns'] = $frozenColumns;

        // get Layers
        $result = array();
        $asLayers = $as->getLayers($idSentence);
        foreach ($asLayers as $row) {
            $result[$row[0]] = ['idAnnotationSet' => $row[2], 'nameLayer' => $row[1], 'currentLabel' => '0', 'currentLabelPos' => 0];
        }
        $layers['layers'] = json_encode($result);

        // get AnnotationSets
        $result = array();
        $annotationSets = $as->getAnnotationSets($idSentence);
        foreach ($annotationSets as $row) {
            $result[$row[0]] = ['idAnnotationSet' => $row[0], 'name' => $row[1], 'show' => true];
        }
        $layers['annotationSets'] = json_encode($result);

        // get Labels
        $result = array();
        $asLabels = $as->getLabels($idSentence);
        foreach ($asLabels as $row) {
            $result[$row[0]][$row[1]] = ['idLabelType' => $row[2]];
        }
        $layers['labels'] = json_encode($result);

        // get LabelTypes
        $result = array();
        // GL-GF
        $queryLabelType = $as->getLabelTypesGLGF($idSentence)->asQuery();
        $rows = $queryLabelType->getResult();
        list($idLayer, $idLabelType, $labelType, $idColor, $coreType) = $queryLabelType->getColumnNumbers('idLayer,idLabelType,labelType,idColor,coreType');
        foreach ($rows as $row) {
            $result[$row[$idLayer]][$row[$idLabelType]] = array('label' => $row[$labelType], 'idColor' => $row[$idColor], 'coreType' => $row[$coreType]);
        }
        // GL
        $queryLabelType = $as->getLabelTypesGL($idSentence)->asQuery();
        $rows = $queryLabelType->getResult();
        list($idLayer, $idLabelType, $labelType, $idColor, $coreType) = $queryLabelType->getColumnNumbers('idLayer,idLabelType,labelType,idColor,coreType');
        foreach ($rows as $row) {
            $result[$row[$idLayer]][$row[$idLabelType]] = array('label' => $row[$labelType], 'idColor' => $row[$idColor], 'coreType' => $row[$coreType]);
        }
        // FE
        $queryLabelType = $as->getLabelTypesFE($idSentence);
        $rows = $queryLabelType->getResult();
        list($idLayer, $idLabelType, $labelType, $idColor, $coreType) = $queryLabelType->getColumnNumbers('idLayer,idLabelType,labelType,idColor,coreType');
        foreach ($rows as $row) {
            $result[$row[$idLayer]][$row[$idLabelType]] = array('label' => $row[$labelType], 'idColor' => $row[$idColor], 'coreType' => $row[$coreType]);
        }
        // CE
        $queryLabelType = $as->getLabelTypesCE($idSentence);
        $rows = $queryLabelType->getResult();
        list($idLayer, $idLabelType, $labelType, $idColor, $coreType) = $queryLabelType->getColumnNumbers('idLayer,idLabelType,labelType,idColor,coreType');
        foreach ($rows as $row) {
            $result[$row[$idLayer]][$row[$idLabelType]] = array('label' => $row[$labelType], 'idColor' => $row[$idColor], 'coreType' => $row[$coreType]);
        }
        $layers['labelTypes'] = json_encode($result);

        // get NIs
        //$niFields = array();
        $result = array();
        $queryNI = $as->getNI($idSentence, $idLanguage);
        $rows = $queryNI->getResult();
        list($idLayer, $idLabel, $feName, $idInstantiationType, $instantiationType, $idColor, $idLabelType) = $queryNI->getColumnNumbers('idLayer,idLabel,feName,idInstantiationType,instantiationType,idColor,idLabelType');
        foreach ($rows as $row) {
            $result[$row[$idLayer]][$row[$idLabelType]] = array(
                'fe' => $row[$feName],
                'idInstantiationType' => $row[$idInstantiationType],
                'label' => $row[$instantiationType],
                //'idSentenceWord' => $row[$idSentenceWord],
                'idColor' => $row[$idColor]
            );
            //$niFields[$row[$idLayer]] = 'wf' . $row[$idSentenceWord];
        }
        $layers['nis'] = (count($result) > 0) ? json_encode($result) : "{}";
        //$layers['niFields'] = json_encode($niFields);

        return $layers;
    }

    public function getLayersData($params, $idLanguage)
    {
        $idSentence = $params->idSentence;
        $idAnnotationSet = $params->idAnnotationSet;

        $as = new mfn\models\AnnotationSet($idAnnotationSet);
        $result = array();
        $queryLayersData = $as->getLayersData($idSentence);
        $unorderedRows = $queryLayersData->getResult();
        list($idAnnotationSet, $idLayerType, $idLayer, $nameLayer, $startChar, $endChar, $idLabelType, $idLabel) = $queryLayersData->getColumnNumbers('idAnnotationSet,idLayerType,idLayer,layer,startChar,endChar,idLabelType,idLabel');

        // get the annotationsets
        $aSet = array();
        foreach ($unorderedRows as $row) {
            $aSet[$row[$idAnnotationSet]][] = $row;
        }
        // reorder rows to put Target on top of each annotatioset
        $rows = array();
        $idHeaderLayer = -1;
        foreach ($aSet as $asRows) {
            $hasTarget = false;
            foreach ($asRows as $row) {
                if ($row[$nameLayer] == 'Target') {
                    $row[$idLayerType] = 0;
                    $rows[] = $row;
                    $hasTarget = true;
                }
            }
            if ($hasTarget) {
                foreach ($asRows as $row) {
                    if ($row[$nameLayer] != 'Target') {
                        $rows[] = $row;
                    }
                }
            } else {
                $headerLayer = $asRows[0];
                $headerLayer[$nameLayer] = 'x';
                $headerLayer[$startChar] = -1;
                $headerLayer[$idLayerType] = 0;
                $headerLayer[$idLayer] = $idHeaderLayer--;
                $rows[] = $headerLayer;
                foreach ($asRows as $row) {
                    $rows[] = $row;
                }
            }
        }

        $layersToShow = Manager::getSession()->mfnLayers;
        if ($layersToShow == '') {
            $user = Manager::getLogin()->getUser();
            $layersToShow = Manager::getSession()->mfnLayers = $user->getConfigData('mfnLayers');
        }
        $wordsChars = $as->getWordsChars($idSentence);
        $chars = $wordsChars->chars;

        $line = [];
        $idLayerRef = -1;
        foreach ($rows as $row) {
            $idLT = $row[$idLayerType];
            if ($idLT != 0) {
                if (!in_array($idLT, $layersToShow)) {
                    //  mdump('*'.$idLayerType);
                    continue;
                }
            }
            if ($row[$idLayer] != $idLayerRef) {
                $line[$row[$idLayer]] = new \stdclass();
                $line[$row[$idLayer]]->idAnnotationSet = $row[$idAnnotationSet];
                $line[$row[$idLayer]]->idLayerType = $row[$idLayerType];
                $line[$row[$idLayer]]->idLayer = $row[$idLayer];
                $line[$row[$idLayer]]->layer = ($row[$idLayerType] == 0) ? 'AS_' . $row[$idAnnotationSet] : $row[$nameLayer];
                $line[$row[$idLayer]]->ni = '';
                $line[$row[$idLayer]]->show = true;
                $idLayerRef = $row[$idLayer];
            }
            if ($row[$startChar] > -1) {
                $posChar = $row[$startChar];
                $i = 0;
                while ($posChar <= $row[$endChar]) {
                    $field = 'wf' . $posChar;
                    if ($row[$nameLayer] == 'Target') {
                        $line[$row[$idLayer]]->$field = $chars[$posChar][1];
                    } else {
                        $line[$row[$idLayer]]->$field = $row[$idLabelType];
                    }
                    $posChar += 1;
                }
            }
        }
        // last, create data
        $data = array();
        foreach ($line as $layer) {
            $data[] = $layer;
        }
        return json_encode($data);
        //return $data;
    }

    public function putLayers($layers)
    {
        $annotationSet = new mfn\models\AnnotationSet();
        $annotationSet->putLayers($layers);
    }

    public function addFELayer($idAnnotationSet)
    {
        $annotationSet = new mfn\models\AnnotationSet($idAnnotationSet);
        $annotationSet->addFELayer();
        $this->render();
    }

    public function delFELayer($idAnnotationSet)
    {
        $annotationSet = new mfn\models\AnnotationSet($idAnnotationSet);
        $annotationSet->delFELayer();
        $this->render();
    }

    public function listCnx($cnx = '', $idLanguage = '')
    {
        $construction = new mfn\models\Construction();
        $filter = (object)['cnx' => $cnx, 'idLanguage' => $idLanguage];
        $constructions = $construction->listByFilter($filter)->asQuery()->chunkResult('idConstruction', 'name');
        $result = array();
        foreach ($constructions as $idCnx => $name) {
            $node = array();
            $node['id'] = 'c' . $idCnx;
            $node['text'] = $name;
            $node['state'] = 'closed';
            $result[] = $node;
        }
        return json_encode($result);
    }

    public function listSubCorpusCnx($idCnx)
    {
        $sc = new mfn\models\SubCorpus();
        $scs = $sc->listByCnx($idCnx)->asQuery()->getResult();
        foreach ($scs as $sc) {
            $node = array();
            $node['id'] = 's' . $sc[0];
            $node['text'] = $sc[1] . ' [' . $sc[2] . ']';
            $node['state'] = 'open';
            $result[] = $node;
        }
        return json_encode($result);
    }

    public function headerMenu($wordform)
    {
        $wf = new mfn\models\WordForm();
        $lus = $wf->listLUByWordForm($wordform);
        return json_encode($lus);
    }

    public function addManualSubcorpus($data)
    {
        $sc = new mfn\models\SubCorpus();
        if ($data->idLU != '') {
            $sc->addManualSubcorpusLU($data);
        } else {
            $sc->addManualSubcorpusCnx($data);
        }
    }

    public function cnxGridData()
    {
        $cnx = new mfn\models\Construction();
        $criteria = $cnx->listAll();
        $data = $cnx->gridDataAsJSON($criteria);
        return $data;
    }

    public function listCorpus($corpus = '', $idLanguage = '')
    {
        $corpus = new mfn\models\Corpus();
        $filter = (object)['corpus' => $corpus, 'idLanguage' => $idLanguage];
        $corpora = $corpus->listByFilter($filter)->asQuery()->chunkResult('idCorpus', 'name');
        $result = array();
        foreach ($corpora as $idCorpus => $name) {
            $node = array();
            $node['id'] = 'c' . $idCorpus;
            $node['text'] = $name;
            $node['state'] = 'closed';
            $result[] = $node;
        }
        return json_encode($result);
    }

    public function listCorpusDocument($idCorpus)
    {
        $doc = new mfn\models\Document();
        $docs = $doc->listByCorpus($idCorpus)->asQuery()->getResult();
        foreach ($docs as $doc) {
            if ($doc[0]) {
                $node = array();
                $node['id'] = 'd' . $doc[0];
                $node['text'] = $doc[1] . ' [' . $doc[2] . ']';
                $node['state'] = 'open';
                $result[] = $node;
            }
        }
        return json_encode($result);
    }

    public function deleteCxn($idCxn)
    {
        mdump('deleteCxn ' . $idCxn);
        $cxn = new mfn\models\Construction($idCxn);
        $transaction = $cxn->beginTransaction();
        try {
            $cxnElement = new mfn\models\ConstructionElement();
            $filter = (object)['idConstruction' => $idCxn];
            $ces = $cxnElement->listByFilter($filter)->asQuery()->getResult();
            foreach ($ces as $ce) {
                $cxnElement->getById($ce['idConstructionElement']);
                $cxnElement->delete();
            }
            $cxn->delete();
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \exception($e->getMessage());
        }
    }

    public function deleteCxnElement($idCE)
    {
        mdump('deleteCE ' . $idCE);
        $ce = new mfn\models\ConstructionElement($idCE);
        $transaction = $ce->beginTransaction();
        try {
            $ce->delete();
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \exception($e->getMessage());
        }
    }

    public function addConstraintsCX($data)
    {
        try {
            $transaction = Manager::getDatabase(Manager::getConf('mfn.db'))->beginTransaction();
            if (($data->idEntityA1 != '') && ($data->idEntityA2 != '')) {
                $constraint = Base::createEntity('CN', 'con');
                Base::createEntityRelation($constraint->getIdEntity(), $data->relation, $data->idEntityA1, $data->idEntityA2);
                $constraint2 = Base::createEntity('CN', 'con');
                $cxn = new mfn\models\Construction($data->idConstruction);
                Base::createEntityRelation($constraint2->getIdEntity(), 'rel_constraint_constraint', $cxn->getIdEntity(), $constraint->getIdEntity());
            }
            if ($data->idEntityCE != '') {
                $constraint = Base::createEntity('CN', 'con');
                $frame = new mfn\models\Frame($data->idFrame);
                Base::createEntityRelation($constraint->getIdEntity(), $data->relationCEFrame, $data->idEntityCE, $frame->getIdEntity());
                $constraint2 = Base::createEntity('CN', 'con');
                $cxn = new mfn\models\Construction($data->idConstruction);
                Base::createEntityRelation($constraint2->getIdEntity(), 'rel_constraint_constraint', $cxn->getIdEntity(), $constraint->getIdEntity());
            }
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \exception($e->getMessage());
        }
    }

    public function addConstraintsCE($data)
    {
        try {
            $transaction = Manager::getDatabase(Manager::getConf('mfn.db'))->beginTransaction();
            if ($data->idConstruction != '') {
                $constraint = Base::createEntity('CN', 'con');
                $ce = new mfn\models\ConstructionElement($data->idConstructionElement);
                $cxn = new mfn\models\Construction($data->idConstruction);
                Base::createEntityRelation($constraint->getIdEntity(), 'rel_constraint_cxn', $ce->getIdEntity(), $cxn->getIdEntity());
            }
            if ($data->idFrame != '') {
                $constraint = Base::createEntity('CN', 'con');
                $ce = new mfn\models\ConstructionElement($data->idConstructionElement);
                $frame = new mfn\models\Frame($data->idFrame);
                Base::createEntityRelation($constraint->getIdEntity(), 'rel_constraint_frame', $ce->getIdEntity(), $frame->getIdEntity());
            }
            if ($data->idFrameFamily != '') {
                $constraint = Base::createEntity('CN', 'con');
                $ce = new mfn\models\ConstructionElement($data->idConstructionElement);
                $frame = new mfn\models\Frame($data->idFrameFamily);
                Base::createEntityRelation($constraint->getIdEntity(), 'rel_constraint_framefamily', $ce->getIdEntity(), $frame->getIdEntity());
            }
            if ($data->idConstructionBefore != '') {
                $constraint = Base::createEntity('CN', 'con');
                $ce = new mfn\models\ConstructionElement($data->idConstructionElement);
                $ceBefore = new mfn\models\ConstructionElement($data->idConstructionBefore);
                Base::createEntityRelation($constraint->getIdEntity(), 'rel_constraint_before', $ce->getIdEntity(), $ceBefore->getIdEntity());
            }
            if ($data->idConstructionMeets != '') {
                $constraint = Base::createEntity('CN', 'con');
                $ce = new mfn\models\ConstructionElement($data->idConstructionElement);
                $ceMeets = new mfn\models\ConstructionElement($data->idConstructionMeets);
                Base::createEntityRelation($constraint->getIdEntity(), 'rel_constraint_meets', $ce->getIdEntity(), $ceMeets->getIdEntity());
            }
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \exception($e->getMessage());
        }
    }

    public function addConstraintsCN($data)
    {
        mdump($data);
        try {
            $transaction = Manager::getDatabase(Manager::getConf('mfn.db'))->beginTransaction();
            if ($data->idConstructionElement != '') {
                $constraint = Base::createEntity('CN', 'con');
                $cn = new mfn\models\Constraint($data->idConstraint);
                $ce = new mfn\models\ConstructionElement($data->idConstructionElement);
                Base::createEntityRelation($constraint->getIdEntity(), 'rel_constraint_element', $cn->getId(), $ce->getIdEntity());
            }
            if ($data->idConstruction != '') {
                $constraint = Base::createEntity('CN', 'con');
                $cn = new mfn\models\Constraint($data->idConstraint);
                $cxn = new mfn\models\Construction($data->idConstruction);
                Base::createEntityRelation($constraint->getIdEntity(), 'rel_constraint_cxn', $cn->getId(), $cxn->getIdEntity());
            }
            if ($data->idFrame != '') {
                $constraint = Base::createEntity('CN', 'con');
                $cn = new mfn\models\Constraint($data->idConstraint);
                $frame = new mfn\models\Frame($data->idFrame);
                //Base::createEntityRelation($constraint->getIdEntity(), 'rel_constraint_frame', $cn->getId(), $frame->getIdEntity());
                Base::createEntityRelation($constraint->getIdEntity(), 'rel_evokes', $cn->getId(), $frame->getIdEntity());
            }
            if ($data->idFrameFamily != '') {
                $constraint = Base::createEntity('CN', 'con');
                $cn = new mfn\models\Constraint($data->idConstraint);
                $frame = new mfn\models\Frame($data->idFrameFamily);
                Base::createEntityRelation($constraint->getIdEntity(), 'rel_constraint_framefamily', $cn->getId(), $frame->getIdEntity());
            }
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \exception($e->getMessage());
        }
    }


}
