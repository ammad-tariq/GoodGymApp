class SessionsController < ApplicationController
  def index
    @sessions = Session.all
    render json: @sessions
  end

  def show
    @session = Session.find(params[:id])
    render json: @session
  end

  def create
    @session = Session.new(session_params)
    if @session.save
      render json: @session, status: :created
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  private

  def session_params
    params.require(:session).permit(:name, :area_id, :registration_limit, :session_type)
  end
end
