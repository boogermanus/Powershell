param(
    [Parameter(Mandatory=$true)]
    [string]$path
)

$items = Get-ChildItem -path $path -include bin,obj -recurse -directory | Where-Object { -not $_.FullName.Contains("node_modules")}
$count = $items.Length;
$i = 0;

foreach($item in $items)
{
    $status = ($i/$count) * 100
    Write-Progress -Activity "Removing files in $($item.FullName)" -PercentComplete $status
    $item | Remove-Item -whatif -Force -Recurse -Verbose
    $i++;
}