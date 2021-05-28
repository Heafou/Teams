$credentials=Get-Credential  
import-module microsoftTeams
Connect-MicrosoftTeams -Credential $credentials  
   
$outFile="C:\Users\$env:username\Desktop\teamOwner.csv"
$newCSV= {} | select "Equipe", "userID", "userMail", "userName" | Export-Csv $outFile
$Teams=Get-Team  


foreach($team in $Teams)  
{      
    $allOwner= Get-TeamUser -GroupId $team.GroupId -Role Owner  
 
    
    foreach($owner in $allOwner)  
    {  
        $userID= $owner.UserId
        $userMail=$owner.User
        $userName=$owner.Name
        $teamName=$team.DisplayName 
        add-content $outFile "$teamName,$userID,$userMail,$userName"
    }      
    
}  
