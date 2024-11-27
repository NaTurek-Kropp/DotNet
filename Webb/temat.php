<?php
include('db.php');

$topicID = $_GET['id'];

$sql = "SELECT * FROM Tematy WHERE TematID = $topicID";
$topicResult = $conn->query($sql);
$topic = $topicResult->fetch_assoc();

$sqlExamples = "SELECT * FROM Przykłady WHERE TematID = $topicID";
$examples = $conn->query($sqlExamples);
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $topic['Nazwa']; ?> - Dokumentacja C#</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1><?php echo $topic['Nazwa']; ?></h1>
        <p><?php echo $topic['Opis']; ?></p>
    </header>

    <section>
        <h2>Przykłady:</h2>
        <?php
        if ($examples->num_rows > 0) {
            while($example = $examples->fetch_assoc()) {
                echo "<section>";
                echo "<h3>" . $example['Nazwa'] . "</h3>";
                echo "<pre><code>" . htmlspecialchars($example['Kod']) . "</code></pre>"; 
                echo "<p>" . $example['Opis'] . "</p>"; 
                echo "</section>";
            }
        } else {
            echo "<p>Brak przykładów dla tego tematu.</p>";
        }
        ?>
    </section>

    <a href="category.php?id=<?php echo $topic['KategoriaID']; ?>" class="back-button">Wróć do kategorii</a>

    <footer>
        <p>-----</p>
    </footer>
</body>
</html>
