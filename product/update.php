<?php
header('Content-Type: application/json');
include "../db.php";

$id_product =(int) $_POST['id_product'];
$name_product = $_POST['name_product'];
$price_product =  $_POST['price_product'];
$image_product =  $_POST['image_product'];

$stmt = $db->prepare("UPDATE `t_product` SET `name_product`=?,`price_product`=?, `image_product`=?, `date_update`=CURRENT_TIMESTAMP() WHERE `id_product`=?");
$result =  $stmt->execute([$name_product, $price_product,$image_product, $id_product]);

echo json_encode([
    'success' => $result
]);
