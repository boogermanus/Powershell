for($i = 0;$i -lt 400;$i++)
{
    $complete = ($i/400) * 100
    Write-Progress -Activity "test" -status "$complete%" -PercentComplete (($i/400) * 100)
}