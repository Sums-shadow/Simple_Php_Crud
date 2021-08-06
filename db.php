<?php

$DATABASE_HOST = 'localhost';
$DATABASE_USER = 'root';
$DATABASE_PASS = '';
$DATABASE_NAME = 'db_eureka_wenze';

try {
    $db = new PDO("mysql:host={$DATABASE_HOST};dbname={$DATABASE_NAME};charset=utf8", $DATABASE_USER, $DATABASE_PASS);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

} catch (\Throwable $th) {
    var_dump($th);
}