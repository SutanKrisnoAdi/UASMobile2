<?php
header("Content-Type: application/json");
include 'db.php';

$method = $_SERVER['REQUEST_METHOD'];
$id = isset($_GET['id']) ? intval($_GET['id']) : null;

switch ($method) {
    case 'GET':
        if ($id) {
            $sql = "SELECT * FROM items WHERE id = $id";
            $result = $conn->query($sql);
            $data = $result->fetch_assoc();
        } else {
            $sql = "SELECT * FROM items";
            $result = $conn->query($sql);
            $data = [];
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
        }
        echo json_encode($data);
        break;

    case 'POST':
        $input = json_decode(file_get_contents('php://input'), true);
        if (isset($input['kode'], $input['nama'], $input['qty'])) {
            $kode = $conn->real_escape_string($input['kode']);
            $nama = $conn->real_escape_string($input['nama']);
            $qty = intval($input['qty']);
            $sql = "INSERT INTO items (kode, nama, qty) VALUES ('$kode', '$nama', $qty)";
            if ($conn->query($sql) === TRUE) {
                echo json_encode(['id' => $conn->insert_id]);
            } else {
                echo json_encode(['error' => $conn->error]);
            }
        } else {
            echo json_encode(['error' => 'Input tidak valid']);
        }
        break;

    case 'PUT':
        if ($id) {
            $input = json_decode(file_get_contents('php://input'), true);
            if (isset($input['kode'], $input['nama'], $input['qty'])) {
                $kode = $conn->real_escape_string($input['kode']);
                $nama = $conn->real_escape_string($input['nama']);
                $qty = intval($input['qty']);
                $sql = "UPDATE items SET kode='$kode', nama='$nama', qty=$qty WHERE id=$id";
                if ($conn->query($sql) === TRUE) {
                    echo json_encode(['message' => 'Record updated successfully']);
                } else {
                    echo json_encode(['error' => $conn->error]);
                }
            } else {
                echo json_encode(['error' => 'Input tidak valid']);
            }
        }
        break;

    case 'DELETE':
        if ($id) {
            $sql = "DELETE FROM items WHERE id = $id";
            if ($conn->query($sql) === TRUE) {
                echo json_encode(['message' => 'Record deleted successfully']);
            } else {
                echo json_encode(['error' => $conn->error]);
            }
        }
        break;

    default:
        echo json_encode(['message' => 'Metode tidak didukung']);
        break;
}

$conn->close();
?>
