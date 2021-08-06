<?php
header('Content-Type: application/json');
include "../db.php";

$TITLE_CMQ = $_POST['TITLE_CMQ'];
$CONTENT_CMQ =  $_POST['CONTENT_CMQ'];

$stmt = $db->prepare("INSERT INTO `t_COMMUNIQUE`(`PK_COMMUNIQUE`, `TITLE_CMQ`, `CONTENT_CMQ`) VALUES (?,?,?)");
$result = $stmt->execute([null,$TITLE_CMQ, $CONTENT_CMQ]);

echo json_encode([
    'success' => $result
]);
