<#
function ensure($path) {
    if (!(test-path $path)) {
        mkdir -p $path
    }
}
#>

$dir = resolve-path "$psscriptroot\"
$deps = resolve-path "$dir\_scoopinstall"

$is64 = [intptr]::size -eq 8

if ($is64) {
    mv -force "$deps\ruby\x64-msvcrt-ruby200.dll" "$dir"
}
else {
    mv -force "$deps\ruby\msvcrt-ruby200.dll" "$dir"
}
mv -force "$deps\python34\python34.dll" "$dir"
mv -force "$deps\python27\python27.dll" "$dir"
mv -force "$deps\lua\lua52.dll" "$dir"
mv -force "$deps\perl\perl518.dll" "$dir"

<# Probably not needed. I will try installing it from hardlinked (junction) dotfiles\vim\bundle\  submodules

$vim = "$APPDATA\Vim"

ensure "$vim\vimfiles\bundle"

git clone https://github.com/Shougo/neobundle.vim "$vim\vimfiles\bundle\neobundle.vim"

mv -force "$deps\llvm\libclang.dll" "$deps\ycm\third_party\ycmd\libclang.dll"
mv -force "$deps\ycm" "$vim\vimfiles\bundle\YouCompleteMe"

#>

rm -recurse -force "$deps"
