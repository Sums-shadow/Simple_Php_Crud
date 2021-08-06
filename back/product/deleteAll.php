<?php
header('Content-Type: application/json');
include "../db.php";

$stmt =$db->prepare("CALL deleteAllProduct()");
$result = $stmt->execute();

echo json_encode([
    'result' => $result
]);
