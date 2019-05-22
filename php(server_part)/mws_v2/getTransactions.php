<?php
require_once 'login1.php';

$response = array();

$response['transactions'] = array();

$method = $_SERVER['REQUEST_METHOD'];

if($method=='GET'){
    $sql="SELECT * FROM `transaction`";
    $result=$link->query($sql);
	if ($result->num_rows>0) {
		while ($row=$result->fetch_assoc()){
			$temp = array();

			//inserting the team in the temporary array
			$temp['transID'] = $row['transID'];
			$temp['custID'] = $row['custID'];
			$temp['ISBN'] = $row['ISBN'];
			$temp['orderDate'] = $row['orderDate'];
			$temp['amount'] = $row['amount'];
			$temp['sellerID'] = $row['sellerID'];
			$temp['sellingPrice'] = $row['sellingPrice'];
			$temp['cardNum']=$row['cardNum'];		

			//inserting the temporary array inside response
			array_push($response['transactions'],$temp);
		}
	}
    //$row=$result->fetch_array(MYSQLI_ASSOC);
    
    echo (json_encode($response));
    $result->close();
    $link->close();	
}
?>