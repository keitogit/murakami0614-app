class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.includes(:user).order('created_at DESC')
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
