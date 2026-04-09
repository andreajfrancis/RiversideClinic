<?php
session_start();
require_once "../config.php";

header('Content-Type: application/json');

if (!isset($_SESSION['user']) || !is_array($_SESSION['user'])) {
    http_response_code(401);
    echo json_encode([
        "error" => "Not logged in"
    ]);
    exit;
}

$userId = (int)($_SESSION['user']['id'] ?? 0);

if ($userId <= 0) {
    http_response_code(401);
    echo json_encode([
        "error" => "Invalid session"
    ]);
    exit;
}

$stmt = $pdo->prepare("
    SELECT
        u.User_ID,
        u.First_Name,
        u.Last_Name,
        r.Role_Name,
        li.Must_Change_Password
    FROM users u
    JOIN user_login_info li
        ON u.User_ID = li.User_ID
    JOIN roles r
        ON u.Role_ID = r.Role_ID
    WHERE u.User_ID = ?
    LIMIT 1
");

$stmt->execute([$userId]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user) {
    http_response_code(404);
    echo json_encode([
        "error" => "User not found"
    ]);
    exit;
}

echo json_encode([
    "id" => (int)$user['User_ID'],
    "name" => trim(($user['First_Name'] ?? '') . ' ' . ($user['Last_Name'] ?? '')),
    "role" => $user['Role_Name'],
    "mustChangePassword" => ((int)$user['Must_Change_Password'] === 1)
]);