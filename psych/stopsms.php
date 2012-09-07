<?php

require 'lib.php';

$id=getLatestMessageIdFromQuarantine();
removeMessageFromQuarantine($id);
if($id>0)
	echo "Psych! Message successfully recalled.";
else
	echo "Unable to recall message.";

