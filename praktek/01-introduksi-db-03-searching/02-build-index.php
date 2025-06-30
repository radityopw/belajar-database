<?php
require 'common.php';

$dbFolder = 'db/single-file';

$idxFolder = $dbFolder.'/single-file-idx/idx-flight-1';

passthru('rm -rf '.$idxFolder);

@mkdir($idxFolder,0700,true);

$bRecordFlight = $len['year']+$len['month']+$len['day']+$len['codeAirline']+$len['flightNumber']+(2 * $len['codeAirport']);

$fpFlights = fopen($dbFolder.'/flights',"r");

$bOffset = 0;

while ( !feof( $fpFlights ) ) {

	$record = fread($fpFlights,$bRecordFlight);

	$offset = 0;

        $year = @unpack($pack['year'],substr($record,$offset,$len['year']))[1];

        $offset+=$len['year'];

        $month = @unpack($pack['month'],substr($record,$offset,$len['month']))[1];

        $offset+=$len['month'];

        $day = @unpack($pack['day'],substr($record,$offset,$len['day']))[1];

        $offset+=$len['day'];

        $code = @unpack($pack['codeAirline'],substr($record,$offset,$len['codeAirline']))[1];

        $offset+=$len['codeAirline'];

        $flightNumber = @unpack($pack['flightNumber'],substr($record,$offset,$len['flightNumber']))[1];

	$offset+=$len['flightNumber'];

	$airportFrom = @unpack($pack['codeAirport'],substr($record,$offset,$len['codeAirport']))[1];

	$offset+=$len['codeAirport'];

	$airportTo = @unpack($pack['codeAirport'],substr($record,$offset,$len['codeAirport']))[1];

	$offset+=$len['codeAirport'];

	if ( $code ) {


		$key = $code."-".$year."-".$month;

		$fw = fopen($idxFolder.'/'.$key,'a+');

		fputs($fw,pack("L",$bOffset));

		fclose($fw);

	}

	$bOffset += $bRecordFlight;

}

fclose($fpFlights);
