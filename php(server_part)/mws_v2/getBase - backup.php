<?php
require_once 'login1.php';

$response = array();

$response['books'] = array();

$method = $_SERVER['REQUEST_METHOD'];

if($method=='POST'){
    $table=$_POST['nTable']; 	
    $field=$_POST['nField']; 	
    $condition=$_POST['tQuery'];
	$value = $_POST['value'];
    $sql="SELECT * FROM {$table} WHERE {$field} {$condition} {$value} ";
    //echo($sql);	
    $result=$link->query($sql);
	if ($result->num_rows>0) {
		while ($row=$result->fetch_assoc()){
			$temp = array();

			//inserting the team in the temporary array
			$temp['ISBN'] = $row['ISBN'];
			$temp['wrYear']=$row['wrYear'];
			$temp['publYear']=$row['publYear'];

			//inserting the temporary array inside response
			array_push($response['books'],$temp);
		}
	}
    //$row=$result->fetch_array(MYSQLI_ASSOC);
    
    echo (json_encode($response));
    $result->close();
    $link->close();	
}
?>