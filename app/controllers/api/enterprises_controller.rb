module API
class EnterprisesController < ApplicationController
  before_action :set_enterprise, only: [:show, :update, :destroy]

  def create
    @enterprise = Enterprise.create!(enterprise_params)
    json_response(@enterprise, :created)
  end

  def update
    @enterprise.update(enterprise_params)
    head :no_content
  end

  def destroy
    @enterprise.destroy
    head :no_content
  end

  def index
    @enterprises = Enterprise.all
    json_response(@enterprises)
  end

  def show
    json_response(@enterprise)
  end

  private

  def enterprise_params
    params.permit(:name, :code_enterprise)
  end

  def set_enterprise
    @enterprise = Enterprise.find(params[:id])
  end

end
end
