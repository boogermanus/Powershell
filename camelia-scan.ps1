param(
    [Parameter(Mandatory=$true)]
    [string]$path,
    [Parameter]
    [string]$images = 'D:\images'
)

$files = Get-ChildItem -r $path -file

foreach($file in $files) {
    if($file.PSIsContainer) {
        "directory $($file.FullName)"
    }
    else {
        if($file.Extension -eq ".zip") {
            "zip $($file.FullName)"
        }
        else {
            "file $($file.FullName)"
        }
    }
}
