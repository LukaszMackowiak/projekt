<?php

$polaczenie=mysqli_connect('localhost','root','','starty');

if (mysqli_connect_errno())
{
    exit("Blad polaczenia z serwerem MySQL: ".mysqli_connect_error());
}

$zapytanie5 = mysqli_query($polaczenie,'SELECT ladunki.nazwa_ladunku AS "nazwa", ladunki.operator_ladunku AS "operator", ladunki.masa_ladunku AS "masa", starty.data_startu AS "data" FROM ladunki JOIN starty ON ladunki.id_startu = starty.id_startu ORDER BY starty.data_startu DESC;');

 if(!$zapytanie5)
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
        <h3>Lista ładunków:</h3>
		<div class="ladunki">
		<?php
		echo "<table>";
		echo "<tr>";
			echo "<td>" . "<b>Nazwa</b>" . "</td>";
			echo "<td>" . "<b>Operator</b>" . "</td>";
			echo "<td>" . "<b>Masa (t)</b>" . "</td>";
			echo "<td>" . "<b>Data startu</b>" . "</td>";
			echo "</tr>";
		while($wiersze5=mysqli_fetch_array($zapytanie5))
        {
            echo "<tr>";
			echo "<td>" . "$wiersze5[nazwa]" . "</td>";
			echo "<td>" . "$wiersze5[operator]" . "</td>";
			echo "<td>" . "$wiersze5[masa]" . "</td>";
			echo "<td>" . "$wiersze5[data]" . "</td>";
			echo "</tr>";
			
        }
		echo "</table>";
		?>
		</div>
        <hr>
        <a href="index.php">Powrót do strony głównej</a>

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