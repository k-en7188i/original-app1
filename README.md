# README

# アプリケーション名
  
おすすめニュース投稿アプリ『Blog’in-Com』  
ブログをする『blogging』　＋　つながる場所/意思疎通『community/communication』
  
## アプリケーション概要
  
このアプリケーションでは、おすすめ記事の投稿やコメント、お気に入りユーザーの設定、投稿のいいね、  
検索機能などを提供します。
  
## URL

https://original-app1.onrender.com

## テスト用アカウント
  
  
Basic認証ID：f1111  
Basic認証パスワード: 8817  


  
  
## 利用方法
  
1.トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う。  
2.新規記事投稿ボタンから、目標の内容(タイトル、おすすめポイント、カテゴリー、画像)を入力し投稿する  
3.投稿記事に対して、いいね・フォロー・コメント・お気に入り(記事・ユーザー)をする  
  

## アプリケーションを作成した背景  
  
友人と会話をしていた際、情報発信をしたいが何かとめんどくさくて始められないという課題を  
抱えていることがわかった。  
発信自体はしたいが恥ずかしい、見てもらえないからやっても仕方ないと思っている人に向けた  
お互いが発信者・読者という関係性の中でやらざるえない環境による習慣化と成功体験を積んでいただく  
アプリケーションを開発することにしました。  
  
## 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/1TujxyIm1oYkKDAx6mhSS8HnFYaHTmuMPfTktw3eRwpE/edit#gid=982722306)

## 実装した機能についての画像やGIFおよびその説明
  
投稿された画像に対して”いいね”や”お気に入り登録”をすることができます。また、自分が好きなユーザーを  
フォローする機能を実装しました。  
  
  

[![Image from Gyazo](https://i.gyazo.com/4b5fea91e0103c70eeb3c3e1b7754c85.png)](https://i.gyazo.com/4b5fea91e0103c70eeb3c3e1b7754c85.png)

## 実装予定の機能

１、投稿に対して５段階でユーザーがレビューできる機能の追加できる機能の追加(実装中)

２、APIを利用したログイン機能(Google)・お問合せに関する自動返信BOT(LINE)機能の追加(未実装)

## データベース設計

[![Image from Gyazo](https://i.gyazo.com/ae8d554ddd5afec22618b144e5d051d2.png)](https://i.gyazo.com/ae8d554ddd5afec22618b144e5d051d2.png)

## 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/124e363000809f69be808b4a42c11897.png)](https://gyazo.com/124e363000809f69be808b4a42c11897)

## 開発環境
  
Ruby / Ruby on Rails / MySQL / GitHub・GitHub-Copilot / Render / Visual Studio Code / Trello・Notion
  
## ローカルでの動作方法
  
以下のコマンドを順に実行。  
% git clone https://github.com/k-en7188i/original-app1.git  
% cd 【ご自身が実行したいディレクトリ名】  
% bundle install  
% yarn install  

## 工夫したポイント
  
1つ目:投稿詳細ページで画面下部に前の投稿・後ろの投稿部分をクリックすることで前後の投稿に進むことができる機能を実装しました。

2つ目:一週間の中で投稿した全ての記事に対していいねされた数に応じてランキングをつける機能を実装しました。

3つ目:新規投稿ページや編集ページで画像投稿をする際にどの画像を投稿するか確認できるようにプレビュー機能を実装しました。

いずれも、知人数名ほどに実際に利用してもらい、ユーザーヒアリングを行いながら改善を行っています。


