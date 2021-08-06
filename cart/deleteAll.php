<?php
header('Content-Type: application/json');
include "../db.php";

$stmt = $db->prepare("TRUNCATE `t_COMMUNIQUE` ");
$result = $stmt->execute();

echo json_encode([
    'id' => $id,
    'success' => $result
]);
