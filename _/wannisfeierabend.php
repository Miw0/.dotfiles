<?php

$data = file_get_contents('http://zz-cd-import.em.lan/stats/1165');

$doc = new DOMDocument();
$doc->loadHTML($data);

$code = $doc->getElementsByTagName('pre');
foreach ($code as $codeElement) {
    $timeData =  print_r_reverse($codeElement->nodeValue);

    $today = date('Y-m-d');

    if(isset($timeData[$today])) {
        $timesToday = $timeData[$today];

        $count = false;
        $startTime = 0;
        $totalTime = new DateTime('00:00');
        $diffTime = clone $totalTime;

        foreach ($timesToday['times'] as $timeItem) {

            if($timeItem['action'] == 'K') {
                $count = true;
                $startTime = $timeItem['time'];
                continue;
            }

            if($count) {
                $currentDate = new DateTime($today . ' ' . $timeItem['time']);
                $startDate = new DateTime($today . ' ' . $startTime);

                $time = $currentDate->diff($startDate);
                $totalTime->add($time);
            }
        }

        if($count) {
            $currentDate = new DateTime();
            $startDate = new DateTime($today . ' ' . $startTime);
            $time = $currentDate->diff($startDate);
            $totalTime->add($time);
        }

        $worktime = $diffTime->diff($totalTime);

        if($worktime->format('%H') >= 8) {
            echo 'FEIERABEND!' . PHP_EOL;
        } else {
            $hoursToGo = 7 - $worktime->format('%H');
            $minutesToGo = 60 - $worktime->format('%I');

            $timeTillEnd = new DateInterval('P0D');
            $timeTillEnd->h = $hoursToGo;
            $timeTillEnd->i = $minutesToGo;

            $currentDate = new DateTime();

            echo 'Feierabend: '  . $currentDate->add($timeTillEnd)->format('H:i') . ' Uhr' . PHP_EOL;
            echo 'Verbleibend: ' . str_pad($hoursToGo, 2, '0', STR_PAD_LEFT) . ':' . str_pad($minutesToGo, 2, '0', STR_PAD_LEFT) . ' Std' . PHP_EOL;
        }

        echo 'Arbeitszeit: ' . $worktime->format("%H:%I") . ' Std' . PHP_EOL;
    }

}

function print_r_reverse($in) {
    $lines = explode("\n", trim($in));
    if (trim($lines[0]) != 'Array') {
        // bottomed out to something that isn't an array
        return $in;
    } else {
        // this is an array, lets parse it
        if (preg_match("/(\s{5,})\(/", $lines[1], $match)) {
            // this is a tested array/recursive call to this function
            // take a set of spaces off the beginning
            $spaces = $match[1];
            $spaces_length = strlen($spaces);
            $lines_total = count($lines);
            for ($i = 0; $i < $lines_total; $i++) {
                if (substr($lines[$i], 0, $spaces_length) == $spaces) {
                    $lines[$i] = substr($lines[$i], $spaces_length);
                }
            }
        }
        array_shift($lines); // Array
        array_shift($lines); // (
        array_pop($lines); // )
        $in = implode("\n", $lines);
        // make sure we only match stuff with 4 preceding spaces (stuff for this array and not a nested one)
        preg_match_all("/^\s{4}\[(.+?)\] \=\> /m", $in, $matches, PREG_OFFSET_CAPTURE | PREG_SET_ORDER);
        $pos = array();
        $previous_key = '';
        $in_length = strlen($in);
        // store the following in $pos:
        // array with key = key of the parsed array's item
        // value = array(start position in $in, $end position in $in)
        foreach ($matches as $match) {
            $key = $match[1][0];
            $start = $match[0][1] + strlen($match[0][0]);
            $pos[$key] = array($start, $in_length);
            if ($previous_key != '') $pos[$previous_key][1] = $match[0][1] - 1;
            $previous_key = $key;
        }
        $ret = array();
        foreach ($pos as $key => $where) {
            // recursively see if the parsed out value is an array too
            $ret[$key] = print_r_reverse(substr($in, $where[0], $where[1] - $where[0]));
        }
        return $ret;
    }
}
