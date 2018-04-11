<?php

class MLookupQualiaFrame extends MControl
{

    public function generate()
    {
        $url = Manager::getAppURL('', "data/qualia/lookupData/{$this->property->type}");
        $onLoad = <<<EOT
        
        $('#{$this->property->id}').combogrid({
            panelWidth:180,
            url: '{$url}',
            idField:'idQualia',
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

