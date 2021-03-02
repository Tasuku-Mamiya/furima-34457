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

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | integer | null: false               |

### Association

- has_many :items
- has_many :buys
- has_many :histories



## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item_name                | string     | null: false                    |
| category_id              | integer    | null: false                    |
| price                    | integer    | null: false                    |
| item_description         | text       | null: false                    |
| shipping_area_id         | integer    | null: false                    |
| item_status_id           | integer    | null: false                    |
| shipping_cost_burden _id | integer    | null: false                    |
| delivery_days_id         | integer    | null: false                    |
| user_id                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :history


## buys テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| phone_number     | string     | null: false                    |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address_line_one | string     | null: false                    |
| address_line_two | string     |                                |
| history_id       | references | null: false, foreign_key: true |


### Association

- belongs_to ::user
- belongs_to ::history

## histories テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :buy