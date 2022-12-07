Import-Module .\mates.psm1

$numeros = @(10000, 2000, 3000)
$inicio = $(CogerMayor $numeros)

# Venimos del mcd pero deberíamos cambiarlo a un while
for ($i = $inicio; $i -eq $i; $i++) {
    $encontrado = $true
    foreach ($elemento in $numeros) {
        if (-not $(EsDivisible $i $elemento)) {
            $encontrado = $false
            break
        }
    }
    if ($encontrado) {
        break
    }
}
Write-Host "El minimo comun multiplo de $numeros es el $i"
