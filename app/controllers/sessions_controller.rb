class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index, :show]

  def index
    @sessions = Session.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @sessions.to_json(include: :registrations) }
    end
  end

  def show
    @session = Session.find(params[:id])
    render json: @session.to_json(include: :registrations)
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
