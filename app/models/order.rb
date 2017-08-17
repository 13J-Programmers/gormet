class Order < ApplicationRecord
  has_many :menus, through: :foods
  has_many :foods
  accepts_nested_attributes_for :foods
end
