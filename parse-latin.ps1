$uri = "https://en.wikipedia.org/wiki/List_of_Latin_phrases_(full)";
$dataLength = 2 # data length is 
$request = Invoke-WebRequest -Uri $uri

$tables = $request.ParsedHtml.body.getElementsByClassName("wikitable")

foreach($table in $tables)
{
    $rows = $table.getElementsByTagName("tr");

    foreach($row in $rows) {
        $data = $row.getElementsByTagName("td")

        $data | ForEach-Object { $_.InnerText}
    }
}