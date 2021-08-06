 

<?php
header('Content-Type: application/json');
include "../db.php";
$id_user=$_POST['id_user'];
$stmt = $db->prepare("SELECT * FROM `t_user` WHERE `id_user`=?");
$stmt->execute([$id_user]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);
