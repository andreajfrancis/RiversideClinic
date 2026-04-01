<?php
require_once "../utils.php";
$user = require_role("Doctor");

$patientId = (int)($_GET["patientId"] ?? 0);

$stmt = $pdo->prepare("
  SELECT
    Appointment_ID,
    Scheduled_Start,
    Status
  FROM Appointment
  WHERE Patient_ID = ?
  ORDER BY Scheduled_Start DESC
");

$stmt->execute([$patientId]);

echo json_encode([
  "appointments" => $stmt->fetchAll(PDO::FETCH_ASSOC)
]);