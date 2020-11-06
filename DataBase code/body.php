<?php
 
$HostName = "localhost";
$DatabaseName = "id14279158_beauty_agneda";
$HostUser = "id14279158_timchao";
$HostPass = "Timchao0204.."; 
 
$mysqli = new mysqli($HostName,$HostUser,$HostPass,$DatabaseName);
$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);

$json = file_get_contents('php://input');
$obj = json_decode($json,true);
$body = $obj['body'];
$id = $obj['id'];

$SQL = "UPDATE users SET body = '$body' WHERE id = '$id'";
 
 
if($mysqli -> query($SQL)) {
    $MSG = '填寫完成!，趕快登入來使用Beauty Agenda吧!' ;
	$json = json_encode($MSG);
	echo $json ;
} else {
    $MSG = $mysqli -> error;
    $json = json_encode($MSG);
    echo $json ;
}

    mysqli_close($con);
?>