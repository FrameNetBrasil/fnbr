<?php

class ReportLUService extends MService
{

    public function getFERealizations($lu)
    {
        $valence = new fnbr\models\Valence();
        $rows = $valence->FERealizations($lu->getIdLU())->getResult();
        $fes = [];
        $realizations = [];
        $idAS = -1;
        $idVP = null;
        $pattern = [];
        foreach($rows as $row) {
            $fes[$row['feName']] = [
                'entry' => $row['feEntry'],
                'type' => $row['feTypeEntry'],
                'count' => ++$fes[$row['feName']]['count']
            ];
            $fe = $row['feName'];
            $gf = $row['gfName'] ?: '?';
            $pt = $row['ptName'] ?: '?';
            $it = $row['itEntry'] ?: '?';
            if ($it == 'int_normal') {
                $realizations[$fe][$gf][$pt][] = $row['idAnnotationSet'];
            } else {
                $realizations[$fe][$row['itName']]['--'][] = $row['idAnnotationSet'];
            }
            if ($row['idAnnotationSet'] != $idAS) {
                if ($idAS >= 0) {
                    $vp[$idVP][] = $idAS;
                    if (count($vp[$idVP]) == 1) {
                        $patterns[$idVP] = $pattern;
                    }
                }
                $idVP = '';
                $pattern = [];
            }
            if ($it == 'int_normal') {
                $pattern[$fe][$gf][$pt][] = $row['idAnnotationSet'];
            } else {
                $pattern[$fe][$row['itName']]['--'][] = $row['idAnnotationSet'];
            }
            $idAS = $row['idAnnotationSet'];
            $idVP = md5($idVP. $fe . $gf . $pt . $it);
        }
        mdump($vp);
        mdump($patterns);
        $result = [
            'realizations' => $realizations,
            'fes' => $fes,
            'vp' => $vp,
            'patterns' => $patterns
        ];
        return $result;
    }

}
