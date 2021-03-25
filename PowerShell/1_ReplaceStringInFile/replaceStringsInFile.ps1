# $Source_Text = Read-Host 'Enter source'

# $Target_Text = Read-Host 'Enter target'

$Source_Text = "old"

$Target_Text = "new"

$filePath = "C:\temp.txt"

(Get-Content $filePath).Replace($Source_Text,$Target_Text) | Set-Content $filePath