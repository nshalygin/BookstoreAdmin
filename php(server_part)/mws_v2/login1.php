<?php
/**
 * Created by PhpStorm.
 * User: nikita
 * Date: 12.11.2018
 * Time: 21:38
 */
//require_once 'config.php';

$user = 'root';
$password = '';
$db = 'bookstoreeng';
$host = '127.0.0.1';
$port = 3306;
$socket = 'localhost:/Applications/MAMP/tmp/mysql/mysql.sock';

//$link = mysqli_init();
$link = new mysqli($host,$user,$password,$db,$port,$socket);
$link->set_charset("utf8");
 if($link->connect_errno >0){
	echo "<p>You're not connect to MySQL!</p>";
 }
 else {
	//echo "<p>You're successfully connect to MySQL!</p>";
 }

?>
