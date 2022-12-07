try {
    $size = (Get-PartitionSupportedSize -DriveLetter $drive_letter)
}
catch {
    write-host "No existe esa unidad"
}

try {
    $division = 66 / 0
    write-host $division
} catch {
    write-Host "Eso no se puede hacer, estas dividiendo entre 0."
} 
finally {
    <#Do this after the try block regardless of whether an exception occurred or not#>
    write-host "Sigo con el programa"
}

