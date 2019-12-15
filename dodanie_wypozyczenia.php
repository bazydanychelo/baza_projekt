<?php

	session_start();
	
	if(!isset($_SESSION['zalogowany']))
	{
		header('Location: logowanie_pracownik.php');
		exit();
	}
?>
<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Wypozyczalnia sprzetu</title>
</head>

<body>

<?php
	
	require_once "connect.php";
	
	$polaczenie= new mysqli($host,$db_user,$db_password,$db_name)
	
	
	if ($polaczenie->connect_errno!=0)
	{
		echo "Error: ".$polaczenie->connect_errno;
	}
	else
	{
	

	$ins = @$polaczenie->query("INSERT INTO wypozyczenia SET idPracownika='{$_SESSION['Stanowisko']}', idSprzetu='{$_POST['idSprzet']}',
	Data_wyp='{$data}'");
    
    if($ins) echo "Sprzęt został wypożyczony";
    else echo "Nie udało się wypożyczyć sprzętus";
	
	}
	
		
		
		
	$polaczenie->close();
	
	
	



?>


</body>
</html>