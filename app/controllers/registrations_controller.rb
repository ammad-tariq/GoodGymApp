class RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    goodgymer = Goodgymer.find(params[:registration][:goodgymer_id])
    session = Session.find(params[:registration][:session_id])

    if can_register?(goodgymer, session)
      registration = Registration.new(registration_params)
      if registration.save
        render json: registration, status: :created
      else
        render json: { error: registration.errors.full_messages.to_sentence }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Goodgymer must be TaskForce for Community Mission sessions' }, status: :forbidden
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:goodgymer_id, :session_id)
  end

  def can_register?(goodgymer, session)
    if session.CommunityMission?
      goodgymer.TaskForce?
    elsif session.SocialVisit?
      goodgymer.dbs_verified?
    else
      true
    end
  end
end
