param(
    [Parameter(Mandatory=$true)]
    [string]$path,
    [Parameter]
    [string]$images = 'D:\images'
)
$validFileTypes = [
".jpg",
".jpeg",
".png",
".tiff",
".tiff",
".pdf",
".docx",
".docm",
".dotx",
".doc"
".rtf",
".xlsx",
".xlsb",
".xlsm",
".xltx",
".xls",
".pptx",
".potx",
".ppt",
".mp4",
".avi",
".wmv",
".mkv",
".mpg",
".mpeg"]

function handle-file([System.IO.FileInfo]$info) {
    
}
