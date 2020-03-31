param(
    [Parameter(Mandatory=$true)]
    [string]$repo, #a directory path
    [Parameter(Mandatory=$false)]
    [switch]$noserve
)

$temp = "\code\angular\temp";

Push-Location $temp
#match https://github.com/user/(repo) or https://github.com/user/(some-repo) or https://github.com/user/(repo2)
$newDir = [regex]::Match($repo, "([0-9|A-Z|a-z|-|_]*)\/*$");

"Cloning"
git clone $repo

Push-Location $newDir.value;

"Installing"
npm install

if (-not $noserve)
{
    "Serving"
    ng serve
}


