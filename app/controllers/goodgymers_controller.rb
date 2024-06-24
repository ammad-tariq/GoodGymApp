class GoodgymersController < ApplicationController
  def index
    @goodgymers = Goodgymer.all
    render json: @goodgymers
  end

  def show
    @goodgymer = Goodgymer.find(params[:id])
    render json: @goodgymer
  end

  def create
    @goodgymer = Goodgymer.new(goodgymer_params)
    if @goodgymer.save
      render json: @goodgymer, status: :created
    else
      render json: @goodgymer.errors, status: :unprocessable_entity
    end
  end

  private

  def goodgymer_params
    params.require(:goodgymer).permit(:name, :area_id, :role, :dbs_verified)
  end
end
