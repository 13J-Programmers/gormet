class Order < ApplicationRecord
  has_many :foods
  has_many :menus, through: :foods
  accepts_nested_attributes_for :foods

  def total
    self.foods.sum(:total)
  end

  def total_amount
    self.foods.sum(:amount)
  end
end
