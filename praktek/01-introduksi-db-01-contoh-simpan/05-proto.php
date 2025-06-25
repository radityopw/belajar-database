<?php

use Tutorial\Data;

include 'common.php';
include 'GPBMetadata/Skema.php';
include 'Tutorial/Data.php';

$obj = new Data();
$obj->setUserName($data['userName']);
$obj->setFavoriteNumber($data['favoriteNumber']);
$obj->setInterests($data['interests']);

file_put_contents('05-proto.dat',$obj->serializeToString());
