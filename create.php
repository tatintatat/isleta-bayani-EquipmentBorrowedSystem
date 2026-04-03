<?php
include 'config.php';

// Check kung na-submit ang form
if(isset($_POST['submit'])) {

    // Kunin ang input
    $name = $_POST['name'];
    $desc = $_POST['description'];
    $qty = $_POST['quantity'];

    // Insert query
    $sql = "INSERT INTO products (name, description, quantity) 
            VALUES ('$name', '$desc', '$qty')";

    if($conn->query($sql)) {
        // Redirect pabalik sa index
        header("Location: index.php");
    } else {
        echo "Error: " . $conn->error;
    }
}
?>

<h2>Add Product</h2>

<form method="POST">
    Name: <input type="text" name="name" required><br><br>
    Description: <textarea name="description"></textarea><br><br>
    Quantity: <input type="number" name="quantity" required><br><br>
    <button type="submit" name="submit">Save</button>
</form>