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

| Column      | Type     | Options                        |
| ----------- | -------- | ------------------------------ |
| product     | string   | null: false                    |
| explanation | text     | null: false                    |
| category    | string   | null: false                    |
| condition   | string   | null: false                    |
| price       | integer  | null: false                    |
| user        |references| null: false, foreign_key: true |

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


## addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postage | string     |                                |
| area    | string     | null: false                    |
| period  | string     | null: false                    |
| purchase| references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

