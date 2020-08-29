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
| birth_day       | date   | null: false |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column          | Type       | Options                        |
| --------        | ------     | -----------                    |
| name            | string     | null: false                    |
| category_id     | integer    | null: false                    |
| price           | string     | null: false                    |
| condition_id    | integer    | null: false                    |
| text            | string     | null: false                    |
| image           | string     | null: false                    |
| ship_from_id    | integer    | null: false                    |
| date_ship_id    | integer    | null: false                    |
| shipping_fee_id | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- has_many :purchases
- has_many :favorites
- belongs_to :user

## purchases テーブル

| Column      | Type       | Options                        |
| --------    | ------     | -----------                    |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |
| purchase    | string     | null: false                    |

### Association

- has_one :addresses
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column          | Type    | Options     |
| --------        | ------  | ----------- |
| postal          | string  | null: false |
| prefectures_id  | integer | null: false |
| city            | string  | null: false |
| address         | string  | null: false |
| building        | string  |             |
| phone_number    | string  | null: false |

### Association

- belongs_to :purchase


## favorites テーブル

| Column       | Type       | Options                        |
| --------     | ------     | -----------                    |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item




