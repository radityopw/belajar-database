<?php

$data = array(
	'userName' => "Martin" ,
	"favoriteNumber" => 1337,
	"interests" => ["daydreaming", "hacking"]
);

$pack_format['userName'] = "A6"; // 6 byte
$pack_format['favoriteNumber'] = "n"; // 16 bit -> 2 byte
$pack_format['interests0'] = "A11"; // 11 byte
$pack_format['interests1'] = "A11"; // 11 byte
