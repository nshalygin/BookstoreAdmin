<?php
require_once 'login1.php';

$method = $_SERVER['REQUEST_METHOD'];

if($method=='GET'){
    $sql="SELECT * FROM `books`";
    //echo($sql);	
    $result=$link->query($sql);
	if ($result->num_rows>0) {
		while ($row=$result->fetch_assoc()){
			print(json_encode($row)); 
		}
	}
        
    //print(json_encode($row));
    $result->close();
    $link->close();	
}
?>