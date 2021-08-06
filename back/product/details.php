 

<?php
header('Content-Type: application/json');
include "../db.php";
$id_product=$_POST['id_product'];
$stmt = $db->prepare("SELECT * FROM `t_product` WHERE `id_product`=?");
$stmt->execute([$id_product]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);
