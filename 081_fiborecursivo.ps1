function Get-Fibonacci ($n) {
    if ($n -le 1) {
        return 1
    }
    return (Get-Fibonacci ($n - 1)) + (Get-Fibonacci ($n - 2))
}

$output = ""
foreach ($i in 0..15) {
#    $output += ("{0}, " -f (Get-Fibonacci $i))
    $output += ("{0}, " -f ($i))
#write-host (Get-Fibonacci $i)
}
echo "$output..."
