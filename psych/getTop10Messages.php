<?php
require_once 'lib.php';

$top10Messages = getTop10messagesFromDB();
if(count($top10Messages)>0){
	//echo "Success=1;";
	json_encode($top10Messages);
	print_r($top10Messages);
}
else
	echo "10 Most Recent Messages";
