class NursesController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'nurses/create_user', locals: {message: "Please sign up before you sign in"}
    else
      redirect to '/patients'
    end
  end
  
  post '/signup' do
    if params[:username] == "" || params[:badge_number] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @nurse = Nurse.new(:username => params[:username], :badge_number => params[:badge_number], :password => params[:password])
      @nurse.save
      session[:nurse_id] = @nurse.id
      redirect to '/patients'
    end
  end

  # GET: /nurses
  get "/nurses" do
    erb :"/nurses/index.html"
  end

  # GET: /nurses/new
  get "/nurses/new" do
    erb :"/nurses/new.html"
  end

  # POST: /nurses
  post "/nurses" do
    redirect "/nurses"
  end

  # GET: /nurses/5
  get "/nurses/:id" do
    erb :"/nurses/show.html"
  end

  # GET: /nurses/5/edit
  get "/nurses/:id/edit" do
    erb :"/nurses/edit.html"
  end

  # PATCH: /nurses/5
  patch "/nurses/:id" do
    redirect "/nurses/:id"
  end

  # DELETE: /nurses/5/delete
  delete "/nurses/:id/delete" do
    redirect "/nurses"
  end
end
