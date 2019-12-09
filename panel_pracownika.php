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
	
	$polaczenie= new mysqli($host,$db_user,$db_password,$db_name);
	
	
	echo '<p>Witaj '.$_SESSION['Godnosc'].'! [<a href="logout.php">Wyloguj się!</a>]</p>
		  <p><b>Twoje stanowisko</b>: '.$_SESSION['Stanowisko'].'
	    | <b>Twój telefon</b>: '.$_SESSION['Telefon'].'
	      <br /><b>E-mail</b>: '.$_SESSION['email'].'</p>';
		  
	if ($polaczenie->connect_errno!=0)
	{
		echo "Error: ".$polaczenie->connect_errno;
	}
	else
	{
		
		$rezultat_1=@$polaczenie->query("SELECT sprzet.idSprzet, sprzet.Nazwa_urzadzenia, sprzet.Typ_urzadzenia, wypozyczenia.Data_wyp, 
		wypozyczenia.Data_zwrotu FROM wypozyczenia, sprzet WHERE wypozyczenia.idSprzetu=sprzet.idSprzet AND wypozyczenia.idPracownika=".$_SESSION['idPracownik']);
		$rezultat_2=@$polaczenie->query("SELECT * FROM sprzet WHERE Stanowiska=".$_SESSION['Stanowisko']);
		
		
		/*
		$lista_sprzetu_do_wypozyczenia=$rezultat->fetch_assoc();
		$_SESSION['idSprzet']=$lista_sprzetu_do_wypozyczenia['idSprzet'];
		$_SESSION['Nazwa_urzadzenia']=$lista_sprzetu_do_wypozyczenia['Nazwa_urzadzenia'];
		$_SESSION['Typ_urzadzenia']=$lista_sprzetu_do_wypozyczenia['Typ_urzadzenia'];
		$_SESSION['Lokalizacja']=$lista_sprzetu_do_wypozyczenia['Lokalizacja'];
		$_SESSION['dostepnosc']=$lista_sprzetu_do_wypozyczenia['dostepnosc'];
		$_SESSION['Stan']=$lista_sprzetu_do_wypozyczenia['Stan'];
		$_SESSION['wyrzucony']=$lista_sprzetu_do_wypozyczenia['wyrzucony'];
		echo $_SESSION['Nazwa_urzadzenia'];
		*/
		
			
		echo "<p><table border='1' cellpading='10' cellspacing='1'>";
		echo "<caption align='center'><b>Co już wypożyczyłeś</b></caption>";
		echo "<tr> <td><b>Numer sprzętu</b></td> <td><b>Nazwa urządzenia</b></td> <td><b>Typ urządzenia</b></td> <td><b>Data wypożyczenia</b></td>";
		echo "<td><b>Data zwrotu</b></td> </tr>";
		
		while($row_w = mysqli_fetch_array($rezultat_1))
		{echo '<tr><td>'.$row_w['idSprzet'].'</td><td>'.$row_w['Nazwa_urzadzenia'].
		'</td><td>'.$row_w['Typ_urzadzenia'].'</td><td>'.$row_w['Data_wyp'].
		'</td><td>'.$row_w['Data_zwrotu'].'</td></tr>';}
		echo "</p>";
			
		echo "<p><table border='1' cellpading='10' cellspacing='1'>";
		echo "<caption align='center'><b>Co możesz wypożyczyć</b></caption>";
		echo "<tr> <td><b>Numer sprzętu</b></td> <td><b>Nazwa urządzenia</b></td> <td><b>Typ urządzenia</b></td> <td><b>Dostępność</b></td>";
		echo "<td><b>Stan</b></td> <td><b>Czy został wyrzucony</b></td> </tr>";
		
		
		while($row = mysqli_fetch_array($rezultat_2))
		{echo '<tr><td>'.$row['idSprzet'].'</td><td>'.$row['Nazwa_urzadzenia'].
		'</td><td>'.$row['Typ_urzadzenia'].'</td><td>'; 
		if($row['dostepnosc']==1) echo "dostępny"; else echo "niedostepny";
		echo '</td><td>';
		if($row['Stan']==1) echo "dobry"; else echo "uszkodzony";
		echo '</td><td>';
		if($row['wyrzucony']==1) echo "wyrzucony"; else echo "nie wyrzucony";
		if($row['Stan']==1) 
		{
			echo '</td><td><form action="dodanie_wypozyczenia.php" method="post">
			<input type="hidden" name="idSprzet" value='.$row['idSprzet'].'>
			<input type="submit" value="Wypożycz" /></form>	</td></tr>';
		}
		else 
		{
			echo '</td><td><form action="dodanie_wypozyczenia.php" method="post">
			<input type="hidden" name="idSprzet" value='.$row['idSprzet'].'>
			<input type="submit" value="Wypożycz" disabled /></form>	</td></tr>';
		}
		echo "</p>";}
		
	}
		
		
	
		
		
		
	$polaczenie->close();
	
	
	



?>


</body>
</html>