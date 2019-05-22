<?php
require_once 'login1.php';

$response = array();

$response['info'] = array();

$method = $_SERVER['REQUEST_METHOD'];

if($method=='POST'){
    
	$value = $_POST['value'];
    $sql="SELECT * FROM authors WHERE authName = '{$value}'";
    echo($sql);	
    $result=$link->query($sql);
	if ($result->num_rows>0) {
		while ($row=$result->fetch_assoc()){
			$temp = array();

			//inserting the team in the temporary array
			$temp['authName'] = $row['authName'];
			$temp['bDay'] = $row['bDay'];
			$temp['dDay'] = $row['dDay'];
			$temp['authBIO'] = " ";//$row['authBIO'];
			$temp['email'] = " ";//$row['email'];
			$temp['Telephone'] = " ";//$row['Telephone'];
					

			//inserting the temporary array inside response
			array_push($response['info'],$temp);

		}
	}
       
    echo (json_encode($response));
    $result->close();
    $link->close();	
}
?>