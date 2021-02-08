## 機能
- 投稿機能
- ログイン機能
- 分析機能


# DBテーブル構成

 ## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|prefecture|integer| |
|city|string| |
|sex|integer| |
|birthday|date| |


### Association
- has_many :spendings
- has_many :incomes
- belongs_to :job

 ## spendingsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|price|integer|null: false|
|date|date|null: false|
|memo|string| |

### Association
- belongs_to :user

 ## incomesテーブル

|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
|date|date|null: false|
|memo|string| |

### Association
- belongs_to :user

 ## jobsテーブル

|Column|Type|Options|
|------|----|-------|

### Association
- has_many :users
