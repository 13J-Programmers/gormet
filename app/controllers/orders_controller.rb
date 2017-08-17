class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @order = Order.all
    render json: @orders, include: include_list
  end

  def create
    @order = Order.new(order_params)
    @order.menus.each do |m|
      m.stock = m.stock - 1 if m.stock > 0
    end

    if @order.save
      render json: @order, include: include_list
    else
      render json: { errors: @order.errors.full_messages }
    end
  end

  def update
    if @order.update(order_params)
      render json: @order, include: include_list
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
      params.require(:order).permit(:order_at, :offer_at, food_attributes: [:menu_id])
    end

    def include_list
      %w(menus foods)
end
