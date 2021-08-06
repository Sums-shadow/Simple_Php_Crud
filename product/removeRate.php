<?php
header('Content-Type: application/json');
include "../db.php";

$id_product = (int) $_POST['id_product'];

$stmt =$db->prepare("CALL removeRateProduct(?)");
$result = $stmt->execute([$id_product]);

echo json_encode([
    'id' => $id_product,
    'result' => $result
]);
