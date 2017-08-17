class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_at, :offer_at

  has_many :menus
  has_many :foods
end
