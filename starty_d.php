<?php

$polaczenie=mysqli_connect('localhost','root','','starty');

if (mysqli_connect_errno())
{
    exit("Blad polaczenia z serwerem MySQL: ".mysqli_connect_error());
}

		?>
		<!DOCTYPE HTML>
<html>
    <head>
        <title>Starty</title>
        <meta charset="UTF-8">
		<link rel="stylesheet" href="main.css"/>
    </head>
    <body>
        <h1>Misje orbitalne</h1>
        <hr>
        <h3>Dodaj nowy start:</h3>
		
		<form action="starty_d.php" method="post">
		<p>Data startu: <input type="date" name="data" id="data" required /></p>
		<p>Status: <select name="status" id="status" required>
				<option value="sukces">Sukces</option>
				<option value="porazka">Porażka</option>
			</select></p>
		
		<p>Miejsce: <select name="miejsce" id="miejsce" required>
				<option value="1">Kennedy Space Center</option>
				<option value="2">Cape Canaveral SFS</option>
				<option value="3">Vandenberg SFB</option>
				<option value="4">Wallops FF</option>
				<option value="5">Rocket Lab LC-1</option>
				<option value="6">Guiana Space Center</option>
				<option value="7">Jiuquan SLC</option>
				<option value="8">Xichang SLC</option>
				<option value="9">Shatish Dhawan SC</option>
				<option value="10">Tanegashima SC</option>
				<option value="11">Space Port Kii</option>
				<option value="12">Kosmodrom Bajkonur</option>
				<option value="13">Kosmodrom Wostocznyj</option>
			</select></p>
			
		<p>Rakieta: <select name="rakieta" id="rakieta" required>
				<option value="1">Falcon 9</option>
				<option value="2">Falcon Heavy</option>
				<option value="3">Electron</option>
				<option value="4">Atlas V</option>
				<option value="5">Vulcan</option>
				<option value="6">New Glenn</option>
				<option value="7">Alpha</option>
				<option value="8">PSLV</option>
				<option value="9">LVM3</option>
				<option value="10">H3</option>
				<option value="11">Chang Zheng 2C</option>
				<option value="12">Ceres-1</option>
				<option value="13">Sojuz 2.1b</option>
				<option value="14">Proton</option>
				<option value="15">Ariane 6</option>
				<option value="16">Vega C</option>
				<option value="17">KAIROS</option>
			</select></p>
			<p><input type="submit" value="Dodaj" name="dodaj" id="dodaj"></p>
		</form>
		
				 <hr>
        <a href="index.php">Powrót do strony głównej</a>

        <hr>
		<a href="starty.php">Pełna lista startów</a>
        <a href="rakiety.php">Lista rakiet</a>
		<a href="ladunek.php">Lista ładunków</a>
		
		<footer>
		&copy; Łukasz Maćkowiak 5i
		</footer>
		
		<?php
		
	$data=$_POST['data'];
    $status=$_POST['status'];
    $miejsce=$_POST['miejsce'];
	$rakieta=$_POST['rakieta'];

    $zapytanie4=mysqli_query($polaczenie,"INSERT INTO starty (id_startu,data_startu,status_startu,id_miejsca,id_rakiety) VALUES (DEFAULT, '$data','$status','$miejsce','$rakieta');");
    if(!$zapytanie4)
    {
        echo "<p><b>Start nie został dodany do bazy</b></p>";
    }
    else
    {
        echo "<p><b>Start został dodany do bazy</b></p>";
    }
    mysqli_close($polaczenie);
		
		?>

    </body>
    </html>
	
        <?php

	?>