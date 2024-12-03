<?php

$polaczenie=mysqli_connect('localhost','root','','starty');

if (mysqli_connect_errno())
{
    exit("Blad polaczenia z serwerem MySQL: ".mysqli_connect_error());
}

$zapytanie1 = mysqli_query($polaczenie,'SELECT starty.data_startu AS "data", rakiety.nazwa_rakiety AS "rakieta", miejsca.nazwa_miejsca AS "miejsce", starty.status_startu AS "status" FROM starty JOIN rakiety ON starty.id_rakiety = rakiety.id_rakiety JOIN miejsca ON starty.id_miejsca = miejsca.id_miejsca ORDER BY starty.data_startu DESC LIMIT 5;');

 if(!$zapytanie1)
    {
        mysqli_close($polaczenie);
        echo "Błąd <br>";

        exit;
    }
    else
    {
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
        <h3>Ostatnie starty:</h3>
		<div class="ostatnie">
		<?php
		echo "<table>";
		echo "<tr>";
			echo "<td>" . "<b>Data</b>" . "</td>";
			echo "<td>" . "<b>Rakieta</b>" . "</td>";
			echo "<td>" . "<b>Miejsce</b>" . "</td>";
			echo "<td>" . "<b>Status</b>" . "</td>";
			echo "</tr>";
		while($wiersze1=mysqli_fetch_array($zapytanie1))
        {
            echo "<tr>";
			echo "<td>" . "$wiersze1[data]" . "</td>";
			echo "<td>" . "$wiersze1[rakieta]" . "</td>";
			echo "<td>" . "$wiersze1[miejsce]" . "</td>";
			echo "<td>" . "$wiersze1[status]" . "</td>";
			echo "</tr>";
			
        }
		echo "</table>";
		?>
		</div>
        <hr>
        <a href="starty.php">Pełna lista startów</a>
        <a href="rakiety.php">Lista rakiet</a>
		<a href="ladunek.php">Lista ładunków</a>

        <hr>
        <a href="starty_d.php">Dodaj nowy start</a><br>
		
		<footer>
		&copy; Łukasz Maćkowiak 5i
		</footer>

    </body>
    </html>
        <?php

        mysqli_close($polaczenie);
    }
	?>