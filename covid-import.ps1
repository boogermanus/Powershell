
$covidDir = "C:\code\covid-19-data"
$countiesDataFile = "C:\code\covid-19-data\us-counties.csv"
$statesDataFile = "C:\code\covid-19-data\us-states.csv";
$database = "Playground"
$countiesTable = "dbo.[us-counties]"
$statesTable = "dbo.[us-states]"
$counties = import-csv $countiesDataFile

Push-Location $covidDir
& "c:\program files\git\bin\git.exe" "pull"
Pop-Location
function invoke-sql($query)
{
    Invoke-Sqlcmd -ServerInstance $env:COMPUTERNAME -Database $database -query $query
}

$deleteCounties = "delete from $countiesTable"
invoke-sql $deleteCounties

foreach($county in $counties)
{
    if($county.fips -eq "")
    {
        $county.fips = -1;
    }

    $county.county = $county.county.Replace("'","''");
    $query = "INSERT INTO $countiesTable (date,county,state,fips,cases,deaths)
    VALUES ('$($county.date)', '$($county.county)', '$($county.state)', $($county.fips), $($county.cases), $($county.deaths))"

    $query
    invoke-sql $query
}

$deleteStates = "delete from $statesTable";

invoke-sql $deleteStates

$states = Import-Csv $statesDataFile

foreach($state in $states)
{
    $query = "INSERT INTO $statesTable (date,state,fips,cases,deaths)
    VALUES ('$($state.date)', '$($state.state)', $($state.fips), $($state.cases), $($state.deaths))"

    $query
    invoke-sql $query
}


