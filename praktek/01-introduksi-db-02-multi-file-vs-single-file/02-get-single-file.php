<?php
require 'common.php';
$dbFolder="db/single-file";

$table = $argv[1];
$key = $argv[2];

if ( $table == "airlines" ) {

	$bRecord = 27;

	$firstTime = 1;

	$fp = fopen($dbFolder.'/airlines','r');

	while ( !feof($fp) ) {

		//echo ftell($fp).PHP_EOL;

		if ( $firstTime ) {
			$firstTime = 0;
		} else { 
			fseek($fp,($bRecord - $len['codeAirline']),SEEK_CUR);
		}

		$code = @unpack($pack['codeAirline'],fread($fp,$len['codeAirline']))[1];

		if ( $code == $key ) {

			echo $code.PHP_EOL;
			echo unpack($pack['nameAirline'],fread($fp,$len['nameAirline']))[1].PHP_EOL;
			break;

		}

		

	}

	fclose($fp);

} elseif ( $table == "airports" ){

	$bRecord = 71;

	$firstTime = 1;

	$fp = fopen($dbFolder.'/airports','r');

	while ( !feof($fp) ) {

		//echo ftell($fp).PHP_EOL;

		if ( $firstTime ) {
			$firstTime = 0;
		} else { 
			fseek($fp,($bRecord - $len['codeAirport']),SEEK_CUR);
		}

		$code = @unpack($pack['codeAirport'],fread($fp,$len['codeAirport']))[1];

		if ( $code == $key ) {

			echo $code.PHP_EOL;
			echo unpack($pack['nameAirport'],fread($fp,$len['nameAirport']))[1].PHP_EOL;
			break;

		}

		

	}

	fclose($fp);

} elseif ( $table == "flights" ) {

	$bRecord = $len['year']+$len['month']+$len['day']+$len['codeAirline']+$len['flightNumber']+(2 * $len['codeAirport']);

	$firstTime = 1;

	$fp = fopen($dbFolder.'/flights','r');

	$row = 0;

	while ( !feof($fp) ) {

		//echo ftell($fp).PHP_EOL;

		$record = fread($fp,$bRecord);

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

		if ( $code == $key ) {

			$row++;

			echo "--------".$row."--------".PHP_EOL;
			echo $code.PHP_EOL;
			echo $flightNumber.PHP_EOL;
			echo $year.PHP_EOL;
			echo $month.PHP_EOL;
			echo $day.PHP_EOL;
		}

	}

	fclose($fp);

}
