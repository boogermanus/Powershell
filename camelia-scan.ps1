param(
    [Parameter(Mandatory=$true)]
    [string]$path,
    [Parameter]
    [string]$images = 'D:\images'
)

$files = Get-ChildItem -r $path

function scan([System.IO.FileInfo[]]$items) {
    foreach($item in $items) {
        if($item.PSIsContainer) {
            scan-directory 
        }
        else {
            if($file.Extension -eq ".zip") {
                scan-zip $file
            }
            else {
                "file $($file.FullName)"
            }
        }
    }
}

function scan-directory([System.IO.FileInfo]$dir) {
    "directory $($dir.FullName)"
}

function scan-zip([System.IO.FileInfo]$zip) {
    "zip $($zip.FullName)"
}

function handle-file([System.IO.FileInfo]$file) {
    "file $($file.FullName)"
}
