<?php
require_once "../utils.php";
require_role("Doctor");

$stmt = $pdo->query("
  SELECT
    Patient_ID,
    First_Name,
    Last_Name,
    Date_Of_Birth AS Birth_Date
  FROM Patient
  ORDER BY Last_Name, First_Name
");

echo json_encode([
  "patients" => $stmt->fetchAll(PDO::FETCH_ASSOC)
]);