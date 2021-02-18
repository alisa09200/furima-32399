# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               | 
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchases
- has_many :comments


## items テーブル

| Column         | Type     | Options                       |
| -------------- | -------- | ----------------------------- |
| product        | string   | null: false                   |
| explanation    | text     | null: false                   |
| category_id    | string   | null: false                   |
| condition_id   | string   | null: false                   |
| postage_id     | string   | null: false                   |
| area_id        | string   | null: false                   |
| period_id      | string   | null: false                   |
| price          | integer  | null: false                   |
| user           |references| null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| purchase| references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase


## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address
- belongs_to :user


## addresses テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| credit      | integer    | null: false                    |
| expiration  | integer    | null: false                    |
| security    | integer    | null: false                    |
| postalcode  | integer    | null: false                    |
| prefectures | string     | null: false                    |
| city        | string     | null: false                    |
| block       | string     | null: false                    |
| building    | string     |                                |
| phone       | integer    | null: false                    |
| purchase    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

