Import-Module .\libreria_mates.psm1

$numeros = @()
$total=5
while ($numeros.Count -lt $total) {
    $numactual = Read-Host "Entra un número: "
    $numeros += [int]$numactual
    Write-Host "Numero elementos: " $numeros.Count   
}

Write-Host $numeros
$ordenados = $numeros | sort

Write-Host "Ordenados: " $ordenados
write-host "el menor: " $ordenados[0]
write-host "el mayor: " $ordenados[-1]
write-host "la media es:" $(CogerMediaAritmetica ($ordenados))
write-host "Mayor sin sort: " $(CogerMayor($numeros))
write-host "Menor sin sort: " $(CogerMenor($numeros))