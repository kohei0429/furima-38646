# DB設計


# usersテーブル

| Column             | Type       | Options     |     
| ---------------    | ---------- | ----------- |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false |
| nickname           | string     | null: false |
| name               | string     | null: false |
| name_kana          | string     | null: false |
| birth              | string     | null: false |

## Association

- has_many :items
- has_many :purchases
- has_many :ships

# itemsテーブル

| Column             | Type       | Options     | 
| title              | string     | null: false |
| price              | string     | null: false |
| text               | text       | null: false |
| user               | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :purchase

# purchasesテーブル

| column             | Type       | Options     | 
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item

# shipsテーブル

| Column             | Type       | Options     | 
| postcode           | string     | null: false |
| city               | string     | null: false |
| city_number        | string     | null: false |
| building_name      | string     | null: false |
| phone_number       | string     | null: false |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## Association
- has_one :purchase
- belongs_to :user