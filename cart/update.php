<?php
header('Content-Type: application/json');
include "../db.php";

$PK_COMMUNIQUE =(int) $_POST['PK_COMMUNIQUE'];
$TITLE_CMQ = $_POST['TITLE_CMQ'];
$CONTENT_CMQ =  $_POST['CONTENT_CMQ'];

$stmt = $db->prepare("UPDATE `t_COMMUNIQUE` SET `TITLE_CMQ`=?,`CONTENT_CMQ`=? WHERE `PK_COMMUNIQUE`=?");
$result =  $stmt->execute([$TITLE_CMQ, $CONTENT_CMQ, $PK_COMMUNIQUE]);

echo json_encode([
    'success' => $result
]);
