<?php

Manager::import("fnbr\models\*");

class GrapherService extends MService
{

    public function getRelationData()
    {
        $relation = new RelationType();
        $result = new \StdClass;
        $relations = $relation->listByFilter((object)['group' => 'rgp_frame_relations'])->asQuery()->getResult();
        foreach ($relations as $row) {
            $id = $row['entry'];
            $node = array();
            $node['id'] = $id;
            $node['label'] = $row['name'];
            $node['color'] = Manager::getConf("fnbr.color.{$id}");
            $node['idType'] = 'rgp_frame_relations';
            $node['default'] = (($id == 'rel_inheritance') || ($id == 'rel_subframe') || ($id == 'rel_using'));
            $result->$id = $node;
        }
        $relations = $relation->listByFilter((object)['group' => 'rgp_cxn_relations'])->asQuery()->getResult();
        foreach ($relations as $row) {
            $id = $row['entry'];
            $node = array();
            $node['id'] = $id;
            $node['label'] = $row['name'];
            $node['color'] = Manager::getConf("fnbr.color.{$id}");
            $node['idType'] = 'rgp_cxn_relations';
            $node['default'] = true;
            $result->$id = $node;
        }
        $relations = $relation->listByFilter((object)['entry' => 'rel_evokes'])->asQuery()->getResult();
        foreach ($relations as $row) {
            $id = $row['entry'];
            $node = array();
            $node['id'] = $id;
            $node['label'] = $row['name'];
            $node['color'] = Manager::getConf("fnbr.color.{$id}");
            $node['idType'] = 'rel_evokes';
            $node['default'] = true;
            $result->$id = $node;
        }
        $relations = $relation->listByFilter((object)['entry' => 'rel_hassemtype'])->asQuery()->getResult();
        mdump($relations);
        foreach ($relations as $row) {
            $id = $row['entry'];
            $node = array();
            $node['id'] = $id;
            $node['label'] = $row['name'];
            $node['color'] = Manager::getConf("fnbr.color.{$id}");
            $node['idType'] = 'rel_hassemtype';
            $node['default'] = false;
            $result->$id = $node;
        }
        $relations = $relation->listByFilter((object)['entry' => 'rel_elementof'])->asQuery()->getResult();
        foreach ($relations as $row) {
            $id = $row['entry'];
            $node = array();
            $node['id'] = $id;
            $node['label'] = $row['name'];
            $node['color'] = Manager::getConf("fnbr.color.{$id}");
            $node['idType'] = 'rel_elementof';
            $node['default'] = false;
            $result->$id = $node;
        }
        return $result;
    }

    public function listFrames($data, $idLanguage = '')
    {
        $frame = new ViewFrame();
        $filter = (object)['lu' => $data->lu, 'fe' => $data->fe, 'frame' => $data->frame, 'idDomain' => $data->idDomain, 'idLanguage' => $idLanguage];
        $frames = $frame->listByFilter($filter)->asQuery()->getResult(\FETCH_ASSOC);
        $result = array();
        foreach ($frames as $row) {
            if (strpos($row['name'], '#') === false) {
                $node = array();
                $node['id'] = 'f' . $row['idEntity'];
                $node['text'] = $row['name'];
                $node['state'] = 'open';
                $node['iconCls'] = 'icon-blank fa fa-square fa16px entity_frame';
                $node['entry'] = $row['entry'];
                $result[] = $node;
            }
        }
        return $result;
    }

    public function getFrame($id)
    {
        $frame = new Frame();
        $filter = (object)['idFrame' => $id];
        $result = $frame->listByFilter($filter)->asQuery()->getResult();
        return json_encode($result[0]);
    }

    public function listCxns($data, $idLanguage = '')
    {
        $cxn = new Construction();
        $filter = (object)['cxn' => $data->cxn, 'idLanguage' => $idLanguage];
        $cxns = $cxn->listByFilter($filter)->asQuery()->getResult(\FETCH_ASSOC);
        $result = array();
        foreach ($cxns as $row) {
            if (strpos($row['name'], '#') === false) {
                $node = array();
                $node['id'] = 'c' . $row['idEntity'];
                $node['text'] = $row['name'];
                $node['state'] = 'open';
                $node['iconCls'] = 'icon-blank fa fa-circle fa16px entity_cxn';
                $node['entry'] = $row['entry'];
                $result[] = $node;
            }
        }
        return $result;
    }

    public function getCxn($id)
    {
        $cxn = new Construction();
        $filter = (object)['idConstruction' => $id];
        $result = $cxn->listByFilter($filter)->asQuery()->getResult();
        return json_encode($result[0]);
    }

    public function getRelations($idEntity, $chosen, $level = 1)
    {
        $relations = [];
        for ($l = 1; $l <= $level; $l++) {
            if ($l == 1) {
                $relations = $this->getEntityRelationsById($idEntity, $chosen);
            } else if ($l == 2) {
                $base = $relations;
                foreach ($base as $rel) {
                    if ($rel['source']->id == $idEntity) {
                        $idTarget = $rel['target']->id;
                        $add = $this->getEntityDirectRelations($idTarget, $chosen);
                        $relations = array_merge($relations, $add);
                    }
                }
            }
        }
        return json_encode($relations);
    }

    public function getEntityRelationsById($idEntity, $chosen)
    {
        $relations = array_merge($this->getEntityDirectRelations($idEntity, $chosen), $this->getEntityInverseRelations($idEntity, $chosen));
        if (count($relations == 0)) {
            $entity = new Entity($idEntity);
            $node = (object)[
                'id' => $idEntity,
                'type' => $entity->getTypeNode(),
                'name' => $entity->getName()
            ];
            $relations[] = ['source' => $node, 'type' => 'rel_none', 'target' => $node];
        }
        return $relations;
    }

    public function getEntityDirectRelations($idEntity, $chosen)
    {
        $entity = new Entity($idEntity);
        $relations = [];
        $node0 = (object)[
            'id' => $idEntity,
            'type' => $entity->getTypeNode(),
            'name' => $entity->getName()
        ];
        $directRelations = $entity->listDirectRelations();
        foreach ($directRelations as $entry => $row) {
            foreach ($row as $r) {
                $node1 = (object)[
                    'id' => $r['idEntity'],
                    'type' => $r['type'],
                    'name' => $r['name']
                ];
                if ($chosen[$entry]) {
                    $relations[] = ['source' => $node0, 'type' => $entry, 'target' => $node1];
                }
            }
        }
        return $relations;
    }

    public function getEntityInverseRelations($idEntity, $chosen)
    {
        $entity = new Entity($idEntity);
        $relations = [];
        $node1 = (object)[
            'id' => $idEntity,
            'type' => $entity->getTypeNode(),
            'name' => $entity->getName()
        ];
        $inverseRelations = $entity->listInverseRelations();
        foreach ($inverseRelations as $entry => $row) {
            mdump($row);
            foreach ($row as $r) {
                $node0 = (object)[
                    'id' => $r['idEntity'],
                    'type' => $r['type'],
                    'name' => $r['name']
                ];
                if ($chosen[$entry]) {
                    $relations[] = ['source' => $node0, 'type' => $entry, 'target' => $node1];
                }
            }
        }
        return $relations;
    }

    public function getEntitiesRelations($idEntity1, $idEntity2, $type)
    {
        $relations = $this->getElementsRelationByHosts($idEntity1, $idEntity2, $type);
        return json_encode($relations);
    }

    public function getElementsRelationByHosts($idEntity1, $idEntity2, $type)
    {
        $relations1 = $this->getElementsRelationByEntity($idEntity1);
        $elements1 = [];
        foreach ($relations1 as $r) {
            $elements1[] = $r['target']->id;
        }
        $relations2 = $this->getElementsRelationByEntity($idEntity2);
        $elements2 = [];
        foreach ($relations2 as $r) {
            $elements2[] = $r['target']->id;
        }
        $relationsE = $this->getElement2ElementRelation($elements1, $elements2, $type);
        $relations = array_merge($relations1, $relations2, $relationsE);
        return $relations;
    }

    public function getElementsRelationByEntity($idEntity)
    {
        $entity = new Entity($idEntity);
        $relations = [];
        $node0 = (object)[
            'id' => $idEntity,
            'type' => $entity->getTypeNode(),
            'name' => $entity->getName()
        ];
        $elementRelations = $entity->listElementRelations();
        foreach ($elementRelations as $entry => $row) {
            $i = 0;
            foreach ($row as $r) {
                $node1 = (object)[
                    'id' => $r['idEntity'],
                    'type' => $r['type'],
                    'name' => $r['name']
                ];
                $relations[] = ['source' => $node0, 'type' => $entry, 'target' => $node1];
            }
        }
        return $relations;
    }

    public function getElement2ElementRelation($elements1, $elements2, $type)
    {
        $entity = new Entity();
        $elementRelations = $entity->listElement2ElementRelation($elements1, $elements2, $type);
        foreach ($elementRelations as $entry => $row) {
            $node0 = (object)[
                'id' => $row['idEntity1'],
                'type' => $row['type1'],
                'name' => $row['name1']
            ];
            $node1 = (object)[
                'id' => $row['idEntity2'],
                'type' => $row['type2'],
                'name' => $row['name2']
            ];
            $relations[] = ['source' => $node0, 'type' => $type, 'target' => $node1];
        }
        return $relations;
    }

    public function getDirectRelations($frame, $chosen)
    {
        $relations = [];
        $node0 = (object)[
            'id' => $frame->getIdEntity(),
            'idFrame' => $frame->getId(),
            'name' => $frame->getName()
        ];
        $directRelations = $frame->listDirectRelations();
        foreach ($directRelations as $entry => $row) {
            $i = 0;
            foreach ($row as $r) {
                $node1 = (object)[
                    'id' => $r['idEntity'],
                    'idFrame' => $r['idFrame'],
                    'name' => $r['name']
                ];
                if ($chosen[$entry]) {
                    $relations[] = ['source' => $node0, 'type' => $entry, 'target' => $node1];
                }
            }
        }
        return $relations;
    }

    public function getInverseRelations($frame, $chosen)
    {
        $relations = [];
        $node0 = (object)[
            'id' => $frame->getIdEntity(),
            'idFrame' => $frame->getId(),
            'name' => $frame->getName()
        ];
        $inverseRelations = $frame->listInverseRelations();
        foreach ($inverseRelations as $entry => $row) {
            $i = 0;
            foreach ($row as $r) {
                $node1 = (object)[
                    'id' => $r['idEntity'],
                    'idFrame' => $r['idFrame'],
                    'name' => $r['name']
                ];
                if ($chosen[$entry]) {
                    $relations[] = ['source' => $node1, 'type' => $entry, 'target' => $node0];
                }
            }
        }
        return $relations;
    }

    public function getFrameRelationsByFrame($idFrame, $chosen)
    {
        $frame = new Frame($idFrame);
        $relations = array_merge($this->getDirectRelations($frame, $chosen), $this->getInverseRelations($frame, $chosen));
        return $relations;
    }

    public function getFrameRelations($id, $chosen, $level = 1)
    {
        $relations = [];
        for ($l = 1; $l <= $level; $l++) {
            if ($l == 1) {
                $relations = $this->getFrameRelationsByFrame($id, $chosen);
            } else if ($l == 2) {
                $base = $relations;
                foreach ($base as $rel) {
                    if ($rel['source']->idFrame == $id) {
                        $idFrame = $rel['target']->idFrame;
                        $frame = new Frame($idFrame);
                        $add = $this->getDirectRelations($frame, $chosen);
                        $relations = array_merge($relations, $add);
                    }
                }
            }
        }
        return $relations;
    }

    public function getDirectRelationsCxn($cxn, $chosen)
    {
        $relations = [];
        $node0 = (object)[
            'id' => $cxn->getIdEntity(),
            'idCxn' => $cxn->getId(),
            'type' => 'cxn',
            'name' => $cxn->getName()
        ];
        $directRelations = $cxn->listDirectRelations();
        foreach ($directRelations as $entry => $row) {
            $i = 0;
            foreach ($row as $r) {
                $node1 = (object)[
                    'id' => $r['idEntity'],
                    'idCxn' => $r['idConstruction'],
                    'type' => 'cxn',
                    'name' => $r['name']
                ];
                if ($chosen[$entry]) {
                    $relations[] = ['source' => $node0, 'type' => $entry, 'target' => $node1];
                }
            }
        }
        return $relations;
    }

    public function getInverseRelationsCxn($cxn, $chosen)
    {
        $relations = [];
        $node0 = (object)[
            'id' => $cxn->getIdEntity(),
            'idCxn' => $cxn->getId(),
            'type' => 'cxn',
            'name' => $cxn->getName()
        ];
        $inverseRelations = $cxn->listInverseRelations();
        foreach ($inverseRelations as $entry => $row) {
            $i = 0;
            foreach ($row as $r) {
                $node1 = (object)[
                    'id' => $r['idEntity'],
                    'idCxn' => $r['idConstruction'],
                    'type' => 'cxn',
                    'name' => $r['name']
                ];
                if ($chosen[$entry]) {
                    $relations[] = ['source' => $node1, 'type' => $entry, 'target' => $node0];
                }
            }
        }
        return $relations;
    }

    public function getEvokesRelationsCxn($cxn, $chosen)
    {
        $relations = [];
        $node0 = (object)[
            'id' => $cxn->getIdEntity(),
            'idCxn' => $cxn->getId(),
            'type' => 'cxn',
            'name' => $cxn->getName()
        ];
        $evokesRelations = $cxn->listEvokesRelations();
        foreach ($evokesRelations as $entry => $row) {
            $i = 0;
            foreach ($row as $r) {
                $node1 = (object)[
                    'id' => $r['idEntity'],
                    'idCxn' => $r['idFrame'],
                    'type' => 'frame',
                    'name' => $r['name']
                ];
                if ($chosen[$entry]) {
                    $relations[] = ['source' => $node1, 'type' => $entry, 'target' => $node0];
                }
            }
        }
        return $relations;
    }

    public function getCxnRelationsByCxn($idCxn, $chosen)
    {
        $cxn = new Construction($idCxn);
        $relations = array_merge($this->getDirectRelationsCxn($cxn, $chosen), $this->getInverseRelationsCxn($cxn, $chosen), $this->getEvokesRelationsCxn($cxn, $chosen));
        return $relations;
    }

    public function getCxnRelations($id, $chosen, $level = 1)
    {
        $relations = [];
        for ($l = 1; $l <= $level; $l++) {
            if ($l == 1) {
                $relations = $this->getCxnRelationsByCxn($id, $chosen);
            } else if ($l == 2) {
                $base = $relations;
                foreach ($base as $rel) {
                    if ($rel['source']->idCxn == $id) {
                        $idCxn = $rel['target']->idCxn;
                        $cxn = new Construction($idCxn);
                        $add = $this->getDirectRelationsCxn($cxn, $chosen);
                        $relations = array_merge($relations, $add);
                    }
                }
            }
        }
        return $relations;
    }

    public function getCxnStructure($idCxn)
    {
        $construction = new Construction($idCxn);
        $structure = $construction->getStructure();
        $nodes = [];
        $links = [];
        foreach ($structure as $node) {
            if (($node['label'] != 'rel_inheritance_cxn')) {
                $nodes[$node['idEntity']] = (object)[
                    'id' => $node['idEntity'],
                    'name' => $node['name'],
                    //'typeSystem' => $node['typeSystem'],
                    'type' => strtolower($node['typeSystem'])
                ];
                if ($node['source']) {
                    $links[] = [
                        'source' => $node['source'],
                        'target' => $node['idEntity'],
                        'type' => $node['label']
                    ];
                }
            }
        }
        $relations = [];
        foreach ($links as $link) {
            $relations[] = [
                'source' => $nodes[$link['source']],
                'target' => $nodes[$link['target']],
                'type' => $link['type']
            ];
        }
        return json_encode($relations);
    }

    ///
    /// Domain
    ///

    public function getEntityDomainRelationsById($entities, $chosen, $idDomain)
    {
        $inEntities = implode(',', $entities);
        $relations = array_merge(
            $this->getEntityDomainDirectRelations($inEntities, $chosen, $idDomain),
            $this->getEntityDomainInverseRelations($inEntities, $chosen, $idDomain),
            $this->getEntityDomainNoneRelations($inEntities, $idDomain)
        );
        return $relations;
    }

    public function getEntityDomainDirectRelations($inEntities, $chosen, $idDomain)
    {
        $relations = [];
        $entity = new Entity();
        $directRelations = $entity->listDomainDirectRelations($inEntities, $idDomain);
        foreach ($directRelations as $entry => $row) {
            if ($chosen[$row['relationType']]) {
                $node1 = (object)[
                    'id' => $row['idEntity1'],
                    'type' => $row['entity1Type'],
                    'name' => $row['entity1Name']
                ];
                $node2 = (object)[
                    'id' => $row['idEntity2'],
                    'type' => $row['entity2Type'],
                    'name' => $row['entity2Name']
                ];
                $relations[] = ['source' => $node1, 'type' => $row['relationType'], 'target' => $node2];
            }
        }
        return $relations;
    }

    public function getEntityDomainInverseRelations($inEntities, $chosen, $idDomain)
    {
        $relations = [];
        $entity = new Entity();
        $inverseRelations = $entity->listDomainInverseRelations($inEntities, $idDomain);
        foreach ($inverseRelations as $entry => $row) {
            if ($chosen[$row['relationType']]) {
                $node1 = (object)[
                    'id' => $row['idEntity1'],
                    'type' => $row['entity1Type'],
                    'name' => $row['entity1Name']
                ];
                $node2 = (object)[
                    'id' => $row['idEntity2'],
                    'type' => $row['entity2Type'],
                    'name' => $row['entity2Name']
                ];
                $relations[] = ['source' => $node1, 'type' => $row['relationType'], 'target' => $node2];
            }
        }
        return $relations;
    }

    public function getEntityDomainNoneRelations($inEntities, $idDomain)
    {
        $relations = [];
        $entity = new Entity();
        $noneRelations = $entity->listDomainNoneRelations($inEntities, $idDomain);
        foreach ($noneRelations as $entry => $row) {
            $node0 = (object)[
                'id' => $row['idEntity'],
                'type' => $row['entityType'],
                'name' => $row['entityName']
            ];
            $relations[] = ['source' => $node0, 'type' => 'rel_none', 'target' => $node0];
        }
        return $relations;
    }

    public function getConstraintRelationsByFrame($idEntityFrame, $chosen)
    {
        $relations = array_merge($this->getLURelationsByFrame($idEntityFrame, $chosen), $this->getFERelationsByFrame($idEntityFrame, $chosen));
        return $relations;
    }

    public function getLURelationsByFrame($idEntityFrame, $chosen)
    {
        $relations = [];
        $frame = new \fnbr\models\Frame();
        $frameData = $frame->getByIdEntity($idEntityFrame);
        $node0 = (object)[
            'id' => $idEntityFrame,
            'type' => 'frame',
            'name' => $frameData->name
        ];
        $lu = new \fnbr\models\ViewLU();
        $criteria = $lu->listByIdEntityFrame($idEntityFrame, \Manager::getSession()->idLanguage);
        $evokesRelations = $criteria->asQuery()->getResult();
        foreach ($evokesRelations as $er) {
            $node1 = (object)[
                'id' => $er['idEntity'],
                'type' => 'lu',
                'name' => $er['name']
            ];
            $relations[] = ['source' => $node1, 'type' => 'rel_evokes', 'target' => $node0];
            $criteria2 = $lu->listQualiaRelations($er['idEntity'], \Manager::getSession()->idLanguage);
            $qualiaRelations = $criteria2->asQuery()->getResult();
            foreach ($qualiaRelations as $qr) {
                $node2 = (object)[
                    'id' => $qr['idEntity2'],
                    'type' => 'lu',
                    'name' => $qr['name']
                ];
                $relationType = $qr['relationType'];
                if ($chosen[$relationType]) {
                    $relations[] = ['source' => $node1, 'type' => $relationType, 'target' => $node2];
                    $node3 = (object)[
                        'id' => $qr['idEntityFrame'],
                        'type' => 'frame',
                        'name' => $qr['nameFrame']
                    ];
                    $relations[] = ['source' => $node2, 'type' => 'rel_evokes', 'target' => $node3];
                }
            }
        }
        return $relations;
    }

    public function getFERelationsByFrame($idEntityFrame, $chosen)
    {
        $relations = [];
        $frame = new \fnbr\models\Frame();
        $frameData = $frame->getByIdEntity($idEntityFrame);
        $node0 = (object)[
            'id' => $idEntityFrame,
            'type' => 'frame',
            'name' => $frameData->name
        ];
        $fe = new \fnbr\models\ViewFrameElement();
        $criteria = $fe->listByIdEntityFrame($idEntityFrame, \Manager::getSession()->idLanguage);
        $feRelations = $criteria->asQuery()->getResult();
        foreach ($feRelations as $er) {
            $node1 = (object)[
                'id' => $er['idEntity'],
                'type' => 'fe',
                'name' => $er['name']
            ];
            $relations[] = ['source' => $node1, 'type' => 'rel_elementof', 'target' => $node0];
            $criteria2 = $fe->listFEFrameRelations($er['idEntity'], \Manager::getSession()->idLanguage);
            $feframeRelations = $criteria2->asQuery()->getResult();
            foreach ($feframeRelations as $fr) {
                if ($chosen['rel_constraint_frame']) {
                    $node2 = (object)[
                        'id' => $fr['idEntity'],
                        'type' => 'frame',
                        'name' => $fr['name']
                    ];
                    $relations[] = ['source' => $node1, 'type' => 'rel_constraint_frame', 'target' => $node2];
                }
            }
        }
        return $relations;
    }

    public function getDomainRelationData()
    {
        $relation = new RelationType();
        $result = new \StdClass;
        $relations = $relation->listByFilter((object)['group' => 'rgp_frame_relations'])->asQuery()->getResult();
        foreach ($relations as $row) {
            $id = $row['entry'];
            if ($id != 'rel_see_also') {
                $node = array();
                $node['id'] = $id;
                $node['label'] = $row['name'];
                $node['color'] = Manager::getConf("fnbr.color.{$id}");
                $node['idType'] = 'rgp_frame_relations';
                $node['default'] = (($id == 'rel_inheritance') || ($id == 'rel_subframe') || ($id == 'rel_using'));
                $result->$id = $node;
            }
        }
        $relations = $relation->listByFilter((object)['entry' => 'rel_evokes'])->asQuery()->getResult();
        foreach ($relations as $row) {
            $id = $row['entry'];
            $node = array();
            $node['id'] = $id;
            $node['label'] = $row['name'];
            $node['color'] = Manager::getConf("fnbr.color.{$id}");
            $node['idType'] = 'rel_evokes';
            $node['default'] = true;
            $result->$id = $node;
        }
        $relations = $relation->listByFilter((object)['entry' => 'rel_hassemtype'])->asQuery()->getResult();
        foreach ($relations as $row) {
            $id = $row['entry'];
            $node = array();
            $node['id'] = $id;
            $node['label'] = $row['name'];
            $node['color'] = Manager::getConf("fnbr.color.{$id}");
            $node['idType'] = 'rel_hassemtype';
            $node['default'] = false;
            $result->$id = $node;
        }
        $relations = $relation->listByFilter((object)['entry' => 'rel_elementof'])->asQuery()->getResult();
        foreach ($relations as $row) {
            $id = $row['entry'];
            $node = array();
            $node['id'] = $id;
            $node['label'] = $row['name'];
            $node['color'] = Manager::getConf("fnbr.color.{$id}");
            $node['idType'] = 'rel_elementof';
            $node['default'] = false;
            $result->$id = $node;
        }
        $relations = $relation->listByFilter((object)['group' => 'rgp_qualia'])->asQuery()->getResult();
        foreach ($relations as $row) {
            $id = $row['entry'];
            $node = array();
            $node['id'] = $id;
            $node['label'] = $row['name'];
            $node['color'] = Manager::getConf("fnbr.color.{$id}");
            $node['idType'] = 'rgp_frame_relations';
            $node['default'] = true;
            $result->$id = $node;
        }
        $relations = $relation->listByFilter((object)['entry' => 'rel_constraint_frame'])->asQuery()->getResult();
        foreach ($relations as $row) {
            $id = $row['entry'];
            $node = array();
            $node['id'] = $id;
            $node['label'] = $row['name'];
            $node['color'] = Manager::getConf("fnbr.color.{$id}");
            $node['idType'] = 'rel_constraint_fe';
            $node['default'] = true;
            $result->$id = $node;
        }
        return $result;
    }

    public function getDomainRelations($frames, $chosen, $idDomain = 1)
    {
        $relations = [];
        $entities = [];
        foreach ($frames as $idNode) {
            if ($idNode{0} == 'f') {
                $entities[] = substr($idNode, 1);
            }
        }
        if (count($entities)) {
            $relations = $this->getEntityDomainRelationsById($entities, $chosen, $idDomain);
        }
        return $relations;
    }

    public function getConstraintRelations($frames, $chosen, $idDomain = 1)
    {
        $relations = [];
        foreach ($frames as $idNode) {
            if ($idNode{0} == 'f') {
                $idEntity = substr($idNode, 1);
                $r = $this->getConstraintRelationsByFrame($idEntity, $chosen);
                $relations = array_merge($relations, $r);
            }
        }
        return $relations;
    }

}
