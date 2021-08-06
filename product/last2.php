<?php
header('Content-Type: application/json');
include "../db.php";

$stmt = $db->prepare("SELECT * FROM `listProduct` ORDER BY id_product ASC LIMIT 3");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);
