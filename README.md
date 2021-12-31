# MSX用ビジュアルプログラミング開発環境『MSX T-LEX』
正確には

**まるで**MSX用ビジュアルプログラミング開発環境**のようにふるまうBASICプログラム**『MSX T-LEX』

です。

## MSX T-LEXとは
マウスで命令ブロックをドラッグ＆ドロップすることによりコーディングできるビジュアルプログラミング開発環境を、MSX-BASICで作ってみました。

いちおう、**M**SX **T**INY **L**OGO **EX**ECUTOR/**LEX**ICAL ANALYZERの略ということにしています。

## 画面サンプル
後述『ファイルの説明』→『サンプルコード』の項もご覧ください。
<p>
<img src="/img/scr-en.jpg" alt="画面サンプル" width="400" height="263">
<img src="/sample/sample1img.jpg" alt="実行結果" height="263">
<img src="/sample/sample3img.jpg" alt="実行結果" height="263">
<img src="/sample/sample4img.jpg" alt="実行結果" height="263">
<img src="/sample/sample7img.jpg" alt="実行結果" height="263">
</p>

## できること
- MSXでマウスを使ってビジュアルプログラミングを楽しめる
- LOGOっぽいタートルグラフィックス（の一部）を味わうことができる
- MSXが令和のプログラミング教育の最前線で戦えるかもしれない可能性を感じることができる
- フルBASICなので、高速化の余地が大きい

## 実行環境
- MSX BASIC ver.2.0以降が動作する、できるだけ高速な環境
  - 実機では最低でもturbo Rを要求。1chip MSXの10MHzモードやVictor HC-95の高速モードでは力不足と思われます。
  - MSX3上での実行を強く推奨します。きっと速いはず。
- マウス必須。ポート1に接続してください。
- 高速な実行環境とMSX用マウスの現実解として、エミュレータ上での実行を推奨します。

## ファイルの説明
- 必須ファイル（プログラム）  
※これらのファイルを編集するためには、MSXの文字コードに対応したエディタが必要です。
  - **src\LEX.BAS** 初期処理（主にVRAM初期化）プログラム
  - **src\LEX-MAIN.BAS** ブロックプログラミング環境メインプログラム。LEX.BASから呼び出される。
  - **src\LEX-C.BAS** コンパイラ。ブロックプログラミングで書かれたコードをMSX BASICに変換するトランスパイラ。LEX-MAIN.BASから呼び出される。
  - **src\LEX-DRAW.DAT** 描画プログラム生成用テンプレート。MSX BASICにてLOADコマンドで読み込み可能。LEX-C.BASが読み込む。
  - **src\LEX-CMD.DAT** ブロックの定義。MSX BASICにてLOADコマンドで読み込み可能。LEX-MAIN.BAS,LEX-C.BASが読み込む。
- 必須ファイルが生成するファイル
  - **LEX.INI** ステータス保存用。LEX-MAIN.BASがコンパイラに制御を渡す際に生成する。LEX-MAIN.BASが読み書きする。
  - **LEX-OUT.BAS** コンパイラが生成したMSX BASICプログラム。LEX-C.BASが生成し、実行する。
- サンプルコード
  - **sample\SAMPLE1.BAS** LOGOのロゴを描画するプログラム。<p><img src="/sample/sample1.jpg" alt="英語版ソース" height="160"><img src="/sample/sample1j.jpg" alt="日本語版ソース" height="160"><img src="/sample/sample1img.jpg" alt="実行結果" height="160"></p>
  - **sample\SAMPLE2.BAS** オウムガイ様の図形。<p><img src="/sample/sample2.jpg" alt="英語版ソース" height="160"><img src="/sample/sample2j.jpg" alt="日本語版ソース" height="160"><img src="/sample/sample2img.jpg" alt="実行結果" height="160"></p>
  - **sample\SAMPLE3.BAS** 多重星形。<p><img src="/sample/sample3.jpg" alt="英語版ソース" height="160"><img src="/sample/sample3j.jpg" alt="日本語版ソース" height="160"><img src="/sample/sample3img.jpg" alt="実行結果" height="160"></p>
  - **sample\SAMPLE4.BAS** LOGOっぽい画像。<p><img src="/sample/sample4.jpg" alt="英語版ソース" height="160"><img src="/sample/sample4j.jpg" alt="日本語版ソース" height="160"><img src="/sample/sample4img.jpg" alt="実行結果" height="160"></p>
  - **sample\SAMPLE5.BAS** MSX命令のサンプル。シンプルな日の丸。<p><img src="/sample/sample5.jpg" alt="英語版ソース" height="160"><img src="/sample/sample5img.jpg" alt="実行結果" height="160"></p>
  - **sample\SAMPLE6.BAS** MSX命令のサンプル。sin/cosカーブ。<p><img src="/sample/sample6.jpg" alt="英語版ソース" height="160"><img src="/sample/sample6img.jpg" alt="実行結果" height="160"></p>
  - **sample\SAMPLE7.BAS** FIZZBUZZ. MSXでテキスト画面を扱うサンプル。<p><img src="/sample/sample7.jpg" alt="英語版ソース" height="160"><img src="/sample/sample7img.jpg" alt="実行結果" height="160"></p>
- ディスクイメージ
  - **disk-image/T-LEX.dsk** 必須ファイルとサンプルコードが入ったディスクイメージ。

## 実行方法
1. メディアに後述『ファイルの説明』→『必須ファイル』のすべてのファイルを書き込みます。すべてのファイルはカレントディレクトリに保存されている必要があります。
2. MSX BASICにて、LEX.BASを読み込んで実行します。例：`RUN"LEX.BAS"`

※必須ファイルとサンプルプログラムを詰め合わせたディスクイメージを用意しています（disk-image/T-LEX.dsk）。

## 画面解説
<img src="/img/explanation.jpg" alt="解説画面" height="370">  


- **ブロックエリア** ブロック(命令)が格納されています。
  - **パレット切替** クリックすることで、表示するブロックを、英語系・日本語系・MSX命令系に切り替えることができます。<p><img src="/img/scr-en-1.jpg" alt="ENパレット" height="370"> <img src="/img/scr-jp-1.jpg" alt="JPパレット" height="370"> <img src="/img/scr-msx-1.jpg" alt="MSXパレット" height="370"></p>
- **コードエリア** コーディングを行います。
  - ブロックエリアのブロックをドラッグし、コードエリアにドロップすることでコーディングを行います。
    - 行間にドロップすると挿入されます。
    - ブロック構文（IF,REPEATなど）の間にドロップすると、ブロック構文内に挿入されます。
  - **左ドラッグ** すでに設置したブロックを移動します。ブロック構文の先頭をドラッグすると、ブロック構文が丸ごと移動します。
  - **右クリック** ブロックを削除します。ブロック構文の先頭を右クリックすると、ブロック構文が丸ごと削除されます。
- **ヒントエリア** ドラッグ中のブロックの機能が表示されます。
- **機能エリア** クリックするか、ファンクションキーを押すことで、機能が実行されます。
  - **EXIT** T-LEXを終了します。
  - **LOAD** 保存済みのソースファイルを読み込みます。
  - **SAVE** 編集中のコードエリアの内容を、名前を付けて保存します。
  - **OVERWRITE** 編集中のコードエリアの内容を、現在のファイル名で上書きします。
  - **RUN** 編集中のコードエリアの内容を実行するため、コンパイルを開始します。

## しくみ
1. LEX.BASにて、画像周り（スプライトパターン、文字パターンジェネレータテーブル）の初期化が行われる。
2. LEX-MAIN.BASにて、ユーザはブロックをドラッグ＆ドロップし、プログラムを作成する。
3. ユーザーがF5キーを押下（もしくはRUNをクリック）すると、現在の状況がLEX.INIに保存される。
4. LEX-C.BASは画面上のプログラムを読み取り、BASICのコードに変換し、LEX-OUT.BASという名のASCIIファイルとして出力する。
5. LEX-OUT.BASが実行されることで、ブロックで作成されたプログラムが実行される。
6. LEX.BASが実行され、破壊された画像周りの初期化を行う。
7. LEX-MAIN.BASはLEX.INIを参照し、F5キー押下時に編集していたブロックプログラムを自動的に読み込む。

## できないこと
- 20行を超えるプログラムの作成
- 再帰処理（LOGOのふりをしているくせにフラクタル図形が描けません）
- サブプロシージャの作成
- すべてのエラー処理
- 既にMSX BASIC上でメモリの限界を迎えており、BASICのままでは機能を拡張する余地はない

## すべきこと
- 趣味面
  - 既にBASIC上ではメモリの限界を迎えています。MSX-DOSにプラットフォームを移行するため、Cなどに移植すべきです。
  - BASICのままでも、部分的な機械語化によって高速化の余地はあります。いっそフルアセンブラで書き直してしまいましょう。
- 実用面
  - 前述『できないこと』の解消

## あとがき
- GitHubの使い方がよくわかっていません。
- matsun-riは初回公開時以上の機能追加を行う予定はありません（主に時間とセロトニンの不足のため）。ごめんなさい。




