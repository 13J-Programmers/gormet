class OrdersController < ApplicationController
  before_action :authenticate_user
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    render json: @order
  end

  def create
    @order = Order.new(order_params)
    @order.foods.each do |f|
      menu = Menu.find(f.menu_id)
      menu.stock = menu.stock - f.amount if menu.stock > 0
      f.total = menu.price * f.amount
    end

    if @order.save
      render json: @order
    else
      render json: { errors: @order.errors.full_messages }
    end
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: { errors: @order.errors.full_messages }
    end
  end

  def destroy
    if @order.destroy
      head :no_content
    else
      render json: { errors: @order.errors.full_messages }
    end
  end

  private
  
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:offer_at, foods_attributes: [:menu_id, :amount]).merge({order_at: Time.zone.now})
    end
end
