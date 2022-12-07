Clear-Host
$num = Read-Host "Entra un número: "
write-host "El numero que has entrado es el " $num
write-host "el valor entrado es un " $num.GetType().Name
$num=[int]$num

if ($num -gt 6) {
    Write-Host "$num  is greater than 6 "
} else {
    Write-Host "$num  is less than 6 "
}


for ($x = 0; $x -lt $num; $x++) {
    write-host -NoNewline $x","

<#
     if ($x -eq 0) {
        Write-Host -NoNewline $x
    } else {
        Write-Host -NoNewline ","$x
    }
 #>
}
write-host $x
