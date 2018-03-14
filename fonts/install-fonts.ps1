function Get-ScriptDirectory 
{
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
    Split-Path $Invocation.MyCommand.Path
}

$fontsDir = "$($env:USERPROFILE)\fonts"
$fontsToInstall = get-content (join-path (Get-ScriptDirectory) "fontlist")

git clone https://github.com/powerline/fonts.git $fontsDir

$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14) # https://superuser.com/questions/201896/how-do-i-install-a-font-from-the-windows-command-prompt
foreach ($font in $fontsToInstall)
{
    Get-ChildItem -Recurse -include *.ttf,*.otf $fontsDir/$font | % { $fonts.CopyHere($_.fullname) }
}