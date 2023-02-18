#usage: secs -date 10/29/81 -span G
param(
		[Parameter(Mandatory=$true)]
		[DateTime]$date,
		[Parameter(Mandatory=$true)]
		[ValidateSet("K","M","G")]
		[string]$span
)

$spans = @{"K" = [Math]::Pow(10,3); "M" = [Math]::Pow(10,6); "G" = [Math]::Pow(10,9)}

$timeSpan = new-timespan $date (Get-Date)

$answer = [Math]::Round([Math]::Abs($timeSpan.TotalSeconds)/$spans[$span],3)

"$answer $span" + "s"
