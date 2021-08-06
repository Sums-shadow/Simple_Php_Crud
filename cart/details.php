<?
header('Content-Type: application/json');
include "../db.php";

$id = (int) $_POST['id'];

$stmt = $db->prepare("SELECT * FROM `t_COMMUNIQUE` WHERE `PK_COMMUNIQUE`=?");
$stmt->execute([$id]);
$result = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode([
    'result' => $result
]);
