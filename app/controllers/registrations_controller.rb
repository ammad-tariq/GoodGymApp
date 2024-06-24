class RegistrationsController < ApplicationController
  def create
    goodgymer = Goodgymer.find(params[:registration][:goodgymer_id])
    session = Session.find(params[:registration][:session_id])

    if session.SocialVisit? && !goodgymer.dbs_verified
      render json: { error: 'You must be DBS verified to sign up for SocialVisit.' }, status: :forbidden
    elsif session.CommunityMission? && goodgymer.TaskForce?
      render json: { error: 'You must be a TaskForce member to sign up for CommunityMission.' }, status: :forbidden
    else
      @registration = Registration.new(registration_params)
      if @registration.save
        Pairing.create(goodgymer: goodgymer, session: session) if session.SocialVisit?
        render json: @registration, status: :created
      else
        render json: @registration.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:goodgymer_id, :session_id)
  end
end
