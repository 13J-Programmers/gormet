json.extract! food, :id, :menu_id, :order_id, :with_cheese, :created_at, :updated_at
json.url food_url(food, format: :json)
