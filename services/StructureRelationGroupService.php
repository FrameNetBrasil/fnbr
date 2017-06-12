<?php



class StructureRelationGroupService extends MService
{

    public function listAll($data = '', $idLanguage = '')
    {
        $rg = new mfn\models\RelationGroup();
        $rows = $rg->listAll()->asQuery()->getResult();
        $result = array();
        foreach ($rows as $row) {
            $node = array();
            $node['id'] = 'm' . $row['idRelationGroup'];
            $node['text'] = $row['name'];
            $node['entry'] = $row['entry'];
            $result[] = $node;
        }
        return $result;
    }
    
}
