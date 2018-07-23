#Find all active AD users that are not in the cloud
import-module ActiveDirectory
get-aduser -SearchBase "YOURDN" -filter {enabled -eq $true} -Properties *| where {$_.targetaddress -notlike "*onmicrosoft.com"} | select mail | export-csv onprem.csv