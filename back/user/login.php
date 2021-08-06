 

<?php
header('Content-Type: application/json');
include "../db.php";
$email_user=$_POST['email_user'];
$password_user=$_POST['password_user'];
// $password_user=password_hash($_POST['password_user'],PASSWORD_BCRYPT);

$stmt = $db->prepare("SELECT * FROM `t_user` WHERE `email_user`=? AND password_user=?");
$stmt->execute([$email_user,$password_user]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
 
if(sizeof($result)==0){
    echo json_encode([
"statut"=>"failed",
        "msg"=>"Echec d'authentification"
    ]);

exit();
} 
echo json_encode([
    "statut"=>"success",
    "result"=>$result
]);
 
// $passok=password_verify($password_user,$result[0]["password_user"]);
// echo $passok;
// exit();
// if($passok){
//     echo json_encode($result);
// }else{
//     echo "auth failed";
// }
// echo json_encode($result);
