<?php

$polaczenie=mysqli_connect('localhost','root','','starty');

if (mysqli_connect_errno())
{
    exit("Blad polaczenia z serwerem MySQL: ".mysqli_connect_error());
}

$zapytanie2 = mysqli_query($polaczenie,'SELECT starty.data_startu AS "data", rakiety.nazwa_rakiety AS "rakieta", miejsca.nazwa_miejsca AS "miejsce", starty.status_startu AS "status" FROM starty JOIN rakiety ON starty.id_rakiety = rakiety.id_rakiety JOIN miejsca ON starty.id_miejsca = miejsca.id_miejsca ORDER BY starty.data_startu DESC;');

 if(!$zapytanie2)
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
        <h3>Wszystkie starty:</h3>
		<div class="wszystkie">
		<?php
		echo "<table>";
		echo "<tr>";
			echo "<td>" . "<b>Data</b>" . "</td>";
			echo "<td>" . "<b>Rakieta</b>" . "</td>";
			echo "<td>" . "<b>Miejsce</b>" . "</td>";
			echo "<td>" . "<b>Status</b>" . "</td>";
			echo "</tr>";
		while($wiersze2=mysqli_fetch_array($zapytanie2))
        {
            echo "<tr>";
			echo "<td>" . "$wiersze2[data]" . "</td>";
			echo "<td>" . "$wiersze2[rakieta]" . "</td>";
			echo "<td>" . "$wiersze2[miejsce]" . "</td>";
			echo "<td>" . "$wiersze2[status]" . "</td>";
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