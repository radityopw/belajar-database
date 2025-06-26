<?php
include 'common.php';

$table = $argv[1];
$key = $argv[2];

$dbFolder = 'db/multi-file';

$file = $dbFolder.'/'.$table.'/'.$key;

if ( ( $table == "airlines" || $table == "airports" ) && file_exists($file) ) {

	if ( $table == "airlines" ){
		$offset = 0;

		echo unpack($pack['codeAirline'],file_get_contents($file,False,null,$offset,$len['codeAirline']))[1].PHP_EOL;
		$offset += $len['codeAirline'];

		echo unpack($pack['nameAirline'],file_get_contents($file,False,null,$offset,$len['nameAirline']))[1].PHP_EOL;

	}else if ( $table == "airports" ) {

		$offset = 0;

		echo unpack($pack['codeAirport'],file_get_contents($file,False,null,$offset,$len['codeAirport']))[1].PHP_EOL;
		$offset += $len['codeAirport'];

		echo unpack($pack['nameAirport'],file_get_contents($file,False,null,$offset,$len['nameAirport']))[1].PHP_EOL;

	}

}

if ( $table == "flights" ) {
	$row = 0;
	foreach (glob($dbFolder."/flights/".$key."-*") as $file) {
		$row++;

		echo "-----".$row."-----".PHP_EOL;

		$offset = 0;

		echo unpack($pack['year'],file_get_contents($file,False,null,$offset,$len['year']))[1].PHP_EOL;
		$offset += $len['year'];

		echo unpack($pack['month'],file_get_contents($file,False,null,$offset,$len['month']))[1].PHP_EOL;
		$offset += $len['month'];

		echo unpack($pack['day'],file_get_contents($file,False,null,$offset,$len['day']))[1].PHP_EOL;
		$offset += $len['day'];

		echo unpack($pack['codeAirline'],file_get_contents($file,False,null,$offset,$len['codeAirline']))[1].PHP_EOL;
		$offset += $len['codeAirline'];

		echo unpack($pack['flightNumber'],file_get_contents($file,False,null,$offset,$len['flightNumber']))[1].PHP_EOL;

	}
}

