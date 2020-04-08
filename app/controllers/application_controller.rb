require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "vitals_secret"
  end

  get '/' do
    erb :index
  end
  
  helpers do
    def logged_in?
      # true if nurse is logged in, otherwise false
      !!current_user
    end

    def current_user
      @current_user ||= Nurse.find_by(id: session[:nurse_id])
    end

    def authorized_to_edit?(patient)
      patient.nurse == current_user
    end

    # use this helper method to protect controller actions where user must be logged in to proceed
    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "You must be logged in to view the page you tried to view."
        redirect '/'
      end
    end

    # use this helper method to avoid showing welcome, login, or signup page to a nurse that's already logged in
    def redirect_if_logged_in
      if logged_in?
        redirect "/nurses/:slug"
      end
    end
  end
end

