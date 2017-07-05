<?php

class ReportLUService extends MService
{

    public function getFERealizations($lu)
    {
        $valence = new fnbr\models\Valence();
        $rows = $valence->FERealizations($lu->getIdLU())->getResult();
        $fes = [];
        $realizations = [];
        $realizationAS = [];
        $idAS = -1;
        $idVP = $idVPFE = null;
        $pattern = [];
        $feEntries = [];
        $vp = [];
        $vpfe = [];
        $maxCountFE = 0;
        foreach($rows as $row) {
            if (!isset($fes[$row['feEntry']])) {
                $fes[$row['feEntry']] = [
                    'entry' => $row['feEntry'],
                    'name' => $row['feName'],
                    'type' => $row['feTypeEntry'],
                    'as' => []
                ];
            }
            $fes[$row['feEntry']]['as'][$row['idAnnotationSet']] = $row['idAnnotationSet'];
            $fe = $row['feName'];
            $feEntry = $row['feEntry'];
            $gf = $row['gfName'] ?: '?';
            $pt = $row['ptName'] ?: '?';
            $it = $row['itEntry'] ?: '?';
            $startChar = $row['startChar'] ?: '0';
            if ($it == 'int_normal') {
                $idRealization = 'id' . md5($feEntry . $gf . $pt);
                $realizations[$feEntry][$gf][$pt] = [$idRealization];
            } else {
                $idRealization = 'id' . md5($feEntry . $row['itName'] . '--');
                $realizations[$feEntry][$row['itName']]['--'] = [$idRealization];
            }
            $realizationAS[$idRealization][] = $row['idAnnotationSet'];
            if ($row['idAnnotationSet'] != $idAS) {
                if ($idAS >= 0) {
                    $vpfe[$idVPFE]['feEntries'] = $feEntries;
                    $vpfe[$idVPFE]['count'] = $vpfe[$idVPFE]['count'] + 1;
                    if (count($pattern) > $maxCountFE) {
                        $maxCountFE = count($pattern);
                    }
                    $vp[$idVPFE][$idVP][] = $idAS;
                    if (count($vp[$idVPFE][$idVP]) == 1) {
                        $patterns[$idVPFE][$idVP] = $pattern;
                    }
                }
                $idVP = '';
                $idVPFE = '';
                $pattern = [];
                $feEntries = [];
            }
            if ($it == 'int_normal') {
                $pattern[$startChar][$feEntry][$gf][$pt] = $row['idAnnotationSet'];
            } else {
                $pattern['0'][$fe][$row['itName']]['--'][] = $row['idAnnotationSet'];
            }
            $idAS = $row['idAnnotationSet'];
            $feEntries[$feEntry] = $fe;
            $idVPFE = md5($idVPFE. $fe);
            $idVP = md5($idVP. $fe . $gf . $pt . $it);
        }
        $vpfe[$idVPFE]['feEntries'] = $feEntries;
        $vpfe[$idVPFE]['count'] = $vpfe[$idVPFE]['count'] + 1;
        if (count($pattern) > $maxCountFE) {
            $maxCountFE = count($pattern);
        }
        $vp[$idVPFE][$idVP][] = $idAS;
        if (count($vp[$idVPFE][$idVP]) == 1) {
            $patterns[$idVPFE][$idVP] = $pattern;
        }
        $patternFEAS = [];
        $patternAS = [];
        foreach($vp as $idVPFE => $p) {
            foreach($p as $idVP => $as) {
                $patternAS['id'.$idVP] = $as;
                foreach($as as $a) {
                    $patternFEAS['id'.$idVPFE][] = $a;
                }
            }
        }
        $feAS = [];
        foreach($fes as $feEntry => $fe) {
            foreach($fe['as'] as $as) {
                $feAS[$feEntry][] = $as;
            }
        }
        mdump($realizations);
        $result = [
            'realizations' => $realizations,
            'realizationAS' => $realizationAS,
            'fes' => $fes,
            'vp' => $vp,
            'vpfe' => $vpfe,
            'maxCountFE' => $maxCountFE,
            'patterns' => $patterns,
            'feAS' => $feAS,
            'patternFEAS' => $patternFEAS,
            'patternAS' => $patternAS
        ];
        return $result;
    }

    public function getSentences() {
        $as = new fnbr\models\ViewAnnotationSet();
        $sentences = $as->listSentencesByAS($this->data->idAS)->asQuery()->getResult();
        $annotation = $as->listFECEByAS($this->data->idAS);
        $annotationService = Manager::getAppService('annotation');
        $result = [];
        foreach ($sentences as $sentence) {
            $node = array();
            $node['idAnnotationSet'] = $sentence['idAnnotationSet'];
            $node['idSentence'] = $sentence['idSentence'];
            if ($annotation[$sentence['idSentence']]) {
                $node['text'] = $annotationService->decorateSentence($sentence['text'], $annotation[$sentence['idSentence']]);
            } else {
                $node['text'] = $sentence['text'];
            }
            $node['status'] = $sentence['annotationStatus'];
            $node['rgbBg'] = $sentence['rgbBg'];
            $result[] = $node;
        }
        return $result;
    }

}
