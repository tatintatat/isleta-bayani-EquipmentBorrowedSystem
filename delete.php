<?php
include 'config.php';

// Kunin ang ID
$id = $_GET['id'];

// Delete query
$sql = "DELETE FROM products WHERE id=$id";

if($conn->query($sql)) {
    // Redirect pabalik
    header("Location: index.php");
} else {
    echo "Error deleting record: " . $conn->error;
}
?>