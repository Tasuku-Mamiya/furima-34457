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

| Column     | Type   | Options  |
| --------   | ------ | -------- |
| email      | string | NOT NULL |
| password   | string | NOT NULL |
| name       | string | NOT NULL |



## items テーブル

| Column     | Type       | Options  |
| ---------- | ---------- | -------- |
| item_name  | string     | NOT NULL |
| category   | text       | NOT NULL |
| price      | integer    | NOT NULL |
| user       | references |          |

## buy テーブル

| Column    | Type       | Options  |
| --------- | ---------- | -------- |
| address   | string     | NOT NULL |
| user      | references |          |
| prototype | references |          |

## histories テーブル

| Column    | Type       | Options  |
| --------- | ---------- | -------- |
| user      | references |          |
| item      | references |          |
