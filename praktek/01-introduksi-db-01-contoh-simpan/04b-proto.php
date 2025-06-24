<?php

use Tutorial\Data;

include 'common.php';
include 'GPBMetadata/Skema.php';
include 'Tutorial/Data.php';

$obj = new Data();
$obj->mergeFromString(file_get_contents('04-proto.dat'));

echo $obj->getUserName().PHP_EOL;
echo $obj->getFavoriteNumber().PHP_EOL;
echo "interests : ".PHP_EOL;
foreach($obj->getInterests() as $interest){
	echo $interest.PHP_EOL;
}
