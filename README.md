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
- has_many :likes
- has_many :liked_recipes, through: :likes, source: :recipe


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
- has_many :likes
- has_many :liked_users, through: :likes, source: :user


## levels テーブル

| Column  | Type      | Options     |
| --------| --------- | ----------- |
| name    | string    | null: false |

## Association
- has_many :recipes



## cookingtimes テーブル

| Column | Type      | Options       |
| -------| -------- -| ------------- |
| name   | string    | null: false   |

## Association
- has_many :recipes



## likes テーブル

| Column | Type      | Options                       |
| -------| -------- -| ------------------------------|
| user   | references| null: false,foreign_key: true |
| recipe | references| null: false,foreign_key: true |

## Association
- belongs_to :user
- belongs_to :recipe



## comments テーブル

| Column            | Type      | Options                         |
| ----------------- | --------- | ------------------------------- |
| recipe            | references| null: false, foreign_key: true  |
| user              | references| null: false, foreign_key: true  |
| contents          | text      | null:false                      |

## Association
 - belongs_to :recipe
 - belongs_to :user



## donates テーブル

| Column            | Type      | Options                         |
| ----------------- | --------- | ------------------------------- |
| user              | references| null: false, foreign_key: true  |
| price             | integer   | null: false                     |


## Association

- belongs_to :user
