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
| category_id        |  integer     | null:false                           |
| status_id          |  integer     | null:false                           |
| shipping_fee_id    |  integer     | null:false                           | 
| shipping_from_id   |  integer     | null:false                           |
| shipping_date_id   |  integer     | null:false                           |

## Association

- has_many :comments
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
|   Column     |   Type       |   Options                         |
| ------------ | ------------ | --------------------------------- |
| postcode     | integer      | null:false                        |
| prefecture   | integer      | null:false                        |
| city         | integer      | null:false                        |
| house_number | integer      | null:false                        |
| building     | integer      | null:false                        |
| phone_number | integer      | null:false                        |

## Association

- belongs_to :user


<!-- ## statusテーブル -->
|   Column     |   Type       |   Options                     |
| ------------ | ------------ | ----------------------------- |
| item_id      | references   | null:false, foreign_key: true |
| status       | string       |                               |

## Association

- belongs_to :item