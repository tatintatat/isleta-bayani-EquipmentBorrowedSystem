<?php
include 'config.php';

// Kunin ang ID mula URL
$id = $_GET['id'];

// Kunin ang existing data
$result = $conn->query("SELECT * FROM products WHERE id=$id");
$row = $result->fetch_assoc();

// Kapag submit
if(isset($_POST['update'])) {

    $name = $_POST['name'];
    $desc = $_POST['description'];
    $qty = $_POST['quantity'];

    // Update query
    $sql = "UPDATE products 
            SET name='$name', description='$desc', quantity='$qty'
            WHERE id=$id";

    if($conn->query($sql)) {
        header("Location: index.php");
    } else {
        echo "Error: " . $conn->error;
    }
}
?>

<h2>Edit Product</h2>

<form method="POST">
    Name: <input type="text" name="name" value="<?= $row['name'] ?>"><br><br>
    Description: <textarea name="description"><?= $row['description'] ?></textarea><br><br>
    Quantity: <input type="number" name="quantity" value="<?= $row['quantity'] ?>"><br><br>

    <button type="submit" name="update">Update</button>
</form>