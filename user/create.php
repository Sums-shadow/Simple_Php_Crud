<?php
header('Content-Type: application/json');
include "../db.php";

$name_user = $_POST['name_user'];
$lastname_user =  $_POST['lastname_user'];
$address_user = $_POST['name_user'];
$phone_user =  $_POST['lastname_user'];
$email_user = $_POST['email_user'];
// $password_user =  password_hash($_POST['lastname_user'],PASSWORD_DEFAULT);
$password_user =  $_POST['lastname_user'];

$stmt = $db->prepare("SELECT * FROM `t_user` WHERE `email_user`=? ");
$stmt->execute([$email_user]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
if(sizeof($result)==0){
  $stmt = $db->prepare("CALL addUser(?,?,?,?,?,?)");
$result = $stmt->execute([$name_user,$lastname_user, $address_user,$phone_user,$email_user, $password_user]);

echo json_encode([
    "statut"=>"success",
    "result"=>$result
]);
exit();
  
}
echo json_encode([
    "statut"=>"failed",
    "msg"=>"Cet email est deja utilisé"
]);
exit();

