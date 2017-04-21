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

  def join_enterprise
    @user = User.find(params[:id])
    @user.update(code_enterprise)
    @enterprise = Enterprise.where(code_enterprise: code_enterprise[:code_enterprise]).take
    json_response(@enterprise)
    EnterpriseUser.create!()
    #logger.debug('enterprise with code enterprise?', @enterprise)
    #@test = EnterpriseUser.create!(enterprise_user_params)
    #logger.debug('test', @test)
  end

  private

  def code_enterprise
    params.permit(:code_enterprise)
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :role, :token, :code_enterprise)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
end
