param(
    [Parameter(Mandatory=$true)]
    [string]$path
)

Get-ChildItem -path $path -Include "node_modules" -Recurse -Directory |
Remove-Item -Recurse -Force -Verbose