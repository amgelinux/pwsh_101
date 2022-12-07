function EsPrimo($numero) {
    if ($numero -eq 2) {return $true}
    $contador = 2
    while ($contador -le ($numero / 2)) {
        if ((EsDivisible $numero $contador) -eq $true) {
            return $false
        }
        $contador++
    }
    return $true
}

# Devuelve true si el dividendo es divisible por el divisor.
# DIVISION ENTERA !!!!!
function EsDivisible($dividendo, $divisor) {
    if ($dividendo % $divisor -eq 0) {
        return $true
    } else {
        return $false
    }
}

# Devuelve el mayor número de una matriz de valores
function CogerMenor($valores) {
    $menor = $valores[0]
    for ($i = 0; $i -lt $valores.Count; $i++) {
        if ($menor -gt $valores[$i]) {
            $menor = $valores[$i]
        }
    }
    return $menor
}

# Devuelve el menor número de una matriz de valores
function CogerMayor($valores) {
    $mayor = $valores[0]
    for ($i = 0; $i -lt $valores.Count; $i++) {
        if ($mayor -lt $valores[$i]) {
            $mayor = $valores[$i]
        }
    }
    return $mayor
}
function CogerMediaAritmetica($valores) {
    $suma = 0
    for ($i = 0; $i -lt $valores.Count; $i++) {
        $suma = $suma + $valores[$i]
    }
    return ($suma / $valores.Count) 
}
