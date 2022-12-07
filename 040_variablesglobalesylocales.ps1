# variable global
$c = 10
function sumaconanadidos ($a, $b) {
# creamos una variable local ******
    $d = 9
# la variable global $c se puede usar dentro 
# (en algunos lenguajes como php se tiene que declarar como global $c dentro de la funcion)
    write-host "Variable global" $c
    return $a + $b + $c
}
# esta variable local no tiene sentido fuera, no muetra nada
write-host "Variable global" $c
write-host "Variable local:" $d

sumaconanadidos 1 2

