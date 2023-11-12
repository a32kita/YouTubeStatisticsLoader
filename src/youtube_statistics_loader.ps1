# URLを指定
Write-Host "視聴ページの URL を指定してください; (例: https://www.youtube.com/watch?v=XX)"
$url = Read-Host
$jsonFilePath = Join-Path -Path $PSScriptRoot -ChildPath "youtube_json.json"

while ($true) {
    # Webリクエストを送信してウェブページのソースを取得
    $response = Invoke-WebRequest -Uri $url

    # ウェブページのソースを文字列として取得
    $webPageSource = $response.Content

    # 正規表現を使用して "ytInitialData" の後の部分を抜き出す
    $pattern = 'var ytInitialData = (.*?);</script>'
    $match = [regex]::Match($webPageSource, $pattern)

    # マッチした部分を取得
    if ($match.Success) {
        $ytInitialData = $match.Groups[1].Value
        $ytInitialData | Set-Content -Path $jsonFilePath -Encoding UTF8
    } else {
        Write-Host "エラー: 統計情報の読み込みに失敗しました"
        Start-Sleep -Seconds 30
        continue
    }

    # 処理 (高評価数)
    . ./youtube_like_count.ps1

    Start-Sleep -Seconds 10
}
