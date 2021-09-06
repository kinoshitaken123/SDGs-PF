## もったいない
もったいないは、フードロス削減へ賛同メーカーより協賛価格で提供を受けた商品をお客様へ販売するショッピングサイトです。

<img width="1437" alt="スクリーンショット 2021-09-01 15 11 12" src="https://user-images.githubusercontent.com/82036851/131621350-dd5b5469-5806-4acf-b18a-410f341f1724.png">

URL: http://mottainai-site.com/

※「ゲストログイン機能」（ワンクリックでログインが可能な機能）も実装していますので、ぜひご利用ください。

## サイト概要
食品ロスをテーマとした、小売店・飲食店、生産者の売れ残りや農家の余剰品を、消費者に食品を安く提供するプラットフォームとしています。
結果、食品ロスが減り、廃棄物処理などのエネルギー、コストの節約につながります。

ユーザーは”食材を安い価格で”購入出来、店舗・生産者は”食品ロスが減り収益につながる”サイトとなります。

### ●サイトテーマ
食品ロスをテーマに「いつでもどこでも購入・販売できる通販サイト」

### ●テーマを選んだ理由
前職でSDGsについて携わる機会がありました。SDGs17の目標のうちの一つ「作る責任　使う責任」は身近なもの課題でありました。事実として、日本国内で年間643万トンも食べられるのに廃棄されるのが現状と知りました。内訳として事業系廃棄物は３５７万トン、家庭系廃棄物は２８９万トン。
このフードロス対策としてアプリといつツールを用いて、飲食店や生産者で廃棄の危機にある食品を掲載してユーザーに知らせ、それを見たユーザーは通常よりも安く購入できるプラットフォームを立ち上げたいと思いました。結果、食品ロスが減り、廃棄物処理などのエネルギー、コストの節約に貢献できるようなサイトを立ち上げたいと思いで作成しました。

### ●ターゲットユーザー
* ユーザー（食べ手）
* 小売店、飲食店、生産者　（販売側)
### ●主な利用シーン
* ユーザー（食べ手）「食材を安い価格で手に入れたい時」
* 販売側「廃棄予定の商品を販売を行いたい時」
## ●設計書
# ER図
![Untitled Diagram (1)](https://user-images.githubusercontent.com/82036851/131942483-9bc214b3-cf76-4c36-b619-dfe0d9e8bba6.jpg)

### インフラ構成図

<img width="1036" alt="スクリーンショット 2021-09-01 14 33 29" src="https://user-images.githubusercontent.com/82036851/131619869-04710789-7518-497d-ae4a-333da45c58c3.png">

### [テーブル定義書](https://docs.google.com/spreadsheets/d/1usZ9rT4FX40qjtFqXpawSNSJ5ETITkBJ/edit#gid=1100889497)

## [アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/1MYoasv1NJDYhy-2pC8buS97XWSSFJJkW/edit#gid=1876005655)


## ●顧客側の機能
| 機能 | 非ログイン時利用可否 | 会員利用可否 |
| :--- | :---: | :---:|
| 会員登録 | ○ | ×|
| ログイン | ○ | ×|
| 会員詳細表示 | × | ○|
| 会員情報編集 | × | ○|
| 商品検索機能 (SQL) | ○ | ○|
| コメント機能(Ajax) | × | ○|
| いいね機能(Ajax) | × | ○|
| Chat機能(Ajax) | × | ○|
| お問い合わせ機能 | × | ○|

## ●管理者側の機能
| 機能 | 非ログイン時利用可否 |会員利用可否 |
| :--- | :---: | :---:|
| 会員登録 | ○ | ×|
| ログイン | ○ | ×|
| 会員詳細表示 | × | ○|
| 会員情報編集 | × | ○|
| 商品登録 | × | ○|
| 注文履歴表示 | × | ○|
| ジャンル一覧 | × | ○|
| Chat機能(Ajax) | × | ○|

## ●開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails, Bootstrap
- JSライブラリ：jQuery
- IDE：Cloud9
- AWS : EC2,RDS,CloudWatch,Route53


