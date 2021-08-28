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

<!-- ## usersテーブル -->
|   Column           |   Type       |   Options                            |
| ------------------ | ------------ | ------------------------------------ |
| nickname           |  string      | null:false                           |
| password           |  string      | null:false                           |
| encrypted_password |  string      | null:false                           |
| family_name        |  string      | null:false                           |
| first_name         |  string      | null:false                           |
| family_name_kana   |  string      | null:false                           |
| first_name_kana    |  string      | null:false                           |
| birth_year         |  string      | null:false                           |
| birth_month        |  string      | null:false                           |
| birth_day          |  string      | null:false                           |

## Association
- has_many :items
- has_many :comments



<!-- ## itemsテーブル -->
|   Column           |   Type       |   Options                            |
| ------------------ | ------------ | ------------------------------------ |
| user               |  reference   | null:false, foreign_key: true        |
| category           |  pulldown    |                                      |
| status             |  pulldown    |                                      |
| shipping_fee       |  pulldown    |                                      | 
| shipping_from      |  pulldown    |                                      |
| shipping_date      |  pulldown    |                                      |
| Image              |              |                                      |

## Association

- has_many :comments
- belongs_to :user



<!-- ## commentsテーブル -->
|   Column     |   Type       |   Options               |
| ------------ | ------------ | ----------------------- |
| user         | references   |                         |
| item         | references   |                         |
| text         | text         |                         |

## Association

- belongs_to :user
- belongs_to :item

