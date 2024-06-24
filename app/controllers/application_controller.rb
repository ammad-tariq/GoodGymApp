class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_goodgymer

  private

  def set_current_goodgymer
    if session[:goodgymer_id]
      @current_goodgymer = Goodgymer.find(session[:goodgymer_id])
    else
      @current_goodgymer = nil
    end
  end

  def current_goodgymer
    @current_goodgymer
  end
  helper_method :current_goodgymer
end
