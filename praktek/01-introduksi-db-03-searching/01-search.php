<?php
require 'common.php';

$dbFolder = 'db/single';

// ingin mencari yang ada flight di tahun 2025 dan bulan 1

$fpFlights = fopen($dbFolder.'/flights',"r");

while ( !feof( $fpFlights ) ) {

	$bRecordFlight = $len['year']+$len['month']+$len['day']+$len['codeAirline']+$len['flightNumber']+(2 * $len['codeAirport']);

	

}

fclose($fpFlights);
