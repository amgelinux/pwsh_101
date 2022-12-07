function factorial ($n) {
    if ($n -eq 1) {
        return 1
    }
    return $n * $(factorial ($n - 1))
}

write-host $(factorial 10)
