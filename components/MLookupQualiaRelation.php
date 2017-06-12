<?php

class MLookupQualiaRelation extends MControl
{

    public function generate()
    {
        $url = Manager::getAppURL('', 'api/structurerelationtype/lookupDataQualiaRelation');
        $onLoad = <<<EOT
        
        $('#{$this->property->id}').combogrid({
            panelWidth:180,
            url: '{$url}',
            idField:'entry',
            textField:'name',
            mode:'remote',
            fitColumns:true,
            columns:[[
                {field:'name', title:'Name', width:162}
            ]]
        });

EOT;
        $this->getPage()->onLoad($onLoad);
        $this->style->width = '250px';
        return $this->getPainter()->mtextField($this);
    }

}

