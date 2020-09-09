param(
    [Parameter(Mandatory = $true)]
    [string]$repo, #a directory path
    [Parameter(Mandatory = $false)]
    [switch]$noserve
)

$temp = "\code\angular\temp";

Push-Location $temp

# this regex should match anything after the last slash in the repo url
# e.g. http://github.com/user/repo_name -> repo_name
$newDir = [regex]::Match($repo, '[^/]+($)')

if (Test-Path $newDir) {
    "Removing existing clone"
    Remove-Item $newDir -Force -Recurse
}

"Cloning"
git clone $repo

Push-Location $newDir.value;

"Installing"
npm install

if (-not $noserve) {
    "Serving"
    ng serve -o
}
else {
    code .
}


