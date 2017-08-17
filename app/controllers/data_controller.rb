class DataController < ApplicationController
  before_action :authenticate_user!

  def show
    flavors = Menu.all.map do |menu|
                amount = Food.where(menu_id: menu.id).sum(:amount)
                { name: menu.name, amount: amount }
              end
    order_times = Order.where.not(offer_at: nil).map do |t|
                    { time: t.order_at.strftime("%m/%d/%H"), amount: t.total_amount }
                  end
    sales_per_hour = order_times.group_by{ |i| i[:time] }
                         .map{ |k, v|
                           v[1..-1].each { |x|
                             v[0][:amount] += x[:amount]
                           }
                         v[0]
                       }

    total_sales = Order.all.map(&:total).inject(:+)
    total_amount = Order.all.map(&:total_amount).inject(:+)
    @data = { 
      total_sales: total_sales,
      total_amount: total_amount,
      each_flavors: flavors,
      sales_per_hour: sales_per_hour
    }
    render json: @data
  end
end
