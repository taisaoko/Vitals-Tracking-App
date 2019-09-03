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
      !!session[:nurse_id]
    end

    def current_user
      Nurse.find(session[:nurse_id])
    end
  end
end

