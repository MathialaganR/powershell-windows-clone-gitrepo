$ie = New-Object -com InternetExplorer.Application
$ie.visible= $true

$FinalResult = @()
For ($i=1; $i -le 9; $i++) {
$url="https://******************************"
$ie.Navigate($url)
while($ie.ReadyState -ne 4 -or $ie.Busy) {Start-Sleep -m 100}
$out=$ie.Document.links | select ie8_href | Where-Object {$_ -like "name*" }
$FinalResult+=$out
}


$FinalResult | export-csv C:\AWS\Projects\git.csv

$gitlist= import-csv C:\AWS\Projects\git.csv
cd C:\AWS\Projects
foreach ($input in $gitlist ) {
$inputlist=$input.ie8_href
git clone $inputlist

}
