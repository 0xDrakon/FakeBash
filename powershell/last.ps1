param([int]$n = 20)
Get-WinEvent -LogName Security -FilterXPath "*[System[EventID=4624]]" -MaxEvents $n -ErrorAction SilentlyContinue |
    ForEach-Object {
        $xml = [xml]$_.ToXml()
        $ns = @{ e = 'http://schemas.microsoft.com/win/2004/08/events/event' }
        $user = ($xml.Event.EventData.Data | Where-Object { $_.Name -eq 'TargetUserName' }).'#text'
        "$($_.TimeCreated.ToString('yyyy-MM-dd HH:mm:ss'))  $user"
    }
