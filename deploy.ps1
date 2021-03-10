$newIdxFile = $args[0]
$fileType = [IO.Path]::GetExtension($newIdxFile)

function Invoke-Quit {
    param (
        $ExitCode
    )
    Write-Host "Press any key to exit"
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit $ExitCode
}

if ($fileType -ne '.htm' -and $fileType -ne '.html') {
    Write-Host "This is not a HTML file!"
    Invoke-Quit -ExitCode 1
}

$oWRTIP = Read-Host -Prompt "Enter the IP address of OpenWRT (also is default gateway): "
Write-Host "Uploading new LuCI index file..."
Invoke-Expression -Command 'scp ' + $newIdxFile + ' root@' + $oWRTIP + ':/tmp/index.html'
Write-Host "Executing install script, DO NOT TERMINATE!..."
Invoke-Expression -Command 'ssh root@' + $oWRTIP + ' curl https://gist.githubusercontent.com/rk0cc/ff9482864b2c11559b26ea5532959134/raw/f57a3945c1bf146d6f272c6d2ed969aaeb0d4a7c/pagesetup.sh -o /tmp/luciidx.sh; chmod +x /tmp/luciidx.sh; /tmp/luciidx.sh'
Write-Host "LuCI index page has been changed!"
Invoke-Quit -ExitCode 0


