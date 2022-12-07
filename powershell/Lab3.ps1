get-ciminstance win32_networkadapterconfiguration | where-object IPEnabled -eq True | 
Format-table Description,Index,IPAddress,IPSubnet,DNSDomain,DNSServerSearchOrder -Autosize