class UserController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save 
      render json: @user
    else
      render json: { errors: @order.errors.full_messages }
    end
  end

  private

    def order_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
