# README
​
## usersデータ
|Column|Type|Options|
|-----|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|nameA|string|null: false|
|nameB|string|null: false|
|birthday|string|null: false|
|value|integer|null: true|
|phone_number|string|null: false|
​
​
## commentsデータ
|Column|Type|Options|
|-----|----|-------|
|body|text|null: false|
|user_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|
​
## itemデータ
|Column|Type|Options|
|-----|----|-------|
|name|string|null: false|
|description|string|null: false|
|image|string|
|price|integer|null: false|
|size|string|null: false|
|category_id|reference|null: false|
|brand_id|reference|null: false|
|status|string|null: false|
|ship_method|string|null: false|
|ship_person|string|null: false|
|ship_area|string|null: false|
|ship_days|string|null: false|
​
##　categoryデータ
