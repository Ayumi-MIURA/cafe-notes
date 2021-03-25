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
| test3@test3 | a123456  |

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
### ・投稿の検索機能
### ・ユーザーのフォロー機能

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
