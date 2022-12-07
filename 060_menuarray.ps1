$data = @(
    'Angel'
    'Abraham'
    'Fabian'
    'Asaaam'
    'Lucia'
    'francisco'
    'Elias'
)
$i=0
foreach ($nombre in $data) {
    $i++;
    Write-Host $i")" $nombre
}
$opcion = Read-Host "Elige una opción: "

Write-Host $data[$opcion-1]

# 