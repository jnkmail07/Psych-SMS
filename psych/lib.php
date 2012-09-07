<?php
require_once 'DBClass.php';
require_once 'messageClass.php';


function addMessageToArchive($id,$sentTime,$to,$from,$message,$timeout){
	$messageObject = new messageClass();
	$messageObject->addMessageToArchive($id,$sentTime, $to, $from, $message, $timeout);
}
function addMessageToQuarantine($sentTime,$to,$from,$message,$timeout){
	$messageObject = new messageClass();
	$messageId = $messageObject->addMessageToQuarantine($sentTime, $to, $from, $message, $timeout);
	return $messageId;
}
function getLatestMessageIdFromQuarantine(){
	$messageObject = new messageClass();
	$messageId = $messageObject->getLatestMessageIdFromQuarantine();
	return $messageId[0];
}
function  removeMessageFromQuarantine($id){
	$messageObject = new messageClass();
	$messageObject->removeMessageFromQuarantine($id);
}

function getTop10messagesFromDB(){
	$messageObject = new messageClass();
	$result = $messageObject->getTop10messagesFromDB();
	return $result;
}

function getCancelStatus($id){
	$messageObject = new messageClass();
	$status = $messageObject->getCancelStatus($id);
	return $status;
}
