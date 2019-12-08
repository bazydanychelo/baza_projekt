<?php

	session_start();
	
	if (!isset($_SESSION['udanarejestracja']))
	{
		header('Location: main_operator.php');
		exit();
	}
	else
	{
		unset($_SESSION['udanarejestracja']);
	}
	
	/*Usuwanie zmiennych pamiętających wartości wpisane do formularza
	if (isset($_SESSION['fr_nick'])) unset($_SESSION['fr_nick']);
	if (isset($_SESSION['fr_email'])) unset($_SESSION['fr_email']);
	if (isset($_SESSION['fr_haslo1'])) unset($_SESSION['fr_haslo1']);
	if (isset($_SESSION['fr_haslo2'])) unset($_SESSION['fr_haslo2']);
	if (isset($_SESSION['fr_regulamin'])) unset($_SESSION['fr_regulamin']);
*/	
	//Usuwanie błędów rejestracji
	if (isset($_SESSION['e_godnosc'])) unset($_SESSION['e_godnosc']);
	if (isset($_SESSION['e_stanowisko'])) unset($_SESSION['e_stanowisko']);
	if (isset($_SESSION['e_telefon'])) unset($_SESSION['e_telefon']);
	if (isset($_SESSION['e_email'])) unset($_SESSION['e_email']);
	if (isset($_SESSION['e_haslo'])) unset($_SESSION['e_haslo']);
	
?>

<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>po zrobieniu praconika</title>
</head>

<body>
	
	Pracownik został dodany
	<?php
	header('Location: main_operator.php');
	?> 
</body>
</html>