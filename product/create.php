<?php
header('Content-Type: application/json');
include "../db.php";

$name=$_POST['name'];
$price=$_POST['price'];
$image=$_POST['image'];
$userfk=$_POST['userfk'];


$stmt = $db->prepare("CALL proc_save_product(?,?,?,?)");
$result = $stmt->execute([$name, $price, $image,$userfk]);

echo json_encode([
    'result' => $result
]);
