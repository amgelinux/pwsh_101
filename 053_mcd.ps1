Import-Module .\mates.psm1

$numeros = @(1000, 2000, 3000)
$inicio = $(CogerMenor $numeros)

for ($i = $inicio; $i -ge 1; $i--) {
    $encontrado = $true
    foreach ($elemento in $numeros) {
        if (-not $(EsDivisible $elemento $i)) {
            $encontrado = $false
            break
        }
    }
    if ($encontrado) {
        break
    }
}
Write-Host "El maximo comun divisor de $numeros es el $i"