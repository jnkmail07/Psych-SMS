<?php
require 'config.php';	

class DBLayer
{

	function insertWithReturnId($sql)
   {
		$con = mysql_connect(DB_SERVER,DB_USER_NAME,DB_PASSWORD);
		if (!$con)
	  	{
	  		die('Could not connect: ' . mysql_error());
	  	}
		
		mysql_select_db(DB_NAME, $con);
		
		mysql_query($sql);
		$id = mysql_insert_id($con);
		mysql_close($con);
		return $id;
   }
   
   function insert($sql)
   {
		$con = mysql_connect(DB_SERVER,DB_USER_NAME,DB_PASSWORD);
		if (!$con)
	  	{
	  		die('Could not connect: ' . mysql_error());
	  	}
		mysql_select_db(DB_NAME, $con);
		
		mysql_query($sql);
		
		mysql_close($con);
   }
   
   function update($sql) {
   		$con = mysql_connect(DB_SERVER,DB_USER_NAME,DB_PASSWORD);
		if (!$con)
	  	{
	  		die('Could not connect: ' . mysql_error());
	  	}
		
		mysql_select_db(DB_NAME, $con);
		
		mysql_query($sql);
		
		mysql_close($con);	
   }
   
   function delete($sql) {
   		$con = mysql_connect(DB_SERVER,DB_USER_NAME,DB_PASSWORD);
		if (!$con)
	  	{
	  		die('Could not connect: ' . mysql_error());
	  	}
		
		mysql_select_db(DB_NAME, $con);
		
		mysql_query($sql);
		
		mysql_close($con);
   }
   
   function select($sql) {
	   	$con = mysql_connect(DB_SERVER,DB_USER_NAME,DB_PASSWORD);
	   	
		if (!$con)
	  	{
	  		die('Could not connect: ' . mysql_error());
	  	}
	
		mysql_select_db(DB_NAME, $con);
	
		$result = mysql_query($sql);
		
		
		$resultArray = array();
		while($row = mysql_fetch_array($result))
		{
		  $resultArray[] = $row;
		  
		}
	
		mysql_close($con);
		
		return $resultArray;
   	
   }
}
?>