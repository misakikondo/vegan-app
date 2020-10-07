# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| encrypted_password| string | null: false |
| birth             | date   | null: false |

## Association

- has_many :donates
- has_many :recipes
- has_many :comments


## recipes テーブル

| Column               | Type      | Options                         |
| -------------------- | --------- | ------------------------------- |
| recipes_name         | string    | null: false                     |
| explains             | text      | null: false                     |
| level_id             | integer   | null: false                     | 
| cookingtime_id       | integer   | null: false                     |
| user_id              | integer   | null: false                     |

## Association
- belongs_to :level
- belongs_to :cookingtime
- belongs_to :user
- has_many :comments


## levels テーブル

| Column               | Type      | Options                         |
| -------------------- | --------- | ------------------------------- |
| name                 | string    | null: false                     |

## Association
- has_many :recipes



## cookingtimes テーブル

| Column               | Type      | Options                         |
| -------------------- | --------- | ------------------------------- |
| name                 | string    | null: false                     |

## Association
- has_many :recipes



## comments テーブル

| Column            | Type      | Options                         |
| ----------------- | --------- | ------------------------------- |
| recipe            | references| null: false, foreign_key: true  |
| user              | references| null: false, foreign_key: true  |
| contents          | text      | null:false                      |

## Association
 - belongs_to :recipe
 - belongs_to :user



## orders テーブル

| Column            | Type      | Options                         |
| ----------------- | --------- | ------------------------------- |
| user              | references| null: false, foreign_key: true  |
| price             | integer   | null: false                     |
| gift_id           | integer   | null: false                     |

## Association

- belongs_to :user
- has_one :address
- belongs_to_active_hash :gift


## addresses テーブル

| Column            | Type      | Options                         |
| ----------------- | --------- | ------------------------------- |
| zip_code          | string    | null: false                     |
| prefecture        | integer   | null: false                     |
| city              | string    | null: false                     |
| block             | string    | null: false                     |
| building_name     | string    |                                 |
| phone             | string    | null: false                     |
| order             | references| null: false, foreign_key: true  |

## Association

- belongs_to :donate
- belongs_to_active_hash :prefecture


