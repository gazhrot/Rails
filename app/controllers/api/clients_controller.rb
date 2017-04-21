module API
class ClientsController < ApplicationController
  before_action :set_user
  before_action :set_user_client, only: [:show, :update, :destroy]

  def create
    @user.clients.create!(client_params)
    json_response(@user, :created)
  end

  def update
    @client.update(client_params)
    head :no_content
  end

  def destroy
    @client.destroy
    head :no_content
  end

  def index
    json_response(@user.clients)
  end

  def show
    json_response(@client)
  end

  private

  def client_params
    params.permit(:name, :lat, :lng, :last_order_date, :last_visit_date)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_client
    @client = @user.clients.find_by!(id: params[:id]) if @user
  end
end
end
