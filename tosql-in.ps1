param(
    [string]$list
)

$items = $list.Split([System.Environment]::NewLine);

$builder = New-Object -type System.Text.StringBuilder
$builder.AppendLine('in (')
foreach($item in $items)
{
    $builder.AppendLine("'$item',")
}
$builder.AppendLine(')')
$builder.ToString()