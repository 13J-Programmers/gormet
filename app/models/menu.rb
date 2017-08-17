class Menu < ApplicationRecord
  has_many :orders, through: :foods
  has_many :foods
end
