<?php
header('Content-Type: application/json');
include "../db.php";

$stmt = $db->prepare("SELECT * FROM `t_COMMUNIQUE`");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);
