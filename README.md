# SharePoint Online Recycler

PowerShell script to automatically delete all items in SharePoint Online and OneDrive Recycle Bin and Second-Stage Recycle Bin

## Requirements

* Requires: [SharePoint Online Client Components SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038)

## Usage
Execute the script directly and input variables at prompts:
```
.\SPO-Recycler.ps1

Enter SharePoint site url: https://arneman.sharepoint.com
Enter Username: mark@arneman.me
Enter Password for mark@arneman.me: **************
Total Number of Items found Recycle Bin: 106
All items deleted
```

Or with pass variable arguments directly
```
.\SPO-Recycler.ps1 -url https://arneman.sharepoint.com -username mark@arneman.me -password PLAINTEXT_PASSWORD
Enter SharePoint site url: https://arneman.sharepoint.com
Enter Username: mark@arneman.me
Enter Password for mark@arneman.me: **************
Total Number of Items found Recycle Bin: 0
No items to delete
```