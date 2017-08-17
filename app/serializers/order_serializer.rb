class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_at, :offer_at, :total

  # has_many :menus
  has_many :foods
end
