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

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| e-mail            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday         | integer | null: false |

### Association

- has_many :items
- has_many :buys
- has_many :histories



## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| category             | string     | null: false                    |
| price                | integer    | null: false                    |
| item_description     | text       | null: false                    |
| shipping_area        | string     | null: false                    |
| item_status          | string     | null: false                    |
| shipping_cost_burden | string     | null: false                    |
| delivery_days        | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one    :buys
- has_one    :histories


## buys テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| phone_number   | integer    | null: false                    |
| postal_code    | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| city           | integer    | null: false                    |
| address_line_1 | text       | null: false                    |
| address_line_2 | text       |                                |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :buys
- has_one :histories

## histories テーブル

| Column    | Type       | Options                                |
| --------- | ---------- | -------------------------------------- |
| user      | references | null: false, foreign_key: true         |
| item      | references | null: false, foreign_key: true         |

### Association

- belongs_to :items
- belongs_to :buys
- belongs_to :histories