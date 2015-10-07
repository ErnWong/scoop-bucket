<#
function ensure($path) {
    if (!(test-path $path)) {
        mkdir -p $path
    }
}
#>

$dir = resolve-path "$psscriptroot\.."
$deps = resolve-path "$dir\_scoopinstall"

mv -force "$deps\ruby\x64-msvcrt-ruby200.dll" "$dir"
mv -force "$deps\python35\python35.dll" "$dir"
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