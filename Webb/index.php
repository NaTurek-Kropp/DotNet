<?php
include('db.php');

// Fetch topics along with their category names
$sql = "SELECT t.TematID, t.Nazwa, t.Opis, k.Nazwa AS KategoriaNazwa 
        FROM Tematy t 
        LEFT JOIN Kategorie k ON t.KategoriaID = k.KategoriaID";

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
    <h1>Programowanie w C# - Dokumentacja</h1>
    <ul>
        <?php
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<li><a href='temat.php?id=" . $row['TematID'] . "'>" . $row['Nazwa'] . "</a> - Kategoria: " . $row['KategoriaNazwa'] . "</li>";
            }
        } else {
            echo "<li>Brak dostępnych tematów.</li>";
        }
        ?>
    </ul>
</body>
</html>
<?php
$conn->close();
?>
