param(
    [string]$url,
    [string]$username,
    [string]$password
)

#Load SharePoint Online Assemblies
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"

if ($url -eq "") {
    $url = Read-Host "Enter SharePoint site url"
}

if ($username -eq "") {
    $username = Read-Host "Enter Username"
}

if ($password -eq "") {
    $secure_password = Read-host -AsSecureString "Enter Password for $username"
} else {
    $secure_password = ConvertTo-SecureString -String $password -AsPlainText -Force
}

$Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $secure_password)

Try {
    #Setup the context
    $Context = New-Object Microsoft.SharePoint.Client.ClientContext($url)
    $Context.Credentials = $Credentials

    #Get the recycle bin
    $Site = $Context.Site
    $RecycleBinItems = $Site.RecycleBin
    $Context.Load($Site)
    $Context.Load($RecycleBinItems)
    $Context.ExecuteQuery()

    Write-Host "Total Number of Items found Recycle Bin:" $RecycleBinItems.Count
    if ($RecycleBinItems.Count -gt 0) {
        $RecycleBinItems.DeleteAll()
        $Context.ExecuteQuery()
        Write-Host "All items deleted"
    } else {
        Write-Host "No items to delete"
    }
} catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
}