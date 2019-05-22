<?php
require_once 'login1.php';


$method = $_SERVER['REQUEST_METHOD'];

if($method=='POST'){
    //getting values
    $orderDate = $_POST['orderDate'];
    $ISBN = $_POST['ISBN'];
    $amount = $_POST['amount'];
    $custID = $_POST['custID'];
    $sellerID = $_POST['sellerID'];
    $cardNum = $_POST['cardNum'];
    $sellingPrice = $_POST['sellingPrice'];
	
	
    $sql="INSERT INTO transaction (custID, ISBN, orderDate, amount, sellerID, sellingPrice, cardNum) VALUES ($custID, '$ISBN', '$orderDate', $amount, $sellerID, $sellingPrice, '$cardNum')";		
    echo($sql);	
    $result=$link->query($sql);
    print(json_encode($result));
    $link->close();	
}
?>