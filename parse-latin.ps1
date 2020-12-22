$uri = "https://en.wikipedia.org/wiki/List_of_Latin_phrases_(full)";
$request = Invoke-WebRequest -Uri $uri

$tables = $request.ParsedHtml.body.getElementsByClassName("wikitable")
#$output = @()
foreach($table in $tables)
{
    $rows = $table.getElementsByTagName("tr");

    foreach($row in $rows) {
        $line = @{}
        $data = $row.getElementsByTagName("td")
        $line.phrase = $data[0].InnerText
        $line.translation = $data[1].InnerText
        $line.notes = $data[2].InnerText
        $object = New-Object PSObject -Property $line
        $object

        #  .\parse-latin.ps1 | latin.csv -NoTypeInformation
    }
}

#$output
