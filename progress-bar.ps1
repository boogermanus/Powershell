$oneHundred = 100;

function Get-PercentComplete($count, $length) {
    $count/$length * 100
}

#shows percent complete
for ($i = 0; $i -lt $oneHundred; $i++) {
    Start-Sleep -Milliseconds 10
    $complete = Get-PercentComplete $i $oneHundred
    Write-Progress -Activity "Doing stuff.." -PercentComplete $complete
}

#shows percent complete in a for each
$stuff = @(Get-Process)
$counter = 0;

foreach ($thing in $stuff) {
    Start-Sleep -Milliseconds 10
    $counter++
    $complete = Get-PercentComplete $counter $stuff.Length
    Write-Progress -Activity "Doing stuff..." -PercentComplete $complete
}

#show percent with a status message
$counter = 0
foreach ($thing in $stuff) {
    Start-Sleep -Milliseconds 10
    $counter++
    $complete = Get-PercentComplete $counter $stuff.Length
    Write-Progress -Activity "Doing stuff..." -Status "Doing stuff to $($thing.Name)" -PercentComplete $complete
}