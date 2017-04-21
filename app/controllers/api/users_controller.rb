# app/controllers/api/users_controller.rb
module API
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  def index
    @users = User.all
    json_response(@users)
  end

  def show
    json_response(@user)
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :role, :token, :code_enterprise)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
end
