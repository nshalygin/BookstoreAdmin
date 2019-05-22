<?php
require_once 'login1.php';


$method = $_SERVER['REQUEST_METHOD'];

if($method=='POST'){
    //getting values
    $ISBN = $_POST['ISBN'];
    $bookTitle = $_POST['bookTitle'];
    $genre = $_POST['genre'];
    $authName = $_POST['authName'];
    $description = $_POST['description'];
    $numOfPages = $_POST['numOfPages'];
    $language = $_POST['language'];
    $publYear = $_POST['publYear'];
    $wrYear = $_POST['wrYear'];
	$publHouse = $_POST['publHouse'];
	$sellingPrice = $_POST['sellingPrice'];

	
    $sql="INSERT INTO `books` (`ISBN`, `bookTitle`, `genre`, `authName`, `description`, `numOfPages`, `language`, `publYear`, `wrYear`, `publHouse`, `sellingPrice`) VALUES ('$ISBN', '$bookTitle', '$genre', '$authName', '$description', '$numOfPages', '$language', '$publYear', '$wrYear', '$publHouse', '$sellingPrice');";		
    echo($sql);	
    $result=$link->query($sql);
    print(json_encode($result));
    $link->close();	
}
?>