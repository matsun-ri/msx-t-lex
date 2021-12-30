# MSX T-LEX（ただいま整備中）

** 初GitHub ただいま練習中 **

## MSX T-LEXとは
MSXで作ったブロックプログラミング環境の**ようなもの**です。
いちおう、MSX TINY LOGO EXECUTOR/LEXICAL ANALYZERの略ということにしています。

## 画面サンプル

## しくみ


## できること
- MSXでマウスを使ってブロックプログラミングを楽しめる。
- LOGOっぽいタートルグラフィックス（の一部）を味わうことができる。
- MSXが令和のプログラミング教育の最前線で戦えるかもしれない可能性を感じることができる。

## できないこと
- 20行を超えるプログラムの作成
- 再帰処理（LOGOのふりをしているくせにフラクタル図形が描けません）
- すべてのエラー処理

## ファイルの説明
- 必須ファイル（プログラム）
  - src\LEX.BAS 初期処理（主にVRAM初期化）プログラム
  - src\LEX-MAIN.BAS ブロックプログラミング環境メインプログラム。LEX.BASから呼び出される。
  - src\LEX-C.BAS コンパイラ。ブロックプログラミングで書かれたコードをMSX BASICに変換するトランスパイラ。LEX-MAIN.BASから呼び出される。
  - src\LEX-DRAW.DAT 描画プログラム生成用テンプレート。MSX BASICにてLOADコマンドで読み込み可能。LEX-C.BASが読み込む。
  - src\LEX-CMD.DAT ブロックの定義。MSX BASICにてLOADコマンドで読み込み可能。LEX-MAIN.BAS,LEX-C.BASが読み込む。
- 必須ファイルが生成するファイル
  - LEX.INI ステータス保存用。LEX-MAIN.BASがコンパイラに制御を渡す際に生成する。LEX-MAIN.BASが読み書きする。
  - LEX-OUT.BAS コンパイラが生成したMSX BASICプログラム。LEX-C.BASが生成し、実行する。
- サンプルファイル 
  -  


