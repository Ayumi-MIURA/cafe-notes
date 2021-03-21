# README
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |
| birthbay | day    | null: false |

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
