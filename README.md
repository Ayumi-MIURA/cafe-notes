# README

# アプリケーション名
Cafe Notes

# アプリケーション概要
巣ごもり需要でお家Cafeタイムを始めた・始めようとした人たちがコーヒーについて情報を得られるSNS

# URL
https://cafe-notes.herokuapp.com/

# テスト用アカウント
| Email       | password |
| ----------- | -------- |
| test2@test2 | a123456  |

# 利用方法
テストアカウントでログイン→ヘッダー右上から「New Note」ボタン押下→投稿情報入力→投稿完了
以上の操作でご利用頂けます。

# 目指した課題解決
### ・飲んだだけでは忘れてしまうような「生産地や加工法、その時の感想」などを書き留めておける場が欲しい
### ・これから試してみたいけれど、誰かの感想があったら参考にしたい
### ・見ているだけでなくコミュニケーションが取りたい
### 上記の課題解決を目指しました。

# 要件定義
### ・コーヒーのテイスティング投稿機能（編集・削除）
### ・ユーザー管理機能
### ・投稿へ対するコメント機能

# DEMO
## 新規登録画面
[![Image from Gyazo](https://i.gyazo.com/082f8c737abe43a7bf71be5b78810676.jpg)](https://gyazo.com/082f8c737abe43a7bf71be5b78810676)

## サインイン画面
[![Image from Gyazo](https://i.gyazo.com/2406b2373eadf3f46bc4e4980d817129.jpg)](https://gyazo.com/2406b2373eadf3f46bc4e4980d817129)

## トップ画面
[![Image from Gyazo](https://i.gyazo.com/c1767387ca36d3da444e6f1deec6659c.jpg)](https://gyazo.com/c1767387ca36d3da444e6f1deec6659c)

## 投稿詳細画面
[![Image from Gyazo](https://i.gyazo.com/69247d85ea0082500e1d80c2230b3e46.jpg)](https://gyazo.com/69247d85ea0082500e1d80c2230b3e46)

## 投稿者ページ
[![Image from Gyazo](https://i.gyazo.com/fce30d9d3e26ba39acbaa24bb7d3d2eb.jpg)](https://gyazo.com/fce30d9d3e26ba39acbaa24bb7d3d2eb)


# テーブル設計
## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |
| birthday | date   | null: false |

### Association

- has_many :notes
- has_many :comments

## notes テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| cafe_name     | string     | null: false                    |
| appearance    | string     | null: false                    |
| aroma         | string     | null: false                    |
| taste         | string     | null: false                    |
| rich          | string     | null: false                    |
| tasting_note  | text       |                                |
| geography_id  | integer    | null: false                    |
| processing_id | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :comments

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| note      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :note
