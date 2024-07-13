

new-item "C:\tools\" -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("https://download.sysinternals.com/files/PSTools.zip","C:\tools\pstools.zip")
Expand-Archive -LiteralPath "C:\tools\pstools.zip" -DestinationPath "C:\tools\" -Force


$WebClient.DownloadFile("https://download.sysinternals.com/files/ProcessMonitor.zip","C:\tools\processmonitor.zip")
Expand-Archive -LiteralPath "C:\tools\processmonitor.zip" -DestinationPath "C:\tools\"  -Force

$WebClient.DownloadFile("https://download.sysinternals.com/files/ProcessMonitor.zip","C:\tools\processexplorer.zip")
Expand-Archive -LiteralPath "C:\tools\processexplorer.zip" -DestinationPath "C:\tools\"  -Force

$WebClient.DownloadFile("https://go.microsoft.com/fwlink/?linkid=2272610","C:\tools\winsdk.exe")
$WebClient.DownloadFile("https://go.microsoft.com/fwlink/?linkid=2272234","C:\tools\winwdk.exe")
$sdkinstall = "C:\tools\winsdk.exe"
$wdkinstall = "C:\tools\winwdk.exe"

write-host "uninstall sdk, wdk just incase"
Start-Process -FilePath $sdkinstall -ArgumentList " /uninstall /install C:\tools\sdk /q" -NoNewWindow -Wait
Start-Process -FilePath $wdkinstall -ArgumentList " /uninstall /install C:\tools\sdk /q" -NoNewWindow -Wait
Get-ChildItem "C:\tools\sdk" -Recurse | Remove-Item -Recurse

write-host "start with sdk"

#install windows sdk
#https://go.microsoft.com/fwlink/?linkid=2272610
$sdkargs = " /features + /installpath C:\tools\sdk /q"
Start-Process -FilePath $sdkinstall -ArgumentList $sdkargs -NoNewWindow -Wait
write-host "done with sdk"

write-host "start with wdk"
#download the wdk
#https://go.microsoft.com/fwlink/?linkid=2272234


$wdkargs = " /features + /installpath C:\tools\sdk /q"
Start-Process -FilePath $wdkinstall -ArgumentList $wdkargs -NoNewWindow -Wait
write-host "done with wdk"

#repair the sdk to get tracefmt
write-host "repair sdk to get tracefmt"
$sdkargs = " /features + /installpath C:\tools\sdk /q /repair"
Start-Process -FilePath $sdkinstall -ArgumentList $sdkargs -NoNewWindow -Wait
write-host "done with sdk"