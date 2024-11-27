<?php
include('db.php');

// Get the topic ID from the URL
$tematID = $_GET['id'];

// Fetch topic details
$sql = "SELECT * FROM Tematy WHERE TematID = $tematID";
$tematResult = $conn->query($sql);
$temat = $tematResult->fetch_assoc();

// Fetch examples for the topic
$sqlExamples = "SELECT * FROM Przykłady WHERE TematID = $tematID";
$examples = $conn->query($sqlExamples);
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $temat['Nazwa']; ?></title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1><?php echo $temat['Nazwa']; ?></h1>
    <p><?php echo $temat['Opis']; ?></p>

    <h2>Przykłady:</h2>
    <ul>
        <?php
        if ($examples->num_rows > 0) {
            while($example = $examples->fetch_assoc()) {
                echo "<li><pre>" . $example['Kod'] . "</pre><p>" . $example['Opis'] . "</p></li>";
            }
        } else {
            echo "<li>Brak przykładów.</li>";
        }
        ?>
    </ul>
</body>
</html>

<?php
$conn->close();
?>
