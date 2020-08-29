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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

## items テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| name      | string | null: false |
| category  | string | null: false |
| price     | string | null: false |
| condition | string | null: false |
| text      | string | null: false |
| image     | string | null: false |

## purchases テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| comment   | string | null: false |

## addresses テーブル

| Column      | Type   | Options     |
| --------    | ------ | ----------- |
| postal      | string | null: false |
| prefectures | string | null: false |
| city        | string | null: false |
| address     | string | null: false |
| building    | string | null: false |
| phone       | string | null: false |

## cards テーブル

| Column      | Type   | Options     |
| --------    | ------ | ----------- |
| number      | string | null: false |
| month       | string | null: false |
| year        | string | null: false |
| security    | string | null: false |




