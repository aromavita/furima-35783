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
| email              |  string      | null:false                           |
| encrypted_password |  string      | null:false                           |
| family_name        |  string      | null:false                           |
| first_name         |  string      | null:false                           |
| family_name_kana   |  string      | null:false                           |
| first_name_kana    |  string      | null:false                           |
| birthday           |  date        | null:false                           |


## Association
- has_many :items
- has_many :comments


<!-- ## itemsテーブル -->
|   Column           |   Type       |   Options                            |
| ------------------ | ------------ | ------------------------------------ |
| user               |  references  | null:false, foreign_key: true        |
| name               |  string      | null:false                           |
| description        |  text        |                                      |
| category_id        |  integer     | null:false                           |
| quality_id         |  integer     | null:false                           |
| shipping_fee_id    |  integer     | null:false                           | 
| prefecture_id      |  integer     | null:false                           |
| shipping_date_id   |  integer     | null:false                           |

## Association

- has_many :comments
- has_one :status
- belongs_to :user



<!-- ## commentsテーブル -->
|   Column     |   Type       |   Options                     |
| ------------ | ------------ | ----------------------------- |
| user         | references   | null:false, foreign_key: true |
| item         | references   | null:false, foreign_key: true |
| text         | text         | null:false                    |

## Association

- belongs_to :user
- belongs_to :item

<!-- ## ordersテーブル -->
|   Column      |   Type       |   Options                            |
| ------------  | ------------ | ------------------------------------ |
| post_code     | string       | null:false                           |
| prefecture_id | integer      | null:false                           |
| city          | string       | null:false                           |
| house_number  | string       | null:false                           |
| building      | string       |                                      |
| phone_number  | string       | null:false                           |


## Association

- belongs_to :status


<!-- ## statusテーブル -->
|   Column     |   Type       |   Options                     |
| ------------ | ------------ | ----------------------------- |
| item         | references   | null:false, foreign_key: true |
| history      | integer      | null:false                    |

## Association

- belongs_to :item