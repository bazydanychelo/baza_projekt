<?php
	session_start();
	if(!isset($_SESSION['log_positive']))
	{
		header('Location: logowanie_operator.php');
		exit();
	}
?>
<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<title>Baza danych sprzętu</title>
</head>

<body>

<?php

	echo '<p>Witaj '.$_SESSION['name'].'!';
	$id=$_SESSION['id'];
	echo $id;
	
	
	
	echo '<p><a href="logout.php">Wyloguj sie!</a></p>';
	

?>


<a href="dodaj_uzytkownika.php">Dodaj użytkownika</a>





 
</body>
</html>