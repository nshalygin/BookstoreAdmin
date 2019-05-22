<?php
/**
 * Created by PhpStorm.
 * User: nikita
 * Date: 14.11.2018
 * Time: 0:54
 */
require_once 'login.php';
// Весь код подключения к существующей базе данных
$result = mysqli_query($link, "SHOW TABLES;");
if (!$result) {
    die("<p>Ошибка при выводе перечня таблиц:" . mysqli_error() . "</p>");
}
echo "<p>Таблицы, имеющиеся в базе данных:</p>";
echo "<ul>";
while ($row = mysqli_fetch_row($result)) {
    echo "<li>Таблица: " . $row[0] . "</li>";
}
echo "</ul>";
$result = mysqli_query($link, 'SELECT * FROM Authors');
if (!$result) {
    die("<p>Сбой при доступе к баззе данных:" . mysqli_error() . "</p>");
}

$rows = mysqli_num_rows($result);
while ($rows = mysqli_fetch_row($result)) {
    echo "<li>AuthorID: " . $rows[0] . "</li>";
    echo "<li>Author Name: " . $rows[1] . "</li>";
    echo "<li>B-Day: " . $rows[2] . "</li>";
    echo "<li>Day of death: " . $rows[3] . "</li>";
    echo "<li>BIO: " . $rows[4] . "</li>";
    echo "<li>E-mail: " . $rows[5] . "</li>";
    echo "<li>Telephone: " . $rows[6] . "</li>";
}

?>
