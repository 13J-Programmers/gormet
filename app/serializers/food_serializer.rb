class FoodSerializer < ActiveModel::Serializer
  attributes :id, :amount, :menu

  def menu
    Menu.find(object.menu_id).name
  end
end
