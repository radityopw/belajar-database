<?php

$dataAirlines = 'data/airlines.csv';
$dataAirports = 'data/airports.csv';
$dataFlights = 'data/flights.csv';

$dbFolder = 'db/multi-file';

@mkdir($dbFolder.'/airlines',0777,true);
@mkdir($dbFolder.'/airports',0777,true);
@mkdir($dbFolder.'/flights',0777,true);


// proses airlines

$fp = fopen($dataAirlines,"r");

while(($line = fgets($fp)) != FALSE){

	$a_line = explode(",",$line);
	$code = $a_line[0];
	$name = $a_line[1];

	

	unset($a_line);
	unset($code);
	unset($name);
	unset($line);
}

fclose($fp);
