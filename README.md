# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | --------------------------|
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |

### Assosiation

- has_many :lessons
- has_many :orders 


## lessons テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| introduction    | text       | null: false                    |
| prefecture_id   | integer    | null: false                    |
| date            | date       | null: false                    |
| url             | string     | null: false                    |
| capacity_id     | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Assosiation

- belongs_to :user
- has_many :orders




## orders テーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| user       | references   | null: false, foreign_key: true |
| lesson     | references   | null: false, foreign_key: true |

### Assosiation

- belongs_to :user
- belongs_to :lesson
- has_one :adress


## adresses テーブル

| Column        | Type         | Options                        |
| ------------- | ------------ | ------------------------------ |
| postcode      | string       | null: false                    |
| prefecture_id | integer      | null: false                    |
| city          | string       | null: false                    |
| block         | string       | null: false                    |
| building      | string       |                                |
| phone_number  | string       | null: false                    |
| order         | references   | null: false, foreign_key: true |
### Assosiation

- belongs_to :order