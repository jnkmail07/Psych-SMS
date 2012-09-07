<?php

require "Services/Twilio.php";
require_once 'lib.php';

if(isset($_POST["to"]) && isset($_POST["from"]) && isset($_POST["message"]) && isset($_POST["timeout"]))
{
	date_default_timezone_set('America/Los_Angeles');
	
	$AccountSid = "AC2cba49bc2cc04f6c30b5fbb70143bd39";
	$AuthToken = "ffb9be11e0a28be10a4ead41a402b8b6";
	$client = new Services_Twilio($AccountSid, $AuthToken);
	$to = $_POST["to"];
	//$to="+17706956434";
	$from = $_POST["from"];
	//$from = "424-223-5737";
	$message = $_POST["message"];
	//$message = "Psych!!";
	$timeout = $_POST["timeout"];
	//$timeout = 10;
	
	$revTime = date('h:i:s A');

	$messageId = addMessageToQuarantine($revTime, $to, $from, $message, $timeout);

	sleep($timeout);
	
	$cancel = getCancelStatus($messageId);

	if($cancel==0){
		$sendTime = date('h:i:s A');
		
		$sms = $client->account->sms_messages->create($from,$to,$message);
		
		echo "Message Sent!;";
		echo "Received=$revTime;";
		echo "Sent=$sendTime;";
		echo "Timeout=$timeout;";
		//echo "Revoked=0";

		addMessageToArchive($messageId,$sendTime,$to,$from,$message,$timeout);
		removeMessageFromQuarantine($messageId);
	}
	else
		echo "Message not sent";

	
}
else
	echo "Success=0";