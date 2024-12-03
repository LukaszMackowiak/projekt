<?php

$polaczenie=mysqli_connect('localhost','root','','starty');

if (mysqli_connect_errno())
{
    exit("Blad polaczenia z serwerem MySQL: ".mysqli_connect_error());
}

$zapytanie3 = mysqli_query($polaczenie,'SELECT rakiety.nazwa_rakiety AS "nazwa", rakiety.kategoria_rakiety AS "kategoria", rakiety.udzwig_rakiety AS "udzwig", firmy.nazwa_firmy AS "firma" FROM rakiety JOIN firmy ON rakiety.id_firmy = firmy.id_firmy ORDER BY rakiety.nazwa_rakiety ASC;');

 if(!$zapytanie3)
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
        <h3>Lista rakiet:</h3>
		<div class="rakiety">
		<?php
		echo "<table>";
		echo "<tr>";
			echo "<td>" . "<b>Nazwa</b>" . "</td>";
			echo "<td>" . "<b>Kategoria</b>" . "</td>";
			echo "<td>" . "<b>Udźwig (t)</b>" . "</td>";
			echo "<td>" . "<b>Firma</b>" . "</td>";
			echo "</tr>";
		while($wiersze3=mysqli_fetch_array($zapytanie3))
        {
            echo "<tr>";
			echo "<td>" . "$wiersze3[nazwa]" . "</td>";
			echo "<td>" . "$wiersze3[kategoria]" . "</td>";
			echo "<td>" . "$wiersze3[udzwig]" . "</td>";
			echo "<td>" . "$wiersze3[firma]" . "</td>";
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