<?php
require 'common.php';

$dbFolder = 'db/single-file';

$idxFolder = $dbFolder.'/single-file-idx/idx-flight-1';

function getNameAirline($code) {
	global $dbFolder, $len, $pack;

	$name = '';

	$bRecord = $len['codeAirline']+$len['nameAirline'];

	$fp = fopen($dbFolder.'/airlines','r');

	while ( ! feof($fp) ) {

		$offset = 0;

		$record = fread($fp,$bRecord);

		$codeAirline = @unpack($pack['codeAirline'],substr($record,$offset,$len['codeAirline']))[1];

		$offset+=$len['codeAirline'];

		$nameAirline = @unpack($pack['nameAirline'],substr($record,$offset,$len['nameAirline']))[1];

		$offset+=$len['nameAirline'];

		if ( $code == $codeAirline ) {

			$name = $nameAirline;

			break;

		}


	}

	fclose($fp);

	return $name;

}

function getNameAirport($code) {
	global $dbFolder, $len, $pack;
	$name = '';

	$bRecord = $len['codeAirport']+$len['nameAirport']+$len['cityAirport']+$len['stateAirport']+$len['countryAirport'];

	$fp = fopen($dbFolder.'/airports','r');

	while ( ! feof($fp) ) {

		$offset = 0;

		$record = fread($fp,$bRecord);

		$codeAirport = @unpack($pack['codeAirport'],substr($record,$offset,$len['codeAirport']))[1];

		$offset+=$len['codeAirport'];

		$nameAirport = @unpack($pack['nameAirport'],substr($record,$offset,$len['nameAirport']))[1];

		$offset+=$len['nameAirport'];

		if ( $code == $codeAirport ) {

			$name = $nameAirport;

			break;

		}


	}

	fclose($fp);

	return $name;
}

// ingin mencari yang ada flight di tahun 2025 dan bulan 1 dan dari codeAirline AA

$sYear = 2015;
$sMonth = 1;
$sCode = "VX";

$rIterator = 0;
$bRecordFlight = $len['year']+$len['month']+$len['day']+$len['codeAirline']+$len['flightNumber']+(2 * $len['codeAirport']);


$fpFlights = fopen($dbFolder.'/flights',"r");


$idxFile = $sCode."-".$sYear."-".$sMonth;
$fpIdx = fopen($idxFolder.'/'.$idxFile,"r");

$bRecordIdx = 4; // 32 bit , 4 byte

while ( !feof( $fpIdx ) ) {

	$recordIdx = fread($fpIdx,$bRecordIdx);

	$offsetIdx = @unpack("L",$recordIdx)[1];

	if ( !$offsetIdx ) break;

	fseek($fpFlights,$offsetIdx,SEEK_SET);

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

	$rIterator++;

	echo "----------".$rIterator."-----------".PHP_EOL;
	echo $year.PHP_EOL;
	echo $month.PHP_EOL;
	echo $day.PHP_EOL;
	echo "airline : ".$code." ( ".getNameAirline($code)." ) ".PHP_EOL;
	echo "flight Number : ".$flightNumber.PHP_EOL;
	echo "From : ".$airportFrom." ( ".getNameAirport($airportFrom)." ) to ".$airportTo." ( ".getNameAirport($airportTo)." ) ".PHP_EOL;
}

fclose($fpIdx);
fclose($fpFlights);
