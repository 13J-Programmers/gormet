class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @order = Order.all
    render json: @orders
  end

  def create
    @order = Order.new(order_params)

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
      params.require(:order).permit(:order_at, :offer_at, menu_attributes: [:menu_id, :with_cheese])
    end
end
