class Food < ApplicationRecord
  belongs_to: menu
  belongs_to: order
end
