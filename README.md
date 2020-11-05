# SharePoint Online Recycler

PowerShell script to automatically delete all items in SharePoint Online and OneDrive Recycle Bin and Second-Stage Recycle Bin

This script was designed for use with Commvault environments that have a [Microsoft OneDrive Cloud Library](https://documentation.commvault.com/commvault/v11/article?p=105524.htm) configured. Data aging jobs delete files on the cloud storage library but Microsoft retains files for 30 days causing an organization to possibly run out of space. This script it designed to run after data aging to automatically remove anything in the Recycle Bin.

## Requirements

* Requires: [SharePoint Online Client Components SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038)

## Usage

### via Workflow

In your Commcell:
* Workflows -> Import Definitions -> SPO-Recycler-workflow.xml
* Edit the SPO-Recycler Workflow's Inputs
* Execute and Schedule Workflow

### Execute the script directly and input variables at prompts:

```
.\SPO-Recycler.ps1

Enter SharePoint site url: https://arneman.sharepoint.com
Enter Username: mark@arneman.me
Enter Password for mark@arneman.me: **************
Total Number of Items found Recycle Bin: 106
All items deleted
```

### Or with pass variable arguments directly

```
.\SPO-Recycler.ps1 -url https://arneman.sharepoint.com -username mark@arneman.me -password PLAINTEXT_PASSWORD
Enter SharePoint site url: https://arneman.sharepoint.com
Enter Username: mark@arneman.me
Enter Password for mark@arneman.me: **************
Total Number of Items found Recycle Bin: 0
No items to delete
```