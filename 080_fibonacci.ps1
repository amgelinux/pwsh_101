$num_elem=100
$ele1=1
$ele2=1
write-host $ele1
Write-host $ele2
for ($i = 0; $i -lt ($num_elem-2); $i++) {
    $ele3 = $ele1 + $ele2
    write-host $ele3
    $ele1 = $ele2
    $ele2 = $ele3
}
