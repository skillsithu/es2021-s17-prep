<?php
header('Content-Type: application/json');

// The stock price is a range between $93.5 and $93.9.

function getRand() {
    $rand = (string)rand(50, 99);

    if (substr($rand, 1) === '0') {
        return substr($rand, 0, 1);
    } else {
        return $rand;
    }
}

echo "$93.".getRand();
