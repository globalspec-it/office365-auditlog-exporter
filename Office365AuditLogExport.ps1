#Fetches the last hour of audit entries for all mailboxes and exports to a timestamped CSV
$credential = Import-CliXml -Path 'o365cred.xml'
$Session = New-PSSession –ConfigurationName Microsoft.Exchange –ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $credential –Authentication Basic -AllowRedirection
Import-PSSession $Session
Get-Mailbox | Search-MailboxAuditLog -StartDate (Get-Date).AddHours(-1) -ShowDetails | Export-CSV -Path "C:\O365AuditLogs\log_$((Get-Date).ToString('MM-dd-yyyy_hh-mm-ss')).csv" -NoTypeInformation -Encoding UTF8
