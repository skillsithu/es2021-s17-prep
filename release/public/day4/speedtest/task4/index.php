<?php

if (!empty($_GET['date'])) {
    $monthAndYear = $_GET['date'];
} else {
    $monthAndYear = date('y-m');
}

$startOfMonth = new DateTime($monthAndYear.'-01');
$ts = $startOfMonth->getTimestamp();
$month = date('F', $ts);
$m = intval(date('n', $ts), 10);
$year = intval(date('Y', $ts), 10);
$wd = intval(date('w', $ts), 10);
$days = intval(date('t', $ts), 10);

$today = date('Ynj');

$endOfMonth = new DateTime($monthAndYear.'-'.$days);
$wdB = intval(date('w', $endOfMonth->getTimestamp()), 10);

if ($m === 1) {
    $prev = ($year - 1).'-12';
} else {
    $prev = $year.'-'.str_pad($m - 1, 2, '0', STR_PAD_LEFT);
}
if ($m === 12) {
    $next = ($year + 1).'-01';
} else {
    $next = $year.'-'.str_pad($m + 1, 2, '0', STR_PAD_LEFT);
}

$calendar = array();
$week = array();
$wdc = $wd;
for ($i = 0; $i < $wd; $i++) {
    $week[] = '';
}
for ($i = 1; $i <= $days; $i++) {
    $wdc++;
    $week[] = $i;

    if ($wdc === 7) {
        $wdc = 0;
        array_push($calendar, $week);
        $week = array();
    }
}
$xx = (7 - $wdB - 1);
for ($i = 0; $i < $xx; $i++) {
    $week[] = '';
}
if ($xx > 0) {
    array_push($calendar, $week);
}

?>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="calendar.css">
</head>

<body>


    <div class="custom-calendar-wrap">
        <div class="custom-inner">
            <div class="custom-header clearfix">
                <nav>
                    <a href="?date=<?php echo $prev ?>" class="custom-btn custom-prev"></a>
                    <a href="?date=<?php echo $next ?>" class="custom-btn custom-next"></a>
                </nav>
                <h2 id="custom-month" class="custom-month"><?php echo $month ?></h2>
                <h3 id="custom-year" class="custom-year"><?php echo $year ?></h3>
            </div>
            <div id="calendar" class="fc-calendar-container">
                <div class="fc-calendar fc-five-rows">
                    <div class="fc-head">
                        <div>Sun</div>
                        <div>Mon</div>
                        <div>Tue</div>
                        <div>Wed</div>
                        <div>Thu</div>
                        <div>Fri</div>
                        <div>Sat</div>
                    </div>
                    <div class="fc-body">
                        <?php
                        foreach ($calendar AS $row) {
                            echo '<div class="fc-row">';
                            foreach ($row AS $day) {
                                echo '<div';
                                if ($year . $m . $day === $today) echo ' class="fc-today"';
                                echo '><span class="fc-date">'.$day.'</span></div>';
                            }
                            echo '</div>';
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>


</body>

</html>