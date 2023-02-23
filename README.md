# DB設計


# usersテーブル

| Column             | Type       | Options     |     
| ---------------    | ---------- | ----------- |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false |
| nickname           | string     | null: false |
| last_name          | string     | null: false |
| first_name         | string     | null: false |
| last_name_kana     | string     | null: false |     
| first_name_kana    | string     | null: false |
| birth              | date       | null: false |

## Association

- has_many :items
- has_many :purchases

# itemsテーブル

| Column             | Type       | Options     | 
| ---------------    | ---------- | ----------- |
| image              | string     | null: false |
| title              | string     | null: false |
| text               | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| shipping_area_id   | integer    | null: false |
| shipping_days_id   | integer    | null: false |              
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :purchase

# purchasesテーブル

| column             | Type       | Options     | 
| ---------------    | ---------- | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :ship

# shipsテーブル

| Column             | Type       | Options     | 
| ---------------    | ---------- | ----------- |
| postcode           | string     | null: false |
| prefecture_id      | integer    | null: false |
| city               | string     | null: false |
| city_number        | string     | null: false |
| building_name      | string     |             |
| phone_number       | string     | null: false |
| purchase           | references | null: false, foreign_key: true |

## Association
- belongs_to :purchase