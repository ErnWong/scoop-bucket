$dir = resolve-path "$psscriptroot"
$temp = "$dir\_installtemp"

$exe = (resolve-path "$dir\*.exe")[0]
7z x $exe -o $temp -y
robocopy "$temp\`$_OUTDIR" "$dir" /e /move

rm -recurse $temp
