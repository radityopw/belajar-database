<?php

include 'common.php';

file_put_contents('03-msgpack.dat',msgpack_pack($data));
