#this scripts adds IUSR ( IIS user ) to a given folder

#$path="C:\Program Files (x86)\Common Files\System\ole db"

$path = Read-Host "Enter path :"

$acl = Get-Acl "$path"

$AccessRule = [System.Security.AccessControl.FileSystemAccessRule]::new("NT AUTHORITY\IUSR", "ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow")

$acl.SetAccessRule($AccessRule)

$acl | Set-Acl "$path"

"Permission Added"