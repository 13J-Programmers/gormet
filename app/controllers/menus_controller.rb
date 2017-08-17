class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:update, :destroy]

  def index
    @menus = Menu.all
  end

  def show
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      render json: @menu
    else
      render json: { errors: @menu.errors.full_messages }
    end
  end

  def update
    if @menu.update(menu_params)
      render json: @menu
    else
      render json: { errors: @menu.errors.full_messages }
    end
  end

  def destroy
    if @menu.destroy
      head :no_content
    else
      render json: { errors: @menu.errors.full_messages }
    end
  end

  private
  
    def set_menu
      @menu = Menu.find(params[:id])
    end

  
    def menu_params
      params.require(:menu).permit(:name, :price, :stock)
    end
end
