$csv = Import-CSV email.csv
foreach($user in $csv){
    $userMail = $user.Email
    $userDN = Get-ADUser -Filter {mail -eq $userMail} -Properties Distinguishedname
	foreach ($userID in $userDN) {
		add-content -Path "tor-hemlo.csv" -Value $userID.Distinguishedname
	}
}
