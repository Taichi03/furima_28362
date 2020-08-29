# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| password_check  | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_year      | string | null: false |
| birth_month     | string | null: false |
| birth_day       | string | null: false |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| name      | string | null: false |
| category  | string | null: false |
| price     | string | null: false |
| condition | string | null: false |
| text      | string | null: false |
| image     | string | null: false |
| favorite  | string | null: false |
| seller    | string | null: false |

### Association

- has_many :purchases
- belongs_to :users

## purchases テーブル

| Column      | Type       | Options                        |
| --------    | ------     | -----------                    |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |
| comment     | string     | null: false                    |

### Association

- has_one :addresses
- belongs_to :users
- belongs_to :items

## addresses テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| postal       | string | null: false |
| prefectures  | string | null: false |
| city         | string | null: false |
| address      | string | null: false |
| building     | string |             |
| phone_number | string | null: false |

### Association

- belongs_to :purchases




