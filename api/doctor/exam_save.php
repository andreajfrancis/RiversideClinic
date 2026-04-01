<?php
require_once "../utils.php";
$user = require_role("Doctor");
$data = read_json();

$appointmentId = (int)($data["appointmentId"] ?? 0);
$visitId = (int)($data["visitId"] ?? 0);
$doctorExamNote = trim($data["doctorExamNote"] ?? "");
$medicationChanges = trim($data["medicationChanges"] ?? "");
$medicationNotes = trim($data["medicationNotes"] ?? "");
$doctorCaseStatus = trim($data["doctorCaseStatus"] ?? "COMPLETED");

if ($appointmentId <= 0 || $visitId <= 0) {
  http_response_code(400);
  echo json_encode(["error" => "appointmentId and visitId required"]);
  exit;
}

$stmt = $pdo->prepare("
  SELECT Appointment_ID
  FROM Appointment
  WHERE Appointment_ID = ?
    AND Provider_User_ID = ?
  LIMIT 1
");
$stmt->execute([$appointmentId, $user["id"]]);
if (!$stmt->fetch(PDO::FETCH_ASSOC)) {
  http_response_code(404);
  echo json_encode(["error" => "Appointment not found"]);
  exit;
}

$stmt = $pdo->prepare("
  UPDATE Visit_Exam
  SET Doctor_Exam_Note = ?
  WHERE Visit_ID = ?
");
$stmt->execute([$doctorExamNote, $visitId]);

if ($stmt->rowCount() === 0) {
  $stmt = $pdo->prepare("
    INSERT INTO Visit_Exam (Visit_ID, Doctor_Exam_Note)
    VALUES (?, ?)
  ");
  $stmt->execute([$visitId, $doctorExamNote]);
}

$stmt = $pdo->prepare("
  UPDATE Visit
  SET Doctor_Case_Status = ?
  WHERE Visit_ID = ?
");
$stmt->execute([$doctorCaseStatus, $visitId]);

$stmt = $pdo->prepare("
  UPDATE Appointment
  SET Status = 'COMPLETED'
  WHERE Appointment_ID = ?
    AND Provider_User_ID = ?
");
$stmt->execute([$appointmentId, $user["id"]]);

$stmt = $pdo->prepare("
  UPDATE Visit_Medication
  SET Medication_Changes = ?, Medication_Notes = ?
  WHERE Visit_ID = ?
");
$stmt->execute([$medicationChanges, $medicationNotes, $visitId]);

if ($stmt->rowCount() === 0) {
  $stmt = $pdo->prepare("
    INSERT INTO Visit_Medication (
      Visit_ID,
      Current_Medications,
      Medication_Changes,
      Medication_Notes
    )
    VALUES (?, '', ?, ?)
  ");
  $stmt->execute([$visitId, $medicationChanges, $medicationNotes]);
}

echo json_encode([
  "success" => true,
  "saved" => [
    "visitId" => $visitId,
    "doctorExamNote" => $doctorExamNote,
    "medicationChanges" => $medicationChanges,
    "medicationNotes" => $medicationNotes
  ]
]);