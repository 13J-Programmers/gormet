class Menu < ApplicationRecord
  has_many :foods
  has_many :orders, through: :foods
end
