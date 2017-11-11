<?php

use Maestro\Types\MFile;


class DataService extends MService
{

    public function getLanguage()
    {
        $language = new fnbr\models\Language();
        return $language->listForCombo()->asQuery()->chunkResult('idLanguage', 'language');
    }

    public function getPOS()
    {
        $pos = new fnbr\models\POS();
        return $pos->listForCombo()->asQuery()->chunkResult('idPOS', 'name');
    }

    public function exportFramesToJSON($idFrames)
    {
        $frameModel = new fnbr\models\Frame();
        $frames = $frameModel->listForExport($idFrames)->asQuery()->getResult();
        $feModel = new fnbr\models\FrameElement();
        $entry = new fnbr\models\Entry();
        foreach ($frames as $i => $frame) {
            $entity = new fnbr\models\Entity($frame['idEntity']);
            $frames[$i]['entity'] = [
                'idEntity' => $entity->getId(),
                'alias' => $entity->getAlias(),
                'type' => $entity->getType(),
                'idOld' => $entity->getIdOld()
            ];
            $frames[$i]['fes'] = [];
            $fes = $feModel->listForExport($frame['idFrame'])->asQuery()->getResult();
            foreach ($fes as $j => $fe) {
                $frames[$i]['fes'][$j] = $fe;
                $entityFe = new fnbr\models\Entity($fe['idEntity']);
                $frames[$i]['fes'][$j]['entity'] = [
                    'idEntity' => $entityFe->getId(),
                    'alias' => $entityFe->getAlias(),
                    'type' => $entityFe->getType(),
                    'idOld' => $entityFe->getIdOld()
                ];
                $coreset = $feModel->listCoreSet($fe['idFrameElement'])->asQuery()->getResult();
                $frames[$i]['fes'][$j]['coreset'] = $coreset;
                $excludes = $feModel->listExcludes($fe['idFrameElement'])->asQuery()->getResult();
                $frames[$i]['fes'][$j]['excludes'] = $exclude;
                $requires = $feModel->listRequires($fe['idFrameElement'])->asQuery()->getResult();
                $frames[$i]['fes'][$j]['requires'] = $requires;
                $color = new fnbr\models\Color($fe['idColor']);
                $frames[$i]['fes'][$j]['color'] = [
                    'name' => $color->getName(),
                    'rgbFg' => $color->getRgbFg(),
                    'rgbBg' => $color->getRgbBg(),
                ];
                $entries = $entry->listForExport($fe['entry'])->asQuery()->getResult();
                foreach ($entries as $n => $e) {
                    $frames[$i]['fes'][$j]['entries'][] = $e;
                }
            }
            $entries = $entry->listForExport($frame['entry'])->asQuery()->getResult();
            foreach ($entries as $j => $e) {
                $frames[$i]['entries'][] = $e;
            }
        }
        $result = json_encode($frames);
        return $result;
    }

    public function importFramesFromJSON($json)
    {
        $frames = json_decode($json);
        $frame = new fnbr\models\Frame();
        $fe = new fnbr\models\FrameElement();
        $entity = new fnbr\models\Entity();
        $entry = new fnbr\models\Entry();
        $transaction = $frame->beginTransaction();
        try {
            foreach ($frames as $frameData) {
                // create entries
                $entries = $frameData->entries;
                foreach ($entries as $entryData) {
                    $entry->createFromData($entryData);
                }
                // create entity
                $entity->createFromData($frameData->entity);
                // craete frame
                $frameData->idEntity = $entity->getId();
                $frame->createFromData($frameData);
                // create frameElements
                $fes = $frameData->fes;
                foreach ($fes as $feData) {
                    // create fe entries
                    $entries = $feData->entries;
                    foreach ($entries as $entryData) {
                        $entry->createFromData($entryData);
                    }
                    // create fe entity
                    $entity->createFromData($feData->entity);
                    // craete frame
                    $feData->idEntity = $entity->getId();
                    $feData->idFrame = $frame->getId();
                    $fe->createFromData($feData);
                    $feData->idFrameElement = $fe->getId();
                }
                // create frameElements relations (fes must be created before)
                foreach ($fes as $feData) {
                    $fe->getById($feData->idFrameElement);
                    $fe->createRelationsFromData($feData);
                }
            }
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \exception($e->getMessage());
        }
    }

    public function parseDocWf($file)
    {
        $getOutput = function ($diff) {
            $output = '';
            foreach ($diff as $w) {
                if (!is_numeric($w)) {
                    $output .= $w . ' X ' . $w . "\n";
                }
            }
            return $output;
        };
        $words = [];
        $rows = file($file->getTmpName());
        foreach ($rows as $row) {
            //mdump($row);
            // excludes punctuation
            $row = strtolower(str_replace([',', '.', ';', '!', '?', ':', '"', '(', ')', '[', ']', '<', '>', '{', '}'], ' ', utf8_decode($row)));
            $row = str_replace("\t", " ", $row);
            $row = str_replace("\n", " ", $row);
            $row = utf8_encode(trim($row));

            if ($row == '') {
                continue;
            }
            $wordsTemp = explode(' ', $row);
            foreach ($wordsTemp as $word) {
                $word = str_replace("'", "''", $word);
                $words[$word] = $word;
            }
        }
        $wf = new fnbr\models\WordForm();
        $output = "";
        $i = 0;
        foreach ($words as $word) {
            if (trim($word) != '') {
                $lookFor[$word] = $word;
                if ($i++ == 200) {
                    $found = $wf->lookFor($lookFor);
                    $output .= $getOutput(array_diff($lookFor, $found));
                    $lookFor = [];
                    $i = 0;
                }
            }
        }
        if (count($lookFor)) {
            $found = $wf->lookFor($lookFor);
            $output .= $getOutput(array_diff($lookFor, $found));
        }
        $fileName = str_replace(' ', '_', $file->getName()) . '_docwf.txt';
        $mfile = MFile::file("\xEF\xBB\xBF" . $output, false, $fileName);
        return $mfile;
    }

    private function getFSTree($structure, $idEntity)
    {
        $tree = [];
        foreach ($structure as $node) {
            if ($node['idEntity'] == $idEntity) {
                $tree = [
                    'id' => $node['idEntity'],
                    'nick' => $node['nick'],
                    'name' => $node['name'],
                    'entry' => $node['entry'],
                    'typeSystem' => $node['typeSystem'],
                    'children' => []
                ];
            }
        }
        foreach ($structure as $node) {
            if ($node['source'] == $idEntity) {
                $tree['children'][$node['idEntity']] = $this->getFSTree($structure, $node['idEntity']);
            }
        }
        return $tree;
    }

    private function getFSTreeText($node, &$text, $ident = '')
    {
        $text .= $ident . $node['typeSystem'] . '_' . $node['entry'] . ($node['name'] ? "  [" . $node['name'] . "]" : "") . "\n";
        foreach ($node['children'] as $child) {
            $this->getFSTreeText($child, $text, $ident . '    ');
        }
    }

    public function exportCxnToFS($data)
    {
        $viewCxn = new fnbr\models\ViewConstruction();
        $filter = (object)['idDomain' => $data->idDomain, 'idLanguage' => $data->idLanguage];
        $cxns = $viewCxn->listByFilter($filter)->asQuery()->getResult(\FETCH_ASSOC);
        $construction = new fnbr\models\Construction();
        $network = [];
        foreach ($cxns as $cxn) {
            $construction->getById($cxn['idConstruction']);
            if ($construction->getActive()) {
                $structure = $construction->getStructure();
                $network[$structure->entry] = $structure;
            }
        }
        $fs = [
            'network' => $network
        ];
        mdump(json_encode($fs));
        return json_encode($fs);
    }

}
