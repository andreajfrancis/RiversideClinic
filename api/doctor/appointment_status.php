<?php
require_once "../utils.php";
$user = require_role("Doctor");

$data = read_json();
$appointmentId = (int)($data["appointmentId"] ?? 0);
$status = strtoupper(trim($data["status"] ?? ""));

$allowed = [
  "SCHEDULED",
  "CHECKED_IN",
  "READY_FOR_PROVIDER",
  "CANCELLED",
  "RESCHEDULED",
  "NO_SHOW",
  "COMPLETED",
  "IN_PROGRESS"
];

if (!in_array($status, $allowed, true)) {
  http_response_code(400);
  echo json_encode(["error" => "Invalid status"]);
  exit;
}

if ($appointmentId <= 0) {
  http_response_code(400);
  echo json_encode(["error" => "appointmentId required"]);
  exit;
}

$stmt = $pdo->prepare("UPDATE Appointment SET Status=? WHERE Appointment_ID=? AND Provider_User_ID=?");
$stmt->execute([$status, $appointmentId, (int)$user["id"]]);

if ($stmt->rowCount() === 0) {
  http_response_code(403);
  echo json_encode(["error" => "Unauthorized to update this appointment"]);
  exit;
}

echo json_encode(["success" => true]);