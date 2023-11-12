# URL���w��
Write-Host "�����y�[�W�� URL ���w�肵�Ă�������; (��: https://www.youtube.com/watch?v=XX)"
$url = Read-Host
$jsonFilePath = Join-Path -Path $PSScriptRoot -ChildPath "youtube_json.json"

while ($true) {
    # Web���N�G�X�g�𑗐M���ăE�F�u�y�[�W�̃\�[�X���擾
    $response = Invoke-WebRequest -Uri $url

    # �E�F�u�y�[�W�̃\�[�X�𕶎���Ƃ��Ď擾
    $webPageSource = $response.Content

    # ���K�\�����g�p���� "ytInitialData" �̌�̕����𔲂��o��
    $pattern = 'var ytInitialData = (.*?);</script>'
    $match = [regex]::Match($webPageSource, $pattern)

    # �}�b�`�����������擾
    if ($match.Success) {
        $ytInitialData = $match.Groups[1].Value
        $ytInitialData | Set-Content -Path $jsonFilePath -Encoding UTF8
    } else {
        Write-Host "�G���[: ���v���̓ǂݍ��݂Ɏ��s���܂���"
        Start-Sleep -Seconds 30
        continue
    }

    # ���� (���]����)
    . ./youtube_like_count.ps1

    Start-Sleep -Seconds 10
}
