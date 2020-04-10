class NursesController < ApplicationController
  
  # the purpost of this route is to render the login form
  get '/login' do
    redirect_if_logged_in
      erb :'nurses/login'      
  end

  # the purpost of this route is to receive the login form, find the nurse, and log the nurse in (create a session)
  post '/login' do
    @nurse = Nurse.find_by(badge_number: params[:badge_number])
    # Authenticate the nurse - verify the nurse by their credentials - badge number/password combo
    if @nurse && @nurse.authenticate(params[:password])
      # log the user in - create the user session
      session[:nurse_id] = @nurse.id
      # redirect to nurse's show page
      flash[:message] = "Welcome, #{@nurse.name}!"
      redirect "/nurses/#{@nurse.slug}"
    else
      flash[:errors] = "Your credentials were invalid.  Please sign up or try again."
      # tell the user they entered invalid credentials
      # redirect them to the login page
      redirect to 'nurses/login'
    end
  end

  # this route's job is to render the signup form
  get '/signup' do
    redirect_if_logged_in
    erb :'nurses/new', locals: {message: "Please sign up before you sign in"}
  end
  
  post '/nurses' do
    # here is where we will create a new user and persist the new nurse to the DB
    # params will look like this: {"name"=>"Elizabeth", "badge_number"=>"222", "password"=>"password"}
    # I only want to persist a nurse that has a name, badge_number, AND password
    @nurse = Nurse.new(params)
    # I now have ActiveRecord Validations within my nurse model class, rather
    # than just checking for params keys to have values.  Either way works fine,
    # and checking params is fine for this project.  AR validations give us
    # a little more functionality if we want it.
    if @nurse.save
      # valid input
      session[:nurse_id] = @nurse.id # actually logging the user in
      # go to the user show page
      flash[:message] = "You have successfully created an account, #{@nurse.name}! Welcome!"
      redirect "/nurses/#{@nurse.slug}"
    else
      # not valid input
      # it would be better to include a message to the user
      # telling them what is wrong

      # flash[:errors] = "Account creation failure: #{@nurse.errors.full_messages.to_sentence}"
      redirect '/nurses/new'
    end
  end

  # User SHOW route
  get '/nurses/:slug' do
    @nurse = Nurse.find_by_slug(params[:slug])
    redirect_if_not_logged_in
    erb :'nurses/show'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
