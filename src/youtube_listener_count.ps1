$jsonFilePath = Join-Path -Path $PSScriptRoot -ChildPath "youtube_json.json"
$jsonData = Get-Content -Path $jsonFilePath -Encoding UTF8 | ConvertFrom-Json

$realtimeData = $jsonData.contents.twoColumnWatchNextResults.results.results.contents[0].videoPrimaryInfoRenderer

$htmlTemplateFilePath = Join-Path -Path $PSScriptRoot -ChildPath "youtube_listener_count_template.html"
$htmlTemplateSource = Get-Content -Path $htmlTemplateFilePath -Encoding UTF8
$htmlFilePath = Join-Path -Path $PSScriptRoot -ChildPath "youtube_listener_count.html"

$htmlTemplateSource.Replace("%listener_count_value%", $realtimeData.viewCount.videoViewCountRenderer.viewCount.runs[0].text) | Set-Content -Path $htmlFilePath -Encoding UTF8

# Write-Host $realtimeData.viewCount.videoViewCountRenderer.viewCount.runs[0].text;