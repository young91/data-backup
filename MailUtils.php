<?php

require("class.phpmailer.php");

define("MAIL_HOST", 'smtp.exmail.qq.com');
define("MAIL_USERNAME", 'email');
define("MAIL_PWD", 'pass');
echo $argv[1]."\n";
echo $argv[2]."\n";
sendMail(array('douqu.me@gmail.com'),'data backup',' backup at '.date('Y-m-d H:i:s',time()),$argv[1],$argv[2]);


function sendMail($toArray,$subject,$body,$attachfile,$filename){
	$mail = new PHPMailer();
	$mail->IsSMTP(); 
	                                    // set mailer to use SMTP
	$mail->Host = MAIL_HOST;  // specify main and backup server
	$mail->SMTPAuth = true;     // turn on SMTP authentication
	$mail->Username = MAIL_USERNAME;  // SMTP username
	$mail->Password = MAIL_PWD; // SMTP password
	
	$mail->From = "email";
	$mail->FromName = "douqu";
	foreach ($toArray as $to){
	  $mail->AddAddress($to); 
	} 
	$mail->IsHTML(true);                                  // set email format to HTML
	
	$mail->Subject = $subject;
	$mail->Body    = $body;
	$mail->AddAttachment($attachfile,$filename);
	if(!$mail->Send())
	{
	   echo "Message could not be sent. <p>";
	   echo "Mailer Error: " . $mail->ErrorInfo;
	   exit;
	}
	echo "Message has been sent\n";

}


?>
