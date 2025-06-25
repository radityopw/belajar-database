<?php
include 'common.php';

$binary = "";

$binary.=pack($pack_format['userName'],$data['userName']);
$binary.=pack($pack_format['favoriteNumber'],$data['favoriteNumber']);
$binary.=pack($pack_format['interests0'],substr($data['interests'][0]."           ",0,11));
$binary.=pack($pack_format['interests1'],substr($data['interests'][1]."           ",0,11));



file_put_contents('04-pack.dat',$binary);
