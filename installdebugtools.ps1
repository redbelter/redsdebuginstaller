new-item "C:\tools\" -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("https://download.sysinternals.com/files/PSTools.zip","C:\tools\pstools.zip")
Expand-Archive -LiteralPath "C:\tools\pstools.zip" -DestinationPath "C:\tools\" -Force


$WebClient.DownloadFile("https://download.sysinternals.com/files/ProcessMonitor.zip","C:\tools\processmonitor.zip")
Expand-Archive -LiteralPath "C:\tools\processmonitor.zip" -DestinationPath "C:\tools\"  -Force

$WebClient.DownloadFile("https://download.sysinternals.com/files/ProcessMonitor.zip","C:\tools\processexplorer.zip")
Expand-Archive -LiteralPath "C:\tools\processexplorer.zip" -DestinationPath "C:\tools\"  -Force