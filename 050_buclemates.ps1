Import-Module ./libreria_mates.psm1

Write-Host "Muestra los 10 primeros numeros primos"
$contador = 0
$numero = 2
while ($contador -lt 10) {
    if (EsPrimo $numero) {
        Write-Host $numero
        $contador++
    }
    $numero++
}

write-host "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

write-host "Este programa escribe los numeros impares dado uno"
$numerofin = Read-Host "Mete un numero: "
Write-Host "El numero que has escrito es el: $numerofin"
$paroimpar= Read-Host "Par o impar"
if ($paroimpar -ieq "PAR") {
    $resultado = 0
} else {
    $resultado = 1
}
for ($i = 1; $i -le $numerofin; $i+=1) {
    if (($i % 2) -eq $resultado) {
        Write-Host $i
    }
}

write-host "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

write-host "El numero que has metido es primo?"
 if (EsPrimo $numerofin) {
    write-host "$numerofin es primo"
 } else {
    Write-Host "$numerofin NOOOO es primo"
 }   