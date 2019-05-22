<?php
require_once 'login1.php';


$method = $_SERVER['REQUEST_METHOD'];

if($method=='POST'){
    $authName = $_POST['authName'];
	//echo $authName;
    $Bday = $_POST['Bday'];      
	//echo $Bday;
    $Dday = $_POST['Dday'];
	//echo $Dday;
    $authBIO = $_POST['authBIO'];
	//echo $authBIO;
    $email = $_POST['email'];
	//echo $email;
    $telephone = $_POST['telephone'];
	
    $sql="INSERT INTO `authors` (`authName`, `Bday`, `Dday`, `authBIO`, `email`, `telephone`) values ('$authName' , '$Bday' , '$Dday' , '$authBIO', '$email', '$telephone')";		
    echo($sql);	
    $result=$link->query($sql);
    print(json_encode($result));
    $link->close();	
}
?>