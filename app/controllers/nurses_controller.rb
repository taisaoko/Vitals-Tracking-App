class NursesController < ApplicationController

  get '/nurses/:slug' do
    @nurse = Nurse.find_by_slug(params[:slug])
    erb :'nurses/show'
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

  get '/login' do
    if !logged_in?
      erb :'nurses/login'      
    else
      redirect 'nurses/:slug'
    end
  end

  post '/login' do
    nurse = Nurse.find_by(:username => params[:username])
    if nurse && nurse.authenticate(params[:password])
      session[:nurse_id] = nurse.id
      redirect 'nurses/:slug'
    else
      redirect to '/signup'
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
