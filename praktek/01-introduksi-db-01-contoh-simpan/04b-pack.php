<?php
include 'common.php';

$namaFile = '04-pack.dat';
// userName

$userName = unpack($pack_format['userName'],file_get_contents($namaFile,false,null,0,6));
$userName = $userName[1];
echo $userName.PHP_EOL;

// favoriteNumber

$favoriteNumber = unpack($pack_format['favoriteNumber'],file_get_contents($namaFile,false,null,6,2));
$favoriteNumber = $favoriteNumber[1];
echo $favoriteNumber.PHP_EOL;

// interests 0

$interests0 = unpack($pack_format['interests0'],file_get_contents($namaFile,false,null,8,11));
$interests0 = $interests0[1];
echo $interests0.PHP_EOL;

// interests 1

$interests1 = unpack($pack_format['interests1'],file_get_contents($namaFile,false,null,19,11));
$interests1 = $interests1[1];
echo $interests1.PHP_EOL;

