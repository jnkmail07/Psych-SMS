<?php
require_once 'DBClass.php';
class messageClass
{
	function addMessageToQuarantine($sentTime,$to,$from,$message,$timeout){
		$sql = "INSERT INTO messagequarantine(added, toNumber, fromNumber, message, timeout) VALUES ('$sentTime','$to','$from','$message',$timeout)";
		$db = new DBLayer();
		$id = $db->insertWithReturnId($sql);
		return $id;
	}
	function getLatestMessageIdFromQuarantine(){
		$sql = "SELECT max(id) FROM messagequarantine";
		$db = new DBLayer();
		$result = $db->select($sql);
		return $result[0];
	}
	function addMessageToArchive($id,$sentTime,$to,$from,$message,$timeout){
		$sql = "INSERT INTO messagearchive(id, added, toNumber, fromNumber, message, timeout) VALUES ($id,'$sentTime','$to','$from','$message',$timeout)";
		$db = new DBLayer();
		$db->insert($sql);
	}
	
	function getTop10messagesFromDB(){
		$sql = "SELECT * FROM messagearchive order by id desc limit 0,10";
		$db = new DBLayer();
		$result = $db->select($sql);
		return $result;

	}
	function getCancelStatus($id){
		$sql = "SELECT id FROM messagequarantine where id=$id";
		$db = new DBLayer();
		$status = $db->select($sql);
		if(count($status)>0)
			return 0;
		else
			return 1;
	}
	
	function removeMessageFromQuarantine($id){
		$sql = "DELETE FROM messagequarantine WHERE id=$id";
		$db = new DBLayer();
		$db->delete($sql);
	}
}