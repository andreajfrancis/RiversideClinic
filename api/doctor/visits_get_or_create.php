<?php
require_once "../utils.php";

/* NOTE:
   Keep the same doctor role protection pattern.
*/
$user = require_role("Doctor");

/* NOTE:
   IMPORTANT MERGE CHANGE:
   Main was reading appointmentId from GET.
   Our working version used POST JSON from doctor.js.
   This merged version supports BOTH so Open/visit creation keeps working
   even if one side calls with query string and the other sends JSON body.
*/
$data = json_decode(file_get_contents("php://input"), true);

$appointmentId = 0;
if (is_array($data) && isset($data["appointmentId"])) {
  $appointmentId = (int)$data["appointmentId"];
} elseif (isset($_GET["appointmentId"])) {
  $appointmentId = (int)$_GET["appointmentId"];
}

if ($appointmentId <= 0) {
  http_response_code(400);
  echo json_encode(["error" => "appointmentId required"]);
  exit;
}

/* NOTE:
   IMPORTANT FUNCTIONALITY KEPT:
   Before creating or returning a visit, make sure the appointment belongs
   to the logged-in doctor. This preserves the safer behavior from our
   working version while keeping the cleaner main structure.
*/
$stmt = $pdo->prepare("
  SELECT
    Appointment_ID,
    Patient_ID,
    Provider_User_ID
  FROM Appointment
  WHERE Appointment_ID = ?
    AND Provider_User_ID = ?
  LIMIT 1
");
$stmt->execute([$appointmentId, $user["id"]]);
$appointment = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$appointment) {
  http_response_code(404);
  echo json_encode(["error" => "Appointment not found"]);
  exit;
}

/* NOTE:
   If a visit already exists for this appointment, return it instead of
   creating a duplicate.
*/
$stmt = $pdo->prepare("
  SELECT Visit_ID
  FROM Visit
  WHERE Appointment_ID = ?
  LIMIT 1
");
$stmt->execute([$appointmentId]);
$existingVisit = $stmt->fetch(PDO::FETCH_ASSOC);

if ($existingVisit) {
  echo json_encode([
    "visitId" => (int)$existingVisit["Visit_ID"]
  ]);
  exit;
}

/* NOTE:
   Create the visit only after the doctor ownership check passes.
   Visit_DateTime is kept because that was part of our working logic.
*/
$stmt = $pdo->prepare("
  INSERT INTO Visit
    (Appointment_ID, Patient_ID, Provider_User_ID, Created_By_User_ID, Visit_DateTime)
  VALUES
    (?, ?, ?, ?, NOW())
");
$stmt->execute([
  $appointment["Appointment_ID"],
  $appointment["Patient_ID"],
  $appointment["Provider_User_ID"],
  $user["id"]
]);

/* NOTE:
   doctor.js expects JSON in this exact shape:
   { visitId: number }
*/
echo json_encode([
  "visitId" => (int)$pdo->lastInsertId()
]);