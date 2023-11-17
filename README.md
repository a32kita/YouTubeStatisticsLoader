## シンプル YouTube リアルタイム統計情報ローダー for OBS

### What's this?
YouTube の高評価の数や同時接続数 (準備中) をリアルタイムでシンプルな HTML ファイルに抽出するツールです。  
このツールを DL して起動し、視聴ページの URL を指定するだけで 35 秒ぐらいおきに最新の情報を取得します。

### How to use
1. このリンクから最新版のツールを取得する  
https://github.com/a32kita/YouTubeStatisticsLoader/archive/refs/heads/master.zip
1. ZIP ファイルを右クリックし、[ プロパティ (R) ] をクリック
1. プロパティ ウィンドウ最下部 "許可する (K)" のチェックをオンにする
1. [ OK ] でプロパティ画面を閉じる
1. ZIP ファイルを任意のディレクトリに展開する
1. youtube_statistics_loader.ps1 を右クリックし [ PowerShell で実行 ] をクリック
1. 視聴ページの URL を指定してください; (例: https://www.youtube.com/watch?v=XX) の次の行に視聴ページの URL を貼り付ける
1. [ Enter ] キーを押下する

数秒後に同じディレクトリ内に "youtube_like_count.html" (現在の高評価数), "youtube_listener_count.html" (現在の視聴者数) というファイルが出力されます。
OBS のブラウザ機能で取り込んでご活用ください。

PowerShell のウィンドウ (青い画面) が表示されている間は自動的に数字が更新され続けます。
閉じると停止します。


### License
* 誰でもご自由にお使いいただけます
* 本ツールの使用により発生したトラブル等につきまして、作者は一切の責任を負いません
