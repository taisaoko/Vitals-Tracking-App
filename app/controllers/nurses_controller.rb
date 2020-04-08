class NursesController < ApplicationController
  
  # the purpost of this route is to render the login form
  get '/login' do
    if !logged_in?
      erb :'nurses/login'      
    else
      redirect 'nurses/:slug'
    end
  end

  get '/nurses/:slug' do
    @nurse = Nurse.find_by_slug(params[:slug])
    erb :'nurses/show'
  end

  # the purpost of this route is to receive the login form, find the nurse, and log the nurse in (create a session)
  post '/login' do
    @nurse = Nurse.find_by(badge_number: params[:badge_number])
    # Authenticate the nurse - verify the nurse by their credentials - badge number/password combo
    if nurse && nurse.authenticate(params[:password])
      # log the user in - create the user session
      session[:nurse_id] = @nurse.id
      # redirect to nurse's show page
      # flash [:message] = "Welcome, #{@nurse.name}!"
      redirect 'nurses/:slug'
    else
      # flash[:errors] = "Your credentials were invalid.  Please sign up or try again."
      # tell the user they entered invalid credentials
      # redirect them to the login page
      redirect to 'nurses/login'
    end
  end

  get '/signup' do
    if !logged_in?
      erb :'nurses/new', locals: {message: "Please sign up before you sign in"}
    else
      redirect 'nurses/:slug'
    end
  end
  
  post '/signup' do
    if params[:username] == "" || params[:badge_number] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @nurse = Nurse.new(:username => params[:username], :badge_number => params[:badge_number], :password => params[:password])
      @nurse.save
      session[:nurse_id] = @nurse.id
      redirect 'nurses/:slug'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
