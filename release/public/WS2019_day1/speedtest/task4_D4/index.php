<?php

$width = 120;
$height = 40;

$image = imagecreatetruecolor($width, $height);
$background = imagecolorallocate($image, rand(0, 255), rand(0, 255), rand(0, 255));
imagefill($image, 0, 0, $background);

$abc = array_merge(
    range('0', '9'),
    range('A', 'Z')
);
shuffle($abc);

// Noise lines
for ($i = 0; $i < 4; $i++) {
    $color = imagecolorallocate($image, rand(0, 255), rand(0, 255), rand(0, 255));
    imageline($image, 0, rand(0, $height), $width, rand(0, $height), $color);
}

// Noise points
for ($i = 0; $i < 4; $i++) {
    $color = imagecolorallocate($image, rand(0, 255), rand(0, 255), rand(0, 255));
    imagesetpixel($image, rand(0, $width), rand(0, $height), $color);
}

// Letters
for ($i = 0; $i < 4; $i++) {
    $color = imagecolorallocate($image, rand(0, 255), rand(0, 255), rand(0, 255));
    imagettftext($image, 20, rand(-20, 20), 5 + $i * 30, rand(25, 35), $color, './arial.ttf', $abc[$i]);
}

header("Content-Type: image/png");
imagepng($image);
