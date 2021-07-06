$FilterDate = (Get-Date).AddDays(-30)
 $targetDir = 'C:\Windows\System32\spool\'
 $targetReg= 'Software\Microsoft\Windows\CurrentVersion\Run'
 $filehash = (Get-FileHash -Algorithm SHA1 -LiteralPath (Get-ChildItem -Recurse -File  -ErrorAction SilentlyContinue $targetDir|Where-Object {$_.LastWriteTime -ge $filterDate}|Sort-Object LastWriteTime).fullname |Format-Table -autosize -Property Hash, Path)
 $filePath = (Get-ChildItem -Recurse -File  -ErrorAction SilentlyContinue $targetDir |Where-Object {$_.LastWriteTime -ge $filterDate}|Sort-Object LastWriteTime|Where-Object {$_.LastWriteTime -ge $filterDate}|Sort-Object LastWriteTime |Format-Table -autosize -Property LastWriteTime, Name, Directory)
 $registykey = (Get-ItemProperty -Path HKLM:$targetReg)
 $filehash |Out-File -FilePath C:\users\$env:UserName\fileoutput.txt 
 $filePath |Out-File -Append -FilePath C:\users\$env:UserName\fileoutput.txt
 $registykey |Out-File -Append -FilePath C:\users\$env:UserName\fileoutput.txt
