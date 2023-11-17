# シンプル YouTube リアルタイム統計情報ローダー for OBS

## 1. What's this?
YouTube の高評価の数や同時接続数 (準備中) をリアルタイムでシンプルな HTML ファイルに抽出するツールです。  
このツールを DL して起動し、視聴ページの URL を指定するだけで 35 秒ぐらいおきに最新の情報を取得します。

## 2. How to use
本ツールはダウンロードの上、お手元の Windows 環境で実行して頂く必要があります。
実行中、HTML ファイルが出力されますため、そちらを OBS へ取り込んでご活用いただけます。

### 2 - 1. Download
1. このリンクから最新版のツールを取得する  
https://github.com/a32kita/YouTubeStatisticsLoader/archive/refs/heads/master.zip
1. ZIP ファイルを右クリックし、[ プロパティ (R) ] をクリック  
![スクリーンショット](img/img142201.png)
1. プロパティ ウィンドウ最下部 "許可する (K)" のチェックをオンにする  
![スクリーンショット](img/img142231.png)
1. [ OK ] でプロパティ画面を閉じる
1. ZIP ファイルを任意のディレクトリに展開する

### 2 - 2. Execute
1. youtube_statistics_loader.bat をクリックして実行する  
![スクリーンショット](img/img142235.png)
1. 視聴ページの URL を指定してください; (例: https://www.youtube.com/watch?v=XX) の次の行に視聴ページの URL を貼り付ける  
![スクリーンショット](img/img142255.png)
1. [ Enter ] キーを押下する

[ Enter ] キー押下後、一定の間隔ごとに指定したライブ配信枠から最新の情報を取得し、下記ファイルが出力・更新されます。

| No | ファイル名 | 内容 |
| - | - | - |
| 1 | youtube_like_count.html | 現在の高評価数 |
| 2 | youtube_listener_count.html | 現在の視聴者数 |

これらのファイルを OBS で投影することで、最新の高評価数、視聴者数を配信画面に載せることができます。


### 2 - 3. OBS
1. OBS を開く
1. 本ツールで取得した情報を表示したいシーンを開く  
![スクリーンショット](img/img151202.png)
1. [ ソース追加 (+) ] のメニューから [ ブラウザ ] を選択する  
![スクリーンショット](img/img151311.png)
1. [ 新規作成 ] を選択し、任意の名前を入力し [ OK ] を押下する  
![スクリーンショット](img/img151401.png)
1. プロパティ画面で下記の値を設定する

| 項目名 | 設定値 |
| - | - |
| ローカルファイル (チェック) | オン |
| ローカルファイル | [ 参照 ] ボタンを押下し、手順 2 - 2 - 1 (プログラムの実行) 後に出力される *.html ファイルを選択<br/>※視聴者数なら youtube_listener_count.html |
| 幅・高さ | 200 x 100 程度で設定し、見切れなどに応じて調整してください |
| カスタム CSS | フォント サイズや文字装飾などを設定できます (後述の例を参照) |

![スクリーンショット](img/img151622.png)  
OBS の設定は本ツールの格納先ディレクトリを変えない限りは初回のみの設定でご利用いただけます。


## 5. Custom CSS Samples
OBS のブラウザ機能を利用する際、プロパティからカスタム CSS を設定することでフォントサイズなどを設定できます。
![スクリーンショット](img/img160311.png)

カスタム CSS 設定例;

### 5 - 1. 色・文字サイズ
P タグに対して color, font-size を設定することで変更可能です。

下記の例では文字サイズを 48pt, 色を赤 (red) に変えています。

```CSS
body { background-color: rgba(0, 0, 0, 0); margin: 0px auto; overflow: hidden; }
p { font-size: 48pt; color: red; }
```

視聴者数の場合、span.nin に対して追加のスタイルを設定することで単位 (人) だけ文字サイズを小さくしたり非表示にしたりすることが出来ます。

**単位 (人) を小さくする**
```CSS
body { background-color: rgba(0, 0, 0, 0); margin: 0px auto; overflow: hidden; }
p { font-size: 48pt; color: red; }
span.nin { font-size: 60% }
```

**単位 (人) を消す**
```CSS
body { background-color: rgba(0, 0, 0, 0); margin: 0px auto; overflow: hidden; }
p { font-size: 48pt; color: red; }
span.nin { display: none; }
```


### 5 - 2. 縁取り
P タグに対して text-shadow を指定することで、文字の縁取りの指定ができます。

下記の例では赤 (red) の文字に白 (#FFF) の縁を指定しています。

```CSS
body { background-color: rgba(0, 0, 0, 0); margin: 0px auto; overflow: hidden; }
p { font-size: 60pt; color: red;
  text-shadow:3px 3px 0 #FFF, -3px -3px 0 #FFF,
              -3px 3px 0 #FFF, 3px -3px 0 #FFF,
              0px 3px 0 #FFF,  0 -3px 0 #FFF,
              -3px 0 0 #FFF, 3px 0 0 #FFF; }
```


詳しくは出力される HTML のソースと一般的な CSS のリファレンス サイトをご参照ください。


## 4. License
* 誰でもご自由にお使いいただけます
* 本ツールの使用により発生したトラブル等につきまして、作者は一切の責任を負いません
