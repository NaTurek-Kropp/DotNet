<?php
include('db.php'); // Include database connection

// Fetch categories from database
$sql = "SELECT * FROM Kategorie";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Programowanie w C# - Dokumentacja</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Programowanie w C#</h1>
        <p>Co nie co o języku</p>
    </header>

    <nav>
        <ul>
            <?php
            if ($result->num_rows > 0) {
                while($category = $result->fetch_assoc()) {
                    echo "<li><a href='category.php?id=" . $category['KategoriaID'] . "'>" . $category['KategoriaNazwa'] . "</a></li>";
                }
            } else {
                echo "<li>Brak dostępnych kategorii.</li>";
            }
            ?>
        </ul>
    </nav>

    <footer>
        <p>-----</p>
    </footer>
</body>
</html>
