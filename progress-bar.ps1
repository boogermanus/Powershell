$oneHundred = 100;

#shows percent complete
for ($i = 0; $i -lt $oneHundred; $i++) {
    Start-Sleep -Milliseconds 10
    $complete = ($i / $oneHundred) * 100
    Write-Progress -Activity "Doing stuff.." -PercentComplete $complete
}

#shows percent complete in a for each
$stuff = @(Get-Process)
$counter = 0;

foreach($thing in $stuff) {
    Start-Sleep -Milliseconds 10
    $counter++
    $complete = ($counter/$stuff.Length) * 100;
    Write-Progress -Activity "Doing stuff..." -PercentComplete $complete
}

#show percent with a message
$counter = 0
foreach($thing in $stuff) {
    Start-Sleep -Milliseconds 10
    $counter++
    $complete = ($count/$stuff.Length) * 100;
    Write-Progress -Activity "Doing stuff..." -Status "Doing stuff to $($thing.Name)" -PercentComplete $complete
}