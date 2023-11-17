$jsonFilePath = Join-Path -Path $PSScriptRoot -ChildPath "youtube_json.json"
$jsonData = Get-Content -Path $jsonFilePath -Encoding UTF8 | ConvertFrom-Json

$realtimeData = $jsonData.contents.twoColumnWatchNextResults.results.results.contents[0].videoPrimaryInfoRenderer

$htmlTemplateFilePath = Join-Path -Path $PSScriptRoot -ChildPath "youtube_like_count_template.html"
$htmlTemplateSource = Get-Content -Path $htmlTemplateFilePath -Encoding UTF8
$htmlFilePath = Join-Path -Path $PSScriptRoot -ChildPath "youtube_like_count.html"

$countValue = $realtimeData.videoActions.menuRenderer.topLevelButtons[0].segmentedLikeDislikeButtonRenderer.likeCount;
if ($true) {
    # 自分が高評価していると YouTube から取得できるデータとズレる
    # そこを補正するのかどうか……
}

$htmlTemplateSource.Replace("%like_count_value%", $realtimeData.videoActions.menuRenderer.topLevelButtons[0].segmentedLikeDislikeButtonRenderer.likeCount) | Set-Content -Path $htmlFilePath -Encoding UTF8

# Write-Host ("高評価: " + $realtimeData.videoActions.menuRenderer.topLevelButtons[0].segmentedLikeDislikeButtonRenderer.likeCount)
