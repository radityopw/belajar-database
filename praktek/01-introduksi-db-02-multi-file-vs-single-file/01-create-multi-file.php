<?php

require 'common.php';

$dbFolder = 'db/multi-file';

@mkdir($dbFolder.'/airlines',0777,true);
@mkdir($dbFolder.'/airports',0777,true);
@mkdir($dbFolder.'/flights',0777,true);


// proses airlines

$fp = fopen($dataAirlines,"r");

$lIterator = 0;
while(($line = fgets($fp)) != FALSE){
	$lIterator++;

	if ( $lIterator == 1 ) continue; // skip first header

	$a_line = explode(",",$line);
	$code = $a_line[0];
	$name = $a_line[1];

	$file = $dbFolder."/airlines/".$code;

	echo "CREATE ".$file.PHP_EOL;

	$fw = fopen($file,"w");

	fputs($fw,pack($pack['codeAirline'],$code)); // 2 byte
	fputs($fw,pack($pack['nameAirline'],substr($name,0,25))); // 25 byte

	fclose($fw);

	unset($a_line);
	unset($code);
	unset($name);
	unset($line);
}

fclose($fp);

//proses airport

$fp = fopen($dataAirports,"r");

$lIterator = 0;
while(($line = fgets($fp)) != FALSE){
	$lIterator++;

	if ( $lIterator == 1 ) continue; // skip first header

	$a_line = explode(",",$line);
	$code = $a_line[0];
	$name = $a_line[1];
	$city = $a_line[2];
	$state = $a_line[3];
	$country = $a_line[4];

	$file = $dbFolder."/airports/".$code;

	echo "CREATE ".$file.PHP_EOL;

	$fw = fopen($file,"w");

	fputs($fw,pack($pack['codeAirport'],$code)); // 3 byte
	fputs($fw,pack($pack['nameAirport'],substr($name,0,40))); // 40 byte
	fputs($fw,pack($pack['cityAirport'],substr($city,0,20))); // 20 byte
	fputs($fw,pack($pack['stateAirport'],substr($state,0,3))); // 3 byte
	fputs($fw,pack($pack['countryAirport'],substr($country,0,5))); // 5 byte

	fclose($fw);

	unset($a_line);
	unset($code);
	unset($name);
	unset($city);
	unset($state);
	unset($country);
	unset($line);
}

fclose($fp);

// proses Flights

$fp = fopen($dataFlights,"r");

$lIterator = 0;
while(($line = fgets($fp)) != FALSE){
	$lIterator++;

	if ( $lIterator == 1 ) continue; // skip first header

	$a_line = explode(",",$line);
	$year = $a_line[0];
	$month = $a_line[1];
	$day = $a_line[2];
	$airline = $a_line[4];
	$flightNumber = $a_line[5];
	$airport1 = $a_line[7];
	$airport2 = $a_line[8];

	$file = $dbFolder."/flights/".$airline.'-'.$lIterator;

	echo "CREATE ".$file.PHP_EOL;

	$fw = fopen($file,"w");

	fputs($fw,pack($pack['year'],$year));
	fputs($fw,pack($pack['month'],$month));
	fputs($fw,pack($pack['day'],$day));
	fputs($fw,pack($pack['codeAirline'],$airline));
	fputs($fw,pack($pack['flightNumber'],$flightNumber));
	fputs($fw,pack($pack['codeAirport'],$airport1));
	fputs($fw,pack($pack['codeAirport'],$airport2));

	fclose($fw);

	unset($a_line);
	unset($line);
}

fclose($fp);
