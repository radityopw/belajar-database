<?php

$dataAirlines = 'data/airlines.csv';
$dataAirports = 'data/airports.csv';
$dataFlights = 'data/flights2.csv';

// schema
$pack['codeAirline'] = "A2";
$pack['nameAirline'] = "A25";
$pack['codeAirport'] = "A3";
$pack['nameAirport'] = "A40";
$pack['cityAirport'] = "A20";
$pack['stateAirport'] = "A3";
$pack['countryAirport'] = "A5";
$pack['year'] = "S";
$pack['month'] = "S";
$pack['day'] = "S";
$pack['flightNumber'] = "S";

$len['codeAirline'] = 2;
$len['nameAirline'] = 25;
$len['codeAirport'] = 3;
$len['nameAirport'] = 40;
$len['cityAirport'] = 20;
$len['stateAirport'] = 3;
$len['countryAirport'] = 5;
$len['year'] = 2;
$len['month'] = 2;
$len['day'] = 2;
$len['flightNumber'] = 2;
