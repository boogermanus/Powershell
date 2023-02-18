param(
    [Parameter(Mandatory=$true)]
    [string]$path
)

$items = Get-ChildItem -path $path -Include "bin","obj" -Exclude "node_modules" -Recurse -Directory
$count = $items.Length;
$i = 0;

foreach($item in $items)
{
    $status = ($i/$count) * 100
    Write-Progress -Activity "Removing files in $($item.FullName)" -PercentComplete $status
    $item | Remove-Item -WhatIf -Force -Recurse -Verbose
    $i++;
}