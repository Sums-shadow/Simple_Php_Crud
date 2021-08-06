<?php
header('Content-Type: application/json');
include "../db.php";

$id = (int) $_POST['id'];

$stmt =$db->prepare("CALL deleteOneProduct(?)");
$result = $stmt->execute([$id]);

echo json_encode([
    'id' => $id,
    'result' => $result
]);
