param(
    [string]$list,
    [string]$file,
    [string]$delimiter = " "
)

$elements = @()
$builder = New-Object System.Text.StringBuilder

if (![string]::IsNullOrEmpty($list))
{
    # assume a list of elements separated by spaces
    $elements = $list.Split($delimiter)
}

if (![string]::IsNullOrEmpty($file) -and (Test-Path $file))
{
    $elements = Get-Content $file
}


foreach ($element in $elements)
{
    $line = "'$element',"
    $builder.AppendLine($line) | Out-Null
}

$elementsString = $builder.ToString().TrimEnd([Environment]::NewLine).TrimEnd(',');

@"
in (
$elementsString
)
"@