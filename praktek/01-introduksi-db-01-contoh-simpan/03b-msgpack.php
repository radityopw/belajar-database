<?php

include 'common.php';

var_dump(msgpack_unpack(file_get_contents('03-msgpack.dat')));
